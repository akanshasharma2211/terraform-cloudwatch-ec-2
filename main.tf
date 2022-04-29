
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
} 

data "aws_instances" "acl" {
filter {
name = "vpc-id"
values = ["vpc-01805f7f715686be8"]
}
instance_state_names = ["running"]
}

output "instances" {
value = "${data.aws_instances.acl.instance_tags}"
}


resource "aws_cloudwatch_metric_alarm" "instance_statuscheck" {
  for_each = "${toset(data.aws_instances.acl.ids)}"
  alarm_name            = "awsec2-statuscheckfailed-${each.key}"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods  = "2"
    metric_name         = "StatusCheckFailed"
    namespace           = "AWS/EC2"
    period              = "300"
    statistic           = "Maximum"
    threshold           = "2"
    alarm_description   = "EC2 Status Check"
    dimensions          = { InstanceId = each.key }
    alarm_actions       = [var.aws_sns_topic]  
      
}
resource "aws_cloudwatch_metric_alarm" "instance_cpuutilization_81" {
  for_each = "${toset(data.aws_instances.acl.ids)}"
    alarm_name          = "awsec2-GreaterThanOrEqualTo81percent-CPUUtilization-${each.key}"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods  = "1"
    metric_name         = "CPUUtilization"
    namespace           = "AWS/EC2"
    period              = "300"
    statistic           = "Maximum"
    threshold           = "80"
    alarm_description   = "CPUUtilization"
    dimensions          = { InstanceId = each.key }
    alarm_actions	= [var.aws_sns_topic]


}

resource "aws_cloudwatch_metric_alarm" "instance_cpuutilization_92" {
  for_each = "${toset(data.aws_instances.acl.ids)}"
    alarm_name          = "awsec2-GreaterThanOrEqualTo92percent-CPUUtilization-${each.key}"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods  = "1"
    metric_name         = "CPUUtilization"
    namespace           = "AWS/EC2"
    period              = "300"
    statistic           = "Maximum"
    threshold           = "90"
    alarm_description   = "CPUUtilization"
    dimensions          = { InstanceId = each.key }
    alarm_actions	= [var.aws_sns_topic]

}
