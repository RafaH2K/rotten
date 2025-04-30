const { Router } = require("express");

const router = Router();
const { loguearUser } = require("../controllers/login.controllers");

router.get("/", loguearUser);

module.exports = router;
