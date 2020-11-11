var http = require('http')
var fs = require('fs')
var tmp = require('./tempo.js')

http.createServer(function (req, res) {

	console.log(req.method + ' ' + req.url + ' // ' + tmp.myDateTime());
	
	// mostra o indice
	if (req.url.match(/arqs$/) || req.url.match(/arqs\/$/))
	{
		fs.readFile('../site/arqindex.html', function(err, data) {
	
			res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
			res.write(data);
			res.end();
	
		});
	}

	
	else 
		// apenas existem 122 ficheiros por isso so podemos responder ate 122
		if (req.url.match(/arqs\/([1-9]|[1-9][0-9]|1[01][0-9]|12[0-2])$/))
	{
		var num = req.url.split('/')[2];

		fs.readFile('../site/arq' + num + '.html', function (err, data) {

			res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
			res.write(data);
			res.end();

		});

	}
	// pagina de resposta caso de erro
	else
	{
		res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
		error_page = ' 															\
			<!DOCTYPE html>														\
			<html>															\
				<head>														\
					<title>													\
						Something went wrong!										\
					</title>												\
				</head>														\
				<body>														\
					<h2>Error</h2>											\
					<p>Please check if you requested a valid page or if your request is correct!</p> 							\
				</body>														\
			</html> '

		res.write(error_page);
		res.end();
	}


}).listen(7777);
