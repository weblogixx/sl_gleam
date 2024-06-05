import internal/button
import internal/shared.{with_defaults}
import lustre/attribute.{type Attribute}
import lustre/element.{type Element, element}

pub fn button(attrs: List(Attribute(msg)), children: List(Element(msg))) {
  element("sl-button", with_defaults(attrs, button.with_defaults), children)
}
