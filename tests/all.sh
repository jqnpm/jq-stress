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
EOF

function testAllFourLineTests () {
	echo "$fourLineTests" | runAllFourLineTests
}


# Run tests above automatically.
# Custom tests can be added by adding new function with a name that starts with "test": function testSomething () { some test code; }
source "${BASH_SOURCE%/*}/test-runner.sh"
