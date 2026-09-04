## Non-negotiable deployment safety

- Never apply, deploy, install, upgrade, uninstall, roll back, synchronize, reconcile, or otherwise mutate Kubernetes resources or any remote environment without my explicit consent immediately before execution.
- Working on code, charts, manifests, or configuration does not constitute deployment consent.
- Before requesting consent, show the exact command, Kubernetes context or cluster, namespace, Helm release, chart, manifests, values, and intended effect.
- Consent applies only to the exact operation approved in the current conversation. Never infer consent from an earlier approval or a broad command approval.
- Client-side rendering, linting, validation, diffs, and local tests are permitted.
- Server-side dry runs and anything that contacts a cluster require explicit consent.
