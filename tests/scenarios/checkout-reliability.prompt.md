# Source Prompt

Use `$reliability-engineering` to create a reliability engineering packet for `checkout-api`.

Context:

- `checkout-api` runs in production and owns the user checkout journey from cart submission to paid order.
- The business wants fewer failed checkouts and faster incident learning.
- Candidate telemetry includes request counts, successful orders, payment declines, checkout latency, dependency errors, deploy events, incidents, and on-call notes.
- The current team has no explicit SLO, miss policy, or resilience experiment plan.
- Payment-provider failure, inventory timeout, and malformed cart payloads are credible failure modes.
- Recommendations must avoid duplicating the observability model; ask for telemetry evidence and hand off observability gaps to `$observability-engineering`.
- For executable SLI/SLO, alert, route, and dashboard generation, use deterministic `sre-rules` output from `slo-rules-engine` when the provider is supported.
- The team wants future Datadog and Elastic Terraform generation, but reliability must only produce a provider handoff contract and must not generate provider Terraform directly.
- Include rollback path and verification evidence for any proposed operational change.

Produce these artifacts:

- `ServiceReliabilityProfile`
- `SliSloDefinition`
- `ReliabilityRecommendationSet`
- `IncidentLearningPlan`
- `ResilienceExperimentPlan`
- `SreRulesGenerationPlan`
- `ProviderGenerationHandoff`
- `VerificationEvidence`
