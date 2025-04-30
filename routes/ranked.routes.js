const { Router } = require("express");

const router = Router();
const { ranked } = require("../controllers/ranked.controllers");

router.get("/", ranked);

module.exports = router;
