
from cryptor import decrypt
with open('topo_post_pdf.txt', 'rb') as f:
    contents = f.read()
with open('newtopo.pdf', 'wb') as f:
    f.write(decrypt(contents))
