/* Create Bucket for Terraform Lambda Modules */
resource "aws_s3_bucket" "s3_bucket" {
  bucket        = "${lower(var.environment)}-s3-terraform-backend"
  force_destroy = false
  tags = {
    "Environment" = var.environment
  }
}

resource "aws_s3_bucket_acl" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_kms_key" "kms_key" {
  tags = {
    "Environment" = var.environment
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "aws:kms"
      kms_master_key_id = aws_kms_key.kms_key.arn
    }
  }
}
/////////////////////////////////////////

resource "aws_s3_bucket" "codepipeline_bucket" {
  bucket = "${lower(var.environment)}-bucket-evnfc-001"
  //acl    = "private"

  /* This bucket MUST have versioning enabled and encryption */
 /* versioning {
    enabled = true
  }
*/
  force_destroy = true
/*
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
  */
}
/*
resource "null_resource" "sync_to_s3" {
  provisioner "local-exec" {
    command = "aws s3 cp ArchiveItems.zip s3://${aws_s3_bucket.codepipeline_bucket.bucket}/"
  }
}
*/

/////////////////output//////////////////

