############
####RDS#####



resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = var.dbname
  username             = var.username
  password             = var.password
  publicly_accessible  = true
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = "springpetclinic_db"
  skip_final_snapshot = true
  depends_on = [aws_db_subnet_group.db_subnet_group]
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "springpetclinic_db"
  subnet_ids = [ var.subnet_a, var.subnet_b ]

  tags = {
    Name = "DB subnet group"
  }
}

###################
####Kube Master####


resource "aws_instance" "kube" {
  ami                         = var.ami_kube
  instance_type               = var.instancemed
  key_name                    = var.key
  subnet_id                   = var.subnet_a
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  provisioner "local-exec" {
    command = "export MYSQL_HOST=${aws_db_instance.rds.endpoint}"
  }

  user_data                   = var.user_data
  tags = {
    Name = "EC2_Kubemaster"
  }

}

################
####Scripts#####

data "template_file" "init" {
  template = "${file("${path.module}/scripts/init.sh")}"
}








