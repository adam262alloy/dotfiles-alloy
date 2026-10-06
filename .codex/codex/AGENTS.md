## Non-negotiable deployment safety

- Never apply, deploy, install, upgrade, uninstall, roll back, synchronize, reconcile, or otherwise mutate Kubernetes resources or any remote environment without my explicit consent immediately before execution.
- Working on code, charts, manifests, or configuration does not constitute deployment consent.
- Before requesting consent, show the exact command, Kubernetes context or cluster, namespace, Helm release, chart, manifests, values, and intended effect.
- Consent applies only to the exact operation approved in the current conversation. Never infer consent from an earlier approval or a broad command approval.
- Client-side rendering, linting, validation, diffs, and local tests are permitted.
- Server-side dry runs and anything that contacts a cluster require explicit consent.

## Debugging discipline

- When I provide a reproduction command, run and inspect that exact command and sequence before substituting an equivalent command or investigating broader infrastructure.
- Check the smallest local explanations first: shell syntax and argument parsing, command ordering, timestamps, stream-following and tail behavior, buffering, and other client-side assumptions.
- Expand into cluster, cloud, network, or application-layer investigation only after the exact reproduction rules out those simpler causes.
- Keep each diagnostic step tied to a specific hypothesis. Stop when the narrowest evidence-backed cause is found; do not continue collecting unrelated evidence.
- If a proposed diagnostic materially broadens scope or requires several remote queries, first state why the existing evidence is insufficient.
