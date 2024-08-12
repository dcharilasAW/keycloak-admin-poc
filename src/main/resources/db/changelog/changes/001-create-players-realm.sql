BEGIN;

DO $$
DECLARE
PLAYERS_REALM_ID TEXT := '27e6487e-2bdf-4300-93de-f6de5fdb2a1a';
PLAYERS_REALM_NAME TEXT := 'genesis-players';
BEGIN

----- realm ------
INSERT INTO public.realm
(id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, "name", not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role)
VALUES(PLAYERS_REALM_ID, 60, 300, 300, NULL, NULL, NULL, true, false, 0, NULL, PLAYERS_REALM_NAME, 0, NULL, false, false, false, false, 'EXTERNAL', 1800, 36000, false, false, NULL, 1800, false, NULL, false, false, false, false, 0, 1, 30, 6, 'HmacSHA1', 'totp', NULL, NULL, NULL, NULL, NULL, 2592000, false, 900, true, false, NULL, 0, false, 0, 0, NULL);

----- realm_events_listeners ------
INSERT INTO public.realm_events_listeners
(realm_id, value)
VALUES(PLAYERS_REALM_ID, 'jboss-logging');

----- realm_required_credential ------
INSERT INTO public.realm_required_credential
("type", form_label, "input", secret, realm_id)
VALUES('password', 'password', true, true, PLAYERS_REALM_ID);

----- realm_attribute ------
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('_browser_header.contentSecurityPolicyReportOnly', PLAYERS_REALM_ID, '');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('_browser_header.xContentTypeOptions', PLAYERS_REALM_ID, 'nosniff');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('_browser_header.referrerPolicy', PLAYERS_REALM_ID, 'no-referrer');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('_browser_header.xRobotsTag', PLAYERS_REALM_ID, 'none');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('_browser_header.xFrameOptions', PLAYERS_REALM_ID, 'SAMEORIGIN');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('_browser_header.contentSecurityPolicy', PLAYERS_REALM_ID, 'frame-src ''self''; frame-ancestors ''self''; object-src ''none'';');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('_browser_header.xXSSProtection', PLAYERS_REALM_ID, '1; mode=block');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('_browser_header.strictTransportSecurity', PLAYERS_REALM_ID, 'max-age=31536000; includeSubDomains');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('bruteForceProtected', PLAYERS_REALM_ID, 'false');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('permanentLockout', PLAYERS_REALM_ID, 'false');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('maxTemporaryLockouts', PLAYERS_REALM_ID, '0');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('maxFailureWaitSeconds', PLAYERS_REALM_ID, '900');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('minimumQuickLoginWaitSeconds', PLAYERS_REALM_ID, '60');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('waitIncrementSeconds', PLAYERS_REALM_ID, '60');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('quickLoginCheckMilliSeconds', PLAYERS_REALM_ID, '1000');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('maxDeltaTimeSeconds', PLAYERS_REALM_ID, '43200');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('failureFactor', PLAYERS_REALM_ID, '30');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('realmReusableOtpCode', PLAYERS_REALM_ID, 'false');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('defaultSignatureAlgorithm', PLAYERS_REALM_ID, 'RS256');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('offlineSessionMaxLifespanEnabled', PLAYERS_REALM_ID, 'false');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('offlineSessionMaxLifespan', PLAYERS_REALM_ID, '5184000');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('actionTokenGeneratedByAdminLifespan', PLAYERS_REALM_ID, '43200');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('actionTokenGeneratedByUserLifespan', PLAYERS_REALM_ID, '300');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('oauth2DeviceCodeLifespan', PLAYERS_REALM_ID, '600');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('oauth2DevicePollingInterval', PLAYERS_REALM_ID, '5');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicyRpEntityName', PLAYERS_REALM_ID, 'keycloak');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicySignatureAlgorithms', PLAYERS_REALM_ID, 'ES256');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicyRpId', PLAYERS_REALM_ID, '');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicyAttestationConveyancePreference', PLAYERS_REALM_ID, 'not specified');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicyAuthenticatorAttachment', PLAYERS_REALM_ID, 'not specified');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicyRequireResidentKey', PLAYERS_REALM_ID, 'not specified');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicyUserVerificationRequirement', PLAYERS_REALM_ID, 'not specified');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicyCreateTimeout', PLAYERS_REALM_ID, '0');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicyAvoidSameAuthenticatorRegister', PLAYERS_REALM_ID, 'false');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicyRpEntityNamePasswordless', PLAYERS_REALM_ID, 'keycloak');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicySignatureAlgorithmsPasswordless', PLAYERS_REALM_ID, 'ES256');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicyRpIdPasswordless', PLAYERS_REALM_ID, '');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicyAttestationConveyancePreferencePasswordless', PLAYERS_REALM_ID, 'not specified');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicyAuthenticatorAttachmentPasswordless', PLAYERS_REALM_ID, 'not specified');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicyRequireResidentKeyPasswordless', PLAYERS_REALM_ID, 'not specified');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicyUserVerificationRequirementPasswordless', PLAYERS_REALM_ID, 'not specified');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicyCreateTimeoutPasswordless', PLAYERS_REALM_ID, '0');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless', PLAYERS_REALM_ID, 'false');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('cibaBackchannelTokenDeliveryMode', PLAYERS_REALM_ID, 'poll');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('cibaExpiresIn', PLAYERS_REALM_ID, '120');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('cibaInterval', PLAYERS_REALM_ID, '5');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('cibaAuthRequestedUserHint', PLAYERS_REALM_ID, 'login_hint');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('parRequestUriLifespan', PLAYERS_REALM_ID, '60');
INSERT INTO public.realm_attribute
("name", realm_id, value)
VALUES('firstBrokerLoginFlowId', PLAYERS_REALM_ID, 'd0691215-c842-4366-bad5-fcc28edd978c');

