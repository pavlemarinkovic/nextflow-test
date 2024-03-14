process hello1 {
    $sbgAWSInstanceHint='r5.large;ebs-gp2;10'

    output:
    file 'result.txt'

    """
    echo "Hello World from r5.large!" > result.txt
    """
}

process hello2 {
    $sbgAWSInstanceHint='m5.large;ebs-gp2;10'

    output:
    file 'result.txt'

    """
    echo "Hello World from m5.large!" > result.txt
    """
}

workflow {
    hello1()
    hello2()
}