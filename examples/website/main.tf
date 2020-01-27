module "website-example" {
  source  = "operatehappy/s3-bucket/aws"
  version = "1.1.1"

  name = "oh-demos-website-example"

  website = [{
    index_document           = "index.html"
    error_document           = "error.html"
    routing_rules            = <<EOF
    [{
        "Condition": {
            "KeyPrefixEquals": "img/"
        },
        "Redirect": {
            "ReplaceKeyPrefixWith": "images/"
        }
    }]
    EOF
    redirect_all_requests_to = null
  }]

  cors_rule = {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "HEAD", "POST", "DELETE"]
    allowed_origins = ["https://example.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3600
  }
}
