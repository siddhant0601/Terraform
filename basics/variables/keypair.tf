# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
resource "aws_key_pair" "dove-key" {
  key_name   = "dove-key" // name we will see in aws console 
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN4SrKlcAHVehXFpe2JtZzvfAn6nPTE2EgVnPr6QRrhK siddh@siddhant"
}
//ssh-keygen use it to create a new key pair 