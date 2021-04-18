//resource helm_release nginx-ingress {
//  name         = "ingress-nginx"
//  repository   = "https://kubernetes.github.io/ingress-nginx"
//  chart        = "ingress-nginx"
//  namespace    = "kube-system"
//  force_update = false
//}

//resource helm_release cert-manager {
//  name         = "cert-manager"
//  namespace    = "kube-system"
//  chart        = "cert-manager"
//  repository   = "https://charts.jetstack.io"
//  force_update = false
//  set {
//    name  = "installCRDs"
//    value = true
//  }
//}


//resource helm_release issuer {
//  depends_on      = [ helm_release.cert-manager ]
//  name            = "certs"
//  namespace       = "kube-system"
//  chart           = "${path.module}/certs"
//  force_update    = true
//  cleanup_on_fail = true
//  recreate_pods   = false
//  reset_values    = false
//  values          = [local.helm_chart_values]
//}
