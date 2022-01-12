module "ksk" {
  source  = "../.."
  context = module.this.context
  zones = {
    "example.com" = {
      zone_id = "Z8VLZEXAMPLE"
    }
  }
  providers = {
    aws = aws.use1
  }
}