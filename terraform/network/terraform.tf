provider "google" {

}

terraform {
    required_version = "~> 0.12.29"

    required_providers {
        google = "~> 3.24.0"
    }

    backend "gcs" {
        bucket = "mixfreely"
        prefix = "foundation/"
    }
}