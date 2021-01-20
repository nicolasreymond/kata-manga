#All
curl http://localhost:1337/api/object/api.php/manga
#NoData
curl http://localhost:1337/api/object/api.php/manga/1
#Manga 4
curl http://localhost:1337/api/object/api.php/manga/4
#Manga 7
curl http://localhost:1337/api/object/api.php/manga/7
#Manga witen by Oda
curl http://localhost:1337/api/object/api.php/findByAuthor?author=Oda
#All genre of manga 7
curl http://localhost:1337/api/object/api.php/manga/findGenre/7
