const express = require('express');
const app = express();
const { spawn } = require('child_process');
app.use(express.json());
const containerName = `live`;
app.post('/run', function (req, res, next) {
    const { youtube, livekey } = req.body;
    if (!youtube || !livekey) {
        res.json({
            error: "url not support",
        });
    }
    // const command = `docker run ${containerName} ./exec.sh ${youtube} ${livekey}`;
    const command = spawn('docker', ['run', containerName, './exec.sh', youtube, livekey]);
    command.stdout.on('data', (data) => {
        console.log(`stdout: ${data}`);
        
    });

    command.stderr.on('data', (data) => {
        console.error(`stderr: ${data}`);
    });

    command.on('close', (code) => {
        console.log(`child process exited with code ${code}`);
    });

});

app.listen(3000, function () {
    console.log("Listening in port %d", 3000);
})