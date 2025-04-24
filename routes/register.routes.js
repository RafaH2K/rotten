const { Router } = require('express');

const router = Router();

router.post('/', (req, res) =>{
    res.send('registrado')
})

module.exports = router;