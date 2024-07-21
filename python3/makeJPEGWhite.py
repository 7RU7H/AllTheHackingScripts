from PIL import Image

input_image_path = ""
output_image_path = ""

def make_image_white(input_image_path, output_image_path):
    img = Image.open(input_image_path)
    white_img = Image.new("RGB", img.size, "white")
    white_img.save(output_image_path)
