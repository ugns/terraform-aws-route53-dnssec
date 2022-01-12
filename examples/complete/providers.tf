provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "use1"
  region = "us-east-1"
}
