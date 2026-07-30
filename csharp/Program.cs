// QuantumProxies — C# quickstart (.NET 6+).
// Rotating residential proxies: new IP per request, sticky sessions, geo-targeting.
// Get credentials at https://quantumproxies.io
//
//   dotnet run

using System.Net;

const string USER = "YOUR_USERNAME"; // from your dashboard
const string PASS = "YOUR_PASSWORD";
const string HOST = "residentialboson.quantumproxies.io";

static async Task<string> Through(string user, int port)
{
    var handler = new HttpClientHandler
    {
        Proxy = new WebProxy($"http://{HOST}:{port}")
        {
            Credentials = new NetworkCredential(user, PASS)
        }
    };
    using var client = new HttpClient(handler) { Timeout = TimeSpan.FromSeconds(30) };
    return await client.GetStringAsync("https://ipinfo.io/json");
}

// Rotating: new IP on every request (port 9000)
Console.WriteLine("rotating: " + await Through(USER, 9000));

// Country targeting: append -country-XX to the username
Console.WriteLine("es exit: " + await Through($"{USER}-country-es", 9000));

// Sticky session: same IP for `lifetime` minutes (port 10000)
var sticky = $"{USER}-country-us-session-ab12-lifetime-10";
Console.WriteLine("sticky #1: " + await Through(sticky, 10000));
Console.WriteLine("sticky #2: " + await Through(sticky, 10000)); // same IP
