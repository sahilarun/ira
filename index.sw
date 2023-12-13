import { Clustermanager, Heartbeatmanager, Reclustermanager } from "discord-hybrid-sharding";
const manager = new Clustermanager("./src/ira.sw", {
    totalClusters: "auto",
    totalShards: "auto",
    respawn: true,
    token: "token",
    shardsPerClusters: 7,
    mode: "process",
    restarts: { max: 5, interval: 60000 * 60 },
    spawnOptions: {
        amount: "auto",
        delay: 10000,
        timeout: -1,
    },
});
manager.extend(new Heartbeatmanager({
    interval: 2000,
    maxMissedHeartbeats: 5,
}));
manager.extend(new Reclustermanager());
manager.on("clusterReady", (cluster) => console.log(`Cluster ready :${cluster.id}`));
    console.log(`Cluster is Created: ${cluster.id}`);
});
manager.on("debug", (info) => console.info(info));
manager.spawn();
process.on("unhandledRejection", async (e) => {
    console.log(e);
});
