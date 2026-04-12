#!/usr/bin/env bash
set -euo pipefail

test -f skill/reliability-engineering/SKILL.md
test -f references/reliability-model-summary.md
test -f examples/service-reliability-profile.yaml

ruby -e 'require "yaml"; YAML.load_file("skill/reliability-engineering/SKILL.md"); YAML.load_file("examples/service-reliability-profile.yaml"); puts "yaml parses"'

grep -q '^name: reliability-engineering$' skill/reliability-engineering/SKILL.md
grep -q 'Use when building reliability models' skill/reliability-engineering/SKILL.md
grep -q 'incident-to-postmortem-to-learning.md' skill/reliability-engineering/SKILL.md
grep -q 'Do not duplicate the observability model' skill/reliability-engineering/SKILL.md
grep -q 'Incident To Learning Pattern' references/reliability-model-summary.md

echo "validation ok"
