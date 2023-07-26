module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "lab"

  # ami                    = "ami-05548f9cecf47b442" # Amazon Linux 2023
  ami                    = "ami-053b0d53c279acc90" #Ubuntu 22.04

  instance_type          = "t2.micro"
  key_name               = "labs"
#   monitoring             = true
  vpc_security_group_ids = ["sg-07f9df34bb328b145", "sg-00013924a0387c9ab"]
  subnet_id              = "subnet-0a8f1497a9c82a152"

  tags = {
    Environment = "lab"
  }
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  bucket = "labs-terraform-rmo"
  force_destroy = true
}
