provider "aws" {
    access_key = "AKIAYNWHOCS74K42O7HE"
    secret_key = "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"
    region = "ap-south-1"
}

resource "aws_instance" "first1" {
    ami = "ami-0a7cf821b91bcccbc"
    instance_type = "t2.micro"
    key_name = "hello1"  
    count = 2
    tags = {
        "Name" = "myterra"
    } 
}