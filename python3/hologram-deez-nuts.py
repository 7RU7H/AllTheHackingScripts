import cv2
import numpy as np

frame = cv2.imread("frame.png")
depth = cv2.imread("depth.png", 0) / 255.0

# shift pixels based on depth
shift = (depth * 20).astype(np.int32)

output = np.zeros_like(frame)

for y in range(frame.shape[0]):
    for x in range(frame.shape[1]):
        nx = x + shift[y, x]
        if nx < frame.shape[1]:
            output[y, nx] = frame[y, x]

cv2.imwrite("shifted.png", output)
