bend="bend run"
program="cli-test.bend"
args=$(cat args)

result="$bend $program $args"
echo $result

$result
