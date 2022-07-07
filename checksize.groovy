pipelineJob("CICD_crear_buckets") {
	description()
	keepDependencies(false)
	definition {
		cpsScm {
			scm {
				git {
					remote {
						github("file:///home/$USER/Desktop/whatever", "")
					}
					branch("*/master")
				}
			}
			scriptPath("Jenkinsfile-Storage-Check")
		}
	}
	disabled(false)
}
