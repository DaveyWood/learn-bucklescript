type js_string = Js_string.t

external slice :
  js_string ->  int  -> js_string =
"slice" [@@bs.send]

type attributes = < className: js_string > Js.t

(* A type representing virtual dom elements *)
type element = < className: js_string > Js.t
type dom_element
type patch
external body : dom_element = "document.body" [@@bs.val]

external empty_object : unit -> attributes = "Object" [@@bs.new]

(* virtual-dom/h - creates a virtual element *)
external h : js_string -> attributes -> js_string Js_array.t
  -> element =
  "h"[@@bs.module "virtual-dom"]

(* virtual-dom createElement - make real dom from virtual dom *)
external create_element: element -> dom_element =
  "create"[@@bs.module "virtual-dom"]

(* appendChild - append child to dom element *)
external append_child: dom_element -> dom_element -> unit =
  "appendChild"[@@bs.send]


(* virtual-dom diff - diff two bits of virtual dom *)
external diff: element -> element -> patch =
  "diff"[@@bs.module "virtual-dom"]


(* virtual-dom patch - apply patches to the dom *)
external patch: dom_element -> patch -> dom_element =
  "patch"[@@bs.module "virtual-dom"]
