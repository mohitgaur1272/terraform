provider "aws" {
    access_key = "your_access_key"
    secret_key = "your_secret_key"
    region = "ap-south-1"
}
resource "aws_key_pair" "for_remote_testkey" {
    key_name = "testhello1"
    public_key = file("/home/mohit/.ssh/id_rsa.pub")  #path of your local system public key 
}

resource "aws_instance" "forth" {
    ami           = "ami-0a7cf821b91bcccbc"
    instance_type = "t2.micro"
    key_name      = aws_key_pair.for_remote_testkey.key_name  # Use the key_name attribute of the key pair
    tags = {
        Name = "for remote provisioner"
    }

connection {
  type = "ssh"
  user = "ubuntu"
  private_key = file("/home/mohit/.ssh/id_rsa") #your private_key path on your local system
  host = self.public_ip  #resource name  of that you want to ssh with public key 
}
provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install apache2 -y",
      "echo 'hello your remote provisioner yaml file is complete' | sudo tee /var/www/html/index.html",
      "sudo systemctl start apache2"
    ]
  }
}

