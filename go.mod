module github.com/khulnasoft-lab/cloud-scanner

go 1.21

replace github.com/khulnasoft-lab/golang_sdk/client => ./golang_sdk/client

replace github.com/khulnasoft-lab/golang_sdk/utils => ./golang_sdk/utils

require (
	github.com/Jeffail/tunny v0.1.4
	github.com/aws/aws-sdk-go v1.50.19
	github.com/google/uuid v1.6.0
	github.com/khulnasoft-lab/golang_sdk/client v0.0.0-00010101000000-000000000000
	github.com/khulnasoft-lab/golang_sdk/utils v0.0.0-00010101000000-000000000000
	github.com/khulnasoft/kengine/khulnasoft_utils 22855cd4b666
	github.com/lib/pq v1.10.9
	github.com/rs/zerolog v1.32.0
)

require (
	github.com/cenkalti/backoff/v4 v4.3.0 // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/decred/dcrd/dcrec/secp256k1/v4 v4.3.0 // indirect
	github.com/dgryski/go-rendezvous v0.0.0-20200823014737-9f7001d12a5f // indirect
	github.com/goccy/go-json v0.10.2 // indirect
	github.com/golang/protobuf v1.5.4 // indirect
	github.com/hashicorp/go-cleanhttp v0.5.2 // indirect
	github.com/hashicorp/go-retryablehttp v0.7.5 // indirect
	github.com/hibiken/asynq v0.24.1 // indirect
	github.com/jmespath/go-jmespath v0.4.0 // indirect
	github.com/klauspost/compress v1.17.8 // indirect
	github.com/lestrrat-go/blackmagic v1.0.2 // indirect
	github.com/lestrrat-go/httpcc v1.0.1 // indirect
	github.com/lestrrat-go/httprc v1.0.5 // indirect
	github.com/lestrrat-go/iter v1.0.2 // indirect
	github.com/lestrrat-go/jwx/v2 v2.0.21 // indirect
	github.com/lestrrat-go/option v1.0.1 // indirect
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-isatty v0.0.20 // indirect
	github.com/pierrec/lz4/v4 v4.1.21 // indirect
	github.com/redis/go-redis/v9 v9.5.1 // indirect
	github.com/robfig/cron/v3 v3.0.1 // indirect
	github.com/segmentio/asm v1.2.0 // indirect
	github.com/spf13/cast v1.6.0 // indirect
	github.com/twmb/franz-go v1.16.1 // indirect
	github.com/twmb/franz-go/pkg/kadm v1.11.0 // indirect
	github.com/twmb/franz-go/pkg/kmsg v1.7.0 // indirect
	golang.org/x/crypto v0.22.0 // indirect
	golang.org/x/sys v0.20.0 // indirect
	golang.org/x/time v0.5.0 // indirect
	google.golang.org/protobuf v1.34.0 // indirect
)
