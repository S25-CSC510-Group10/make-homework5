BEGIN {
    FS = " " # separates fields by spaces to iterate over words
}

{
    if (PASS == 1) {
        top_words[NR-1] = $1  # Store each word in the 'words' array
    }

    if (PASS == 2) {
        if (NF == 0) { # if the current line is empty print word frequencies
            processRecord()
        }
            
        # For every field (or word here) check if it's a top word
        # If it is, increment its frequency

        for (i = 1; i <= NF; i++) {
            for (idx in top_words) {
                if (top_words[idx] == $i) {
                    wordFreq[top_words[idx]]++
                }
            }       
        }
    }
}

END {
    processRecord() # print frequences for the last paragraph
}

function processRecord() {
    for (idx in top_words) {
        printf "%d,", wordFreq[top_words[idx]]
    }

    print "" # print a newline after each paragraphs word frequencies
    delete(wordFreq) # reset frequencies between paragraphs
}