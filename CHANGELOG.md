## [Unreleased]

- **Breaking:** PDS URLs are now validated as bare HTTPS origins (no userinfo, path, query, or fragment) by `ATProto::Credentials`, `ATProto::Session`, and `Bskyrb::PostRecord`. Cleartext `http://` is accepted only for `localhost`, `127.0.0.1`, and `[::1]` (local development PDS)
- **Breaking:** Link previews (`embed_url:`) and remote images are fetched only from public addresses. A link whose host (or any redirect target) resolves to a loopback, private, link-local, reserved, or cloud metadata address raises `Bskyrb::PostTools::BlockedRemoteAddressError`, and the post is not created. A remote image at such an address is skipped.
- **Breaking:** `http_proxy` and `https_proxy` are now ignored for link-preview and remote-image fetches. Set `Bskyrb.remote_fetch_proxy` to use a proxy.
- Link-preview and remote-image fetches now have a 10s connect timeout, a 15s read timeout and a 30s overall limit, allow up to 5 redirects, and stop after 2MB for pages or 20MB for images. Pages must be served as HTML. Images must be served as `image/*`, as a generic binary type, or with no content type.
- If a link preview page can't be fetched (connection error, timeout, HTTP error, non-HTML response or oversized page), the post now gets a plain link card instead of failing
- ImageMagick work (inspecting, resizing and compressing images) now runs under resource limits (100 megapixels, 1GiB memory, 2GiB memory-mapped, 512MiB disk, one thread) and a 10s per-command timeout. `MAGICK_*_LIMIT` environment variables already set by the host take precedence over the built-in limits.
- `Client#upload_blob` refuses files larger than the image upload limit (about 1.95MB) by default. Pass `max_bytes: nil` to upload other blob types.
- `ATProto::Session` raises `ATProto::HTTPError` (or `ATProto::UnauthorizedError` for 401) on any failed `createSession` or `refreshSession` response, instead of continuing without a token
- Code generation refuses lexicons whose names or property names can't be expressed as Ruby constants or attribute names
- `experiments/register.rb` hides the password as you type and asks for it twice. It stores the recovery key in `~/.bskyrb/` (override with `BSKYRB_KEY_DIR`) with owner-only permissions, never overwrites an existing key file, accepts only an HTTPS server (or HTTP on localhost), and writes the key only after the answers have been checked, so an invalid server no longer leaves an unused key file
- Add `embed_record:` to `create_post`, `create_reply`, and `create_post_or_reply` for native quote posts, combined with images, video, or a link card via `app.bsky.embed.recordWithMedia`
- Support up to 10 image attachments per post using Bluesky's gallery embed for posts with 5 or more images
- Raise video upload size limit to 300MB to match Bluesky's maximum
- Raise video processing timeout to 15 minutes to accommodate Bluesky's new maximum video length of 10 minutes
- Fix `Encoding::CompatibilityError` in link facet detection under C/POSIX locales (e.g. cron jobs and containers) by preloading the public_suffix list as UTF-8
- Raise image size limit to 2MB per image and enforce Bluesky's 4000x4000 pixel cap (oversized images are automatically downscaled)
- Refresh generated classes from current ATProto lexicons, including current feed fields and video lexicons
- Rework automatic rich text facet parsing to match Bluesky behavior for bare links, trailing punctuation, Unicode hashtags, and cashtags

## [0.1.0] - 2023-04-16

- Initial release

## [0.5.0] - 2023-05-01

- Too many changes to count and we weren't adding to the changelog. All future updates will show up in the changelog
