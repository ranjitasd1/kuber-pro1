provider "aws" {
    region = "ap-south-1"    
}

resource "aws_instance" "instance-1" {
    ami = "ami-047126e50991d067b"
    instance_type = "t2.medium"
    security_groups = ["default"]
    key_name = "open"
    user_data = file("docker.sh")
    tags = {
        Name = "Microk8s"
    }
   root_block_device {
     volume_size = 30
     volume_type = "gp3"
     delete_on_termination = true
   }
}
