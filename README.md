# Bskyrb
![](https://img.shields.io/github/actions/workflow/status/ShreyanJain9/bskyrb/ruby.yml?style=plastic)

- [Bskyrb](#bskyrb)
  - [Installation](#installation)
  - [Usage](#usage)
    - [Session Management](#session-management)
    - [Basic Operations](#basic-operations)
    - [Media Handling](#media-handling)
    - [Rich Text Features](#rich-text-features)
    - [User Operations](#user-operations)
    - [Post Retrieval](#post-retrieval)
  - [Development](#development)
  - [Dependencies](#dependencies)
  - [Code generation](#code-generation)
    - [Type checking](#type-checking)
    - [Tests](#tests)
    - [Formatting](#formatting)
  - [Contributing](#contributing)
    - [TODO](#todo)
  - [Contributors](#contributors)
  - [License](#license)
  - [Code of Conduct](#code-of-conduct)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add bskyrb

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install bskyrb
    
You can also install the gem by cloning this repository and running `./install-local.sh`.

## Usage

### Session Management

Create a new session:

```ruby
require 'bskyrb'
username = 'your_username'
password = 'your_password'
pds_url = 'https://bsky.social' # Optional, defaults to https://bsky.social

# Initialize session
credentials = Bskyrb::Credentials.new(username, password)
session = Bskyrb::Session.new(credentials, pds_url)
bsky = Bskyrb::RecordManager.new(session)
```

### Basic Operations

```ruby
# Create a simple text post
post_uri = bsky.create_post("Hello world from bskyrb!")["uri"]

# Interact with posts
bsky.like(post_uri)
bsky.repost(post_uri)
bsky.create_reply(post_uri, "Replying to post from bskyrb")
```

### Media Handling

```ruby
# Post with images (up to 4 images supported)
bsky.create_post("Check out these photos!", embed_images: ["path/to/image1.jpg", "path/to/image2.jpg"])

# Post with images and alt text
images = [
  { "url" => "path/to/image.jpg", "alt" => "Description of the image" },
  { "url" => "path/to/image2.jpg", "alt" => "Description of second image" }
]
bsky.create_post("Photos with accessibility!", embed_images: images)

# Post with a video
bsky.create_post("Check out this video!", embed_video: "path/to/video.mp4")

# Post with external URL preview
bsky.create_post("Check out this link!", embed_url: "https://example.com")

# Reply with media
bsky.create_reply(post_uri, "Great post!", embed_images: ["path/to/image.jpg"])
```

Images are automatically optimized:
- Large images are automatically resized and compressed
- Maximum size is enforced (900KB)
- Image quality is preserved while reducing file size
- Supports both local files and remote URLs

### Rich Text Features

Posts automatically handle rich text features:

```ruby
# Mentions are automatically detected and linked
bsky.create_post("Hello @username! How are you?")

# URLs are automatically detected and previewed
bsky.create_post("Check out https://example.com")

# Hashtags are automatically detected
bsky.create_post("Just posting about #ruby and #coding!")
```

### User Operations

```ruby
# Get user information
did = bsky.resolveHandle("username.bsky.social") # Get DID for a user
profile = bsky.get_profile("username.bsky.social") # Get full profile

# Follow/Unfollow
bsky.follow(did)
bsky.unfollow(did)

# Get followers
followers = bsky.get_followers("username.bsky.social")
followers_with_cursor = bsky.get_followers("username.bsky.social", cursor: "next_page_cursor")
```

### Post Retrieval

```ruby
# Get a specific post
post = bsky.get_post_by_url("https://bsky.app/profile/username.bsky.social/post/postid")

# Get latest post
latest_post = bsky.get_latest_skoot("username.bsky.social")

# Get multiple recent posts
recent_posts = bsky.get_latest_n_skoots("username.bsky.social", 5) # Get last 5 posts

# Get full thread
thread = bsky.get_post_thread("https://bsky.app/profile/username.bsky.social/post/postid", depth: 10)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, run `./deploy.sh` and you will be guided through updating the version number, bundling the gem, and pushing it to RubyGems. You must be signed in with a RubyGems account that has push access to bskyrb.

## Dependencies

The gem requires the following runtime dependencies:
- json (>= 2.0)
- net-http
- date
- httparty
- nokogiri (>= 1.16.1) - For parsing HTML and extracting OpenGraph data
- mini_mime (>= 1.1.2) - For handling MIME types
- addressable (>= 2.8.1) - For improved URL handling
- mini_magick (>= 4.12.0) - For image processing and optimization
- logger (>= 1.5.3) - For improved logging
- streamio-ffmpeg (>= 3.0.2) - For video processing

## Code generation

We are working on a script to generate classes from the atproto lexicon. So far we have made non-query objects. To recreate them:

```
git submodule add https://github.com/bluesky-social/atproto.git
# or just clone it!
bin/codegen
```

This crawls the lexicon directory in your newly-cloned atproto repo, and generates formatted classes based on the json schemas embedded in the files. You can then hydrate them like so:

```ruby
# make your RecordManager, then...

post_by_url = manager.get_post_by_url("https://staging.bsky.app/profile/naia.bsky.social/post/3jszsrnruws27")

my_post = Bskyrb::AppBskyFeedDefs::PostView.from_hash post_by_url["thread"]["post"]

=>
#<Bskyrb::AppBskyFeedDefs::PostView:0x000000010432a0a0
 @author=
  {"did"=>"did:plc:scx5mrfxxrqlfzkjcpbt3xfr",
   "handle"=>"naia.bsky.social",
   "displayName"=>"naia",
   "avatar"=>
    "https://cdn.bsky.social/imgproxy/0uv5pCOimHKw44PfnCt5_XpnOICHz1KeHCl8dknI_ZY/rs:fill:1000:1000:1:0/plain/bafkreibabes4xznjzdwxqj4hzirg7lofhl2detvabroibakewssfkr
      "alt"=>""}]},
 @indexedAt="2023-04-10T16:51:21.391Z",
 @labels=[],
 @likeCount=27,
 @record=
  {"text"=>"gm from the new deck chair i built yesterday\n\nthe sky is very blue",
   "$type"=>"app.bsky.feed.post",
   "embed"=>
    {"$type"=>"app.bsky.embed.images",
     "images"=>
      [{"alt"=>"",
        "image"=>{"$type"=>"blob", "ref"=>{"$link"=>"bafkreif52k6kev6xgy2ydptub5oryss3gsscajrec6zh5r2els4si2yj7i"}, "mimeType"=>"image/jpeg", "size"=>796921}}]},
   "createdAt"=>"2023-04-10T16:51:21.049Z"},
 @replyCount=4,
 @repostCount=2,
 @uri="at://did:plc:scx5mrfxxrqlfzkjcpbt3xfr/app.bsky.feed.post/3jszsrnruws27",
 @viewer={}>
```

Next steps:

- Recursion--hydrate the classes embedded in the classes. Some parsing to enable this already happens in `LexiconParser`.
- Generate classes for queries and other unusual object types.
- Integrate our new classes into the API call methods.

### Type checking

bskyrb uses [.rbs type definitions](https://github.com/ruby/rbs). To check for accuracy, run `bin/typecheck`. Not all of the output will be useful, especially during rapid development, but it is a good idea to have types at least for the bluesky objects.

Use the [`rbs collection` tool](https://github.com/ruby/rbs/blob/master/docs/collection.md) to manage definitions for third-party dependencies, for example HTTParty. Use `bundle exec rbs collection install` to download third-party definitions (**you will need to do this before `bin/typecheck` will work**).

### Tests

Run the test suite with:

    $ bundle exec rake test

### Formatting

So nobody has to argue about formatting, bskyrb uses the `standard` gem. Run `bin/format` to format the code in this repo.

## Contributing

Please do!

### TODO

- Build
- More/better tests
- (Eventually) Publish/release pipeline
- Split into separate modules for XRPC, Lexicon, ATProto, etc

## Contributors

<a href="https://github.com/ShreyanJain9/bskyrb/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=ShreyanJain9/bskyrb" />
</a>

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Bskyrb project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/bskyrb/blob/master/CODE_OF_CONDUCT.md).
