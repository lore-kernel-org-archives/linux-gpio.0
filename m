Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945917;
	b=nAVfsMBCkU/VSvwwqbgT1nNfluDfD16g9b2ui4pB889Hh+UcpUu0SAKRrik7g1chgEtA
	 xv1uZctQd1j4O2R7sf96Mo4rbcin5qn7Trj0Lg6cf9nbcnCJxn9TZQH7cbLlYez6gFj/Y
	 JHG7omkufvPxMjp+y+rHNSXCOzgUyuN1L4b9sPpDG3nOgpxpRYmUZ3iKK5i6pKU2V3RFa
	 koR5CTlJKMK7aZGt3zsDMEu40MmiAjkchil9BO9chtbjrTULxc/mzwdXHHuL9sLSSiL3D
	 6QShZanzg/NydHGbh5T5frotU/EoYxpF9FVD5cvqgxiAwiP4jsSZ04aFCyG4AdWMKWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945917;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oQ6kVNTKtHM/GlFIwNb9GkcrSJOUH3g4l0nbt5E8WPg=;
	b=PcG+fSFnEplUS5hokWsZtkugppLBQYO6nPv0yVJmuGExHF3W/q0kvMIzbjLeyUU4EPdE
	 JFi7c0rStO447oToV90TYXEjeWVPv9LKc8fXrF+lqCTdUsApGTJuxzBoIxobsTiurZ9y6
	 34BEq4rlLkE7saSLovQo20IcKMLN3l//VKNTlIMydgtY0WMNisCSXQ9fu78xEcPm0By31
	 v8PpI8MAsIz0fRwViTyArUI+wvIv/iEfbLCnuez5S/unMVmvga3TxOZ4V1DIpXovxlXjS
	 c8QJ595/Qs7edUgTErZlnSybGvyWhhgEKHCGwxtA36yFi2pieYA3oaSgTODH+9MHswQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SUyVBPRK;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C444F60A6F5F
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 20:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C444F60A6F5F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SUyVBPRK
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so36789f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 12:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794945915; x=1795550715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oQ6kVNTKtHM/GlFIwNb9GkcrSJOUH3g4l0nbt5E8WPg=;
        b=SUyVBPRKvlIPfyyfb6ETZn6Oj8b+gAXpZ80SFzVZXHh1crDmixmj41Va2EnEXc8FOX
         9f98bIqfQM1Xa0Nksu+TZxCa+HmDaHxPppk8Y9ZM+BDDT1f5poSw3b/+kgZ/mIS1o2UV
         sWTKIA/hzmTGVe9vcRqtxbiZuKWqmGihhxzWNTxa/SicsmYe9eZeE++3LR7L+cKywBRo
         QiDIJxvRqORTekCjEsTfNBMPXP3ak0NIm3LBwDpSSB/pdziXocUb45WHMc4uJySF03eJ
         dKZuF+UFj2Cd5sKkR+fLI0RjiI74dwW62oojhyG9zJmBaNMS2UxMqjwXTBQQyD3YovYj
         0gDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794945915; x=1795550715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQ6kVNTKtHM/GlFIwNb9GkcrSJOUH3g4l0nbt5E8WPg=;
        b=Qb8CtI2xsZVUrqzxJPMNsMWTQ2DJLVMKwfPVV43uwdaiDAapg2LvIbIwUnefGCk2/E
         yT9UIeGbi7XM75LipSElf6vHm7T8FmqGTtL5ISOFavRbUg0MczzTzsqwV2M5cexFkuxO
         zmazXsd8h7wJxK7lSkvCi1p9e4DUZV6etK9QKQZx7xLwjJbz0V4BNM3n+v/NZEyDnxKU
         RcbR/XQ6a3qLV35ZL2eki0LEDmMglvOn0vXfitEVISSFOvAp5mxi02U5NzitSfayMkRS
         Obw0St/Bku48EJS/HbyjB+ysJxqN3yPW+No6LXSYk9mUtj5CopdGZWkwXcafp3PYhR/f
         iB6w==
X-Forwarded-Encrypted: i=1; AL+hErF7rUVAQ+pWHqYERFUUPkZHLRTdoJnGynxAMeIgzxwiKJGlQsn3qYLMEbjO0d8pcXortwmEaNAr/Eaw@vger.kernel.org
X-Gm-Message-State: APuU4Z+wnDlb95EgP8C9D5xGqvFf+uAcwh2nk1dVzNZlllWgJDqjAsfZ
	Fe+uRQOs6NNEUGUMWx57w8ufjOsFm7yfACPwzRtaJ1pvNBf3IKmwG/rG
