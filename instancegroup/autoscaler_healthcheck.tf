resource "google_compute_autoscaler" "testmeautoscaler" {
     name = "testmeautoscaler"
     zone = "${var.myzone}"
     target = google_compute_instance_group.webserver.id
     autoscaling_policy {
       max_replicas=5
       min_replicas=1
       cooldown_period=60

       cpu_utilization{
           target= 0.5
       }
     }
}

resource "google_compute_http_health_check" "httphealth" {
    name = "healthcheck"
    request_path = "/health_check"
    timeout_sec = 1
    check_interval_sec = 1
  
}

resource "google_compute_backend_service" "bacckend_edd" {

    name = "testme-service"
    port_name="http"
    protocol = "HTTP"
    backend {
      group= google_compute_instance_group.webserver.id
    }
    health_checks = [google_compute_http_health_check.httphealth.id]
    
}