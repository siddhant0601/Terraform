// to find ami id we can directly go to aws and then check the ami id of different instances ( ubuntu windows ) 
// different for different regions 
// we will use terraform to find the ami id and use that in the same terraform code also 
// terraform gives as resources from a provider ( aws , azure )
// we will just fetch the information/data  outside of terraform so we use 
//data ( it will fetch the resource) " provider name/resource " " given name "{} ( resource block)
//terraform will download information of this resource
data "aws_ami" "amiId" {
  //data block used to give argument
  most_recent = true // one of the argument of aws_ami
  filter {           // use it to serach 
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"] //name we get from ami id , * means end with any name 
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]

  }
  owners = ["099720109477"]
  // all this informtaion came from the documentation
}

// output block is like print in python
output "instance_id" {
  description = "ami id"
  value       = data.aws_ami.amiId.id
}

//terraform fmt -> it will check the format of the file eg correct characters are present or not
//terraform init -> will download the provider information 
//terraform validate -> all the arguments and valuesa are correct or not 
// we are not making any resoruce we are just fetching information and printing it 
//terraform plan   check the impact when you apply the code like what resource will be created destroyed
//terraform apply final run the code 