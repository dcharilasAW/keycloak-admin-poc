package keycloak.admin.poc.service;

import keycloak.admin.poc.conf.Client;
import keycloak.admin.poc.conf.Realm;
import keycloak.admin.poc.conf.RealmConfig;
import keycloak.admin.poc.conf.User;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.representations.idm.ClientRepresentation;
import org.keycloak.representations.idm.CredentialRepresentation;
import org.keycloak.representations.idm.RealmRepresentation;
import org.keycloak.representations.idm.UserRepresentation;
import org.springframework.stereotype.Service;

import java.util.Collections;

import static java.util.Objects.nonNull;

@Service
public class KeycloakAdminService {

    private final Keycloak keycloak;

    public KeycloakAdminService(Keycloak keycloak, RealmConfig realmConfig) {
        this.keycloak = keycloak;
        realmConfig.getRealms().forEach(this::createRealm);
    }

    public void createRealm(Realm realm) {
        // delete the realm if it already exists
        keycloak.realm(realm.getName()).remove();

        // Create a new realm
        RealmRepresentation newRealm = new RealmRepresentation();
        newRealm.setRealm(realm.getName());
        newRealm.setEnabled(true);

        keycloak.realms().create(newRealm);
        realm.getClients().forEach(c -> createClient(realm.getName(), c));
        realm.getUsers().forEach(u -> createUser(realm.getName(), u));
    }

    public void createClient(String realmName, Client client) {
        // Create a new client in the new realm
        ClientRepresentation newClient = new ClientRepresentation();
        newClient.setClientId(client.getClientId());
        newClient.setEnabled(true);
        if (nonNull(client.getRedirectUris())) {
            newClient.setRedirectUris(Collections.singletonList(client.getRedirectUris()));
        }
        newClient.setBaseUrl(client.getBaseUrl());
        newClient.setServiceAccountsEnabled(client.isServiceAccountEnabled());
        newClient.setDirectAccessGrantsEnabled(client.isDirectAccessGrant()); // Allow direct access grants
        newClient.setSecret(client.getClientSecret()); // Set the client secret

        keycloak.realm(realmName).clients().create(newClient);
    }

    public void createUser(String realmName, User user) {
        UserRepresentation newUser = new UserRepresentation();
        newUser.setUsername(user.getUsername());
        newUser.setEmail(user.getEmail());
        newUser.setFirstName(user.getFirstname());
        newUser.setLastName(user.getLastname());
        newUser.setEnabled(true); // Optional: Set user enabled status

        // Set plain text password
        CredentialRepresentation credential = new CredentialRepresentation();
        credential.setType(CredentialRepresentation.PASSWORD);
        credential.setValue(user.getPassword());
        credential.setTemporary(false); // Optionally set to false if you want to make the password non-temporary

        newUser.setCredentials(Collections.singletonList(credential));
        keycloak.realm(realmName).users().create(newUser);
    }

}
