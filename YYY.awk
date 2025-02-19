{
    for (i = 1; i <= NF; i++) {
        word = $i
        freq[word]++
    }
}

END {
    for (word in freq) {
        print freq[word], word
    }
}

