resource "google_transcoder_job_template" "transcoder_job_templates" {
  for_each = var.transcoder_job_templates

  job_template_id = each.value.job_template_id
  location        = each.value.location
  deletion_policy = each.value.deletion_policy
  labels          = each.value.labels
  project         = each.value.project

  dynamic "config" {
    for_each = each.value.config != null ? [each.value.config] : []
    content {
      dynamic "ad_breaks" {
        for_each = config.value.ad_breaks != null ? config.value.ad_breaks : []
        content {
          start_time_offset = ad_breaks.value.start_time_offset
        }
      }
      dynamic "edit_list" {
        for_each = config.value.edit_list != null ? config.value.edit_list : []
        content {
          inputs            = edit_list.value.inputs
          key               = edit_list.value.key
          start_time_offset = edit_list.value.start_time_offset
        }
      }
      dynamic "elementary_streams" {
        for_each = config.value.elementary_streams != null ? config.value.elementary_streams : []
        content {
          dynamic "audio_stream" {
            for_each = elementary_streams.value.audio_stream != null ? [elementary_streams.value.audio_stream] : []
            content {
              bitrate_bps       = audio_stream.value.bitrate_bps
              channel_count     = audio_stream.value.channel_count
              channel_layout    = audio_stream.value.channel_layout
              codec             = audio_stream.value.codec
              sample_rate_hertz = audio_stream.value.sample_rate_hertz
            }
          }
          key = elementary_streams.value.key
          dynamic "video_stream" {
            for_each = elementary_streams.value.video_stream != null ? [elementary_streams.value.video_stream] : []
            content {
              dynamic "h264" {
                for_each = video_stream.value.h264 != null ? [video_stream.value.h264] : []
                content {
                  bitrate_bps   = h264.value.bitrate_bps
                  crf_level     = h264.value.crf_level
                  entropy_coder = h264.value.entropy_coder
                  frame_rate    = h264.value.frame_rate
                  gop_duration  = h264.value.gop_duration
                  height_pixels = h264.value.height_pixels
                  dynamic "hlg" {
                    for_each = h264.value.hlg != null ? [h264.value.hlg] : []
                    content {
                    }
                  }
                  pixel_format      = h264.value.pixel_format
                  preset            = h264.value.preset
                  profile           = h264.value.profile
                  rate_control_mode = h264.value.rate_control_mode
                  dynamic "sdr" {
                    for_each = h264.value.sdr != null ? [h264.value.sdr] : []
                    content {
                    }
                  }
                  vbv_fullness_bits = h264.value.vbv_fullness_bits
                  vbv_size_bits     = h264.value.vbv_size_bits
                  width_pixels      = h264.value.width_pixels
                }
              }
            }
          }
        }
      }
      dynamic "encryptions" {
        for_each = config.value.encryptions != null ? config.value.encryptions : []
        content {
          dynamic "aes128" {
            for_each = encryptions.value.aes128 != null ? [encryptions.value.aes128] : []
            content {
            }
          }
          dynamic "drm_systems" {
            for_each = encryptions.value.drm_systems != null ? [encryptions.value.drm_systems] : []
            content {
              dynamic "clearkey" {
                for_each = drm_systems.value.clearkey != null ? [drm_systems.value.clearkey] : []
                content {
                }
              }
              dynamic "fairplay" {
                for_each = drm_systems.value.fairplay != null ? [drm_systems.value.fairplay] : []
                content {
                }
              }
              dynamic "playready" {
                for_each = drm_systems.value.playready != null ? [drm_systems.value.playready] : []
                content {
                }
              }
              dynamic "widevine" {
                for_each = drm_systems.value.widevine != null ? [drm_systems.value.widevine] : []
                content {
                }
              }
            }
          }
          id = encryptions.value.id
          dynamic "mpeg_cenc" {
            for_each = encryptions.value.mpeg_cenc != null ? [encryptions.value.mpeg_cenc] : []
            content {
              scheme = mpeg_cenc.value.scheme
            }
          }
          dynamic "sample_aes" {
            for_each = encryptions.value.sample_aes != null ? [encryptions.value.sample_aes] : []
            content {
            }
          }
          dynamic "secret_manager_key_source" {
            for_each = encryptions.value.secret_manager_key_source != null ? [encryptions.value.secret_manager_key_source] : []
            content {
              secret_version = secret_manager_key_source.value.secret_version
            }
          }
        }
      }
      dynamic "inputs" {
        for_each = config.value.inputs != null ? config.value.inputs : []
        content {
          key = inputs.value.key
          uri = inputs.value.uri
        }
      }
      dynamic "manifests" {
        for_each = config.value.manifests != null ? config.value.manifests : []
        content {
          file_name   = manifests.value.file_name
          mux_streams = manifests.value.mux_streams
          type        = manifests.value.type
        }
      }
      dynamic "mux_streams" {
        for_each = config.value.mux_streams != null ? config.value.mux_streams : []
        content {
          container          = mux_streams.value.container
          elementary_streams = mux_streams.value.elementary_streams
          encryption_id      = mux_streams.value.encryption_id
          file_name          = mux_streams.value.file_name
          key                = mux_streams.value.key
          dynamic "segment_settings" {
            for_each = mux_streams.value.segment_settings != null ? [mux_streams.value.segment_settings] : []
            content {
              segment_duration = segment_settings.value.segment_duration
            }
          }
        }
      }
      dynamic "output" {
        for_each = config.value.output != null ? [config.value.output] : []
        content {
          uri = output.value.uri
        }
      }
      dynamic "overlays" {
        for_each = config.value.overlays != null ? config.value.overlays : []
        content {
          dynamic "animations" {
            for_each = overlays.value.animations != null ? overlays.value.animations : []
            content {
              dynamic "animation_fade" {
                for_each = animations.value.animation_fade != null ? [animations.value.animation_fade] : []
                content {
                  end_time_offset   = animation_fade.value.end_time_offset
                  fade_type         = animation_fade.value.fade_type
                  start_time_offset = animation_fade.value.start_time_offset
                  dynamic "xy" {
                    for_each = animation_fade.value.xy != null ? [animation_fade.value.xy] : []
                    content {
                      x = xy.value.x
                      y = xy.value.y
                    }
                  }
                }
              }
            }
          }
          dynamic "image" {
            for_each = overlays.value.image != null ? [overlays.value.image] : []
            content {
              uri = image.value.uri
            }
          }
        }
      }
      dynamic "pubsub_destination" {
        for_each = config.value.pubsub_destination != null ? [config.value.pubsub_destination] : []
        content {
          topic = pubsub_destination.value.topic
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

