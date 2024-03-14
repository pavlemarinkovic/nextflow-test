process hello {
    """
    echo "Hello World!" > result.txt
    """
}

workflow {
    hello()
}