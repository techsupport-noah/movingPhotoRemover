# loop through every file that ends with .MP.jpg in the folder of the script file

$files = Get-ChildItem -Path $PSScriptRoot -Filter *.MP.jpg

foreach ($file in $files) {
    .\exiftool.exe -trailer:all= $file
    Rename-Item -Path $file -NewName ($file.Name -replace ".MP.jpg", ".jpg")
    Rename-Item -Path ($file.Name -replace ".MP.jpg", ".MP.jpg_original") -NewName $file.Name
    }

$files = Get-ChildItem -Path $PSScriptRoot -Filter *.MP.jpg

foreach ($file in $files) {
    .\exiftool.exe -config .\movingPicture.config -overwrite_original -MotionPhoto= -MotionPhotoVersion= -MotionPhotoPresentationTimestampUs= ($file.Name -replace ".MP.jpg", ".jpg")
}


