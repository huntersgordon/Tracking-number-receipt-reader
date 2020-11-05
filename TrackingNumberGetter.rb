require 'tracking_number'



dir = Dir.entries(".") #get names of all files in folder

recepitTextFiles = []
recepitjpgFiles = []

#get names of all .jpg files


dir.each { |item|
  if item.include? ".HEIC"
    system 'magick mogrify -monitor -format jpg *.HEIC >/dev/null 2>&1' #convert all .heic files to .jpg
    system 'rm *.HEIC'
    break
end
}

dir = Dir.entries(".")

dir.each { |item|
  if item.include? ".jpg"
    recepitjpgFiles.append(item)
end
}

recepitjpgFiles.each { |item|
  cmd = "tesseract " + item + " " +  item[0..-5] + " --dpi 150 >/dev/null 2>&1"
  system cmd
}

dir = Dir.entries(".")

#get names of all .txt files
dir.each { |item|
  if item.include? ".txt"
    recepitTextFiles.append(item)
end
}

#puts recepitTextFiles



recepitTextFiles.each { |item|
  puts TrackingNumber.search(File.open(item).read.delete(' '))
}

#puts TrackingNumber.search(File.open("recital.txt").read.delete(' '))
