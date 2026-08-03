<p align="center">
<a href="https://quantumproxies.io/?utm_source=github&utm_medium=referral&utm_campaign=brand_repo"><img src="images/banner.png" alt="QuantumProxies — Residential Proxies & Web Data APIs"></a>
</p>

<h2 align="center">
  Residential Proxies & Web Data APIs
</h2>

<p align="center">
Access 90M+ high-quality residential IPs in 200+ countries with QuantumProxies — premium proxies and scraping APIs for web data projects. Scale your data gathering, manage multiple accounts, run SEO research and feed your AI agents with clean, structured web data.
</p>

## List of contents

- [What is QuantumProxies?](#what-is-quantumproxies)
- [How does it work?](#how-does-it-work)
- [Getting started](#getting-started)
- [Code examples](#code-examples)
- [Proxy types](#proxy-types)
- [Web Data APIs](#web-data-apis)
- [Locations](#locations)
- [Use cases](#use-cases)
- [Integrations](#integrations)
- [License](#license)
- [Contact](#contact)

## What is QuantumProxies?

[QuantumProxies](https://quantumproxies.io/?utm_source=github&utm_medium=referral&utm_campaign=brand_repo) is a rotating residential proxy network with a pool of over 90 million IPs from real household devices in 200+ countries, plus a full stack of web data APIs (scraping, SERP, AI extraction) built on top of it.

You can choose between **rotating** proxies, which change IP on every request, or **sticky sessions**, which keep the same IP for a configurable lifetime — ideal for logins, carts and multi-step flows.

Looking for something other than residential? We also offer blazing-fast [datacenter proxies](https://quantumproxies.io/datacenter-proxies?utm_source=github&utm_medium=referral&utm_campaign=brand_repo), static residential [ISP proxies](https://quantumproxies.io/isp-proxies?utm_source=github&utm_medium=referral&utm_campaign=brand_repo), authentic [mobile 4G/5G proxies](https://quantumproxies.io/mobile-proxies?utm_source=github&utm_medium=referral&utm_campaign=brand_repo), budget [IPv6 proxies](https://quantumproxies.io/ipv6-proxies?utm_source=github&utm_medium=referral&utm_campaign=brand_repo) and [SOCKS5 proxies](https://quantumproxies.io/socks5-proxies?utm_source=github&utm_medium=referral&utm_campaign=brand_repo).

## How does it work?

In the [dashboard](https://quantumproxies.io/dashboard), pick a session type — rotating or sticky — and whether you want IPs from a random location or a specific country/state/city. The system generates ready-to-use `endpoint:port` credentials for your code or any application.

Everything is driven by the proxy username:

```
http://USERNAME:PASSWORD@residentialboson.quantumproxies.io:9000    ← rotating, new IP each request
http://USERNAME-country-us:PASSWORD@...:9000                        ← rotating, US exits only
http://USERNAME-country-us-session-ab12-lifetime-10:PASSWORD@...:10000  ← sticky, same US IP for 10 min
```

There are two authentication options: **username:password** and **whitelisted IP**. With IP whitelisting you add your server's IP in the dashboard and connect without credentials.

## Getting started

1. [Create a QuantumProxies account](https://quantumproxies.io/register?utm_source=github&utm_medium=referral&utm_campaign=brand_repo).
2. [Choose a plan](https://quantumproxies.io/pricing?utm_source=github&utm_medium=referral&utm_campaign=brand_repo) — residential traffic starts at $1/GB, pay-as-you-go, no subscription required.
3. Grab your credentials from the dashboard.
4. Access 90M+ residential IPs in 200+ countries.

## Code examples

Runnable quickstarts for every major language live in this repository:

| Language | Example | |
|---|---|---|
| Python | [`python/quickstart.py`](python/quickstart.py) | rotating, sticky, country & city targeting with `requests` |
| Node.js | [`nodejs/quickstart.js`](nodejs/quickstart.js) | native `fetch` + `undici` ProxyAgent |
| PHP | [`php/quickstart.php`](php/quickstart.php) | cURL with proxy auth |
| Go | [`golang/main.go`](golang/main.go) | `net/http` transport proxy |
| Ruby | [`ruby/quickstart.rb`](ruby/quickstart.rb) | `net/http` with proxy credentials |
| Java | [`java/QuickStart.java`](java/QuickStart.java) | `java.net.http` + Authenticator |
| C# | [`csharp/Program.cs`](csharp/Program.cs) | `HttpClientHandler` + `WebProxy` |
| Shell | [`shell/curl-examples.sh`](shell/curl-examples.sh) | every curl flag you need, HTTP & SOCKS5 |

A taste, in Python:

```python
import requests

proxy = "http://USER-country-us:PASS@residentialboson.quantumproxies.io:9000"
r = requests.get("https://ipinfo.io/json", proxies={"http": proxy, "https": proxy})
print(r.json())  # a different US residential IP on every request
```

## Proxy types

### Residential
Real devices in physical locations worldwide. Your requests look like normal user traffic, so you avoid detection, bypass IP blocks and rate limits, and access any website. From $1/GB on the [basic pool](https://quantumproxies.io/residential-basic-proxies?utm_source=github&utm_medium=referral&utm_campaign=brand_repo), or the [premium pool](https://quantumproxies.io/residential-proxies?utm_source=github&utm_medium=referral&utm_campaign=brand_repo) for the hardest targets.

### Datacenter
1 Gbps+ speeds, rotating or dedicated IPs, unlimited concurrent sessions. The cheapest way to move a lot of traffic when the target doesn't fingerprint IP ranges. [Details](https://quantumproxies.io/datacenter-proxies?utm_source=github&utm_medium=referral&utm_campaign=brand_repo).

### ISP (static residential)
Residential-grade IPs hosted on datacenter lines: the trust of a household IP with the speed and stability of a server. Ideal for social media management and anything that needs a stable identity. [Details](https://quantumproxies.io/isp-proxies?utm_source=github&utm_medium=referral&utm_campaign=brand_repo).

### Mobile
Real 4G/5G carrier IPs, trusted by every major platform, with the highest success rates against CAPTCHAs and blocks. [Details](https://quantumproxies.io/mobile-proxies?utm_source=github&utm_medium=referral&utm_campaign=brand_repo).

### IPv6
Millions of unique IPs from $0.20/GB for scraping and automation on IPv6-enabled targets. [Details](https://quantumproxies.io/ipv6-proxies?utm_source=github&utm_medium=referral&utm_campaign=brand_repo).

## Web Data APIs

Skip proxy management entirely — send a URL, get data back. Rendering, anti-bot handling and retries happen server-side:

- **[Scraper API](https://quantumproxies.io/scraper-api?utm_source=github&utm_medium=referral&utm_campaign=brand_repo)** — any URL to clean markdown or structured JSON with one POST.
- **[SERP API](https://quantumproxies.io/serp-api?utm_source=github&utm_medium=referral&utm_campaign=brand_repo)** — Google & Bing results as structured JSON: organic ranks, snippets, localized SERPs.
- **[AI scraping](https://quantumproxies.io/ai-web-scraping-service/?utm_source=github&utm_medium=referral&utm_campaign=brand_repo)** — schema-based extraction without writing selectors.
- **[MCP server](https://quantumproxies.io/mcp-server?utm_source=github&utm_medium=referral&utm_campaign=brand_repo)** — give Claude and other AI agents live web access via the Model Context Protocol.

```bash
npx quantumproxies-mcp  # web scraping & search inside Claude in one line
```

## Locations

QuantumProxies covers **200+ countries and territories** with country, state and city-level targeting — the US, UK, Germany, India, Canada, Japan, Brazil and many more. [Browse the full list of locations](https://quantumproxies.io/locations?utm_source=github&utm_medium=referral&utm_campaign=brand_repo).

## Use cases

Complete, working projects built on QuantumProxies:

**E-commerce & pricing**

- [Amazon, Walmart, eBay, Etsy & AliExpress to JSON](https://github.com/quantumproxies/ecommerce-scraping-examples)
- [E-commerce price monitoring to JSON/CSV](https://github.com/quantumproxies/ecommerce-price-scraper)
- [Google Shopping cross-retailer price sheets](https://github.com/quantumproxies/google-shopping-scraper)
- [Flight & hotel fares with geo-true pricing](https://github.com/quantumproxies/travel-fare-scraping)
- [Zillow & real-estate listings to JSON](https://github.com/quantumproxies/real-estate-scraper-python)

**SEO & SERP tools**

- [SERP API in Python and curl](https://github.com/quantumproxies/serp-api-examples)
- [DIY Google rank tracker in Python](https://github.com/quantumproxies/serp-rank-tracker-python)
- [Per-city local rank tracker (uule)](https://github.com/quantumproxies/local-serp-rank-tracker)
- [Keyword research: autocomplete & AI Overviews](https://github.com/quantumproxies/seo-keyword-research-scripts)
- [Competitor share-of-voice & keyword gaps](https://github.com/quantumproxies/competitor-serp-analysis)
- [Google vs Bing vs DuckDuckGo vs Yandex](https://github.com/quantumproxies/multi-engine-serp-comparison)
- [Google Maps: local pack, places & reviews](https://github.com/quantumproxies/google-maps-scraper-python)

**Data for AI & LLMs**

- [Web pages to RAG-ready markdown for LLMs](https://github.com/quantumproxies/website-to-markdown-for-llms)
- [Fine-tuning & RAG corpora from the web](https://github.com/quantumproxies/llm-dataset-collection)
- [Claude + MCP live web scraping](https://github.com/quantumproxies/claude-mcp-web-scraping)
- [AI scraping without selectors](https://github.com/quantumproxies/ai-web-scraping-examples)

**Monitoring & alerts**

- [Website change monitoring with diff alerts](https://github.com/quantumproxies/website-change-monitoring)
- [Stock & restock availability alerts](https://github.com/quantumproxies/stock-availability-monitor)
- [Google News brand & media monitoring](https://github.com/quantumproxies/google-news-scraper)

**Social, jobs & reviews**

- [Public social data: Reddit, YouTube, X, TikTok](https://github.com/quantumproxies/social-media-scraping-python)
- [Job postings: Indeed, Glassdoor & boards](https://github.com/quantumproxies/job-postings-scraper)
- [Reviews: Google Maps, Trustpilot, Tripadvisor, Yelp](https://github.com/quantumproxies/reviews-scraping-examples)

**Fundamentals & utilities**

- [Scraping best practices: legal, polite, cheap](https://github.com/quantumproxies/web-scraping-best-practices)
- [Error handling: 403, 407, 429 & Cloudflare 1020](https://github.com/quantumproxies/web-scraping-error-handling)
- [Geo-targeted scraping from 195+ countries](https://github.com/quantumproxies/geo-targeted-scraping-examples)
- [Proxy testing: IP, geo, rotation, IPv6](https://github.com/quantumproxies/proxy-testing-scripts)
- [Async bulk URL scraper](https://github.com/quantumproxies/bulk-url-scraper-python)
- [Full-page screenshot API](https://github.com/quantumproxies/screenshot-api-example)

## Integrations

- [Python](https://github.com/quantumproxies/rotating-residential-proxies-python)
- [Node.js](https://github.com/quantumproxies/nodejs-proxy-examples)
- [Scrapy](https://github.com/quantumproxies/scrapy-proxy-middleware)
- [Puppeteer](https://github.com/quantumproxies/puppeteer-proxy-example)
- [Playwright](https://github.com/quantumproxies/playwright-proxy-example)
- [Selenium](https://github.com/quantumproxies/selenium-proxy-authentication)
- [cURL](https://github.com/quantumproxies/curl-proxy-cheatsheet)
- [Go](https://github.com/quantumproxies/go-http-proxy-client)
- [PHP / Guzzle](https://github.com/quantumproxies/php-guzzle-proxy-example)
- [SOCKS5 in Python](https://github.com/quantumproxies/socks5-proxy-python)
- [Scraper API in Python](https://github.com/quantumproxies/web-scraping-api-python)
- [Scraper API in Node.js](https://github.com/quantumproxies/nodejs-web-scraping-api)
- [Chrome extension](https://quantumproxies.io/chrome-extension?utm_source=github&utm_medium=referral&utm_campaign=brand_repo)
- [Java](java/)
- [C#](csharp/)
- [Ruby](ruby/)
- [Bash](shell/)

## License

All code in this repository is released under the [MIT License](LICENSE).

## Contact

Email — support@quantumproxies.io

<a href="https://quantumproxies.io/?utm_source=github&utm_medium=referral&utm_campaign=brand_repo">Live chat on quantumproxies.io</a>
