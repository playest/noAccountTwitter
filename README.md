# Usage

Create a directory next to "./update.sh" to follow a twitter user.
For example if you want to follow @notch, create a directory named "notch", if you want to follow @KarenGillan2, create a directory named "KarenGillan2".

Then run `./update.sh`

Then run `./aggregate.sh`

Then open tweets.xml in your browser.

# Dependencies

pyxpath is packaged with this program but if you want a clean install of it see : https://github.com/playest/pyxpath#install

In any case you will need to install html5lib, lxml and BeautifulSoup (`pip install -r requirements.txt`).

If you only have access to python 2.6 (yes, I'm looking at you.) you can delete rename `pyxpath26.py` into `pyxpath.py` (not working apparently :().

