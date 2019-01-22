
function classnames(; dir=nothing)
    readlines(datafile(DEPNAME, PATH_CLASSNAMES, dir))
end

traintensor(; dir=nothing) = load_data(PATH_TRAINDATA,
    NUM_TRAIN, dir)

trainlabels(; dir=nothing) = load_labels(PATH_TRAINLABELS,
    NUM_TRAIN, dir)

traindata(; dir=nothing) = (traintensor(dir), trainlabels(dir))

testtensor(; dir=nothing) = load_data(PATH_TESTDATA,
    NUM_TEST, dir)

testlabels(; dir=nothing) = load_labels(PATH_TESTLABELS,
    NUM_TEST, dir)

testdata(; dir=nothing) = (testtensor(dir), testlabels(dir))

unlabeledtensor(; dir=nothing) = load_data(PATH_UNLABELED,
    NUM_UNLABELED, dir)

function load_data(path, count, dir)
    filename = datafile(DEPNAME, path, dir)
    io = open(filename, "r")
    mmap(io, Array{N0f8,4}, (IMAGE_SIZE..., 3, count))
end

function load_labels(path, count, dir)
    labels = Vector{Int8}(undef, count)
    filename = datafile(DEPNAME, path, dir)
    open(filename, "r") do io
        read!(io, labels)
    end
    labels
end

