# ChunkyPNG sandbox

This is a collection of `chunky_png` samples.



## compose.rb

|       file name        | size |
|------------------------|------|
| composited-default.png | 899K |
| composited-fast.png    | 1.7M |




## extract-common.rb




## from-scratch.rb

This will generate `output/with_metadata_after.png`




## metadata.rb

This sample will insert metadata into an output png.



## scale_down.rb

```sh
exe/scale_down.rb -o output input/chara1.png
```
this will generate the file `output/chara1.png` that is half the size of the original file.

To erase all output files, just invoke:

```sh
rake clean
```

