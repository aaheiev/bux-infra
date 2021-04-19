resource helm_release nginx-ingress {
  name         = "ingress-nginx"
  repository   = "https://kubernetes.github.io/ingress-nginx"
  chart        = "ingress-nginx"
  namespace    = "kube-system"
  force_update = false
}
resource helm_release cert-manager {
  name         = "cert-manager"
  namespace    = "kube-system"
  chart        = "cert-manager"
  repository   = "https://charts.jetstack.io"
  force_update = false
  set {
    name  = "installCRDs"
    value = true
  }
}
data template_file external-dns {
  template = "${file("${path.module}/k8s-services/ExternalDNS.yaml.tpl")}"
  vars = {
    domain_name = var.domain_name
    project_id  = var.project_id
  }
}
resource local_file external-dns {
  filename = "${path.module}/k8s-services/ExternalDNS.yaml"
  content  = data.template_file.external-dns.rendered
  provisioner "local-exec" {
    command = "kubectl -n kube-system apply -f ${self.filename} --kubeconfig=kubeconfig-${var.env}"
  }
}
data template_file letsencrypt-prod {
  template = "${file("${path.module}/k8s-services/letsencrypt-prod.yaml.tpl")}"
  vars = {
    admin_email = var.cert_admin
  }
}
data template_file letsencrypt-staging {
  template = "${file("${path.module}/k8s-services/letsencrypt-staging.yaml.tpl")}"
  vars = {
    admin_email = var.cert_admin
  }
}
resource local_file letsencrypt-prod {
  filename = "${path.module}/k8s-services/etsencrypt-prod.yaml"
  content  = data.template_file.letsencrypt-prod.rendered
  depends_on = [helm_release.cert-manager, helm_release.nginx-ingress]
  provisioner "local-exec" {
    command = "kubectl -n kube-system apply -f ${self.filename} --kubeconfig=kubeconfig-${var.env}"
  }
}
resource local_file letsencrypt-staging {
  filename = "${path.module}/k8s-services/etsencrypt-staging.yaml"
  content  = data.template_file.letsencrypt-staging.rendered
  depends_on = [helm_release.cert-manager, helm_release.nginx-ingress]
  provisioner "local-exec" {
    command = "kubectl -n kube-system apply -f ${self.filename} --kubeconfig=kubeconfig-${var.env}"
  }
}
