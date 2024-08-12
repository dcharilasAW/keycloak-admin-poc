BEGIN;

DO $$
DECLARE
PLAYERS_REALM_ID TEXT := '27e6487e-2bdf-4300-93de-f6de5fdb2a1a';
BEGIN

----- client ------
INSERT INTO public.client
(id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, "name", service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES(gen_random_uuid (), true, false, 'realm-management', 0, false, NULL, NULL, true, NULL, false, PLAYERS_REALM_ID, 'openid-connect', 0, false, false, '${client_realm-management}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client
(id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, "name", service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES(gen_random_uuid (), true, false, 'account', 0, true, NULL, '/realms/genesis/account/', false, NULL, false, PLAYERS_REALM_ID, 'openid-connect', 0, false, false, '${client_account}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client
(id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, "name", service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES(gen_random_uuid (), true, false, 'account-console', 0, true, NULL, '/realms/genesis/account/', false, NULL, false, PLAYERS_REALM_ID, 'openid-connect', 0, false, false, '${client_account-console}', false, 'client-secret', '${authBaseUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client
(id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, "name", service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES(gen_random_uuid (), true, false, 'broker', 0, false, NULL, NULL, true, NULL, false, PLAYERS_REALM_ID, 'openid-connect', 0, false, false, '${client_broker}', false, 'client-secret', NULL, NULL, NULL, true, false, false, false);
INSERT INTO public.client
(id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, "name", service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES(gen_random_uuid (), true, false, 'security-admin-console', 0, true, NULL, '/admin/genesis/console/', false, NULL, false, PLAYERS_REALM_ID, 'openid-connect', 0, false, false, '${client_security-admin-console}', false, 'client-secret', '${authAdminUrl}', NULL, NULL, true, false, false, false);
INSERT INTO public.client
(id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, "name", service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES(gen_random_uuid (), true, false, 'admin-cli', 0, true, NULL, NULL, false, NULL, false, PLAYERS_REALM_ID, 'openid-connect', 0, false, false, '${client_admin-cli}', false, 'client-secret', NULL, NULL, NULL, false, false, true, false);

----- keycloak_role ------
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), PLAYERS_REALM_ID, false, '${role_default-roles}', 'default-roles-genesis', PLAYERS_REALM_ID, NULL, NULL);
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_realm-admin}', 'realm-admin', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_create-client}', 'create-client', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_view-realm}', 'view-realm', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_view-users}', 'view-users', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_view-clients}', 'view-clients', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_view-events}', 'view-events', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_view-identity-providers}', 'view-identity-providers', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_view-authorization}', 'view-authorization', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_manage-realm}', 'manage-realm', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_manage-users}', 'manage-users', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_manage-clients}', 'manage-clients', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_manage-events}', 'manage-events', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_manage-identity-providers}', 'manage-identity-providers', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_manage-authorization}', 'manage-authorization', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_query-users}', 'query-users', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_query-clients}', 'query-clients', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_query-realms}', 'query-realms', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_query-groups}', 'query-groups', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_view-profile}', 'view-profile', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'account';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_manage-account}', 'manage-account', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'account';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_manage-account-links}', 'manage-account-links', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'account';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_view-applications}', 'view-applications', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'account';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_view-consent}', 'view-consent', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'account';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_manage-consent}', 'manage-consent', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'account';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_view-groups}', 'view-groups', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'account';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_delete-account}', 'delete-account', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'account';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_impersonation}', 'impersonation', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'realm-management';
INSERT INTO public.keycloak_role
SELECT gen_random_uuid (), id, true, '${role_read-token}', 'read-token', PLAYERS_REALM_ID, id, NULL FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'broker';
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), PLAYERS_REALM_ID, false, '${role_offline-access}', 'offline_access', PLAYERS_REALM_ID, NULL, NULL);
INSERT INTO public.keycloak_role
(id, client_realm_constraint, client_role, description, "name", realm_id, client, realm)
VALUES(gen_random_uuid (), PLAYERS_REALM_ID, false, '${role_uma_authorization}', 'uma_authorization', PLAYERS_REALM_ID, NULL, NULL);

---- web_origins ----
INSERT INTO public.web_origins
SELECT id, '+' FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'security-admin-console';

---- redirect_uris ----
INSERT INTO public.redirect_uris
SELECT id, '/realms/genesis/account/*' FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'account';
INSERT INTO public.redirect_uris
SELECT id, '/realms/genesis/account/*' FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'account-console';
INSERT INTO public.redirect_uris
SELECT id, '/admin/genesis/console/*' FROM public.client where realm_id = PLAYERS_REALM_ID AND client_id = 'security-admin-console';

---- update realm flows ----
UPDATE public.realm SET (master_admin_client) = (SELECT id FROM public.client WHERE client_id = 'realm-management' AND realm_id = PLAYERS_REALM_ID) WHERE id = PLAYERS_REALM_ID;
UPDATE public.realm SET (browser_flow) = (SELECT id FROM public.client WHERE client_id = 'browser' AND realm_id = PLAYERS_REALM_ID) WHERE id = PLAYERS_REALM_ID;
UPDATE public.realm SET (registration_flow) = (SELECT id FROM public.client WHERE client_id = 'registration' AND realm_id = PLAYERS_REALM_ID) WHERE id = PLAYERS_REALM_ID;
UPDATE public.realm SET (direct_grant_flow) = (SELECT id FROM public.client WHERE client_id = 'direct grant' AND realm_id = PLAYERS_REALM_ID) WHERE id = PLAYERS_REALM_ID;
UPDATE public.realm SET (reset_credentials_flow) = (SELECT id FROM public.client WHERE client_id = 'reset credentials' AND realm_id = PLAYERS_REALM_ID) WHERE id = PLAYERS_REALM_ID;
UPDATE public.realm SET (client_auth_flow) = (SELECT id FROM public.client WHERE client_id = 'clients' AND realm_id = PLAYERS_REALM_ID) WHERE id = PLAYERS_REALM_ID;
UPDATE public.realm SET (docker_auth_flow) = (SELECT id FROM public.client WHERE client_id = 'docker auth' AND realm_id = PLAYERS_REALM_ID) WHERE id = PLAYERS_REALM_ID;
UPDATE public.realm SET (master_admin_client) = (SELECT id FROM public.client WHERE client_id LIKE 'default-roles-%' AND realm_id = PLAYERS_REALM_ID) WHERE id = PLAYERS_REALM_ID;

END $$;

COMMIT;