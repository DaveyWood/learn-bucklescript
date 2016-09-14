open Bs_virtual_dom

let attrs = empty_object()
let render count = (h "div" attrs (Array.make 1 (string_of_int count)))

let wut = render 1

let root_node = create_element wut

let () = append_child body root_node

let two = render 2

let patches = diff wut two

let stuff = patch root_node patches
