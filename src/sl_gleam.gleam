import gleam/int
import lustre
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
    element.element("sl-button", [], [element.text("I am a sl button")]),
    html.button([event.on_click(Decr)], [element.text("-")]),
  ])
}
