module STL10_Tests
using Test
using MLDatasets

@testset "sanity" begin
    train = STL10.traintensor()
    test = STL10.testtensor()
    unlabeled = STL10.unlabeledtensor()
    @test size(train) == (96,96,3,5000)
    @test size(test) == (96,96,3,8000)
    @test size(unlabeled) == (96,96,3,100000)
    @test train[:,:,:,1] != test[:,:,:,1]
    @test train[:,:,:,1] != unlabeled[:,:,:,1]
    @test test[:,:,:,1] != unlabeled[:,:,:,1]
    @test length(STL10.trainlabels()) == size(train,4)
    @test length(STL10.testlabels()) == size(test,4)
    @test length(STL10.classnames()) == 10
    @test extrema(STL10.trainlabels()) == (1,10)
    @test extrema(STL10.testlabels()) == (1,10)
end

@testset "convert" begin
    data = STL10.traintensor()
    s = data[:,:,:,1]
    @test STL10.convert2image(STL10.convert2features(s)) ==
          STL10.convert2image(s)
end

end