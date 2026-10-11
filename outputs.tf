output "transcoder_job_templates_id" {
  description = "Map of id values across all transcoder_job_templates, keyed the same as var.transcoder_job_templates except keys with no id are omitted"
  value       = { for k, v in google_transcoder_job_template.transcoder_job_templates : k => v.id if v.id != null && length(v.id) > 0 }
}
output "transcoder_job_templates_config" {
  description = "Map of config values across all transcoder_job_templates, keyed the same as var.transcoder_job_templates except keys with no config are omitted"
  value       = { for k, v in google_transcoder_job_template.transcoder_job_templates : k => one(v.config) if v.config != null && length(v.config) > 0 }
}
output "transcoder_job_templates_deletion_policy" {
  description = "Map of deletion_policy values across all transcoder_job_templates, keyed the same as var.transcoder_job_templates except keys with no deletion_policy are omitted"
  value       = { for k, v in google_transcoder_job_template.transcoder_job_templates : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "transcoder_job_templates_effective_labels" {
  description = "Map of effective_labels values across all transcoder_job_templates, keyed the same as var.transcoder_job_templates except keys with no effective_labels are omitted"
  value       = { for k, v in google_transcoder_job_template.transcoder_job_templates : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "transcoder_job_templates_job_template_id" {
  description = "Map of job_template_id values across all transcoder_job_templates, keyed the same as var.transcoder_job_templates except keys with no job_template_id are omitted"
  value       = { for k, v in google_transcoder_job_template.transcoder_job_templates : k => v.job_template_id if v.job_template_id != null && length(v.job_template_id) > 0 }
}
output "transcoder_job_templates_labels" {
  description = "Map of labels values across all transcoder_job_templates, keyed the same as var.transcoder_job_templates except keys with no labels are omitted"
  value       = { for k, v in google_transcoder_job_template.transcoder_job_templates : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "transcoder_job_templates_location" {
  description = "Map of location values across all transcoder_job_templates, keyed the same as var.transcoder_job_templates except keys with no location are omitted"
  value       = { for k, v in google_transcoder_job_template.transcoder_job_templates : k => v.location if v.location != null && length(v.location) > 0 }
}
output "transcoder_job_templates_name" {
  description = "Map of name values across all transcoder_job_templates, keyed the same as var.transcoder_job_templates except keys with no name are omitted"
  value       = { for k, v in google_transcoder_job_template.transcoder_job_templates : k => v.name if v.name != null && length(v.name) > 0 }
}
output "transcoder_job_templates_project" {
  description = "Map of project values across all transcoder_job_templates, keyed the same as var.transcoder_job_templates except keys with no project are omitted"
  value       = { for k, v in google_transcoder_job_template.transcoder_job_templates : k => v.project if v.project != null && length(v.project) > 0 }
}
output "transcoder_job_templates_terraform_labels" {
  description = "Map of terraform_labels values across all transcoder_job_templates, keyed the same as var.transcoder_job_templates except keys with no terraform_labels are omitted"
  value       = { for k, v in google_transcoder_job_template.transcoder_job_templates : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}

