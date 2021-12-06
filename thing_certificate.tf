resource "aws_iot_certificate" "cert" {
  csr    = "${file("certificates/aws_iot_certificate_signing_request.csr")}"
  active = true
}

resource "aws_iot_policy_attachment" "att" {
  policy = aws_iot_policy.iot_policy.name
  target = aws_iot_certificate.cert.arn
}

resource "aws_iot_policy" "iot_policy" {
  name   = "${local.iot_policy_allowall}"
  policy = "${data.template_file.tf_iot_policy_allowall.rendered}"
}

resource "aws_iot_policy" "iot_policy2" {
  name   = "${local.iot_policy_con1}"
  policy = "${data.template_file.tf_iot_policy_con1.rendered}"
}
