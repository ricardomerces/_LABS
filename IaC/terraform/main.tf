module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "lab"

  # ami                    = "ami-00c39f71452c08778" # Amazon Linux 2023
  ami                    = "ami-007855ac798b5175e" #Ubuntu 22.04

  instance_type          = "t2.micro"
  key_name               = "aula"
#   monitoring             = true
  vpc_security_group_ids = ["sg-07f9df34bb328b145", "sg-00013924a0387c9ab"]
  subnet_id              = "subnet-0a8f1497a9c82a152"

  tags = {
    Environment = "lab"
  }
}

# module "s3_bucket" {
#   source = "terraform-aws-modules/s3-bucket/aws"
#   bucket = "labs-terraform"
#   acl    = "private"
#   force_destroy = true
# }
