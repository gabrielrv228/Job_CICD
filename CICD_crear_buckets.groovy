pipelineJob("CICD_crear_buckets") {
	description()
	keepDependencies(false)
	definition {
		cpsScm {
			scm {
				git {
					remote {
						github("file:///home/powerppuma/Desktop/test5", "")
					}
					branch("*/master")
				}
			}
			scriptPath("Jenkinsfile")
		}
	}
	disabled(false)
}