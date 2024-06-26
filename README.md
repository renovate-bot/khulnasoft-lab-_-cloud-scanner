# Khulnasoft Cloud Scanner
Khulnasoft Cloud Scanner runs in your cloud environment, gathering inventory and compliance information for the assets deployed in that environment. It submits that information to your Khulnasoft Kengine or ThreatStryker Management Console.

Deploy Khulnasoft Cloud Scanner using the appropriate Terraform module for the cloud you wish to monitor.

## Deploying Cloud Scanner

- Cloud scanner is deployed in ECS Fargate / GCP Cloud Run / Azure Container Instance
- Deployment is done using AWS CloudFormation template or terraform
- Documentation: https://docs.khulnasoft.com/kengine/docs/cloudscanner/

## Build

```shell
./bootstrap.sh
make docker
```

## Usage (cli mode)

#### AWS

Available benchmarks:
- pci (PCI DSS v3.2.1)
- cis (CIS v2.0.0)
- gdpr (GDPR)
- hipaa (HIPAA Final Omnibus Security Rule 2013)
- soc2 (SOC 2)
- nist (NIST 800-171 Revision 2)
- all (runs all benchmarks)

```shell
aws configure

export AWS_ACCOUNT_ID="<AWS_ACCOUNT_ID>"
export BENCHMARK="cis"
export AWS_CONFIG_PATH="$HOME/.aws"
export OUTPUT_FILE="cloud_scanner_output.json"

docker run -it --rm \
  -v $AWS_CONFIG_PATH:/home/khulnasoft/.aws \
  -v $(pwd):/tmp/output \
  -e CLOUD_ACCOUNT_ID=$AWS_ACCOUNT_ID \
  -e CLOUD_PROVIDER=aws \
  docker.io/khulnasoft/cloud-scanner:latest \
  --mode cli \
  --benchmark $BENCHMARK \
  --file "/tmp/output/$OUTPUT_FILE"
```

#### Google Cloud

Available benchmarks:
- cis (CIS v2.0.0)

```shell
gcloud auth login

export GCLOUD_ACCOUNT_ID="<GOOGLE_CLOUD_ACCOUNT_ID>"
export BENCHMARK="cis"
export GCLOUD_CONFIG_PATH="$HOME/.config/gcloud"
export OUTPUT_FILE="cloud_scanner_output.json"

docker run -it --rm \
  -v $GCLOUD_CONFIG_PATH:/home/khulnasoft/.config/gcloud \
  -v $(pwd):/tmp/output \
  -e CLOUD_ACCOUNT_ID=$GCLOUD_ACCOUNT_ID \
  -e CLOUDSDK_CORE_PROJECT=$GCLOUD_ACCOUNT_ID \
  -e CLOUD_PROVIDER=gcp \
  docker.io/khulnasoft/cloud-scanner:latest \
  --mode cli \
  --benchmark $BENCHMARK \
  --file "/tmp/output/$OUTPUT_FILE"
```

#### Azure

Available benchmarks:
- pci (PCI DSS 3.2.1)
- hipaa (HIPAA HITRUST 9.2)
- nist (NIST SP 800-53 Revision 5)
- cis (CIS v2.0.0)
- all (runs all benchmarks)

```shell
az login

export AZURE_ACCOUNT_ID="<AZURE_ACCOUNT_ID>"
export BENCHMARK="cis"
export AZURE_CONFIG_PATH="$HOME/.azure"
export AZURE_TENANT_ID=""
export OUTPUT_FILE="cloud_scanner_output.json"

docker run -it --rm \
  -v $AZURE_CONFIG_PATH:/home/khulnasoft/.azure \
  -v $(pwd):/tmp/output \
  -e CLOUD_ACCOUNT_ID=$AZURE_ACCOUNT_ID \
  -e AZURE_SUBSCRIPTION_ID=$AZURE_ACCOUNT_ID \
  -e AZURE_TENANT_ID=$AZURE_TENANT_ID \
  -e CLOUD_PROVIDER=azure \
  docker.io/khulnasoft/cloud-scanner:latest \
  --mode cli \
  --benchmark $BENCHMARK \
  --file "/tmp/output/$OUTPUT_FILE"
```