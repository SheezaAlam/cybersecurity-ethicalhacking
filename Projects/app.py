from flask import Flask, render_template, request
import re
import dns.resolver

app = Flask(__name__)

def analyze_email_header(header_text):
    results = {}
    summary = []

    # --- SPF Check ---
    if "spf=pass" in header_text.lower():
        results['SPF'] = "Pass ✅ - The sender is authorized."
        summary.append("SPF check passed — sender is verified.")
    elif "spf=fail" in header_text.lower():
        results['SPF'] = "Fail ❌ - The sender is not authorized."
        summary.append("SPF failed — email might be spoofed.")
    else:
        results['SPF'] = "Neutral ⚠️ - No SPF record found."
        summary.append("SPF record missing or neutral — risky setup.")

    # --- DKIM Check ---
    if "dkim=pass" in header_text.lower():
        results['DKIM'] = "Pass ✅ - Message integrity verified."
        summary.append("DKIM signature validated — content is untampered.")
    elif "dkim=fail" in header_text.lower():
        results['DKIM'] = "Fail ❌ - Integrity could not be verified."
        summary.append("DKIM failed — possible tampering or spoofing.")
    else:
        results['DKIM'] = "Not Found ⚠️ - No DKIM signature detected."
        summary.append("Missing DKIM — cannot confirm authenticity.")

    # --- DMARC Check ---
    if "dmarc=pass" in header_text.lower():
        results['DMARC'] = "Pass ✅ - Policy alignment confirmed."
        summary.append("DMARC passed — domain policy enforced properly.")
    elif "dmarc=fail" in header_text.lower():
        results['DMARC'] = "Fail ❌ - Domain policy not aligned."
        summary.append("DMARC failed — sender policy not followed.")
    else:
        results['DMARC'] = "Not Found ⚠️ - No DMARC record found."
        summary.append("DMARC record missing — weak email protection.")

    # --- Extract Source IP ---
    ip_match = re.search(r'\[([0-9]+\.[0-9]+\.[0-9]+\.[0-9]+)\]', header_text)
    if ip_match:
        ip_address = ip_match.group(1)
        results['Source IP'] = ip_address
        summary.append(f"Source IP detected: {ip_address}")
    else:
        results['Source IP'] = "Not Found"
        summary.append("Source IP not detected.")

    # --- Generate Easy Summary ---
    if "fail" in " ".join(results.values()).lower():
        insight = "⚠️ This email is suspicious. One or more authentication checks failed."
    elif "not found" in " ".join(results.values()).lower():
        insight = "⚠️ Email lacks some key security checks — sender might be unverified."
    else:
        insight = "✅ Email looks legitimate. All major checks passed."

    return results, summary, insight

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        header_text = request.form['header']
        results, summary, insight = analyze_email_header(header_text)
        return render_template('results.html', results=results, summary=summary, insight=insight)
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)
