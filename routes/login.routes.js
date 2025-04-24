const { Router } = require('express');

const router = Router();

router.get('/', (req, res) =>{
    res.send('loguearte')
})


module.exports = router;