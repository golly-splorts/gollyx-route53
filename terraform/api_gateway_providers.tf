# Provider alias for API Gateway custom domain management.
# All domain and base-path-mapping operations use the same region as the
# Zappa REST API so that both resources are visible to the same endpoint.
provider "aws" {
  alias  = "api_region"
  region = "us-west-1"
}
