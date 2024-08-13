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


---- client_scope ----
INSERT INTO public.client_scope
(id, "name", realm_id, description, protocol)
VALUES(gen_random_uuid (), 'offline_access', PLAYERS_REALM_ID, 'OpenID Connect built-in scope: offline_access', 'openid-connect');
INSERT INTO public.client_scope
(id, "name", realm_id, description, protocol)
VALUES(gen_random_uuid (), 'email', PLAYERS_REALM_ID, 'OpenID Connect built-in scope: email', 'openid-connect');
INSERT INTO public.client_scope
(id, "name", realm_id, description, protocol)
VALUES(gen_random_uuid (), 'address', PLAYERS_REALM_ID, 'OpenID Connect built-in scope: address', 'openid-connect');
INSERT INTO public.client_scope
(id, "name", realm_id, description, protocol)
VALUES(gen_random_uuid (), 'acr', PLAYERS_REALM_ID, 'OpenID Connect scope for add acr (authentication context class reference) to the token', 'openid-connect');
INSERT INTO public.client_scope
(id, "name", realm_id, description, protocol)
VALUES(gen_random_uuid (), 'web-origins', PLAYERS_REALM_ID, 'OpenID Connect scope for add allowed web origins to the access token', 'openid-connect');
INSERT INTO public.client_scope
(id, "name", realm_id, description, protocol)
VALUES(gen_random_uuid (), 'profile', PLAYERS_REALM_ID, 'OpenID Connect built-in scope: profile', 'openid-connect');
INSERT INTO public.client_scope
(id, "name", realm_id, description, protocol)
VALUES(gen_random_uuid (), 'phone', PLAYERS_REALM_ID, 'OpenID Connect built-in scope: phone', 'openid-connect');
INSERT INTO public.client_scope
(id, "name", realm_id, description, protocol)
VALUES(gen_random_uuid (), 'roles', PLAYERS_REALM_ID, 'OpenID Connect scope for add user roles to the access token', 'openid-connect');
INSERT INTO public.client_scope
(id, "name", realm_id, description, protocol)
VALUES(gen_random_uuid (), 'microprofile-jwt', PLAYERS_REALM_ID, 'Microprofile - JWT built-in scope', 'openid-connect');
INSERT INTO public.client_scope
(id, "name", realm_id, description, protocol)
VALUES(gen_random_uuid (), 'role_list', PLAYERS_REALM_ID, 'SAML role list', 'saml');

---- client_scope_attributes ----
INSERT INTO public.client_scope_attributes
SELECT id, '${offlineAccessScopeConsentText}', 'consent.screen.text' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'offline_access';
INSERT INTO public.client_scope_attributes
SELECT id, 'true', 'display.on.consent.screen' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'offline_access';

INSERT INTO public.client_scope_attributes
SELECT id, 'true', 'include.in.token.scope' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
INSERT INTO public.client_scope_attributes
SELECT id, 'true', 'display.on.consent.screen' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
INSERT INTO public.client_scope_attributes
SELECT id, '${emailScopeConsentText}', 'consent.screen.text' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';

INSERT INTO public.client_scope_attributes
SELECT id, 'true', 'include.in.token.scope' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
INSERT INTO public.client_scope_attributes
SELECT id, 'true', 'display.on.consent.screen' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
INSERT INTO public.client_scope_attributes
SELECT id, '${addressScopeConsentText}', 'consent.screen.text' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';

INSERT INTO public.client_scope_attributes
SELECT id, 'false', 'include.in.token.scope' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'acr';
INSERT INTO public.client_scope_attributes
SELECT id, 'false', 'display.on.consent.screen' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'acr';

INSERT INTO public.client_scope_attributes
SELECT id, 'false', 'include.in.token.scope' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'web-origins';
INSERT INTO public.client_scope_attributes
SELECT id, 'false', 'display.on.consent.screen' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'web-origins';
INSERT INTO public.client_scope_attributes
SELECT id, '', 'consent.screen.text' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'web-origins';

INSERT INTO public.client_scope_attributes
SELECT id, 'true', 'include.in.token.scope' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.client_scope_attributes
SELECT id, 'true', 'display.on.consent.screen' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.client_scope_attributes
SELECT id, '${profileScopeConsentText}', 'consent.screen.text' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';

INSERT INTO public.client_scope_attributes
SELECT id, 'true', 'include.in.token.scope' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'phone';
INSERT INTO public.client_scope_attributes
SELECT id, 'true', 'display.on.consent.screen' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'phone';
INSERT INTO public.client_scope_attributes
SELECT id, '${phoneScopeConsentText}', 'consent.screen.text' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'phone';

