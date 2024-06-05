//// Shared helpers for all items

import gleam/list

import lustre/attribute.{type Attribute, attribute}
import lustre/event.{on}

pub fn boolean_prop(attr: String, val: Bool) {
  case val {
    True -> attribute(attr, "true")
    False -> attribute.none()
  }
}

pub fn with_event(event: String, msg: msg) -> Attribute(msg) {
  use _ <- on("sl-" <> event)
  Ok(msg)
}

pub fn with_defaults(
  attrs: List(Attribute(msg)),
  defaults: fn() -> List(Attribute(msg)),
) {
  list.flatten([defaults(), attrs])
}
