provider "aws" {
    access_key = "AKIAYNWHOCS76OPUQJVC"
    secret_key = "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"
    region = "ap-south-1"
}

resource "aws_key_pair" "mykey" {
     key_name = "mohit1"
     public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCruXJbBR3hb1JgZ2X8Km0a2zNcz0LeBZUSSBuR+jM08pLSE4mDLwQdrjV7q9/MVoSZTkllPnqa4lmEM+J+1XGNHnOYrqvDU7mmWn/8cQ5Z2TZZHH+v5mS4pStMUDu1ar/lwOXRb7whJ/kYEsJx4+krgtYKmDOXk9nBQlo0YIzA5zVxD4ZKDPE+gWpAa4nDMztBSdbeSfRtKtclPzqiy5YT+08s9wTHYYSMjkQ7ABTOi/5GrZelvKZDTSoCSsJMZsdtQUgZHN7hodr+ddbpkQhQRdqbn5hzprbhdJcRE4oisGKO1c/5WXWc0aft8mc246i/5xy7K1Oe0+wSPcxfeIF8HXsvRPwH032Dt8RrBhZApSx93oibg2Bmqdss9QPEQPlQZz5IAF0JbSyCA54PSfUj1gg2ZpoaX2FOFbKNP1TtAZFa6fQoDw8bg/e8vCnxqyS9QWZ7eaieGrvu0vJSzDeHhGjJ02KeRguV95q3rX3qvHh61Ugfv/wOmo+75lramwU= mohit@5480"
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