BEGIN;

DO $$
DECLARE
PLAYERS_REALM_ID TEXT := 'a5f6838a-eef9-4d48-bc8c-361f6b9fb5ae';
PAM_CLIENT_ID TEXT := '13b87381-ff31-413c-bb98-1c1d9e9b58dd';
PAM_CLIENT_NAME TEXT := 'genesis-test';
PAM_CLIENT_SECRET TEXT := 'EGOEPYNPshkfsgRtWaYIzQ2biKaHqtDT';

BEGIN

----- client ------
INSERT INTO public.client
(id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, "name", service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console)
VALUES(PAM_CLIENT_ID, true, true, PAM_CLIENT_NAME, 0, false, PAM_CLIENT_SECRET, 'http://localhost:1234', false, '', false, 'a5f6838a-eef9-4d48-bc8c-361f6b9fb5ae', 'openid-connect', -1, true, false, '', true, 'client-secret', '', '', NULL, true, false, true, false);

---- client_attributes ----
INSERT INTO public.client_attributes
(client_id, "name", value)
VALUES(PAM_CLIENT_ID, 'oidc.ciba.grant.enabled', 'false');
INSERT INTO public.client_attributes
(client_id, "name", value)
VALUES(PAM_CLIENT_ID, 'client.secret.creation.time', '1716546039');
INSERT INTO public.client_attributes
(client_id, "name", value)
VALUES(PAM_CLIENT_ID, 'backchannel.logout.session.required', 'true');
INSERT INTO public.client_attributes
(client_id, "name", value)
VALUES(PAM_CLIENT_ID, 'post.logout.redirect.uris', '+');
INSERT INTO public.client_attributes
(client_id, "name", value)
VALUES(PAM_CLIENT_ID, 'oauth2.device.authorization.grant.enabled', 'false');
INSERT INTO public.client_attributes
(client_id, "name", value)
VALUES(PAM_CLIENT_ID, 'backchannel.logout.revoke.offline.tokens', 'false');

---- client_scope_client ----
INSERT INTO public.client_scope_client
SELECT PAM_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'web-origins';
INSERT INTO public.client_scope_client
SELECT PAM_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'acr';
INSERT INTO public.client_scope_client
SELECT PAM_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'profile';
INSERT INTO public.client_scope_client
SELECT PAM_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'roles';
INSERT INTO public.client_scope_client
SELECT PAM_CLIENT_ID, id, true FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'email';
INSERT INTO public.client_scope_client
SELECT PAM_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'address';
INSERT INTO public.client_scope_client
SELECT PAM_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'phone';
INSERT INTO public.client_scope_client
SELECT PAM_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'offline_access';
INSERT INTO public.client_scope_client
SELECT PAM_CLIENT_ID, id, false FROM public.client_scope WHERE realm_id = PLAYERS_REALM_ID AND name = 'microprofile-jwt';

---- protocol_mapper ----
INSERT INTO public.protocol_mapper
(id, "name", protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES(gen_random_uuid (), 'Client ID', 'openid-connect', 'oidc-usersessionmodel-note-mapper', PAM_CLIENT_ID, NULL);
INSERT INTO public.protocol_mapper
(id, "name", protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES(gen_random_uuid (), 'Client Host', 'openid-connect', 'oidc-usersessionmodel-note-mapper', PAM_CLIENT_ID, NULL);
INSERT INTO public.protocol_mapper
(id, "name", protocol, protocol_mapper_name, client_id, client_scope_id)
VALUES(gen_random_uuid (), 'Client IP Address', 'openid-connect', 'oidc-usersessionmodel-note-mapper', PAM_CLIENT_ID, NULL);

---- protocol_mapper_config ----
INSERT INTO public.protocol_mapper_config
SELECT id, 'client_id', 'user.session.note' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client ID';
INSERT INTO public.protocol_mapper_config
SELECT id, 'true', 'introspection.token.claim' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client ID';
INSERT INTO public.protocol_mapper_config
SELECT id, 'true', 'userinfo.token.claim' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client ID';
INSERT INTO public.protocol_mapper_config
SELECT id, 'true', 'id.token.claim' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client ID';
INSERT INTO public.protocol_mapper_config
SELECT id, 'true', 'access.token.claim' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client ID';
INSERT INTO public.protocol_mapper_config
SELECT id, 'client_id', 'claim.name' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client ID';
INSERT INTO public.protocol_mapper_config
SELECT id, 'String', 'jsonType.label' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client ID';

INSERT INTO public.protocol_mapper_config
SELECT id, 'clientHost', 'user.session.note' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client Host';
INSERT INTO public.protocol_mapper_config
SELECT id, 'true', 'introspection.token.claim' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client Host';
INSERT INTO public.protocol_mapper_config
SELECT id, 'true', 'userinfo.token.claim' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client Host';
INSERT INTO public.protocol_mapper_config
SELECT id, 'true', 'id.token.claim' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client Host';
INSERT INTO public.protocol_mapper_config
SELECT id, 'true', 'access.token.claim' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client Host';
INSERT INTO public.protocol_mapper_config
SELECT id, 'clientHost', 'claim.name' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client Host';
INSERT INTO public.protocol_mapper_config
SELECT id, 'String', 'jsonType.label' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client Host';

INSERT INTO public.protocol_mapper_config
SELECT id, 'clientAddress', 'user.session.note' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client IP Address';
INSERT INTO public.protocol_mapper_config
SELECT id, 'true', 'introspection.token.claim' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client IP Address';
INSERT INTO public.protocol_mapper_config
SELECT id, 'true', 'userinfo.token.claim' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client IP Address';
INSERT INTO public.protocol_mapper_config
SELECT id, 'true', 'id.token.claim' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client IP Address';
INSERT INTO public.protocol_mapper_config
SELECT id, 'true', 'access.token.claim' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client IP Address';
INSERT INTO public.protocol_mapper_config
SELECT id, 'clientAddress', 'claim.name' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client IP Address';
INSERT INTO public.protocol_mapper_config
SELECT id, 'String', 'jsonType.label' FROM public.protocol_mapper WHERE client_id = PAM_CLIENT_ID AND name = 'Client IP Address';

END $$;

COMMIT;