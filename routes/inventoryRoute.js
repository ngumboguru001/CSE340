const express = require("express")
const router = new express.Router()

const invController = require("../controllers/invController")

// Vehicle detail route
router.get("/detail/:inv_id", invController.buildVehicleDetail)

// Intentional error route
router.get("/error", (req, res, next) => {
  throw new Error("Intentional 500 error")
})

module.exports = router