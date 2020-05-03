
Function SearchAndReplace{

    param( 
        [string]$InputFile, 
        [int]$IndexToBeReplace,  
        [string]$InputString ,
        [string]$OutputFile
        )


    $myArray = ""
    foreach($line in [System.IO.File]::ReadLines($InputFile)) {

        $csvValue = $line.Split(",") 
        $csvValue[$IndexToBeReplace] = $InputString

        foreach($csv in $csvValue){
         
  
                $csv = $csv + ","
             
                $myArray = $myArray + $csv 
            
          
        }

         $myArray =  $myArray.Remove($myArray.Length-1) + "`r`n" 

    }

    $myArray

    $myArray | Out-File $OutputFile 

}

SearchAndReplace -InputFile 'C:\CL Test.txt' -IndexToBeReplace 3 -InputString 'C.69081534.001040.01' -OutputFile 'C:\properties1.txt' 
