process hello1 {
    output:
    file 'result.txt'

    """
    echo "Hello World from c4.2xlarge!" > result.txt
    """
}

process hello2 {
    output:
    file 'result.txt'

    """
    echo "Hello World from r5.2xlarge!" > result.txt
    """
}

process hello3 {
    output:
    file 'result.txt'

    """
    echo "Hello World from r5.8xlarge!" > result.txt
    """
}

workflow {
    hello1()
    hello2()
    hello3()
}