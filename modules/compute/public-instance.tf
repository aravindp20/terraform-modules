resource "aws_instance" "public-instance" {
  count                       = var.environment == "Prod" ? 3 : 1
  ami                         = lookup(var.amis, var.aws_region)
  instance_type               = "t3.micro"
  key_name                    = "main-key"
  subnet_id                   = element(var.public_subnet, count.index)
  vpc_security_group_ids      = ["${var.sg_id}"]
  associate_public_ip_address = true
  tags = merge(var.common_tags, {
    Name = "webserver-public-${count.index}"
  })
  user_data = <<-EOF
     #!/bin/bash
     	sudo apt-get update
     	sudo apt-get install -y nginx
     	echo "<h1>${var.environment}-Server-1</h1>" | sudo tee /var/www/html/index.html
     	sudo systemctl start nginx
     	sudo systemctl enable nginx
     EOF
}