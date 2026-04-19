#!/usr/bin/env bash
set -euo pipefail

test -f skill/reliability-engineering/SKILL.md
test -f skill/reliability-engineering/references/reliability-model-summary.md
test -f skill/reliability-engineering/references/provider-handoff.md
test -f references/reliability-model-summary.md
test -f examples/service-reliability-profile.yaml
test -f tests/scenarios/checkout-reliability.prompt.md
test -f tests/scenarios/checkout-reliability.expected.yaml
test -f tests/scenarios/checkout-reliability.actual.yaml
test -x scripts/run-exercise.sh

ruby -e 'require "yaml"; YAML.load_file("skill/reliability-engineering/SKILL.md"); YAML.load_file("examples/service-reliability-profile.yaml"); YAML.load_file("tests/scenarios/checkout-reliability.expected.yaml"); YAML.load_file("tests/scenarios/checkout-reliability.actual.yaml"); puts "yaml parses"'
cmp -s references/reliability-model-summary.md skill/reliability-engineering/references/reliability-model-summary.md

grep -q '^name: reliability-engineering$' skill/reliability-engineering/SKILL.md
grep -q 'choosing SLIs/SLOs' skill/reliability-engineering/SKILL.md
grep -q 'telemetry-derived-sli-slo-onboarding.md' skill/reliability-engineering/SKILL.md
grep -q 'sli-slo-definition-and-review.md' skill/reliability-engineering/SKILL.md
grep -q 'service-level-definition-model.md' skill/reliability-engineering/SKILL.md
grep -q 'reliability-recommendations-model.md' skill/reliability-engineering/SKILL.md
grep -q 'incident-to-postmortem-to-learning.md' skill/reliability-engineering/SKILL.md
grep -q 'resilience-experiment-planning.md' skill/reliability-engineering/SKILL.md
grep -q 'ambient failure' skill/reliability-engineering/SKILL.md
grep -q 'failure is normal' skill/reliability-engineering/SKILL.md
grep -q 'Do not duplicate the observability model' skill/reliability-engineering/SKILL.md
grep -q 'vendor_imports/repos/platform-reliability-model' skill/reliability-engineering/SKILL.md
grep -q 'references/reliability-model-summary.md' skill/reliability-engineering/SKILL.md
grep -q 'PLATFORM_RELIABILITY_MODEL_REPO' README.md
grep -q 'vendor_imports/repos/platform-reliability-model' README.md
grep -q 'SLI/SLO Pattern' references/reliability-model-summary.md
grep -q 'Reliability Recommendations Pattern' references/reliability-model-summary.md
grep -q 'objective ratios' references/reliability-model-summary.md
grep -q 'Generate candidate SLIs and SLOs from telemetry' references/reliability-model-summary.md
grep -q 'Incident To Learning Pattern' references/reliability-model-summary.md
grep -q 'Ambient Resilience Experiment Pattern' references/reliability-model-summary.md
grep -q 'jitter' references/reliability-model-summary.md
grep -q 'ProviderGenerationHandoff' tests/scenarios/checkout-reliability.expected.yaml
grep -q 'ReliabilityProviderHandoff' skill/reliability-engineering/references/provider-handoff.md
grep -q 'delegated_to_observability' skill/reliability-engineering/references/provider-handoff.md
grep -q 'Do not generate provider Terraform from this skill' skill/reliability-engineering/references/provider-handoff.md

./scripts/run-exercise.sh

echo "validation ok"
