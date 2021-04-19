data template_file what-time-is-it {
  template = "${file("${path.module}/app/what-time-is-it.yaml.tpl")}"
  vars = {
    domain_name = var.domain_name
  }
}
resource local_file what-time-is-it {
  filename = "${path.module}/app/what-time-is-it.yaml"
  content  = data.template_file.what-time-is-it.rendered
  depends_on = [local_file.letsencrypt-prod,local_file.letsencrypt-staging]
  provisioner "local-exec" {
    command = "kubectl apply -f ${self.filename} --kubeconfig=kubeconfig-${var.env}"
  }
}
