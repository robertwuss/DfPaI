from PIL import Image
import os


ASCII_CHARS = [ '#', '?', '.']
# ASCII_CHARS = [ ' ', '.']


def image_to_ascii(width,height,image_path):
    image = Image.open(image_path)
    print (width,height)
    image = image.resize((width, height))
    image = image.convert('L')
    pixels_in_image = list(image.getdata())
    range_width = 256/ len(ASCII_CHARS)
    pixels_to_chars = [ASCII_CHARS[ int(pixel_value//range_width)] for pixel_value in
            pixels_in_image]
            # rangewidth is equal to 256 divded by the number of ascii chars in array


    chars = "".join(pixels_to_chars) # converting array to string

    image_ascii = [chars[index: index + width] for index in
             range(0, len(chars), width)]

    # print (image_ascii)
    chars_split = "\n".join(image_ascii)

    f = open(os.path.splitext(image_path)[0]+'.txt','w')
    f.write(chars_split)
    f.close()


if __name__=='__main__':
    import sys


    image_path = sys.argv[1]
    width = int(sys.argv[2])
    height = int(sys.argv[3])

    image_to_ascii(width,height,image_path)
