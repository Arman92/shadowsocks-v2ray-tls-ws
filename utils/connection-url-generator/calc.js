import btoa from 'btoa';

// Change these to the values in .env file on server:
const host = 'your-domain.com';
const password = 'some-strong-password';
const path = '/thepath';
const enc = 'aes-256-gcm';


const pluginExtensions = '?plugin=v2ray-plugin%3Bpath%3D%2F'+path.replace('/','')+'%3Bhost%3D' + host + '%3Btls';
const generateAccesskey = () => {
    const firstPart = btoa(`${enc.toLowerCase()}:${password}`)
    const secondPart = `${host}:443`
    const accesskey = `ss://${firstPart}@${secondPart}`
    return accesskey
};

const generateShadowrocket = () => {
    return `ss://${btoa(`${enc}:${password}@${host}:443`)}?v2ray-plugin=${btoa(JSON.stringify({
        host,
        path,
        mux: true,
        mode: 'websocket',
        tls: true,
    }))}`;
}

console.log("Your connection strings:");
console.log("Shadowrocket is the app used for iOS:");
console.log({
    androidAndWindows: generateAccesskey(password, host, '443') + pluginExtensions,
    shadowRocket: generateShadowrocket(),
});