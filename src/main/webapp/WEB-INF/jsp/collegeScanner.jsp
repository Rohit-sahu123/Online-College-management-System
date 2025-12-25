<script src="https://unpkg.com/html5-qrcode@2.3.8/html5-qrcode.min.js"></script>

<div id="reader" style="width:300px;margin:auto"></div>

<script>
Html5Qrcode.getCameras().then(cameras => {

    const html5QrCode = new Html5Qrcode("reader");

    html5QrCode.start(
        { facingMode: "environment" },
        { fps: 10, qrbox: 250 },
        decodedText => {

            // 🔥 decodedText = STUDENT_ID=5
            let studentId = decodedText.split("=")[1];

            fetch("/student1/scan-attendance", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: "data=" + studentId
            })
            .then(res => res.text())
            .then(msg => {
                alert(msg);
                html5QrCode.stop();
                location.reload();
            });

        }
    );

});
</script>
