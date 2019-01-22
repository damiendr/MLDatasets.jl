export STL10
module STL10
    using DataDeps
    using BinDeps
    using Mmap: mmap
    using ColorTypes: N0f8, RGB
    using ..MLDatasets: bytes_to_type, datafile, download_dep, download_docstring, _colorview, _channelview
    export
        classnames,

        traintensor,
        trainlabels,
        traindata

        testtensor,
        testlabels,
        testdata,

        unlabeledtensor,

        convert2features,
        convert2image,

        download

    const DEPNAME = "STL10"
    const IMAGE_SIZE = (96, 96)
    const NUM_PIXELS = prod(IMAGE_SIZE)
    const NUM_FEATURES = NUM_PIXELS*3

    const PATH_CLASSNAMES = "class_names.txt"
    const PATH_TRAINDATA = "train_X.bin"
    const PATH_TRAINLABELS = "train_y.bin"
    const PATH_TESTDATA = "test_X.bin"
    const PATH_TESTLABELS = "test_y.bin"
    const PATH_UNLABELED = "unlabeled_X.bin"

    const NUM_TRAIN = 5000
    const NUM_TEST = 8000
    const NUM_UNLABELED = 100000

    """
        download([dir]; [i_accept_the_terms_of_use])

    Trigger the (interactive) download of the full dataset into
    "`dir`". If no `dir` is provided the dataset will be
    downloaded into "~/.julia/datadeps/$DEPNAME".

    This function will display an interactive dialog unless
    either the keyword parameter `i_accept_the_terms_of_use` or
    the environment variable `DATADEPS_ALWAYS_ACCEPT` is set to
    `true`. Note that using the data responsibly and respecting
    copyright/terms-of-use remains your responsibility.
    """
    download(args...; kw...) = download_dep(DEPNAME, args...; kw...)

    include("interface.jl")
    include("utils.jl")

    function __init__()
        register(DataDep(
            DEPNAME,
            """
            Dataset: The STL-10 dataset
            Authors: Adam Coates, Honglak Lee, Andrew Y. Ng
            Website: https://cs.stanford.edu/~acoates/stl10
            Reference: http://cs.stanford.edu/~acoates/papers/coatesleeng_aistats_2011.pdf

            [Coates, 2011]
                Adam Coates, Honglak Lee, Andrew Y. Ng.
                "An Analysis of Single Layer Networks in Unsupervised Feature Learning",
                AISTATS, 2011.

            The STL-10 dataset is an image recognition dataset for
            developing unsupervised feature learning, deep learning,
            self-taught learning algorithms.

            The compressed archive file that contains the
            complete dataset is available for download at the
            offical website linked above; specifically the binary
            version for C programs. Note that using the data
            responsibly and respecting copyright remains your
            responsibility. The authors of STL-10 aren't really
            explicit about any terms of use, so please read the
            website to make sure you want to download the
            dataset.
            """,
            "http://ai.stanford.edu/~acoates/stl10/stl10_binary.tar.gz",
            "f31fd99273a1acb8609c8db427cebb1de3f71de77758cdc0e22956e1289b9866",
            post_fetch_method = file -> (run(BinDeps.unpack_cmd(file,dirname(file), ".gz", ".tar")); rm(file))
        ))
    end
end
