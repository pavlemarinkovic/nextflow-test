process hello1 {
    label 'process_low'

    output:
    file 'result.txt'

    """
    echo "Hello World from c4.2xlarge!" > result.txt
    """
}

process hello2 {
    label 'process_medium'

    output:
    file 'result.txt'

    """
    echo "Hello World from r5.2xlarge!" > result.txt
    """
}

process hello3 {
    label 'process_high'

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