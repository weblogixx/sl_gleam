import internal/button
import internal/shared.{with_defaults}
import lustre/attribute.{type Attribute}
import lustre/element.{type Element, element}

type Attributes(msg) =
  List(Attribute(msg))

type Children(msg) =
  List(Element(msg))

pub fn button(attrs: Attributes(msg), children: Children(msg)) {
  element("sl-button", with_defaults(attrs, button.with_defaults), children)
}

pub fn button_group(attrs: Attributes(msg), children: Children(msg)) {
  element("sl-button-group", attrs, children)
}