----- authentication_flow ------
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'browser', 'browser based authentication', PLAYERS_REALM_ID, 'basic-flow', true, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'forms', 'Username, password, otp and other auth forms.', PLAYERS_REALM_ID, 'basic-flow', false, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'Browser - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', PLAYERS_REALM_ID, 'basic-flow', false, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'direct grant', 'OpenID Connect Resource Owner Grant', PLAYERS_REALM_ID, 'basic-flow', true, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'Direct Grant - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', PLAYERS_REALM_ID, 'basic-flow', false, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'registration', 'registration flow', PLAYERS_REALM_ID, 'basic-flow', true, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'registration form', 'registration form', PLAYERS_REALM_ID, 'form-flow', false, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'reset credentials', 'Reset credentials for a user if they forgot their password or something', PLAYERS_REALM_ID, 'basic-flow', true, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'Reset - Conditional OTP', 'Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.', PLAYERS_REALM_ID, 'basic-flow', false, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'clients', 'Base authentication for clients', PLAYERS_REALM_ID, 'client-flow', true, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'first broker login', 'Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account', PLAYERS_REALM_ID, 'basic-flow', true, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'User creation or linking', 'Flow for the existing/non-existing user alternatives', PLAYERS_REALM_ID, 'basic-flow', false, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'Handle Existing Account', 'Handle what to do if there is existing account with same email/username like authenticated identity provider', PLAYERS_REALM_ID, 'basic-flow', false, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'Account verification options', 'Method with which to verity the existing account', PLAYERS_REALM_ID, 'basic-flow', false, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'Verify Existing Account by Re-authentication', 'Reauthentication of existing account', PLAYERS_REALM_ID, 'basic-flow', false, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'First broker login - Conditional OTP', 'Flow to determine if the OTP is required for the authentication', PLAYERS_REALM_ID, 'basic-flow', false, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'saml ecp', 'SAML ECP Profile Authentication Flow', PLAYERS_REALM_ID, 'basic-flow', true, true);
INSERT INTO public.authentication_flow
(id, alias, description, realm_id, provider_id, top_level, built_in)
VALUES(gen_random_uuid (), 'docker auth', 'Used by Docker clients to authenticate against the IDP', PLAYERS_REALM_ID, 'basic-flow', true, true);

----- authenticator_config ------
INSERT INTO public.authenticator_config
(id, alias, realm_id)
VALUES(gen_random_uuid (), 'review profile config', PLAYERS_REALM_ID);
INSERT INTO public.authenticator_config
(id, alias, realm_id)
VALUES(gen_random_uuid (), 'create unique user config', PLAYERS_REALM_ID);

----- authenticator_config_entry ------
INSERT INTO public.authenticator_config_entry
SELECT id, 'false', 'require.password.update.after.registration' FROM public.authenticator_config WHERE alias = 'create unique user config' AND realm_id = PLAYERS_REALM_ID;

INSERT INTO public.authenticator_config_entry
SELECT id, 'missing', 'update.profile.on.first.login' FROM public.authenticator_config WHERE alias = 'review profile config' AND realm_id = PLAYERS_REALM_ID;

