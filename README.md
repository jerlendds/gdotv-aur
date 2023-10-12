# Example of building and uploading a debian package to the AUR

- [x] Generate PKGBUILD for gdotv
- [ ] Upload package to the AUR 

## Running the image
```bash
docker build  --ulimit nofile=1024:524288 --tag gdotv . && docker run gdotv
```
