resource "kubernetes_deployment" "spring_boot_k8s" {
  metadata {
    name      = "spring-boot-k8s"
    namespace = var.namespace
    labels = {
      app = "spring-boot-k8s"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "spring-boot-k8s"
      }
    }

    template {
      metadata {
        labels = {
          app = "spring-boot-k8s"
        }
      }

      spec {
        container {
          name              = "spring-boot-k8s"
          image             = var.backend_image
          image_pull_policy = "IfNotPresent"

          port {
            container_port = 8080
          }

          env {
            name  = "MYSQL_HOST"
            value = var.mysql_service_name
          }

          env {
            name  = "MYSQL_PORT"
            value = "3306"
          }

          env {
            name  = "MYSQL_USER"
            value = "root"
          }

          env {
            name  = "MYSQL_PASSWORD"
            value = "My$ql12345"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "spring_boot_k8s_service" {
  metadata {
    name      = var.springboot_service_name
    namespace = var.namespace
    labels = {
      app = "spring-boot-k8s"
    }
  }

  spec {
    selector = {
      app = "spring-boot-k8s"
    }

    port {
      protocol    = "TCP"
      port        = 8080
      target_port = 8080
    }
  }
}
