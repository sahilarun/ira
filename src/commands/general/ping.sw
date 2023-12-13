let ping = message.createdTimestamp - Date.now();
let api_ping = client.ws.ping;
let dbPing = async () => {
    const currentNano = process.hrtime();
    await (require("mongoose")).connection.db.command({ ping: 1 });
    const time = process.hrtime(currentNano);
    return Math.round((time[0] * 1e9 + time[1]) * 1e-6);
}
if (ping <= 0) ping = Date.now() - message.createdTimestamp;
message.reply({ content: `**🏓 पोंग्!** बोट् लैटेन्सी है **[${ping}मिलीसेकंड्](https://0.0.0.0/)**। एपीआई लैटेन्सी है **[${Math.round(api_ping)}मिलीसेकंड्](https://0.0.0.0/)**
डेटाबेस् लैटेन्सी है **[${await dbPing()}मिलीसेकंड्](https://0.0.0.0/)**.`});
