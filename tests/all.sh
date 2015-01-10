#!/usr/bin/env bash


fileUnderTest="${BASH_SOURCE%/*}/../jq/main.jq"


read -d '' fourLineTests <<-'EOF' || true
remove: Can be polite.
"Hello World!"
remove(" World!")
"Hello"

replace: Can be polite to you.
"Hello World!"
replace("World"; "Beautiful")
"Hello Beautiful!"
EOF

function testAllFourLineTests () {
	echo "$fourLineTests" | runAllFourLineTests
}


# Run tests above automatically.
# Custom tests can be added by adding new function with a name that starts with "test": function testSomething () { some test code; }
source "${BASH_SOURCE%/*}/test-runner.sh"
