import gleam/int
import internal/button
import internal/shared
import internal/sl
import lustre
import lustre/attribute
import lustre/element
import lustre/element/html
import lustre/event

// MAIN ------------------------------------------------------------------------

pub fn main() {
  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", 0)

  Nil
}

// MODEL -----------------------------------------------------------------------

type Model =
  Int

fn init(initial_count: Int) -> Model {
  case initial_count < 0 {
    True -> 0
    False -> initial_count
  }
}

// UPDATE ----------------------------------------------------------------------

pub opaque type Msg {
  Incr
  Decr
}

fn update(model: Model, msg: Msg) -> Model {
  case msg {
    Incr -> model + 1
    Decr -> model - 1
  }
}

// VIEW ------------------------------------------------------------------------

pub fn view(model: Model) -> element.Element(Msg) {
  let count = int.to_string(model)

  html.div([], [
    html.button([event.on_click(Incr)], [element.text("+")]),
    element.text(count),
    sl.button_group([], [
      // Our implementation, Variant 1
      sl.button([button.variant(button.Warning)], [
        html.span([attribute.attribute("slot", "prefix")], [
          element.text("Prefix"),
        ]),
        html.span([], [element.text("Variant 1")]),
        html.span([attribute.attribute("slot", "suffix")], [
          element.text("Suffix"),
        ]),
      ]),
      // Our implementation, Variant 2
      sl.button([button.primary()], [
        html.span([attribute.attribute("slot", "prefix")], [
          element.text("Prefix"),
        ]),
        html.span([], [element.text("Variant 2")]),
        html.span([attribute.attribute("slot", "suffix")], [
          element.text("Suffix"),
        ]),
      ]),
      // Our implementation, Variant 4
      sl.button(
        [button.warning(), button.small(), shared.with_event("focus", Decr)],
        [
          html.span([button.prefix_slot()], [element.text("Prefix")]),
          element.text("Variant 4"),
          html.span([button.suffix_slot()], [element.text("Suffix")]),
        ],
      ),
      // "Native" lustre
      element.element("sl-button", [attribute.attribute("variant", "danger")], [
        html.span([attribute.attribute("slot", "prefix")], [
          element.text("Prefix"),
        ]),
        html.span([], [element.text("Lustre")]),
        html.span([attribute.attribute("slot", "suffix")], [
          element.text("Suffix"),
        ]),
      ]),
    ]),
    html.button([event.on_click(Decr)], [element.text("-")]),
  ])
}
