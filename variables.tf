variable "transcoder_job_templates" {
  description = <<EOT
Map of transcoder_job_templates, attributes below
Required:
    - job_template_id
    - location
Optional:
    - deletion_policy
    - labels
    - project
    - config (block):
        - ad_breaks (optional, block):
            - start_time_offset (optional)
        - edit_list (optional, block):
            - inputs (optional)
            - key (optional)
            - start_time_offset (optional)
        - elementary_streams (optional, block):
            - audio_stream (optional, block):
                - bitrate_bps (required)
                - channel_count (optional)
                - channel_layout (optional)
                - codec (optional)
                - sample_rate_hertz (optional)
            - key (optional)
            - video_stream (optional, block):
                - h264 (optional, block):
                    - bitrate_bps (required)
                    - crf_level (optional)
                    - entropy_coder (optional)
                    - frame_rate (required)
                    - gop_duration (optional)
                    - height_pixels (optional)
                    - hlg (optional, block):
                    - pixel_format (optional)
                    - preset (optional)
                    - profile (optional)
                    - rate_control_mode (optional)
                    - sdr (optional, block):
                    - vbv_fullness_bits (optional)
                    - vbv_size_bits (optional)
                    - width_pixels (optional)
        - encryptions (optional, block):
            - aes128 (optional, block):
            - drm_systems (optional, block):
                - clearkey (optional, block):
                - fairplay (optional, block):
                - playready (optional, block):
                - widevine (optional, block):
            - id (required)
            - mpeg_cenc (optional, block):
                - scheme (required)
            - sample_aes (optional, block):
            - secret_manager_key_source (optional, block):
                - secret_version (required)
        - inputs (optional, block):
            - key (optional)
            - uri (optional)
        - manifests (optional, block):
            - file_name (optional)
            - mux_streams (optional)
            - type (optional)
        - mux_streams (optional, block):
            - container (optional)
            - elementary_streams (optional)
            - encryption_id (optional)
            - file_name (optional)
            - key (optional)
            - segment_settings (optional, block):
                - segment_duration (optional)
        - output (optional, block):
            - uri (optional)
        - overlays (optional, block):
            - animations (optional, block):
                - animation_fade (optional, block):
                    - end_time_offset (optional)
                    - fade_type (required)
                    - start_time_offset (optional)
                    - xy (optional, block):
                        - x (optional)
                        - y (optional)
            - image (optional, block):
                - uri (required)
        - pubsub_destination (optional, block):
            - topic (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    job_template_id = string
    location        = string
    deletion_policy = optional(string)
    labels          = optional(map(string))
    project         = optional(string)
    config = optional(object({
      ad_breaks = optional(list(object({
        start_time_offset = optional(string)
      })))
      edit_list = optional(list(object({
        inputs            = optional(list(string))
        key               = optional(string)
        start_time_offset = optional(string)
      })))
      elementary_streams = optional(list(object({
        audio_stream = optional(object({
          bitrate_bps       = number
          channel_count     = optional(number)
          channel_layout    = optional(list(string))
          codec             = optional(string)
          sample_rate_hertz = optional(number)
        }))
        key = optional(string)
        video_stream = optional(object({
          h264 = optional(object({
            bitrate_bps   = number
            crf_level     = optional(number)
            entropy_coder = optional(string)
            frame_rate    = number
            gop_duration  = optional(string)
            height_pixels = optional(number)
            hlg = optional(object({
            }))
            pixel_format      = optional(string)
            preset            = optional(string)
            profile           = optional(string)
            rate_control_mode = optional(string)
            sdr = optional(object({
            }))
            vbv_fullness_bits = optional(number)
            vbv_size_bits     = optional(number)
            width_pixels      = optional(number)
          }))
        }))
      })))
      encryptions = optional(list(object({
        aes128 = optional(object({
        }))
        drm_systems = optional(object({
          clearkey = optional(object({
          }))
          fairplay = optional(object({
          }))
          playready = optional(object({
          }))
          widevine = optional(object({
          }))
        }))
        id = string
        mpeg_cenc = optional(object({
          scheme = string
        }))
        sample_aes = optional(object({
        }))
        secret_manager_key_source = optional(object({
          secret_version = string
        }))
      })))
      inputs = optional(list(object({
        key = optional(string)
        uri = optional(string)
      })))
      manifests = optional(list(object({
        file_name   = optional(string)
        mux_streams = optional(list(string))
        type        = optional(string)
      })))
      mux_streams = optional(list(object({
        container          = optional(string)
        elementary_streams = optional(list(string))
        encryption_id      = optional(string)
        file_name          = optional(string)
        key                = optional(string)
        segment_settings = optional(object({
          segment_duration = optional(string)
        }))
      })))
      output = optional(object({
        uri = optional(string)
      }))
      overlays = optional(list(object({
        animations = optional(list(object({
          animation_fade = optional(object({
            end_time_offset   = optional(string)
            fade_type         = string
            start_time_offset = optional(string)
            xy = optional(object({
              x = optional(number)
              y = optional(number)
            }))
          }))
        })))
        image = optional(object({
          uri = string
        }))
      })))
      pubsub_destination = optional(object({
        topic = optional(string)
      }))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

