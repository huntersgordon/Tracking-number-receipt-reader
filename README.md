# Tracking-number-receipt-reader
'''gem install tracking_number'''

'''brew install tesseract'''

#throw your cropped iPhone photos of receipts in there (if they're .HEIC, then the program automatically converts them to .jpg with the imagemagick package. Just brew install imagemagick

The program uses tesseract ocr to extract text data from the receipts, then jkeen's tracking_number library to identify tracking numbers in those text data.