INSERT INTO public.client_scope_attributes
SELECT id, 'false', 'include.in.token.scope' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'roles';
INSERT INTO public.client_scope_attributes
SELECT id, 'true', 'display.on.consent.screen' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'roles';
INSERT INTO public.client_scope_attributes
SELECT id, '${rolesScopeConsentText}', 'consent.screen.text' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'roles';

INSERT INTO public.client_scope_attributes
SELECT id, 'true', 'include.in.token.scope' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'microprofile-jwt';
INSERT INTO public.client_scope_attributes
SELECT id, 'false', 'display.on.consent.screen' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'microprofile-jwt';

INSERT INTO public.client_scope_attributes
SELECT id, '${samlRoleListScopeConsentText}', 'consent.screen.text' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'role_list';
INSERT INTO public.client_scope_attributes
SELECT id, 'true', 'display.on.consent.screen' FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'role_list';

---- client_scope_client ----
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'web-origins';
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'acr';
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'roles';
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'phone';
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'offline_access';
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'microprofile-jwt';

INSERT INTO public.client_scope_client
SELECT ACCOUNT_CONSOLE_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'web-origins';
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CONSOLE_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'acr';
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CONSOLE_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CONSOLE_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'roles';
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CONSOLE_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CONSOLE_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CONSOLE_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'phone';
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CONSOLE_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'offline_access';
INSERT INTO public.client_scope_client
SELECT ACCOUNT_CONSOLE_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'microprofile-jwt';

INSERT INTO public.client_scope_client
SELECT ADMIN_CLI_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'web-origins';
INSERT INTO public.client_scope_client
SELECT ADMIN_CLI_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'acr';
INSERT INTO public.client_scope_client
SELECT ADMIN_CLI_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.client_scope_client
SELECT ADMIN_CLI_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'roles';
INSERT INTO public.client_scope_client
SELECT ADMIN_CLI_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
INSERT INTO public.client_scope_client
SELECT ADMIN_CLI_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
INSERT INTO public.client_scope_client
SELECT ADMIN_CLI_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'phone';
INSERT INTO public.client_scope_client
SELECT ADMIN_CLI_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'offline_access';
INSERT INTO public.client_scope_client
SELECT ADMIN_CLI_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'microprofile-jwt';

INSERT INTO public.client_scope_client
SELECT BROKER_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'web-origins';
INSERT INTO public.client_scope_client
SELECT BROKER_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'acr';
INSERT INTO public.client_scope_client
SELECT BROKER_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.client_scope_client
SELECT BROKER_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'roles';
INSERT INTO public.client_scope_client
SELECT BROKER_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
INSERT INTO public.client_scope_client
SELECT BROKER_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
INSERT INTO public.client_scope_client
SELECT BROKER_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'phone';
INSERT INTO public.client_scope_client
SELECT BROKER_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'offline_access';
INSERT INTO public.client_scope_client
SELECT BROKER_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'microprofile-jwt';

INSERT INTO public.client_scope_client
SELECT REALM_MANAGEMENT_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'web-origins';
INSERT INTO public.client_scope_client
SELECT REALM_MANAGEMENT_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'acr';
INSERT INTO public.client_scope_client
SELECT REALM_MANAGEMENT_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.client_scope_client
SELECT REALM_MANAGEMENT_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'roles';
INSERT INTO public.client_scope_client
SELECT REALM_MANAGEMENT_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
INSERT INTO public.client_scope_client
SELECT REALM_MANAGEMENT_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
INSERT INTO public.client_scope_client
SELECT REALM_MANAGEMENT_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'phone';
INSERT INTO public.client_scope_client
SELECT REALM_MANAGEMENT_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'offline_access';
INSERT INTO public.client_scope_client
SELECT REALM_MANAGEMENT_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'microprofile-jwt';

INSERT INTO public.client_scope_client
SELECT SECURITY_ADMIN_CONSOLE_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'web-origins';
INSERT INTO public.client_scope_client
SELECT SECURITY_ADMIN_CONSOLE_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'acr';
INSERT INTO public.client_scope_client
SELECT SECURITY_ADMIN_CONSOLE_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.client_scope_client
SELECT SECURITY_ADMIN_CONSOLE_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'roles';
INSERT INTO public.client_scope_client
SELECT SECURITY_ADMIN_CONSOLE_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
INSERT INTO public.client_scope_client
SELECT SECURITY_ADMIN_CONSOLE_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
INSERT INTO public.client_scope_client
SELECT SECURITY_ADMIN_CONSOLE_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'phone';
INSERT INTO public.client_scope_client
SELECT SECURITY_ADMIN_CONSOLE_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'offline_access';
INSERT INTO public.client_scope_client
SELECT SECURITY_ADMIN_CONSOLE_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'microprofile-jwt';

