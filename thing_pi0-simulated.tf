resource "aws_iot_thing" "pi0_simulated" {
  name = "${local.thing_name_pi0_simulated}"
}

resource "aws_iot_thing_principal_attachment" "pi0_att" {
  principal = "${aws_iot_certificate.cert.arn}"
  thing     = "${aws_iot_thing.pi0_simulated.name}"
}
