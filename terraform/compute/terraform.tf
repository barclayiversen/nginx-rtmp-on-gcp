provider "google" {
    
}

provider "google-beta" {
    
}

data "terraform_remote_state" "foundation" {
    backend = "gcs"
    
    config = {
        bucket = "mixfreely"
        prefix = "foundation/"
    }
}

terraform {
    required_version = "0.12.29"

    backend "gcs" {
        bucket = "mixfreely"
        prefix = "rtmp/"
    }
}