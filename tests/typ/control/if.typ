// Test if-else expressions.

---
// Test condition evaluation.
#if 1 < 2 [
    One.
]

#if true == false [
    {Bad}, but we {dont-care}!
]

---
// Braced condition.
#if {true} [
    One.
]

// Template in condition.
#if [] != none [
    Two.
]

// Multi-line condition with parens.
#if (
    1 + 1
      == 1
) [
    Nope.
] #else {
    "Three."
}

// Multiline.
#if false [
    Bad.
] #else {
    let point = "."
    "Four" + point
}

---
// Value of if expressions.
// Ref: false
{
    let x = 1
    let y = 2
    let z

    // Returns if branch.
    z = if x < y { "ok" }
    test(z, "ok")

    // Returns else branch.
    z = if x > y { "bad" } else { "ok" }
    test(z, "ok")

    // Missing else evaluates to none.
    z = if x > y { "bad" }
    test(z, none)
}

---
// Condition must be boolean.
// If it isn't, neither branch is evaluated.
// Error: 5-14 expected boolean, found string
#if "a" + "b" { nope } #else { nope }

// Make sure that we don't complain twice.
// Error: 5-12 cannot add integer and string
#if 1 + "2" {}
