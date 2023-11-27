provider "aws" {
    access_key = "your_access_key"
    secret_key = "your_secrete_key"
    region = "ap-south-1"
}

resource "aws_key_pair" "mykey" {
     key_name = "mohit1"
     public_key = file("/home/mohit/.ssh/id_rsa.pub")  #path of your local system public key 
}

resource "aws_instance" "second" {
    ami = "ami-0a7cf821b91bcccbc"
    instance_type = "t2.micro" 
    key_name = aws_key_pair.mykey.key_name
    count = 2
    tags = {
        "Name" = "newmyterra"
    } 
}
