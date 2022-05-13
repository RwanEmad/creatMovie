var counter = 1;
function add_movie() {
    counter += 1
    html = '< input type = "text" id = "movie_name" name = "movie_name ' + counter + '" >'
    var movies = document.getElementById('movie')
    movies.innerHTML += html

}