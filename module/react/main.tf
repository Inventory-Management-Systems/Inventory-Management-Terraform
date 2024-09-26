resource "kubernetes_deployment" "react_k8s" {
  metadata {
    name      = "react-k8s"
    namespace = var.namespace
    labels = {
      app = "react-k8s"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "react-k8s"
      }
    }

    template {
      metadata {
        labels = {
          app = "react-k8s"
        }
      }

      spec {
        container {
          name              = "react-k8s"
          image             = var.frontend_image
          image_pull_policy = "IfNotPresent"

          port {
            container_port = 3000
          }

          env {
            name  = "REACT_APP_HOST"
            value = "http://localhost"
          }

          env {
            name  = "REACT_APP_PORT"
            value = "8080"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "react_k8s_service" {
  metadata {
    name      = var.react_service_name
    namespace = var.namespace
    labels = {
      app = "react-k8s"
    }
  }

  spec {
    selector = {
      app = "react-k8s"
    }

    port {
      protocol    = "TCP"
      port        = 3000
      target_port = 3000
    }
  }
}
