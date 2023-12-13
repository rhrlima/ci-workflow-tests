namespace MyTests

open NUnit.Framework
open Program

[<TestFixture>]
type TestSuite() =
  [<Test>]
  member __.``maxDepth of () is 1``() =
    let result = Program.maxDepth "()"
    Assert.AreEqual(1, result)
  
  [<Test>]
  member __.``maxDepth of (1+(2*3)+((8)/4))+1 is 3``() =
    let result = Program.maxDepth "(1+(2*3)+((8)/4))+1"
    Assert.AreEqual(3, result)

  [<Test>]
  member __.``true``() =
    Assert.True(true)
