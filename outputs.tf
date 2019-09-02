output "id" {
  value       = aws_s3_bucket.bucket.id
  description = "Name of the Bucket"
  depends_on = [
    aws_s3_bucket.bucket
  ]
}

output "arn" {
  value       = aws_s3_bucket.bucket.arn
  description = "ARN of the Bucket"
  depends_on = [
    aws_s3_bucket.bucket
  ]
}

output "bucket_domain_name" {
  value       = aws_s3_bucket.bucket.bucket_domain_name
  description = "Domain name of the Bucket"
  depends_on = [
    aws_s3_bucket.bucket
  ]
}

output "bucket_regional_domain_name" {
  value       = aws_s3_bucket.bucket.bucket_regional_domain_name
  description = "Region-specific domain name of the Bucket"
  depends_on = [
    aws_s3_bucket.bucket
  ]
}

output "hosted_zone_id" {
  value       = aws_s3_bucket.bucket.hosted_zone_id
  description = "Hosted Zone ID of the Bucket's Region"
  depends_on = [
    aws_s3_bucket.bucket
  ]
}

output "region" {
  value       = aws_s3_bucket.bucket.region
  description = "Region of the Bucket"
  depends_on = [
    aws_s3_bucket.bucket
  ]
}

output "website_endpoint" {
  value       = aws_s3_bucket.bucket.website_endpoint
  description = "Website Endpoint of the Bucket"
  depends_on = [
    aws_s3_bucket.bucket
  ]
}

output "website_domain" {
  value       = aws_s3_bucket.bucket.website_domain
  description = "Domain of the Website Endpoint of the Bucket"
  depends_on = [
    aws_s3_bucket.bucket
  ]
}

output "readme_id" {
  value = aws_s3_bucket_object.readme[0].id
  depends_on = [
    aws_s3_bucket_object.readme[0]
  ]
}

output "readme_etag" {
  // `count` in `s3_bucket_object` requires
  value = aws_s3_bucket_object.readme[0].etag
  depends_on = [
    aws_s3_bucket_object.readme[0]
  ]
}

output "readme_version_id" {
  value = aws_s3_bucket_object.readme[0].version_id
  depends_on = [
    aws_s3_bucket_object.readme[0]
  ]
}