---- protocol_mapper ----
INSERT INTO public.protocol_mapper
(id, "name", protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES(gen_random_uuid (), 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', ACCOUNT_CONSOLE_CLIENT_ID, NULL);
INSERT INTO public.protocol_mapper
(id, "name", protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES(gen_random_uuid (), 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', SECURITY_ADMIN_CONSOLE_CLIENT_ID, NULL);

INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'email', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'email verified', 'openid-connect', 'oidc-usermodel-property-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';

INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'address', 'openid-connect', 'oidc-address-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'acr loa level', 'openid-connect', 'oidc-acr-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'acr';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'allowed web origins', 'openid-connect', 'oidc-allowed-origins-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'web-origins';

INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'family name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'zoneinfo', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'username', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'birthdate', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'website', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'full name', 'openid-connect', 'oidc-full-name-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'gender', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'updated at', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'picture', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'nickname', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'middle name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'profile', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'locale', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'given name', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'externalId', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'clientType', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';

INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'phone number verified', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'phone';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'phone number', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'phone';

INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'realm roles', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'roles';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'client roles', 'openid-connect', 'oidc-usermodel-client-role-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'roles';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'audience resolve', 'openid-connect', 'oidc-audience-resolve-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'roles';

INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'groups', 'openid-connect', 'oidc-usermodel-realm-role-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'microprofile-jwt';
INSERT INTO public.protocol_mapper
SELECT gen_random_uuid (), 'upn', 'openid-connect', 'oidc-usermodel-attribute-mapper', NULL, id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'microprofile-jwt';

---- scope_mapping ----
INSERT INTO public.scope_mapping
SELECT ACCOUNT_CONSOLE_CLIENT_ID, id FROM public.keycloak_role WHERE realm_id = PLAYERS_REALM_ID AND name = 'view-groups';
INSERT INTO public.scope_mapping
SELECT ACCOUNT_CONSOLE_CLIENT_ID, id FROM public.keycloak_role WHERE realm_id = PLAYERS_REALM_ID AND name = 'manage-account';

---- client_scope_role_mapping ----
INSERT INTO public.client_scope_role_mapping
SELECT
(SELECT id FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'offline_access'),
(SELECT id FROM public.keycloak_role WHERE realm_id = PLAYERS_REALM_ID AND name = 'offline_access');

---- protocol_mapper_config ----
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'true', 'introspection.token.claim' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'locale';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'true', 'userinfo.token.claim' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'locale';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'locale', 'user.attribute' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'locale';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'true', 'id.token.claim' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'locale';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'true', 'access.token.claim' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'locale';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'locale', 'claim.name' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'locale';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'String', 'jsonType.label' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'locale';
--
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'true', 'introspection.token.claim' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'true', 'userinfo.token.claim' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'email', 'user.attribute' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'true', 'id.token.claim' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'true', 'access.token.claim' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'email', 'claim.name' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'String', 'jsonType.label' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
--
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'true', 'introspection.token.claim' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'email verified';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'true', 'userinfo.token.claim' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'email verified';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'emailVerified', 'user.attribute' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'email verified';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'true', 'id.token.claim' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'email verified';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'true', 'access.token.claim' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'email verified';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'email_verified', 'claim.name' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'email verified';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'boolean', 'jsonType.label' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'email verified';
--
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'formatted', 'user.attribute.formatted' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'country', 'user.attribute.country' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'true', 'introspection.token.claim' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'postal_code', 'user.attribute.postal_code' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'true', 'userinfo.token.claim' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'street', 'user.attribute.street' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'true', 'id.token.claim' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'region', 'user.attribute.region' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'true', 'access.token.claim' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
-- INSERT INTO public.protocol_mapper_config
-- SELECT id, 'locality', 'user.attribute.locality' FROM public.protocol_mapper WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';

-- TODO missing

---- update realm admin client ----
UPDATE public.realm SET master_admin_client = MASTER_ADMIN_CLIENT_ID WHERE id = PLAYERS_REALM_ID;


END $$;

COMMIT;