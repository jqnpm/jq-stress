#!/usr/bin/env bash


fileUnderTest="${BASH_SOURCE%/*}/../jq/main.jq"


# TODO: fix unicode stuff so this test doesn't fail.
# https://github.com/mathiasbynens/esrever
# esrever: Can be polite elsewhere.
# "Lorem ipsum 𝌆 dolor sit ameͨ͆t."
# esrever
# ".teͨ͆ma tis rolod 𝌆 muspi meroL"
read -d '' fourLineTests <<-'EOF' || true
remove: Can be polite.
"Hello World!"
remove(" World!")
"Hello"

replace: Can be polite to you.
"Hello World!"
replace("World"; "Beautiful")
"Hello Beautiful!"

esrever: Can be polite on Mars.
"Hello World!"
esrever
"!dlroW olleH"

esrever: Can translate to Martian and back.
"Hello World!"
esrever | esrever
"Hello World!"

esrever: Shows naïve non-unicode aware implemention problems. Will fail when unicode is fixed.
"mañana mañana"
esrever
"anãnam anañam"

esrever: Shows double reverse not having unicode problems.
"Lorem ipsum 𝌆 dolor sit ameͨ͆t."
esrever | esrever
"Lorem ipsum 𝌆 dolor sit ameͨ͆t."

isEmpty: String is empty.
""
isEmpty
true

isEmpty: String is not empty.
"a"
isEmpty
false

isEmpty/1: String is empty with a fallback.
""
isEmpty("omg")
"omg"

isEmpty/1: String is not empty with a fallback.
"a"
isEmpty("omg")
"a"

isNullOrEmpty: String is null.
null
isNullOrEmpty
true

isNullOrEmpty: String is empty.
""
isNullOrEmpty
true

isNullOrEmpty: String is whitespace.
" \\\\u0009\\\\u000B"
isNullOrEmpty
false

isNullOrEmpty: String is not empty.
"a"
isNullOrEmpty
false

isNullOrEmpty/1: String is null with a fallback.
null
isNullOrEmpty("omg")
"omg"

isNullOrEmpty/1: String is empty with a fallback.
""
isNullOrEmpty("omg")
"omg"

isNullOrEmpty/1: String is whitespace with a fallback.
" \\\\u0009\\\\u000B"
isNullOrEmpty("omg")
" \\\\u0009\\\\u000B"

isNullOrEmpty/1: String is not empty with a fallback.
"a"
isNullOrEmpty("omg")
"a"

isNullOrWhitespace: String is null.
null
isNullOrWhitespace
true

isNullOrWhitespace: String is empty.
""
isNullOrWhitespace
true

isNullOrWhitespace: String is whitespace.
" \\\\u0009\\\\u000B"
isNullOrWhitespace
true

isNullOrWhitespace: String is not empty.
"a"
isNullOrWhitespace
false

isNullOrWhitespace/1: String is null with a fallback.
null
isNullOrWhitespace("omg")
"omg"

isNullOrWhitespace/1: String is empty with a fallback.
""
isNullOrWhitespace("omg")
"omg"

isNullOrWhitespace/1: String is whitespace with a fallback.
" \\\\u0009\\\\u000B"
isNullOrWhitespace("omg")
"omg"

isNullOrWhitespace/1: String is not empty with a fallback.
"a"
isNullOrWhitespace("omg")
"a"
EOF

function testAllFourLineTests () {
	echo "$fourLineTests" | runAllFourLineTests
}


# Run tests above automatically.
# Custom tests can be added by adding new function with a name that starts with "test": function testSomething () { some test code; }
source "${BASH_SOURCE%/*}/test-runner.sh"