X-Gm-Gg: AZFdTZfNyI0xmZSWfsPiNfPBawW+xMSVT3L+Gj/r0Mxg3JeCW5+qr7Ej/zLACk5WjUp
	URRfYG82ee7FFibWcNYrlqFvrgy93Q+96lWvBAJV8Pqw+AXeaSrzWKjG8FzTVB4yFMl88bckDsH
	D3N+vYjYtIxAqiH1mA+4dwieI65F9kyazVrbak4xlDX0/mX+SQ09Dek7P3CGjK/VoiCA3shH+qj
	BjvjryWRjQevcpKq69E+6jaWIgzX7HvyTpYwJBBJRZiCj30SvrSIRtyJZWjSY6VZmc53rxhWmjX
	G+zwMpFt1BLuE3ZauKHmP9KWUccHFYqk848srnqcvUd3xqoPE2t1dceUguyLHZ8BRBsXj2PtGZe
	RDNWE4Gf7t2S0QizfNOX49+hL9/OCnQW6eAqciFQlhGIse/N3L0692B+m60Jlfgxkz6PV0aS2z3
	QfQttXPGshgsybCOAiZHhhDXXPRyPJ+xH/HYV42Q5uVt8LQuW6phq3EsoTx3deZPS5yii32lXAG
	YmMyaJNmR+sGSFjbRNEM2Cqhx0BjF4vSn3kIKOqAu0XLohqlt1R7F21JIx91s4YcMWvT3pwMKWV
	9gcZwa32UpDINHSjFehqQGNsYCg6
X-Received: by 2002:a05:6000:4555:b0:4a4:7328:21f1 with SMTP id ffacd0b85a97d-4a63ac6be9fmr782897f8f.24.1794945915115;
        Tue, 17 Nov 2026 12:05:15 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a64b60940csm625528f8f.0.2026.11.17.12.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:05:14 -0800 (PST)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Raman Varabets <kernel-linux-20260610-80b7ab08@raman.v1.sg>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Christina Quast <contact@christina-quast.de>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	linux-input@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v4 06/16] HID: ft260: i2c: reduce bus-error message severity
Date: Tue, 17 Nov 2026 22:04:12 +0200
Message-ID: <20261117200423.19561-7-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117200423.19561-1-michael.zaidman@gmail.com>
References: <20261117200423.19561-1-michael.zaidman@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver logged errors when the FT260 reported an I2C bus error or
when ft260_i2c_write / ft260_smbus_write failed after such a status.
That was meant to flag unexpected failures, but bus scans (i2cdetect,
HWMON discovery, transceiver monitoring, and similar) hit missing
devices routinely and should not fill dmesg with lines such as:

  ft260 0003:0403:6030.0001: ft260_i2c_write: failed with -5

Keep returning -EIO, but print those via ft260_dbg. Still use hid_err in
ft260_hid_output_report_check_status for actual HID/USB transport
failures, which are genuine errors.

Drop the extra __func__ from the write-path ft260_dbg calls; the helper
already prints the function name.

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>

---
v2:
Fix for the issue reported by Sashiko: the write-path messages
printed the function name twice, because ft260_dbg() already prints it.
---
 drivers/hid/hid-ft260.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index bdd55b35df9a..f722ef0ddf06 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -579,7 +579,7 @@ static int ft260_xfer_status(struct ft260_device *dev, u8 bus_busy)
 	 * to 1, bit 1 is also set to 1.
 	 */
 	if (report.bus_status & FT260_I2C_STATUS_ERROR) {
-		hid_err(hdev, "i2c bus error: %#02x\n", report.bus_status);
+		ft260_dbg("i2c bus error: %#02x\n", report.bus_status);
 		return -EIO;
 	}
 
@@ -613,6 +613,7 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 
 	ret = ft260_hid_output_report(hdev, data, len);
 	if (ret < 0) {
+		hid_err(hdev, "%s: failed with %d\n", __func__, ret);
 		ft260_i2c_reset(hdev);
 		return ret;
 	}
@@ -652,7 +653,6 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 			   int len, u8 flag)
 {
 	int ret, wr_len, idx = 0;
-	struct hid_device *hdev = dev->hdev;
 	struct ft260_i2c_write_request_report *rep =
 		(struct ft260_i2c_write_request_report *)dev->i2c_wr_buf;
 
@@ -683,7 +683,7 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 		ret = ft260_hid_output_report_check_status(dev, (u8 *)rep,
 							   wr_len + 4);
 		if (ret < 0) {
-			hid_err(hdev, "%s: failed with %d\n", __func__, ret);
+			ft260_dbg("failed with %d\n", ret);
 			return ret;
 		}
 
@@ -699,7 +699,7 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 			     u8 *data, u8 data_len, u8 flag)
 {
-	int ret = 0;
+	int ret;
 	int len = 4;
 
 	struct ft260_i2c_write_request_report *rep =
@@ -724,7 +724,7 @@ static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 
 	ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len);
 	if (ret < 0)
-		hid_err(dev->hdev, "%s: failed with %d\n", __func__, ret);
+		ft260_dbg("failed with %d\n", ret);
 
 	return ret;
 }
-- 
2.43.0

