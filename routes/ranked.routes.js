const { Router } = require('express');

const router = Router();

router.get('/', (req, res) =>{
    res.send('ranked de profes');
})

module.exports = router;
