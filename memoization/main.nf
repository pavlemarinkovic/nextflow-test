params.salt = "default salt"
params.test_content = "default content"
params.code_package_file = "main.nf"
params.check_no_cache = "yes"


process explicitDockerImage {

    container 'images.sbgenomics.com/andjelko/alpine_with_bash:latest'

    input:
    val salt

    """
    echo ${salt}
    """

}

process implicitDockerImage {

    label 'implicit_image'

    input:
    val salt

    """
    echo ${salt}
    """

}

process topLevelFileInput {

    input:
    val salt
    path test_file

    output:
    path 'result.txt'

    """
    echo ${salt}
    cp ${test_file} result.txt
    """

}

process codePackageFileInput {

    input:
    val salt
    path test_file

    output:
    path 'result.txt'

    """
    echo ${salt}
    cp ${test_file} result.txt
    """

}

process intermediaryFileInput {

    input:
    val salt
    path test_file

    output:
    path 'result.txt'

    """
    echo ${salt}
    cp ${test_file} result.txt
    """

}

process script {

    input:
    val salt
    val content

    output:
    stdout emit: salt
    path 'test_file.txt'

    """
    echo ${salt}
    echo ${content} > test_file.txt
    """

}

process resourceRequirements {

    memory { params.test_content != "second" ? 100.MB : 200.MB }
    cpus 1

    input:
    val salt

    """
    echo ${salt}
    """

}

process alwaysExecute {

    cache false

    input:
    val salt

    """
    echo ${salt}
    """

}

workflow {
    if (params.test_content != "second") {
        explicitDockerImage(params.salt)
        implicitDockerImage(params.salt)
    }
    if (params.check_no_cache == "yes" ) {
        alwaysExecute(params.salt)
    }
    topLevelFileInput(params.salt, file(params.test_file))
    codePackageFileInput(params.salt, file(params.code_package_file))
    intermediaryFileInput(script(params.salt, params.test_content))
    resourceRequirements(params.salt)
}

