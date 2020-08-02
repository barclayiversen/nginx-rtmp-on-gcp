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