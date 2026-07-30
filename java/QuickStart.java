// QuantumProxies — Java quickstart (java.net.http, JDK 11+).
// Rotating residential proxies: new IP per request, sticky sessions, geo-targeting.
// Get credentials at https://quantumproxies.io
//
//   javac QuickStart.java && java -Djdk.http.auth.tunneling.disabledSchemes= QuickStart

import java.net.Authenticator;
import java.net.InetSocketAddress;
import java.net.PasswordAuthentication;
import java.net.ProxySelector;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class QuickStart {
    static final String USER = "YOUR_USERNAME"; // from your dashboard
    static final String PASS = "YOUR_PASSWORD";
    static final String HOST = "residentialboson.quantumproxies.io";

    static String through(String user, int port) throws Exception {
        HttpClient client = HttpClient.newBuilder()
            .proxy(ProxySelector.of(new InetSocketAddress(HOST, port)))
            .authenticator(new Authenticator() {
                @Override protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(user, PASS.toCharArray());
                }
            })
            .build();
        HttpRequest req = HttpRequest.newBuilder(URI.create("https://ipinfo.io/json")).build();
        return client.send(req, HttpResponse.BodyHandlers.ofString()).body();
    }

    public static void main(String[] args) throws Exception {
        // Rotating: new IP on every request (port 9000)
        System.out.println("rotating: " + through(USER, 9000));

        // Country targeting: append -country-XX to the username
        System.out.println("it exit: " + through(USER + "-country-it", 9000));

        // Sticky session: same IP for `lifetime` minutes (port 10000)
        String sticky = USER + "-country-us-session-ab12-lifetime-10";
        System.out.println("sticky #1: " + through(sticky, 10000));
        System.out.println("sticky #2: " + through(sticky, 10000)); // same IP
    }
}
