# mlpy environment

## How to

```
docker build -t omiya/dev:2.0 -f Dockerfile ./
docker run -it -p 8080:8000 --name mlpy --mount type=bind,source="$(pwd)/mount",target=/workspace omiya/dev:2.0
python setup.py install
```

## Changelog

- mlpy/wavelet/continuous.py, line 162

```
### - s = empty(J + 1)
### + s = empty(int(J) + 1)
python setup.py build_ext
```