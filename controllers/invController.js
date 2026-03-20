const invModel = require("../models/inventory-model")
const utilities = require("../utilities")

async function buildVehicleDetail(req, res, next) {

  const inv_id = req.params.inv_id

  const vehicle = await invModel.getVehicleById(inv_id)

  const detail = utilities.buildVehicleDetail(vehicle)

  res.render("inventory/detail", {
    title: vehicle.inv_make + " " + vehicle.inv_model,
    detail
  })
}

module.exports = { buildVehicleDetail }