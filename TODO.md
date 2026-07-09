# TODO

Larger follow-up work that should be handled in separate branches/PRs.

## Generated Client Surface

Build on the refreshed generated classes by making more of the ATProto endpoint surface available through generated or semi-generated client helpers.

Scope:
- Decide whether endpoint helpers should be generated directly or wrapped in hand-written, higher-level APIs.
- Keep generated classes shallow unless there is a clear caller need for recursive hydration.
- Add generated endpoint tests around commonly used queries/procedures before exposing them as public API.
- Consider a local audit script that compares current upstream lexicons with generated classes without making normal tests depend on network access.

Risk:
- Medium. The generated classes are current, but generated endpoint helpers could change public API expectations.

## Error Model Standardization

Replace ad hoc string raises, raw `HTTParty::Response` returns, logging, and `nil` fallbacks with a consistent error strategy.

Scope:
- Define typed gem errors, such as `Bskyrb::APIError`, `UnauthorizedError`, `NotFoundError`, `ValidationError`, `UploadError`, and `VideoUploadError`.
- Centralize HTTP response handling.
- Preserve compatibility for methods that currently return `nil`, or introduce strict/bang variants for callers that want typed exceptions.
- Cover JSON and non-JSON error bodies.
- Keep the existing session refresh/retry behavior integrated with the response handler.

Risk:
- Medium to high. This touches public method behavior and dependent app expectations.

## Suggested Order

1. Error model standardization if reliability and observability are the priority.
2. Generated client surface if maintenance and future API drift are the priority.
