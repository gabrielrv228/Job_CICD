data "archive_file" "source" {
    type        = "zip"
    source_dir  = "src"
    output_path = "/tmp/function.zip"
}

# Añadir el codigo a el bucket
resource "google_storage_bucket_object" "zip" {
    source       = data.archive_file.source.output_path
    content_type = "application/zip"

    # Append to the MD5 checksum of the files's content
    # to force the zip to be updated as soon as a change occurs
    name         = "src-${data.archive_file.source.output_md5}.zip"
    bucket       = google_storage_bucket.function_bucket.name

    # Dependencies are automatically inferred so these lines can be deleted
    depends_on   = [
        google_storage_bucket.function_bucket,  # declared in `storage.tf`
        data.archive_file.source
    ]
}

# Crear la funcion accionada por el  `Finalize` en el  bucket
resource "google_cloudfunctions_function" "function" {
    name                  = "${var.function-name}"
    runtime               = "python37"  # of course changeable

    # Coger el código de la función como zip
    source_archive_bucket = google_storage_bucket.function_bucket.name
    source_archive_object = google_storage_bucket_object.zip.name

    entry_point           = "hello_gcs"
    
    
    event_trigger {
        event_type = "google.storage.object.finalize"
        resource   = "${var.bucket_name}-${var.env}"
    }

    # Dependencies are automatically inferred so these lines can be deleted
    depends_on            = [
        google_storage_bucket.function_bucket,  # declarado en `storage.tf`
        google_storage_bucket_object.zip
    ]
}
