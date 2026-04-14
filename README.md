# Reliability Engineering Skill

Reusable agent-agnostic skill for building reliability models, service reliability profiles, incident/postmortem analysis, miss-policy, action items, and resilience experiments.

The skill is meant to work with the private model repo when present. The preferred checkout is the source mirror created by the workstation installer:

```text
${AGENTS_HOME:-$HOME/.agents}/vendor_imports/repos/platform-reliability-model
```

It also recognizes this legacy workspace checkout:

```text
~/Library/CloudStorage/OneDrive-Personal/Pet projects/platform-reliability-model
```

It can still operate from its bundled reference when the private model is unavailable.

## Install With Private Model Fetch

Copy `skill/reliability-engineering` into the skill directory used by your agent runtime. The install path below tries to fetch or clone the private model repo first. If the private repo is unavailable because auth or network access is missing, the skill still installs and falls back to `references/reliability-model-summary.md`.

```bash
SKILLS_DIR="${SKILLS_DIR:-${AGENTS_HOME:-$HOME/.agents}/skills}"
MODEL_ROOT="${MODEL_ROOT:-${AGENTS_HOME:-$HOME/.agents}/vendor_imports/repos}"
PLATFORM_RELIABILITY_MODEL_REPO="${PLATFORM_RELIABILITY_MODEL_REPO:-git@github.com:jetteim/platform-reliability-model.git}"

mkdir -p "$MODEL_ROOT"
if [ -d "$MODEL_ROOT/platform-reliability-model/.git" ]; then
  if ! git -C "$MODEL_ROOT/platform-reliability-model" pull --ff-only; then
    echo "private model repo update failed; bundled references remain available" >&2
  fi
else
  if ! git clone "$PLATFORM_RELIABILITY_MODEL_REPO" "$MODEL_ROOT/platform-reliability-model"; then
    echo "private model repo clone failed; bundled references remain available" >&2
  fi
fi

mkdir -p "$SKILLS_DIR/reliability-engineering"
cp -R skill/reliability-engineering/. "$SKILLS_DIR/reliability-engineering/"
```

## Validate

```bash
./scripts/validate.sh
```
