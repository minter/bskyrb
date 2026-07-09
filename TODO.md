# TODO

Larger follow-up work that should be handled in separate branches/PRs.

## Rich-Text Parser Parity

Port Bluesky's official rich-text facet detection behavior to Ruby-native code.

Scope:
- Mentions with current handle/domain validation.
- Links, including bare domains, trailing punctuation, and unmatched trailing parens.
- Unicode-aware hashtags.
- Cashtags.
- UTF-8 byte offsets and overlap behavior.
- Fixture tests based on current official parser behavior.

Risk:
- Medium. Mostly contained to `Bskyrb::PostTools`, but changes user-visible facets.

## Lexicon and Codegen Cleanup

Bring the generated classes and endpoint surface closer to current ATProto lexicons.

Scope:
- Decide whether to patch targeted generated classes or modernize codegen first.
- Add current fields commonly read by callers, such as `bookmarkCount`, `quoteCount`, `threadgate`, `bookmarked`, and `feedContext`.
- Handle current video lexicons explicitly or generate them.
- Prune or quarantine stale generated classes for removed endpoints such as `app.bsky.unspecced.getPopular`.
- Consider a local audit script that compares current upstream lexicons with generated classes without making normal tests depend on network access.

Risk:
- Medium to high if regenerating everything.
- Low to medium if patching targeted fields only.

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
2. Rich-text parser parity if post fidelity is the priority.
3. Lexicon/codegen cleanup if maintenance and future API drift are the priority.
