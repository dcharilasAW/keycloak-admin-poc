BEGIN;

DO $$
    DECLARE
        REALM_IDS TEXT[] := array['27e6487e-2bdf-4300-93de-f6de5fdb2a1a'];
    BEGIN

        -- realm
        delete from public.authenticator_config_entry where authenticator_id in (select id from public.authenticator_config where realm_id = ANY(REALM_IDS));
        delete from public.authenticator_config where realm_id = ANY(REALM_IDS);
        delete from public.authentication_execution where flow_id in (select id from public.authentication_flow where realm_id = ANY(REALM_IDS));
        delete from public.authentication_flow where realm_id = ANY(REALM_IDS);
        delete from public.realm_attribute where realm_id = ANY(REALM_IDS);
        delete from public.realm_required_credential where realm_id = ANY(REALM_IDS);
        delete from public.realm_events_listeners where realm_id = ANY(REALM_IDS);
        delete from public.component_config where component_id in (select id from public.component where realm_id = ANY(REALM_IDS));
        delete from public.component where realm_id = ANY(REALM_IDS);
        delete from public.required_action_provider where realm_id = ANY(REALM_IDS);

        -- default clients
        delete from public.redirect_uris where client_id in (select id from public.client where realm_id = ANY(REALM_IDS));
        delete from public.web_origins where client_id in (select id from public.client where realm_id = ANY(REALM_IDS));
        delete from public.client_attributes where client_id in (select id from public.client where realm_id = ANY(REALM_IDS));
        delete from public.client_scope_attributes where scope_id in (select id from public.client_scope where realm_id = ANY(REALM_IDS));
        delete from public.client_scope_client where scope_id in (select id from public.client_scope where realm_id = ANY(REALM_IDS));
        delete from public.scope_mapping where role_id in (select id from public.keycloak_role where realm_id = ANY(REALM_IDS));

        delete from public.client_scope_role_mapping where scope_id in (select id from public.client_scope where realm_id = ANY(REALM_IDS));
        delete from public.protocol_mapper_config where protocol_mapper_id in (
            select id from public.protocol_mapper where client_id is not null and client_id in (
                select id from public.client where realm_id = ANY(REALM_IDS)
            )
        );
        delete from public.protocol_mapper where client_id is not null and client_id in (select id from public.client where realm_id = ANY(REALM_IDS));
        delete from public.protocol_mapper_config where protocol_mapper_id in (
            select id from public.protocol_mapper where client_scope_id is not null and client_scope_id in (
                select id from public.client_scope where realm_id = ANY(REALM_IDS)
            )
        );
        delete from public.protocol_mapper where client_scope_id is not null and client_scope_id in (select id from public.client_scope where realm_id = ANY(REALM_IDS));
        delete from public.client_scope where realm_id = ANY(REALM_IDS);


        -- final
        delete from public.keycloak_role where realm_id = ANY(REALM_IDS);
        delete from public.client where realm_id = ANY(REALM_IDS) or client_id like 'genesis-%-realm';
        delete from public.realm where id = ANY(REALM_IDS);
        delete from public.databasechangelog where id = 'raw';

    END $$;

commit;