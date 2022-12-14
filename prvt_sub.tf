resource "aws_subnet" "subnet1-private" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.private_subnet1_name}"
  }
}
