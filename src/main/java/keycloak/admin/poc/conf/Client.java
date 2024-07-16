package keycloak.admin.poc.conf;

public class Client {

    private String clientId;
    private String clientSecret;
    private String redirectUris;
    private String baseUrl;
    private boolean serviceAccountEnabled;
    private boolean directAccessGrant;

    public String getRedirectUris() {
        return redirectUris;
    }

    public void setRedirectUris(String redirectUris) {
        this.redirectUris = redirectUris;
    }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public String getClientSecret() {
        return clientSecret;
    }

    public void setClientSecret(String clientSecret) {
        this.clientSecret = clientSecret;
    }

    public boolean isServiceAccountEnabled() {
        return serviceAccountEnabled;
    }

    public void setServiceAccountEnabled(boolean serviceAccountEnabled) {
        this.serviceAccountEnabled = serviceAccountEnabled;
    }

    public boolean isDirectAccessGrant() {
        return directAccessGrant;
    }

    public void setDirectAccessGrant(boolean directAccessGrant) {
        this.directAccessGrant = directAccessGrant;
    }

    public String getBaseUrl() {
        return baseUrl;
    }

    public void setBaseUrl(String baseUrl) {
        this.baseUrl = baseUrl;
    }
}
