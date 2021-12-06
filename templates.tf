data "template_file" "tf_iot_policy_allowall" {
  vars = {
    aws_region = "${var.aws_region}"
    aws_account_id = "${var.aws_account_id}"
  }
  template = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iot:Connect",
        "iot:Publish",
        "iot:Receive",
        "iot:Subscribe"
      ],
      "Resource": "arn:aws:iot:$${aws_region}:$${aws_account_id}:*"
    }
  ]
}
EOF
}


data "template_file" "tf_iot_policy_con1" {
  vars = {
    aws_region = "${var.aws_region}"
    aws_account_id = "${var.aws_account_id}"
  }
  template = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "iot:Publish",
        "iot:Receive",
        "iot:RetainPublish"
      ],
      "Resource": [
        "arn:aws:iot:$${aws_region}:$${aws_account_id}:topic/sdk/test/java",
        "arn:aws:iot:$${aws_region}:$${aws_account_id}:topic/sdk/test/Python",
        "arn:aws:iot:$${aws_region}:$${aws_account_id}:topic/topic_1",
        "arn:aws:iot:$${aws_region}:$${aws_account_id}:topic/topic_2"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "iot:Subscribe"
      ],
      "Resource": [
        "arn:aws:iot:$${aws_region}:$${aws_account_id}:topicfilter/sdk/test/java",
        "arn:aws:iot:$${aws_region}:$${aws_account_id}:topicfilter/sdk/test/Python",
        "arn:aws:iot:$${aws_region}:$${aws_account_id}:topicfilter/topic_1",
        "arn:aws:iot:$${aws_region}:$${aws_account_id}:topicfilter/topic_2"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "iot:Connect"
      ],
      "Resource": [
        "arn:aws:iot:$${aws_region}:$${aws_account_id}:client/sdk-java",
        "arn:aws:iot:$${aws_region}:$${aws_account_id}:client/basicPubSub",
        "arn:aws:iot:$${aws_region}:$${aws_account_id}:client/sdk-nodejs-*"
      ]
    }
  ]
}
EOF
}