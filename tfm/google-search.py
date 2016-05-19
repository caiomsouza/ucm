import urllib
import mechanize
from bs4 import BeautifulSoup

br = mechanize.Browser()
br.set_handle_robots(False)
br.addheaders = [('User-agent','chrome')]

term = "".replace("","+")
query = "https://www.google.com/search?num=100&site=&source=hp&q="+term+"&oq="+term

htmltext = br.open(query).read()
print htmltext

soup = BeautifulSoup(htmltext)

search = BeautifulSoup.findAll('div


