# pip3 install translate
from translate import Translator

LANG = input("Input a compatible language to translate to:" )
translator = Translator(to_lang=LANG)
try:
    with open('filename.txt', mode='r') as
    text = (file.read())
    translation = translator.translate(text)
    with open('./translationOutput.txt', mode='w') as fileTwo:
        fileTwo.write(translation)
    except FileNotFoundError as e:
    print('Restate file and file path')
exit()
