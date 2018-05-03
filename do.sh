#!/bin/bash

python makeBook.py
mv QipengBai-blog.pdf pdf/
cd ..
hugo
cd -
evince pdf/QipengBai-blog.pdf
