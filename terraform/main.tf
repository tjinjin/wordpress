data "aws_ami" "centos" {
  most_recent = true

  filter {
    name   = "product-code"
    values = ["aw0evgkw8e5c1q413zgy5pjce"]
  }
}

resource "aws_instance" "wp" {
  ami                    = "${data.aws_ami.centos.id}"
  instance_type          = "t2.micro"
  key_name               = "tjinjin-terraform"
  vpc_security_group_ids = ["${aws_security_group.wp.id}"]

  root_block_device {
    delete_on_termination = "true"
  }

  tags {
    Name = "wordpress"
  }
}

resource "aws_security_group" "wp" {
  name        = "wordpress"
  description = "wordpress sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ipaddr}"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ipaddr}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name    = "wordpress"
    Created = "terraform"
  }
}

output "wordpress_ip" {
  value = "${aws_instance.wp.public_ip}"
}
