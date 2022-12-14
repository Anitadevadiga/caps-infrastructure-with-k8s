resource "aws_subnet" "subnet1-public" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.public_subnet1_name}"
  }
}
