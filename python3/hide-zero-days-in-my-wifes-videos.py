with open('video.mp4', 'rb') as v, open('flag.asm', 'rb') as f, open('encoded_video.mp4', 'wb') as out:
    out.write(v.read())
    out.write(f.read())`
