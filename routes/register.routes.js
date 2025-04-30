const { Router } = require("express");

const router = Router();
const { registrarUser } = require("../controllers/register.controllers");

router.post("/", registrarUser);

module.exports = router;
