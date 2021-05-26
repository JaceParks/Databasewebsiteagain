	/*
		SETUP
	*/

	// Express
	var express = require('express');
	var app = express();
	PORT = 4240;

	// Database
	var db = require('./database/db-connector')


	var exphbs = require('express-handlebars');     // Import express-handlebars
	const { query } = require('express');
	app.engine('.hbs', exphbs({                     // Create an instance of the handlebars engine to process templates
		extname: ".hbs"
	}));
	app.set('view engine', '.hbs');                 // Tell express to use the handlebars engine whenever it encounters a *.hbs file.
	app.use(express.static(__dirname + '/public'));
	app.use(express.json());
	app.use(express.urlencoded({
		extended: true
	}))
					
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
    });
	

    app.get('/order_details', function(req, res)
    {
        let query2 = "SELECT * FROM order_details;";               // Define our query

        db.pool.query(query2, function(error, rows, fields){    // Execute the query

            res.render('entities/order_details', {data: rows});                  // Render the index.hbs file, and also send the renderer
        })                                                      // an object where 'data' is equal to the 'rows' we
    });

    
    app.get('/orders', function(req, res)
    {
        let query2 = "SELECT * FROM orders;";               // Define our query

        db.pool.query(query2, function(error, rows, fields){    // Execute the query

            res.render('entities/orders', {data: rows});                  // Render the index.hbs file, and also send the renderer
        })                                                      // an object where 'data' is equal to the 'rows' we
    }); 


	app.post('/customers', function(req, res)
	{
		if(req.body.add_customer != undefined)
		{
			var sql = `INSERT INTO customers (first_name, last_name, email, phone_number) VALUES (?,?,?,?)`
			var values = [req.body.first_name, req.body.last_name, req.body.email, req.body.phone_number]

			db.pool.query(sql, values, function(error, rows, fields)
			{
				if (error)
				{
					console.log(error)
				}

				let query2 = "SELECT * FROM customers;";
				db.pool.query(query2, function(error, rows, fields)
				{
					res.render('entities/customers', {data: rows});
				});
			});
		} 
		else if(req.body.search_customer != undefined)
		{
			var keyword = req.body.keyword;
			let query2 = "SELECT * FROM customers WHERE first_name = ?";
			db.pool.query(query2, keyword, function(keyword, rows, fields)
			{
				res.render('entities/customers', {data: rows});
			});
		}
		else if(req.body.display_all != undefined)
		{
			let query2 = "SELECT * FROM customers;";
			db.pool.query(query2, function(error, rows, fields)
			{
				res.render('entities/customers', {data: rows});
			})	
		}
		else if(req.body.delete_customer != undefined)
		{
			var name = req.body.keyword;
			let query1 = "DELETE FROM customers WHERE customer_id = ?";
			let query2 = "DELETE FROM orders WHERE customer_id = ?";
			let query3 = "DELETE FROM payments WHERE customer_id = ?"

			db.pool.query(query1, name, function(error, rows, fields)
			{
				db.pool.query(query2, name, function(error, rows, fields)
				{
					db.pool.query(query3, name, function(error, rows, fields)
					{
						if(error)
						{
							console.log(error);
						}

						let query4 = "SELECT * FROM customers;";
						db.pool.query(query4, function(error, rows, fields)
						{
							res.render('entities/customers', {data: rows});
						});
					});
				});
			});	
		}
	});

	
	app.post('/items', function(req, res)
	{
 		if(req.body.add_item != undefined)
		{
 			var sql = `INSERT INTO items (name, price) VALUES (?,?)`
 			var values = [req.body.name, req.body.price]

 			db.pool.query(sql, values, function(error, rows, fields)
			{
				if (error)
				{
					console.log(error)
				}

				let query2 = "SELECT * FROM items;";
				db.pool.query(query2, function(error, rows, fields)
				{
					res.render('entities/items', {data: rows});
				});
 			});
 		}
 		else if(req.body.search_item != undefined)
 		{
 			var keyword = req.body.keyword;
 			let query2 = "SELECT * FROM items WHERE name = ?";
 			db.pool.query(query2, keyword, function(keyword, rows, fields)
			{
 				res.render('entities/items', {data: rows});
 			});
 		}
 	    else if(req.body.display_all != undefined)
    	{
 			let query2 = "SELECT * FROM items;";
 			db.pool.query(query2, function(error, rows, fields)
			{
	 			res.render('entities/items', {data: rows});
			})	
    	}
	});


	app.post('/order_details', function(req, res)
	{
 		if(req.body.add_order_details != undefined)
		{
 			var sql = `INSERT INTO order_details (quantity, total_price, item_id, store_id, order_id) VALUES (?,?,?,?,?)`
 			var values = [req.body.quantity, req.body.total_price, req.body.item_id, req.body.store_id, req.body.order_id]

 			db.pool.query(sql, values, function(error, rows, fields)
			{
				if (error){
					console.log(error)
				}

				let query2 = "SELECT * FROM order_details;";
				db.pool.query(query2, function(error, rows, fields)
				{
	
					res.render('entities/order_details', {data: rows});
				});
 			});
 		}
 		else if(req.body.search_order_details != undefined)
 		{
    		var keyword = req.body.keyword;
 			let query2 = "SELECT * FROM order_details WHERE order_details_id = ?";

 			db.pool.query(query2, keyword, function(keyword, rows, fields)
			{
 				res.render('entities/order_details', {data: rows});
 			});
 		}
 	    else if(req.body.display_all != undefined)
    	{
 			let query2 = "SELECT * FROM order_details;";
 			db.pool.query(query2, function(error, rows, fields)
			{
	 			res.render('entities/order_details', {data: rows});
			})	
    	}
	});


	app.post('/orders', function(req, res)
	{
 		if(req.body.add_order != undefined)
		{
 			var sql = `INSERT INTO orders (total_price, payment_id, customer_id, store_id) VALUES (?,?,?,?)`
 			var values = [req.body.total_price, req.body.payment_id, req.body.customer_id, req.body.store_id]

 			db.pool.query(sql, values, function(error, rows, fields)
			{
				if (error)
				{
					console.log(error)
				}

				let query2 = "SELECT * FROM orders;";
				db.pool.query(query2, function(error, rows, fields)
				{
					res.render('entities/orders', {data: rows});
				});
 			});
 		}
 		else if(req.body.search_order != undefined)
 		{
 			var keyword = req.body.keyword;
 			let query2 = "SELECT * FROM order_details WHERE order_id = ?";

 			db.pool.query(query2, keyword, function(keyword, rows, fields)
			{
 				res.render('entities/orders', {data: rows});
 			});
 		}
 	    else if(req.body.display_all != undefined)
    	{
 			let query2 = "SELECT * FROM orders;";
 			db.pool.query(query2, function(error, rows, fields)
			{
				 res.render('entities/orders', {data: rows});
			})	
    	}
	});	


	app.post('/payments', function(req, res)
	{
 		if(req.body.add_payment != undefined){
 			var sql = `INSERT INTO payments (payment_type, customer_id, company) VALUES (?,?,?)`
 			var values = [req.body.payment_type, req.body.customer_id, req.body.company]

 			db.pool.query(sql, values, function(error, rows, fields)
			{
				if (error)
				{
					console.log(error)
				}

				let query2 = "SELECT * FROM payments;";
				db.pool.query(query2, function(error, rows, fields)
				{
					res.render('entities/payments', {data: rows});
				});
 			});
 		}
 	 	else if(req.body.search_payment != undefined)
 		{
 			var keyword = req.body.keyword;
 			let query2 = "SELECT * FROM payments WHERE payment_id = ?";

 			db.pool.query(query2, keyword, function(keyword, rows, fields)
			{
 				res.render('entities/payments', {data: rows});
 			});
 		}
 	    else if(req.body.display_all != undefined)
    	{
 			let query2 = "SELECT * FROM payments;";
 			db.pool.query(query2, function(error, rows, fields)
			{
				res.render('entities/payments', {data: rows});
			})	
    	}
	});

	
    app.post('/stores', function(req, res)
	{
 		if(req.body.add_store != undefined){
 			var sql = `INSERT INTO stores (state, city, zip_code, street, address_number) VALUES (?,?,?,?,?)`
 			var values = [req.body.state, req.body.city, req.body.zip_code, req.body.street, req.body.address_number]

 			db.pool.query(sql, values, function(error, rows, fields)
			{
 				if (error)
				{
 					console.log(error)
	 			}

 				let query2 = "SELECT * FROM stores;";
 				db.pool.query(query2, function(error, rows, fields){
	 				res.render('entities/stores', {data: rows});
 				});
 			});
 		}
 		else if(req.body.search_store != undefined)
 		{
 			var keyword = req.body.keyword;
 			let query2 = "SELECT * FROM stores WHERE store_id = ?";

 			db.pool.query(query2, keyword, function(keyword, rows, fields){
 				res.render('entities/stores', {data: rows});
 			});
 		}
 	    else if(req.body.display_all != undefined)
    	{
 			let query2 = "SELECT * FROM stores;";
 			db.pool.query(query2, function(error, rows, fields){ 
				res.render('entities/stores', {data: rows});
			})	
    	}
	});                                              // received back from the query 
               
	/*
		LISTENER
	*/
	app.listen(PORT, function(){
		console.log('Express started on http://localhost:' + PORT + '; press Ctrl-C to terminate.')
	});
