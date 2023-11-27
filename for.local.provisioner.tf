provider "aws" {
    access_key = "your_access_key"
    secret_key = "your_secret_key"
    region = "ap-south-1"
}
resource "aws_key_pair" "for_local_testkey" {
    key_name = "testhello2"
    public_key = file("/home/mohit/.ssh/id_rsa.pub")  #path of your local system public key 
}

resource "aws_instance" "fifth" {
    ami           = "ami-0a7cf821b91bcccbc"
    instance_type = "t2.micro"
    key_name      = aws_key_pair.for_local_testkey.key_name  # Use the key_name attribute of the key pair
    tags = {
        Name = "for local provisioner"
    }

provisioner "local-exec" {
command = "echo ${self.private_ip} > ./myip.txt"
}
}
