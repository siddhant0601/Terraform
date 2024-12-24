# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
resource "aws_security_group" "dove-sg" {
  name        = "dove-sg"
  description = "dove-sg"

  tags = {
    Name = "dove-sg"
  }
}
//below are the rules of security group
resource "aws_vpc_security_group_ingress_rule" "sshFromMyIp" {
  security_group_id = aws_security_group.dove-sg.id //the id of above group where this rule will be created
  cidr_ipv4         = "103.25.231.126/32"           // from where we want to allow incoming 
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allowHttp" {
  security_group_id = aws_security_group.dove-sg.id
  cidr_ipv4         = "0.0.0.0/0" //anyIpv4 
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allowAllOutBound_ipv4" {
  // all the ports can go to any ipv4
  security_group_id = aws_security_group.dove-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allowAllOutBound_ipv6" {
  security_group_id = aws_security_group.dove-sg.id
  cidr_ipv6         = "::/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}