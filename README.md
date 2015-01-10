# S3Source

Plugin for RubyGems to fix its s3 fetch / download functionality

## Installation

This is a RubyGems plugin. To use it, simply install it and RubyGems will automatically detect and use it.

```
gem install s3_source
```

## Usage

To add an s3 gem source, edit your .gemrc file (usually found at ~/.gemrc). You must add the s3 bucket to the regular `sources`, then add the
`s3_source` key with a set of credentials for each s3 hostname.

```
:sources:
- s3://bucket1/path
- s3://bucket2/
- https://rubygems.org/
s3_source: {
  bucket1: {
    id: "AOUEAOEU123123AOEUAO",
    secret: "aodnuhtdao/saeuhto+19283oaehu/asoeu+123h"
  },
  bucket2: {
    id: "AOUEAOEU123123AOEUAO",
    secret: "aodnuhtdao/saeuhto+19283oaehu/asoeu+123h"
  }
}
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/s3_source/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
