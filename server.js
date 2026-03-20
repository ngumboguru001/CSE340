/* ******************************************
 * This server.js file is the primary file of the 
 * application. It is used to control the project.
 ******************************************/

/* ***********************
 * Require Statements
 *************************/
const express = require("express")
const expressLayouts = require("express-ejs-layouts")
require("dotenv").config()

const app = express()

const static = require("./routes/static")
const invRoute = require("./routes/inventoryRoute")


/* ***********************
 * View Engine and Templates
 *************************/
app.set("view engine", "ejs")
app.use(expressLayouts)
app.set("layout", "./layouts/layout")

/* ***********************
 * Static Files
 *************************/
app.use(express.static("public"))

/* ***********************
 * Routes
 *************************/
app.use(static)
app.use("/inv", invRoute)

/* ***********************
 * Home Route
 *************************/
app.get("/", function(req, res){
  res.render("index", { title: "Home" })
})

/* ***********************
 * Server Information
 *************************/
const port = process.env.PORT || 3000
const host = process.env.HOST || "localhost"

/* ***********************
 * Start Server
 *************************/
app.listen(port, () => {
  console.log(`Server running at ${host}:${port}`)
})