#!/usr/bin/env bash
set -euo pipefail

sre_rules_root="${SRE_RULES_ENGINE_ROOT:-${AGENTS_HOME:-$HOME/.agents}/vendor_imports/repos/slo-rules-engine}"
if [ ! -x "$sre_rules_root/bin/rules-ctl" ]; then
  sre_rules_root="$HOME/Library/CloudStorage/OneDrive-Personal/Pet projects/slo-rules-engine"
fi

if [ ! -x "$sre_rules_root/bin/rules-ctl" ]; then
  echo "missing deterministic sre-rules engine checkout with bin/rules-ctl" >&2
  echo "checked: ${SRE_RULES_ENGINE_ROOT:-${AGENTS_HOME:-$HOME/.agents}/vendor_imports/repos/slo-rules-engine}" >&2
  echo "checked: $HOME/Library/CloudStorage/OneDrive-Personal/Pet projects/slo-rules-engine" >&2
  exit 1
fi

(
  cd "$sre_rules_root"
  bin/rules-ctl providers list >/tmp/reliability-engineering-sre-rules-providers.json
  bin/rules-ctl validate examples/services/checkout.rb >/tmp/reliability-engineering-sre-rules-validate.txt
  bin/rules-ctl model-report examples/services/checkout.rb >/tmp/reliability-engineering-sre-rules-model-report.json
  bin/rules-ctl generate --provider datadog examples/services/checkout.rb >/tmp/reliability-engineering-sre-rules-datadog.json
  bin/rules-ctl generate --provider prometheus_stack examples/services/checkout.rb >/tmp/reliability-engineering-sre-rules-prometheus-stack.json
  bin/rules-ctl generate --provider sloth examples/services/checkout.rb >/tmp/reliability-engineering-sre-rules-sloth.json
)

grep -q '"key": "datadog"' /tmp/reliability-engineering-sre-rules-providers.json
grep -q '"key": "prometheus_stack"' /tmp/reliability-engineering-sre-rules-providers.json
grep -q '"key": "sloth"' /tmp/reliability-engineering-sre-rules-providers.json
grep -q '"provider": "datadog"' /tmp/reliability-engineering-sre-rules-datadog.json
grep -q '"provider": "prometheus_stack"' /tmp/reliability-engineering-sre-rules-prometheus-stack.json
grep -q '"provider": "sloth"' /tmp/reliability-engineering-sre-rules-sloth.json

echo "sre-rules validation ok"
