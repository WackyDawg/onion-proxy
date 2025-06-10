const onionProxy = require('./app.js');
onionProxy.startTorProxy(() => {
  onionProxy.requestThroughTor('https://api.ipify.org', (err, ip) => {
    if (err) return console.error(err);
    console.log('Your Tor IP:', ip);
  });
});