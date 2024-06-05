import internal/shared.{boolean_prop}
import lustre/attribute.{attribute}

pub type ButtonType {
  Button
  Submit
  Reset
}

pub type Variant {
  Default
  Primary
  Success
  Neutral
  Warning
  Text
  Danger
}

pub type Size {
  Small
  Medium
  Large
}

pub type Slot {
  DefaultSlot
  PrefixSlot
  SuffixSlot
}

pub fn variant(variant: Variant) {
  let v = case variant {
    Default -> "default"
    Primary -> "primary"
    Success -> "success"
    Warning -> "warning"
    Danger -> "Danger"
    Text -> "text"
    _ -> "neutral"
  }
  attribute("variant", v)
}

pub fn default() {
  variant(Default)
}

pub fn primary() {
  variant(Primary)
}

pub fn success() {
  variant(Success)
}

pub fn neutral() {
  variant(Neutral)
}

pub fn warning() {
  variant(Warning)
}

pub fn danger() {
  variant(Danger)
}

pub fn text() {
  variant(Text)
}

pub fn slot(slot: Slot) {
  let s = case slot {
    PrefixSlot -> "prefix"
    SuffixSlot -> "suffix"
    _ -> ""
  }
  attribute("slot", s)
}

pub fn prefix_slot() {
  slot(PrefixSlot)
}

pub fn suffix_slot() {
  slot(SuffixSlot)
}

pub fn size(s: Size) {
  let s = case s {
    Small -> "small"
    Large -> "large"
    _ -> "medium"
  }
  attribute("size", s)
}

pub fn small() {
  size(Small)
}

pub fn medium() {
  size(Medium)
}

pub fn large() {
  size(Large)
}

pub fn button_type(t: ButtonType) {
  let t = case t {
    Reset -> "reset"
    Submit -> "submit"
    _ -> "button"
  }
  attribute("type", t)
}

pub fn submit() {
  button_type(Submit)
}

pub fn reset() {
  button_type(Reset)
}

pub fn outline(val: Bool) {
  boolean_prop("outline", val)
}

pub fn pill(val: Bool) {
  boolean_prop("pill", val)
}

pub fn circle(val: Bool) {
  boolean_prop("circle", val)
}

pub fn caret(val: Bool) {
  boolean_prop("caret", val)
}

pub fn loading(val: Bool) {
  boolean_prop("loading", val)
}

pub fn disabled(val: Bool) {
  boolean_prop("disabled", val)
}

pub fn href(url: String) {
  attribute("href", url)
}

pub fn with_defaults() {
  [default(), medium()]
}
