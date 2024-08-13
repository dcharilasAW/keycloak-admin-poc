BEGIN;

DO $$
DECLARE
PLAYERS_REALM_ID TEXT := '27e6487e-2bdf-4300-93de-f6de5fdb2a1a';
PLAYERS_REALM_NAME TEXT := 'genesis-players';

REALM_MANAGEMENT_CLIENT_ID TEXT := gen_random_uuid ();
ACCOUNT_CLIENT_ID TEXT := gen_random_uuid ();
ACCOUNT_CONSOLE_CLIENT_ID TEXT := gen_random_uuid ();
BROKER_CLIENT_ID TEXT := gen_random_uuid ();
SECURITY_ADMIN_CONSOLE_CLIENT_ID TEXT := gen_random_uuid ();
ADMIN_CLI_CLIENT_ID TEXT := gen_random_uuid ();
MASTER_ADMIN_CLIENT_ID TEXT := gen_random_uuid ();

BEGIN

----- client ------
INSERT INTO public.client
(id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, "name", service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES(REALM_MANAGEMENT_CLIENT_ID, true, false, 'realm-management', 0, false, NULL, NULL, true, NULL, false, PLAYERS_REALM_ID, 'openid-connect', 0, false, false, '${client_realm-management}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client
(id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, "name", service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES(ACCOUNT_CLIENT_ID, true, false, 'account', 0, true, NULL, '/realms/genesis/account/', false, NULL, false, PLAYERS_REALM_ID, 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client
(id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, "name", service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES(ACCOUNT_CONSOLE_CLIENT_ID, true, false, 'account-console', 0, true, NULL, '/realms/genesis/account/', false, NULL, false, PLAYERS_REALM_ID, 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client
(id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, "name", service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES(BROKER_CLIENT_ID, true, false, 'broker', 0, false, NULL, NULL, true, NULL, false, PLAYERS_REALM_ID, 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client
(id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, "name", service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES(SECURITY_ADMIN_CONSOLE_CLIENT_ID, true, false, 'security-admin-console', 0, true, NULL, '/admin/genesis/console/', false, NULL, false, PLAYERS_REALM_ID, 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client
(id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, "name", service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES(ADMIN_CLI_CLIENT_ID, true, false, 'admin-cli', 0, true, NULL, NULL, false, NULL, false, PLAYERS_REALM_ID, 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);

INSERT INTO public.client
(id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, "name", service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES(MASTER_ADMIN_CLIENT_ID, true, false, CONCAT(PLAYERS_REALM_NAME,'-realm'), 0, false, NULL, NULL, true, NULL, false,
(SELECT id from public.realm where name = 'master'),
NULL, 0, false, false, CONCAT(PLAYERS_REALM_NAME,' Realm'), false, 'client-secret', NULL, NULL, NULL, true, false, false, false);

----- keycloak_role ------
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), PLAYERS_REALM_ID, false, '${role_default-roles}', 'default-roles-genesis', PLAYERS_REALM_ID, NULL, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_realm-admin}', 'realm-admin', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_create-client}', 'create-client', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_view-realm}', 'view-realm', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_view-users}', 'view-users', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_view-clients}', 'view-clients', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_view-events}', 'view-events', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_view-identity-providers}', 'view-identity-providers', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_view-authorization}', 'view-authorization', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_manage-realm}', 'manage-realm', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_manage-users}', 'manage-users', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_manage-clients}', 'manage-clients', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_manage-events}', 'manage-events', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_manage-identity-providers}', 'manage-identity-providers', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_manage-authorization}', 'manage-authorization', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_query-users}', 'query-users', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_query-clients}', 'query-clients', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_query-realms}', 'query-realms', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_query-groups}', 'query-groups', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), ACCOUNT_CLIENT_ID, true, '${role_view-profile}', 'view-profile', PLAYERS_REALM_ID, ACCOUNT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), ACCOUNT_CLIENT_ID, true, '${role_manage-account}', 'manage-account', PLAYERS_REALM_ID, ACCOUNT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), ACCOUNT_CLIENT_ID, true, '${role_manage-account-links}', 'manage-account-links', PLAYERS_REALM_ID, ACCOUNT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), ACCOUNT_CLIENT_ID, true, '${role_view-applications}', 'view-applications', PLAYERS_REALM_ID, ACCOUNT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), ACCOUNT_CLIENT_ID, true, '${role_view-consent}', 'view-consent', PLAYERS_REALM_ID, ACCOUNT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), ACCOUNT_CLIENT_ID, true, '${role_manage-consent}', 'manage-consent', PLAYERS_REALM_ID, ACCOUNT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), ACCOUNT_CLIENT_ID, true, '${role_view-groups}', 'view-groups', PLAYERS_REALM_ID, ACCOUNT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), ACCOUNT_CLIENT_ID, true, '${role_delete-account}', 'delete-account', PLAYERS_REALM_ID, ACCOUNT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), REALM_MANAGEMENT_CLIENT_ID, true, '${role_impersonation}', 'impersonation', PLAYERS_REALM_ID, REALM_MANAGEMENT_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), BROKER_CLIENT_ID, true, '${role_read-token}', 'read-token', PLAYERS_REALM_ID, BROKER_CLIENT_ID, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), PLAYERS_REALM_ID, false, '${role_offline-access}', 'offline_access', PLAYERS_REALM_ID, NULL, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), PLAYERS_REALM_ID, false, '${role_uma_authorization}', 'uma_authorization', PLAYERS_REALM_ID, NULL, NULL);

---- web_origins ----
INSERT INTO public.web_origins
(client_id, value)
VALUES(SECURITY_ADMIN_CONSOLE_CLIENT_ID, '+');

---- redirect_uris ----
INSERT INTO public.redirect_uris
(client_id, value)
VALUES(ACCOUNT_CLIENT_ID, '/realms/master/account/*');
INSERT INTO public.redirect_uris
(client_id, value)
VALUES(ACCOUNT_CONSOLE_CLIENT_ID, '/realms/master/account/*');
INSERT INTO public.redirect_uris
(client_id, value)
VALUES(SECURITY_ADMIN_CONSOLE_CLIENT_ID, '/admin/master/console/*');

---- client_attributes ----
INSERT INTO public.client_attributes
(client_id, "name", value)
VALUES(ACCOUNT_CLIENT_ID, 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes
(client_id, "name", value)
VALUES(ACCOUNT_CONSOLE_CLIENT_ID, 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes
(client_id, "name", value)
VALUES(ACCOUNT_CONSOLE_CLIENT_ID, 'pkce.code.challenge.method', 'S256');
INSERT INTO public.client_attributes
(client_id, "name", value)
VALUES(SECURITY_ADMIN_CONSOLE_CLIENT_ID, 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes
(client_id, "name", value)
VALUES(SECURITY_ADMIN_CONSOLE_CLIENT_ID, 'pkce.code.challenge.method', 'S256');

---- update realm admin client ----
UPDATE public.realm SET master_admin_client = MASTER_ADMIN_CLIENT_ID WHERE id = PLAYERS_REALM_ID;


END $$;

COMMIT;