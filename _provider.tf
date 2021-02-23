/* multi region provider */

# default region is set to "eu-west-1"
provider "aws" {
  region = "eu-west-1"
}

# secondary region is set to "eu-west-2" using alias
provider "aws" {
  alias  = "eu-west-2"
  region = "eu-west-2"
}
