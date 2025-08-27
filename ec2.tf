// ec2 instance code 

resource "aws_instance" "server" {
  ami                    = "ami-02f624c08a83ca16f"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = aws_key_pair.key1.key_name
  user_data              = file("setup.sh")

  tags = {
    Name = "Terraform_project-server"
  }
}

// ebs volume

resource "aws_ebs_volume" "ebs" {
  size = 20
  availability_zone = aws_instance.server.availability_zone  
  tags = {
    Name = "Extra-volume"
  }
}

resource "aws_volume_attachment" "att" {
  instance_id = aws_instance.server.id
  volume_id = aws_ebs_volume.ebs.id
  device_name = "/dev/sdb"
}