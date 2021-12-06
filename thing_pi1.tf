resource "aws_iot_thing" "pi1" {
  name = "${local.thing_name_pi1}"
}

resource "aws_iot_thing_principal_attachment" "att" {
  principal = "${aws_iot_certificate.cert.arn}"
  thing     = "${aws_iot_thing.pi1.name}"
}
