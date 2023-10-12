terraform {
    # Compatible version of terraform language features / core functions this module uses
    # Follows SemVer, "~>" means "compatible with", i.e. >= 1.1 and < 2.0
    required_version = "~> 1.1"

    # Compatible versions of providers thes module uses
    required_providers {
        docker = {
            source  = "kreuzwerker/docker"
            version = "3.0.2"
        }
    }
}