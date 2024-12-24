# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "web" {
  ami                    = data.aws_ami.amiId.id
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.dove-key.key_name // or directly "dove-key"
  vpc_security_group_ids = [aws_security_group.dove-sg.id]
  availability_zone      = "us-east-1a"
  tags = {
    Name = "Dove-web"
    Name = "Dove"
  }
}