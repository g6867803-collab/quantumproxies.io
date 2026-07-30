// QuantumProxies — Node.js quickstart (native fetch, Node 18+).
// Rotating residential proxies: new IP per request, sticky sessions, geo-targeting.
// Get credentials at https://quantumproxies.io
//
//   npm install undici
//   node quickstart.js

const { ProxyAgent } = require("undici");

const USER = "YOUR_USERNAME"; // from your dashboard
const PASS = "YOUR_PASSWORD";
const HOST = "residentialboson.quantumproxies.io";

const get = async (proxyUrl) => {
  const res = await fetch("https://ipinfo.io/json", {
    dispatcher: new ProxyAgent(proxyUrl),
  });
  return res.json();
};

(async () => {
  // Rotating: new IP on every request (port 9000)
  const rotating = `http://${USER}:${PASS}@${HOST}:9000`;
  console.log("rotating:", (await get(rotating)).ip);

  // Country targeting: append -country-XX to the username
  const de = `http://${USER}-country-de:${PASS}@${HOST}:9000`;
  const geo = await get(de);
  console.log("de exit:", geo.ip, geo.country);

  // Sticky session: same IP for `lifetime` minutes (port 10000)
  const sticky = `http://${USER}-country-us-session-ab12-lifetime-10:${PASS}@${HOST}:10000`;
  console.log("sticky #1:", (await get(sticky)).ip);
  console.log("sticky #2:", (await get(sticky)).ip); // same IP
})();
