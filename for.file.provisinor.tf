provider "aws" {
    access_key = "your_access_key"
    secret_key = "your_secret_key"
    region = "ap-south-1"
}
resource "aws_key_pair" "for_file_testkey" {
    key_name = "testhello"
    public_key = file("/home/mohit/.ssh/id_rsa.pub")  #path of your local system public key 
}

resource "aws_instance" "third" {
    ami           = "ami-0a7cf821b91bcccbc"
    instance_type = "t2.micro"
    key_name      = aws_key_pair.for_file_testkey.key_name  # Use the key_name attribute of the key pair
    tags = {
        Name = "for file provisioner"
    }

connection {
  type = "ssh"
  user = "ubuntu"
  private_key = file("/home/mohit/.ssh/id_rsa") #path of your local system private key 
  host = aws_instance.third.public_ip  #resource name  of that you want to ssh with public key 
}
provisioner "file" {
    source      = "/home/mohit/Desktop/newterraform/terraform/meri.txt"  # Your local file path
    destination = "/home/ubuntu/meri.txt"  # Absolute path on the remote instance
}
}
