resource "aws_instance" "instance_type" {
  ami                         = "ami-0b0dcb5067f052a63"
  instance_type               = var.instance_type
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  subnet_id                   = aws_subnet.subnet1-public.id
  associate_public_ip_address = true
  availability_zone           = var.azs
  #user_data                   = file("docker.sh")
  user_data                   = "${file("jenkins.sh")}"
  key_name                    = var.key_name
  root_block_device {
 volume_size = "30"
 volume_type = "gp2"
 encrypted = true
 delete_on_termination = true
 }
  tags = {
    Name = "jenkins-master"
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.instance_type.id
  vpc      = true
}

resource "aws_instance" "instance_type1" {
  ami                         = "ami-0b0dcb5067f052a63"
  instance_type               = var.instance_type1
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  subnet_id                   = aws_subnet.subnet1-public.id
  associate_public_ip_address = true
  availability_zone           = var.azs
  user_data                   = file("docker.sh")
  #user_data                   = "${file("jenkins.sh")}"
  key_name                    = var.key_name
  root_block_device {
 volume_size = "30"
 volume_type = "gp2"
 encrypted = true
 delete_on_termination = true
 }
  tags = {
    Name = "stagging"
  }
}


resource "aws_instance" "instance_type2" {
  ami                         = "ami-0b0dcb5067f052a63"
  instance_type               = var.instance_type
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  subnet_id                   = aws_subnet.subnet1-public.id
  associate_public_ip_address = true
  availability_zone           = var.azs
  #user_data                   = file("docker.sh")
  #user_data                   = "${file("jenkins.sh")}"
  key_name                    = var.key_name
  root_block_device {
 volume_size = "30"
 volume_type = "gp2"
 encrypted = true
 delete_on_termination = true
 }
  tags = {
    Name = "kubernetes-master"
  }
}

resource "aws_instance" "instance_type3" {
  ami                         = "ami-0b0dcb5067f052a63"
  instance_type               =  var.instance_type1
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  subnet_id                   = aws_subnet.subnet1-public.id
  associate_public_ip_address = true
  availability_zone           = var.azs
  #user_data                   = file("docker.sh")
  #user_data                   = "${file("jenkins.sh")}"
  key_name                    = var.key_name
  root_block_device {
 volume_size = "30"
 volume_type = "gp2"
 encrypted = true
 delete_on_termination = true
 }
  tags = {
    Name = "kubernetes-workernode1"
  }
}




