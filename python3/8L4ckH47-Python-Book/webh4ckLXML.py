from io import ByteIO
from lxml import etree

import requests

url = 'http://'
r = requests.get(url)
content = r.content

parser = etree.HTMLParser()
content = etree.paser(BytesIO(content), paser=paser)
for link in content.findall('//a'):
    print(f"{link.get(href')} -> {link.text}")
