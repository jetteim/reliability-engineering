# Reliability Engineering Skill

Reusable agent-agnostic skill for building reliability models, service reliability profiles, incident/postmortem analysis, miss-policy, action items, and resilience experiments.

The skill is meant to work with a local model repo when present:

```text
~/Library/CloudStorage/OneDrive-Personal/Pet projects/platform-reliability-model
```

It can still operate from its bundled reference when the private model is unavailable.

## Install

Copy `skill/reliability-engineering` into the skill directory used by your agent runtime. For a portable shell install, set `SKILLS_DIR` first:

```bash
mkdir -p "$SKILLS_DIR/reliability-engineering"
cp -R skill/reliability-engineering/. "$SKILLS_DIR/reliability-engineering/"
```

## Validate

```bash
./scripts/validate.sh
```
