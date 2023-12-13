let maxDepth (expression: string) =
    expression
    |> Seq.map (function | '(' -> 1 | ')' -> -1 | _ -> 0)
    |> Seq.scan (+) 0
    |> Seq.map abs
    |> Seq.max

[<EntryPoint>]
let main argv =
    if Array.length argv > 0 then
        printfn "Expression: %s" argv.[0]
        let result = maxDepth argv.[0]
        printfn "Max Depth %d" result
    else
        printfn "Usage: program.exe \"(1+(2*3)+((8)/4))+1\""
    0
