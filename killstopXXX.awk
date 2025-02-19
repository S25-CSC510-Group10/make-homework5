# List of words to remove
BEGIN {
    stopword["is"] = 1
    stopword["the"] = 1
    stopword["in"] = 1
    stopword["but"] = 1
    stopword["can"] = 1
    stopword["a"] = 1
    stopword["of"] = 1
    stopword["to"] = 1
    stopword["that"] = 1
    stopword["it"] = 1
    stopword["for"] = 1
    stopword["on"] = 1
    stopword["with"] = 1
    stopword["as"] = 1
    stopword["this"] = 1
    stopword["was"] = 1
    stopword["at"] = 1
    stopword["by"] = 1
    stopword["an"] = 1
    stopword["be"] = 1
    stopword["from"] = 1
    stopword["or"] = 1
    stopword["are"] = 1
}

# Remove lines
{
    for (i = 1; i <= NF; i++) {
        if (!( $i in stopword )) {
            printf "%s ", $i
        }
    }
    print ""
}