----- authentication_execution ------
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'auth-cookie', PLAYERS_REALM_ID, id, 2, 10, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'browser';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'auth-spnego', PLAYERS_REALM_ID, id, 3, 20, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'browser';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'identity-provider-redirector', PLAYERS_REALM_ID, id, 2, 25, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'browser';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'auth-username-password-form', PLAYERS_REALM_ID, id, 0, 10, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'forms';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, NULL, PLAYERS_REALM_ID,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'browser'),
       2, 30, true,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'forms'),
       NULL;
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, NULL, PLAYERS_REALM_ID,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'forms'),
       1, 20, true,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Browser - Conditional OTP'),
       NULL;
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'conditional-user-configured', PLAYERS_REALM_ID, id, 0, 10, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Browser - Conditional OTP';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'auth-otp-form', PLAYERS_REALM_ID, id, 0, 20, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Browser - Conditional OTP';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'direct-grant-validate-username', PLAYERS_REALM_ID, id, 0, 10, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'direct grant';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'direct-grant-validate-password', PLAYERS_REALM_ID, id, 0, 20, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'direct grant';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, NULL, PLAYERS_REALM_ID,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'direct grant'),
       1, 30, true,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Direct Grant - Conditional OTP'),
       NULL;
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'conditional-user-configured', PLAYERS_REALM_ID, id, 0, 10, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Direct Grant - Conditional OTP';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'direct-grant-validate-otp', PLAYERS_REALM_ID, id, 0, 20, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Direct Grant - Conditional OTP';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'registration-page-form', PLAYERS_REALM_ID,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'registration'),
       1, 10, true,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'registration form'),
       NULL;
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'registration-user-creation', PLAYERS_REALM_ID, id, 0, 20, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'registration form';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'registration-password-action', PLAYERS_REALM_ID, id, 0, 50, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'registration form';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'registration-recaptcha-action', PLAYERS_REALM_ID, id, 3, 60, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'registration form';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'registration-terms-and-conditions', PLAYERS_REALM_ID, id, 3, 70, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'registration form';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'reset-credentials-choose-user', PLAYERS_REALM_ID, id, 0, 10, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'reset credentials';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'reset-credential-email', PLAYERS_REALM_ID, id, 0, 20, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'reset credentials';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'reset-password', PLAYERS_REALM_ID, id, 0, 30, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'reset credentials';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'registration-page-form', PLAYERS_REALM_ID,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'reset credentials'),
       1, 40, true,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Reset - Conditional OTP'),
       NULL;
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'conditional-user-configured', PLAYERS_REALM_ID, id, 0, 10, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Reset - Conditional OTP';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'reset-otp', PLAYERS_REALM_ID, id, 0, 20, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Reset - Conditional OTP';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'client-secret', PLAYERS_REALM_ID, id, 2, 10, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Reset - Conditional OTP';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'client-jwt', PLAYERS_REALM_ID, id, 2, 20, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Reset - Conditional OTP';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'client-secret-jwt', PLAYERS_REALM_ID, id, 2, 30, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Reset - Conditional OTP';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'client-x509', PLAYERS_REALM_ID, id, 2, 40, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Reset - Conditional OTP';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'idp-review-profile', PLAYERS_REALM_ID,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'first broker login'),
       0, 10, true, NULL,
       (select id from public.authenticator_config WHERE realm_id = PLAYERS_REALM_ID AND alias = 'review profile config');
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, NULL, PLAYERS_REALM_ID,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'first broker login'),
       0, 20, true,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'User creation or linking'),
       NULL;
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'idp-create-user-if-unique', PLAYERS_REALM_ID,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'User creation or linking'),
       2, 10, false, NULL,
       (select id from public.authenticator_config WHERE realm_id = PLAYERS_REALM_ID AND alias = 'create unique user config');
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, NULL, PLAYERS_REALM_ID,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'User creation or linking'),
       2, 20, true,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Handle Existing Account'),
       NULL;
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'idp-confirm-link', PLAYERS_REALM_ID, id, 0, 10, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Handle Existing Account';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, NULL, PLAYERS_REALM_ID,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Handle Existing Account'),
       0, 20, true,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Account verification options'),
       NULL;
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'idp-email-verification', PLAYERS_REALM_ID, id, 2, 10, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Account verification options';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, NULL, PLAYERS_REALM_ID,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Account verification options'),
       2, 20, true,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Verify Existing Account by Re-authentication'),
       NULL;
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'idp-username-password-form', PLAYERS_REALM_ID, id, 0, 10, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Verify Existing Account by Re-authentication';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, NULL, PLAYERS_REALM_ID,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'Verify Existing Account by Re-authentication'),
       1, 20, true,
       (select id from public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'First broker login - Conditional OTP'),
       NULL;
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'conditional-user-configured', PLAYERS_REALM_ID, id, 0, 10, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'First broker login - Conditional OTP';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'auth-otp-form', PLAYERS_REALM_ID, id, 0, 20, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'First broker login - Conditional OTP';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'http-basic-authenticator', PLAYERS_REALM_ID, id, 0, 10, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'saml ecp';
INSERT INTO public.authentication_execution
SELECT gen_random_uuid (), NULL, 'docker-http-basic-authenticator', PLAYERS_REALM_ID, id, 0, 10, false, NULL, NULL FROM public.authentication_flow WHERE realm_id = PLAYERS_REALM_ID AND alias = 'docker auth';

