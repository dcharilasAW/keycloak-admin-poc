package keycloak.admin.poc.conf;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
@ConfigurationProperties(prefix = "configuration")
public class RealmConfig {

    private List<Realm> realms;

    public List<Realm> getRealms() {
        return realms;
    }

    public void setRealms(List<Realm> realms) {
        this.realms = realms;
    }
}