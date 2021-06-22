const crypto = require('crypto');

const algorithm = 'aes128';
const secretKey = 'wer457ad92of7yna';
const iv = '5u34tcv49u34tgvh';

const encrypt = (text) => {
    const cipher = crypto.createCipheriv(algorithm, secretKey, iv);
    const encrypted = Buffer.concat([cipher.update(text), cipher.final()]);

    return encrypted.toString('hex').slice(0,16);
};


module.exports = encrypt;