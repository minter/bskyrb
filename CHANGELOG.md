## [Unreleased]

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
