BEGIN {
    FS = " " # separates fields by spaces to iterate over words
}

{
    if (PASS == 1){
        top_words[NR-1] = $1  # Store each word in the 'words' array
    }

    if (PASS == 2) {
        RS = "\n\n" # separates records by empty lines to iterate over paragraphs

        # For every field (or word here) check if it's a top word
        # If it is, increment its frequency
        for (i = 1; i < NF; i++) {
            for (idx in top_words) {
                if (top_words[idx] == $i) {
                    wordFreq[top_words[idx]]++
                }
            }       
        }

        for (idx in top_words) {
            printf "%d,", wordFreq[top_words[idx]]
        }
        print "" # print a newline after each paragraphs word frequencies
        delete(wordFreq) # reset frequencies between paragraphs
    }
}