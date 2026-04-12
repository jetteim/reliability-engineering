# Reliability Engineering Skill

Reusable Codex skill for building reliability models, service reliability profiles, incident/postmortem analysis, miss-policy, action items, and resilience experiments.

The skill is meant to work with a local model repo when present:

```text
~/Library/CloudStorage/OneDrive-Personal/Pet projects/platform-reliability-model
```

It can still operate from its bundled reference when the private model is unavailable.

## Install

```bash
mkdir -p ~/.codex/skills/reliability-engineering
cp -R skill/reliability-engineering/. ~/.codex/skills/reliability-engineering/
```

## Validate

```bash
./scripts/validate.sh
```

