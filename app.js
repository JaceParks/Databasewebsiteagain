/*
    SETUP
*/

// Express
var express = require('express');
var app = express();
PORT = 4268;

// Database
var db = require('./database/db-connector')


var exphbs = require('express-handlebars');     // Import express-handlebars
const { query } = require('express');
app.engine('.hbs', exphbs({                     // Create an instance of the handlebars engine to process templates
    extname: ".hbs"
}));
app.set('view engine', '.hbs');                 // Tell express to use the handlebars engine whenever it encounters a *.hbs file.
app.use(express.static(__dirname + '/public'));
                 
/*
    ROUTES
*/

app.get('/', function(req, res)
    {
        let query1 = "SELECT * FROM bsg_people;";               // Define our query

        db.pool.query(query1, function(error, rows, fields){    // Execute the query

            res.render('index', {data: rows});                  // Render the index.hbs file, and also send the renderer
        })                                                      // an object where 'data' is equal to the 'rows' we
    });                                                         // received back from the query

    app.get('/customers', function(req, res)
    {
        let query2 = "SELECT * FROM customers;";               // Define our query

        db.pool.query(query2, function(error, rows, fields){    // Execute the query

            res.render('entities/customers', {data: rows});                  // Render the index.hbs file, and also send the renderer
        })                                                      // an object where 'data' is equal to the 'rows' we
    });                                                         // received back from the query


    app.get('/items', function(req, res)
    {
        let query2 = "SELECT * FROM items;";               // Define our query

        db.pool.query(query2, function(error, rows, fields){    // Execute the query

            res.render('entities/items', {data: rows});                  // Render the index.hbs file, and also send the renderer
        })                                                      // an object where 'data' is equal to the 'rows' we
    });                                                         // received back from the query 

    app.get('/stores', function(req, res)
    {
        let query2 = "SELECT * FROM stores;";               // Define our query

        db.pool.query(query2, function(error, rows, fields){    // Execute the query

            res.render('entities/stores', {data: rows});                  // Render the index.hbs file, and also send the renderer
        })                                                      // an object where 'data' is equal to the 'rows' we
    });                                                         // received back from the query 

    app.get('/payments', function(req, res)
    {
        let query2 = "SELECT * FROM payments;";               // Define our query

        db.pool.query(query2, function(error, rows, fields){    // Execute the query

            res.render('entities/payments', {data: rows});                  // Render the index.hbs file, and also send the renderer
        })                                                      // an object where 'data' is equal to the 'rows' we
    });                                                         // received back from the query 

    app.get('/order_details', function(req, res)
    {
        let query2 = "SELECT * FROM order_details;";               // Define our query

        db.pool.query(query2, function(error, rows, fields){    // Execute the query

            res.render('entities/order_details', {data: rows});                  // Render the index.hbs file, and also send the renderer
        })                                                      // an object where 'data' is equal to the 'rows' we
    });                                                         // received back from the query 
    

    
                       

/*
    LISTENER
*/
app.listen(PORT, function(){
    console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
});
