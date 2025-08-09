*Install Linux*
```
git clone git@github.com:theRadn/nvim.git ~/.config/minimal-nvim
```
```
git clone https://github.com/theRadn/minimal-nvim.git ~/.config/minimal-nvim
```

*Install Windows*
```
git clone git@github.com:theRadn/nvim.git $env:LOCALAPPDATA\nvim
```
```
git clone https://github.com/theRadn/minimal-nvim.git $env:LOCALAPPDATA\nvim
```

*Uninstall Linux*
```
rm -rf ~/.config/minimal-nvim
```

.bashrc
```
echo "alias mvim='NVIM_APPNAME="minimal-nvim" nvim'" >> ~/.bashrc
```