---- component ----
INSERT INTO public.component
(id, "name", parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES(gen_random_uuid (), 'rsa-generated', PLAYERS_REALM_ID, 'rsa-generated', 'org.keycloak.keys.KeyProvider', PLAYERS_REALM_ID, NULL);
INSERT INTO public.component
(id, "name", parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES(gen_random_uuid (), 'rsa-enc-generated', PLAYERS_REALM_ID, 'rsa-enc-generated', 'org.keycloak.keys.KeyProvider', PLAYERS_REALM_ID, NULL);
INSERT INTO public.component
(id, "name", parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES(gen_random_uuid (), 'hmac-generated-hs512', PLAYERS_REALM_ID, 'hmac-generated', 'org.keycloak.keys.KeyProvider', PLAYERS_REALM_ID, NULL);
INSERT INTO public.component
(id, "name", parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES(gen_random_uuid (), 'aes-generated', PLAYERS_REALM_ID, 'aes-generated', 'org.keycloak.keys.KeyProvider', PLAYERS_REALM_ID, NULL);
INSERT INTO public.component
(id, "name", parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES(gen_random_uuid (), 'Trusted Hosts', PLAYERS_REALM_ID, 'trusted-hosts', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', PLAYERS_REALM_ID, 'anonymous');
INSERT INTO public.component
(id, "name", parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES(gen_random_uuid (), 'Consent Required', PLAYERS_REALM_ID, 'consent-required', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', PLAYERS_REALM_ID, 'anonymous');
INSERT INTO public.component
(id, "name", parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES(gen_random_uuid (), 'Full Scope Disabled', PLAYERS_REALM_ID, 'scope', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', PLAYERS_REALM_ID, 'anonymous');
INSERT INTO public.component
(id, "name", parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES(gen_random_uuid (), 'Max Clients Limit', PLAYERS_REALM_ID, 'max-clients', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', PLAYERS_REALM_ID, 'anonymous');
INSERT INTO public.component
(id, "name", parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES(gen_random_uuid (), 'Allowed Protocol Mapper Types', PLAYERS_REALM_ID, 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', PLAYERS_REALM_ID, 'anonymous');
INSERT INTO public.component
(id, "name", parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES(gen_random_uuid (), 'Allowed Client Scopes', PLAYERS_REALM_ID, 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', PLAYERS_REALM_ID, 'anonymous');
INSERT INTO public.component
(id, "name", parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES(gen_random_uuid (), 'Allowed Protocol Mapper Types', PLAYERS_REALM_ID, 'allowed-protocol-mappers', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', PLAYERS_REALM_ID, 'authenticated');
INSERT INTO public.component
(id, "name", parent_id, provider_id, provider_type, realm_id, sub_type)
VALUES(gen_random_uuid (), 'Allowed Client Scopes', PLAYERS_REALM_ID, 'allowed-client-templates', 'org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy', PLAYERS_REALM_ID, 'authenticated');

---- component_config ----
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'keyUse', 'SIG' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'rsa-generated';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'certificate', 'MIICnTCCAYUCBgGRNw12iTANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdnZW5lc2lzMB4XDTI0MDgwOTEyMTAxNFoXDTM0MDgwOTEyMTE1NFowEjEQMA4GA1UEAwwHZ2VuZXNpczCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ89t1f9wTs08y50DNfpgL7SqBqZxi6DhG7NlgMEOLqDIjinc11mOyZiA5ZCHNIuOCu72a8IWpAZOR1fDdlW68wvkH6CCxtZLv/y58jsCHwtAzl4k8DjISTrNjCTCIZfu7cB1qUd52WcwMrU6eb+MbQL+gLaoOAusVPUmcfdve2UkSkvTspG2FM8GsNn+DR1NHYCcIjG5yQpGJKLROcSIm+4z7GEkH1YlWXpqp9WIRcPUTEJSI+hXZBYwHS/ofXLqdrIHpbWgRoJDivun4NoyXqNnA921wLmJbAn32bTlkAXXiI4IApmz5Tknw15H4XAvmOj0FZDoBtFQM8FbX7oeN8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAB1+ykXoX066gcBA24Lawx/1AVNA0UGqoI2Xm7jGjws/wxMheHmzhhTrpV/oUA65QWkaRWVOuNREyX3aU+7d3PAGHVQYKhS2S0lge2zOjR7zr7H/W9sA6oHWF6E0o5bEo/fVnm0cBLxocmhIKWSdOvw2weW8hE81G22DrnPrcNZRw74+qtsEzRBJeHY3TGzuLmoFnoznbO/YxbZCq8cMi/5oheCc3vbB5ftSfopr6uLHgnogxFb/9SgfDwcIvShItK0R7yO4SkEuiuzNwsUpIKV5ClTNPEjN+XIwsRq7ontXG+22l7FHT5tFmkEw0MfcjwyNcm4Plr7DmwbA3KEDCvg==' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'rsa-generated';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'priority', '100' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'rsa-generated';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'privateKey', 'MIIEowIBAAKCAQEAnz23V/3BOzTzLnQM1+mAvtKoGpnGLoOEbs2WAwQ4uoMiOKdzXWY7JmIDlkIc0i44K7vZrwhakBk5HV8N2VbrzC+QfoILG1ku//LnyOwIfC0DOXiTwOMhJOs2MJMIhl+7twHWpR3nZZzAytTp5v4xtAv6Atqg4C6xU9SZx9297ZSRKS9OykbYUzwaw2f4NHU0dgJwiMbnJCkYkotE5xIib7jPsYSQfViVZemqn1YhFw9RMQlIj6FdkFjAdL+h9cup2sgeltaBGgkOK+6fg2jJeo2cD3bXAuYlsCffZtOWQBdeIjggCmbPlOSfDXkfhcC+Y6PQVkOgG0VAzwVtfuh43wIDAQABAoIBAD3nC3Fguy+tb0VlJqL+aiaEFIY2tgRZ6u7563FjwDu9A14btiyeM6tBmdxc+gA4qGxT25T/vdjbfUjuLR+KeyKGcPjEy9WHT05/GlyQaOIAy4qZVXK7uKQ17Xxng/5ck8faJptMayokjAutRfoeYar4pulaHQTZEeUhNeCs0grbQ02dWNJND/fa7q/E0lFyanrFcEKArL+p8YLh7bPKnBjlwfaK1txdL+0Y6qn2jwsPF1LFaXPAfZXdXSI4iS1LuNWSAK6GqQmFZ9xWObkT0o3Q29WaPOAffc6DTjR4kCwVWpLcmICZBzFuF7+II3nNqiLmWfjeAhbb3TOSCnD2eikCgYEA2Lt2OjnXkruo60KA5eJvCiKwADWo+zsKy9UQfXnSWnUWkzCnFMswJzl8JPOrvgoTTttgvuJcH7npWl1HEg5AFbwfA9QsnJfkmAVhhUDkOsV+b+vw/XT1ix2oaF2U81m2veay11CO6PYs+4SmeyywQc/B8PiY8JXOBRWPCaUwTLkCgYEAvBeub0KgHWJJ86xBtoUVQ49yqfacfA13f5J2cn/2F39hbhrLc8FuXq+cvMCjuD2SjTIlCUK8sxCKfVAXp9i+rcaOomJn5gtBJBzF7RV4U78WqXvdAWh5t0kl3t6H6x3o+24oggPwxd9XW4fmRYf0RrErMUis+NtBTXITXgHallcCgYB5u0E6jwaAChtkmGPhuv73SGhmlb0l7xGvTysF7wixehaF8cvGqCGRxn3uG1cZVHtnzVxXmrh3sWpaMQ4cHBjunE0nT2MHSWFB6bPOrpYCVK8hmfovwiOwUaYniHiC/p7fptZIjZzXSH4Xf3gqsv0E2fZqrJbqepnOzT8cAcZRMQKBgQC6obTPaQh+n3xJcG5zsHF86+UWiECVRrd/udAVpKqGfjoqiiO94/yjrxSSpYLN2SqFN3BQVAvwkUUZOlN+lC3/N7lnnsUBGcG1F2e860TNtBnEacbNEuFS4B3Xmm66+J6ofJFtEIPjksyXYa026MOVMU5uRHJ9KvEM61gUOzqtWQKBgEt1oseSTyuF2uPT6gMEL3no1Cmawr2E3aIVKxFizFzxizMJgCH3TsVfl3pf2FBt2gVyDnrykiwzzBsBDBrIOXywR+y6CUAuAdOQrYN576I1KdgJy7VYZd6AA+QCIy9hMXK1ANmj7GHbFXEaJsue49Z5HcBRk6rN+bA4jodqrCPO' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'rsa-enc-generated';

INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'keyUse', 'ENC' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'rsa-enc-generated';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'certificate', 'MIICnTCCAYUCBgGRNw13CTANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdnZW5lc2lzMB4XDTI0MDgwOTEyMTAxNVoXDTM0MDgwOTEyMTE1NVowEjEQMA4GA1UEAwwHZ2VuZXNpczCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALB6Naqf1Fslnp9tBrA5a3q/r6qG+ITd2b5M6tzdLyg0OIm3HHv02Nhq8/0o/E4WBGDfKtwIg2dhhv6SOefQduf/SCoECD1aTjayMgKE4KHu70K+HPUYX/uHDdBgmbthVi8eYT/CLJWAEIbO60U3QXI7wVS8R2TrPrG8vMUZJHHR7qGh1g8HpfudZIEDf5U+iquSjCHF+Hm/8vo6XAQcWllkb6vE6tDw3q3b/BP50y8+OBQzSJnou/gOXPeMWeM0X2m9153pkxzjzSu5vBPPBv3XpwSPxl+QbEhgY6LAkfRexrGSzxHmSSq1t/EGh53qQWOFVrrSzoNDNPEfJ/LrhoMCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAT9ZUY2/KGMkrnNsteCr+TmMIplwAQ7+0+q2AjB/4urlfKWXvdxlR9J1Ye7byT2tI5eofuaCKWiOORMxlMtrAWeh7n21z0rGT3gYgiIeOBnScixJiGA6K9MHhW5MVlDzCC7EjzRuevij7uLDZKNFSy5biwlhhyFAyBRUR5liH12GHqhU+ZsAhx9H+AZzv2llv7P3JM2ZG62uQrZYzjdYaLk+2JQrReGG8q/Zv3IRvPCFJEYT4rusH1kQxF2WxtE/0SAfYqLslulRc1A4zuubjwEJCJyK3QJA5jDtKAnT6UoRKaF9B43opNRMQ/pI6W5Mk8GokFm3+ZxjJxH+MwO4cjA==' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'rsa-enc-generated';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'priority', '100' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'rsa-enc-generated';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'privateKey', 'MIIEogIBAAKCAQEAsHo1qp/UWyWen20GsDlrer+vqob4hN3Zvkzq3N0vKDQ4ibcce/TY2Grz/Sj8ThYEYN8q3AiDZ2GG/pI559B25/9IKgQIPVpONrIyAoTgoe7vQr4c9Rhf+4cN0GCZu2FWLx5hP8IslYAQhs7rRTdBcjvBVLxHZOs+sby8xRkkcdHuoaHWDwel+51kgQN/lT6Kq5KMIcX4eb/y+jpcBBxaWWRvq8Tq0PDerdv8E/nTLz44FDNImei7+A5c94xZ4zRfab3XnemTHOPNK7m8E88G/denBI/GX5BsSGBjosCR9F7GsZLPEeZJKrW38QaHnepBY4VWutLOg0M08R8n8uuGgwIDAQABAoIBAAH6iZnm8aiVj8u8NM3KnWvigYO187KTRWe4aqgc5FrdCwbWqL9/2Hz35gU51AP3UNRzn07/dKNQf2tg4SLtcW5BRhV1tunvlngcICqeQ5Tm0VC8Qb+o84Dy2+X9z0g/wfAEgfttbLaLmXCjGhXML5p3FQ0JxC5bfN525HiJQzrx2aUEtyBHswEZSYOjHwSD1PZ26E0pv5h2Z30I+69mKCuNxxQUtoHFiBGKltWtyxOEC4Bht79i/RjGiIH05SIvLsM2VsHf6meNzv3KWSO2rFLl7nwUp+qaF+13VbZgE6qL/2ksV+Jcb73xgeh4VUHd0bmSfWLbcnaWT20oCP4TfEECgYEA5jxNUSsayc4+nfkHpKoMxGXamyx66GKYZ2zOkPha1YNu2r5/F6aITLdYWIy0m77EGgxhTQ3zNlcQ5ywssCJXfx9W0I+rD3Y5+z+LIKgeQe8mn+mI/axl1HjiKl36P+Yi6zXQOMHGSnP8ssew8s9+scdjaGuZ9OSGpngF3VlKwVMCgYEAxDndUWY3P2aLb2OrN7fkwJhDczumxkv4mUP0ZDTIOALZxMaaoNP+S8Ve21FCce572m7MgKqj1E8JjiaVE0oFGW3VaM9wKuz2+TjHt0VLBpDDOEtnf8uwnCUJcxBPbxp5m4dF6WdJNX0C7nQ5hqlk3/PaYp8zpuHG3UGuxTIykBECgYAoDWuB6FbDrq5z+uOagL6x1+o8vnMvRB+xNluFGr9qj2/Ue/lOGvlxJyAmX2v4ACrLQUYYCoo59NGK9cNcbMz932zR4XxntzCFBdvlNXn2DG2SuiTLxJb+bH0j0696OEXw1y6/AO7G+wCF9XlR9EjdEou3mahx0uOdyBl1FViM4wKBgCR6OUlDfiu8DVmkppSSC+U9qPRH94XPY6RiPJFQOpQm+4KYBPC22AQP6cVNgtOZKM7/X+bfUdtK4hTZ2UafsPj8MPrt7QUdzf+gbYgFSqAq0w+o/NGF9Qvh2rLYKlwWCNs/t2BfQf2+gof/dR4yaT00oLlKrRhtykEhT7L61OlxAoGAIVt0WmPM3yR8vrZJcIzkosTVU9hGC6O9nOFcaNTBzQ6NW38DAsH4qnXXKVpE97PiL5ySJZKPtREowqssvQ1+2W1I70qW9BHcgHuyJ7tuOXVfyrYmGyo1WSyCAlX2SzjmW3WucpGGjQmJveNim30bidtbvSaNjjsfwnJSz5ZZkRY=' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'rsa-enc-generated';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'algorithm', 'RSA-OAEP' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'rsa-enc-generated';

INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'keyUse', 'SIG' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'hmac-generated-hs512';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'certificate', 'MIICnTCCAYUCBgGRNw12iTANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdnZW5lc2lzMB4XDTI0MDgwOTEyMTAxNFoXDTM0MDgwOTEyMTE1NFowEjEQMA4GA1UEAwwHZ2VuZXNpczCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJ89t1f9wTs08y50DNfpgL7SqBqZxi6DhG7NlgMEOLqDIjinc11mOyZiA5ZCHNIuOCu72a8IWpAZOR1fDdlW68wvkH6CCxtZLv/y58jsCHwtAzl4k8DjISTrNjCTCIZfu7cB1qUd52WcwMrU6eb+MbQL+gLaoOAusVPUmcfdve2UkSkvTspG2FM8GsNn+DR1NHYCcIjG5yQpGJKLROcSIm+4z7GEkH1YlWXpqp9WIRcPUTEJSI+hXZBYwHS/ofXLqdrIHpbWgRoJDivun4NoyXqNnA921wLmJbAn32bTlkAXXiI4IApmz5Tknw15H4XAvmOj0FZDoBtFQM8FbX7oeN8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAB1+ykXoX066gcBA24Lawx/1AVNA0UGqoI2Xm7jGjws/wxMheHmzhhTrpV/oUA65QWkaRWVOuNREyX3aU+7d3PAGHVQYKhS2S0lge2zOjR7zr7H/W9sA6oHWF6E0o5bEo/fVnm0cBLxocmhIKWSdOvw2weW8hE81G22DrnPrcNZRw74+qtsEzRBJeHY3TGzuLmoFnoznbO/YxbZCq8cMi/5oheCc3vbB5ftSfopr6uLHgnogxFb/9SgfDwcIvShItK0R7yO4SkEuiuzNwsUpIKV5ClTNPEjN+XIwsRq7ontXG+22l7FHT5tFmkEw0MfcjwyNcm4Plr7DmwbA3KEDCvg==' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'hmac-generated-hs512';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'priority', '100' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'hmac-generated-hs512';

INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'kid', gen_random_uuid () FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'aes-generated';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'secret', '1dEPajKZ4hzd2IqKJ7unAw' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'aes-generated';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'priority', '100' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'aes-generated';

INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'client-uris-must-match', 'true' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Trusted Hosts';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'host-sending-registration-request-must-match', 'true' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Trusted Hosts';

INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allowed-protocol-mapper-types', 'saml-user-property-mapper' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Protocol Mapper Types' and sub_type = 'anonymous';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Protocol Mapper Types' and sub_type = 'anonymous';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Protocol Mapper Types' and sub_type = 'anonymous';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allowed-protocol-mapper-types', 'oidc-full-name-mapper' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Protocol Mapper Types' and sub_type = 'anonymous';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allowed-protocol-mapper-types', 'saml-role-list-mapper' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Protocol Mapper Types' and sub_type = 'anonymous';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Protocol Mapper Types' and sub_type = 'anonymous';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Protocol Mapper Types' and sub_type = 'anonymous';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allowed-protocol-mapper-types', 'oidc-address-mapper' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Protocol Mapper Types' and sub_type = 'anonymous';

INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'max-clients', '200' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Max Clients Limit';

INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allow-default-scopes', 'true' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Client Scopes' and sub_type = 'anonymous';

INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allowed-protocol-mapper-types', 'saml-user-property-mapper' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Protocol Mapper Types' and sub_type = 'authenticated';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allowed-protocol-mapper-types', 'oidc-usermodel-property-mapper' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Protocol Mapper Types' and sub_type = 'authenticated';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allowed-protocol-mapper-types', 'oidc-sha256-pairwise-sub-mapper' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Protocol Mapper Types' and sub_type = 'authenticated';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allowed-protocol-mapper-types', 'oidc-full-name-mapper' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Protocol Mapper Types' and sub_type = 'authenticated';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allowed-protocol-mapper-types', 'saml-role-list-mapper' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Protocol Mapper Types' and sub_type = 'authenticated';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allowed-protocol-mapper-types', 'saml-user-attribute-mapper' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Protocol Mapper Types' and sub_type = 'authenticated';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allowed-protocol-mapper-types', 'oidc-usermodel-attribute-mapper' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Protocol Mapper Types' and sub_type = 'authenticated';
INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allowed-protocol-mapper-types', 'oidc-address-mapper' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Protocol Mapper Types' and sub_type = 'authenticated';

INSERT INTO public.component_config
SELECT gen_random_uuid (), id, 'allow-default-scopes', 'true' FROM public.component WHERE realm_id = PLAYERS_REALM_ID AND name = 'Allowed Client Scopes' and sub_type = 'authenticated';

---- required_action_provider ----
INSERT INTO public.required_action_provider
(id, alias, "name", realm_id, enabled, default_action, provider_id, priority)
VALUES(gen_random_uuid (), 'VERIFY_EMAIL', 'Verify Email', PLAYERS_REALM_ID, true, false, 'VERIFY_EMAIL', 50);
INSERT INTO public.required_action_provider
(id, alias, "name", realm_id, enabled, default_action, provider_id, priority)
VALUES(gen_random_uuid (), 'UPDATE_PROFILE', 'Update Profile', PLAYERS_REALM_ID, true, false, 'UPDATE_PROFILE', 40);
INSERT INTO public.required_action_provider
(id, alias, "name", realm_id, enabled, default_action, provider_id, priority)
VALUES(gen_random_uuid (), 'CONFIGURE_TOTP', 'Configure OTP', PLAYERS_REALM_ID, true, false, 'CONFIGURE_TOTP', 10);
INSERT INTO public.required_action_provider
(id, alias, "name", realm_id, enabled, default_action, provider_id, priority)
VALUES(gen_random_uuid (), 'UPDATE_PASSWORD', 'Update Password', PLAYERS_REALM_ID, true, false, 'UPDATE_PASSWORD', 30);
INSERT INTO public.required_action_provider
(id, alias, "name", realm_id, enabled, default_action, provider_id, priority)
VALUES(gen_random_uuid (), 'TERMS_AND_CONDITIONS', 'Terms and Conditions', PLAYERS_REALM_ID, false, false, 'TERMS_AND_CONDITIONS', 20);
INSERT INTO public.required_action_provider
(id, alias, "name", realm_id, enabled, default_action, provider_id, priority)
VALUES(gen_random_uuid (), 'delete_account', 'Delete Account', PLAYERS_REALM_ID, false, false, 'delete_account', 60);
INSERT INTO public.required_action_provider
(id, alias, "name", realm_id, enabled, default_action, provider_id, priority)
VALUES(gen_random_uuid (), 'delete_credential', 'Delete Credential', PLAYERS_REALM_ID, true, false, 'delete_credential', 100);
INSERT INTO public.required_action_provider
(id, alias, "name", realm_id, enabled, default_action, provider_id, priority)
VALUES(gen_random_uuid (), 'update_user_locale', 'Update User Locale', PLAYERS_REALM_ID, true, false, 'update_user_locale', 1000);
INSERT INTO public.required_action_provider
(id, alias, "name", realm_id, enabled, default_action, provider_id, priority)
VALUES(gen_random_uuid (), 'webauthn-register', 'Webauthn Register', PLAYERS_REALM_ID, true, false, 'webauthn-register', 70);
INSERT INTO public.required_action_provider
(id, alias, "name", realm_id, enabled, default_action, provider_id, priority)
VALUES(gen_random_uuid (), 'webauthn-register-passwordless', 'Webauthn Register Passwordless', PLAYERS_REALM_ID, true, false, 'webauthn-register-passwordless', 80);
INSERT INTO public.required_action_provider
(id, alias, "name", realm_id, enabled, default_action, provider_id, priority)
VALUES(gen_random_uuid (), 'VERIFY_PROFILE', 'Verify Profile', PLAYERS_REALM_ID, true, false, 'VERIFY_PROFILE', 90);
END $$;

COMMIT;