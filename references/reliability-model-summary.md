# Reliability Model Summary

Use this file when the private `platform-reliability-model` repository is unavailable.

## Principles

- Reliability is socio-technical.
- Incident response and postmortem aftercare are different workflows.
- Analysis must be blameless and evidence-backed.
- Action items must directly follow from analysis.
- SLO misses and incidents are related but not identical.
- Miss-policy is a pre-agreed operating mode.
- Resilience experiments are hypothesis-driven and risk-aware.
- Observability provides evidence and generated artifacts; reliability owns risk, learning, and operational change.

## Service Reliability Pattern

1. Establish service identity, owner, escalation, criticality, and capabilities.
2. Inventory dependencies and failure modes.
3. Review SLOs and observability support.
4. Assess graceful degradation, timeout, retry, circuit breaker, and rollback strategies.
5. Define operational readiness.
6. Create action items for gaps.

## Incident To Learning Pattern

1. Normalize incident record.
2. Confirm impact and urgency.
3. Build chronological timeline.
4. Preserve evidence.
5. Document resolution.
6. Evaluate impact.
7. Analyze trigger, enabling components, and response timeline.
8. Classify contributing causes.
9. Write reusable lessons.
10. Create owned, verifiable action items.

