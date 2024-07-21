from PIL import Image



input_image_path = ""
output_image_path = ""

image = Image.open(input_image.jpg)
gray_image = image.convert('L')
white_image = Image.new('RGB', image.size, (255, 255, 255))
white_image.paste(gray_image, (0, 0), gray_image)
white_image.save(output_image.jpg)
