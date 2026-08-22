Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE8C38550C
	for <linux-gpio@vger.kernel.org>; Sat, 22 Aug 2026 21:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787434856; cv=none; b=RcbIrbYjH+DnVIDPF7nC4a+Ut5dmS4Qs2vo7HlA91ty1vI9Dz4ezoFXYovUV48Bk4Ow8iu82Xp+xYUou24zCOolWnqDjGaGK0lh7Wwwp1WOPq4urZok0EKMGVpxLletBi8CysaILj5yVLnpHZ1yTlYf571ygmYizkTnn73uHkR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787434856; c=relaxed/simple;
	bh=+tTBPf/ITWlpNCLZqiExxTpUAgaWoqxWpXFOOAp5x4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UIOUtEzCdfLgQbD0cLf4rys9lKfYS6TpYS2snpHs96KxWlgMXcw/jb9ICrNvr/bQ4g1JQcdDZN1jZQ+pzWC25s7U8R676s89qMooX3tmi0dMNSanuqovrnteFRNwx96co30csJBjzLrUw+VBi9im/28hlBnVqfLCz9o/5ImEC34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hu5x/Oxa; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hu5x/Oxa"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1670dad7a8so388887466b.3
        for <linux-gpio@vger.kernel.org>; Sat, 22 Aug 2026 14:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787434848; x=1788039648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10Eq5R/N2bfHPdqI9SBKLnnx+VXtAYQbeV+dq9RoJTo=;
        b=hu5x/Oxa/d3y6zWFCg3G6PNcMQX82Q+drWOWuByIgA6VhI6ZegzD5MUAvNMyarunZf
         bKgIYjg7agqc87krmzC8O3kNHWpnB311UfyWnPZNvvNtzWyXNojfgq17hmPsjWocUinJ
         Dh2Abt3ZgWqZj8rbRQgM04Gu8L0VFlzDdfBo0rQBTJ+2BpM2zo/3EL1lDaKaWrcdPU7/
         gX7cRsLrSk0CoVSTepl7ZwwBr/LxxNCZFhGguErMZRgBYDSsMilwOnKk0fBuIs4W5Whq
         apmrT7q4J2N7Bwi22UqoFJc4Mv6FqjEB5dTVblDowuh/+df0CDv/AAB5ikAS+k5gwpR+
         ql1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787434848; x=1788039648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=10Eq5R/N2bfHPdqI9SBKLnnx+VXtAYQbeV+dq9RoJTo=;
        b=iupyBCyzdHPOE2aZwGBDXJpjs1972ikGKpnd14kR6M63RgkrCwfPjrPYKVwIyw6TE+
         QDPdQ2wyMfVqtT6xFGrK7LcUV4ipA2wAGkIEEXEo9tQbSr+fu9qzyNY8RME2+PYj5ulS
         mOMnADUeKCGYHO1ZAq4NWwS76TI/W0ZmqeGr2QOU+TmuvLaUP50CEldtCqzAZYk4VcSm
         gk6FkOUB76QIDTmYPpF9+IHyvF1kpGb0HLGxog8dM51wLFsxD/FvBHtkwaa6y1hcmqkC
         qxaUdyrT4n8qlcE7a7SfsCTaflbbIv11EGG1aB6rzvqmb3VHOpM1+RKhdE5T51+AxyQq
         s0yQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVPpUBk2erRxGyBYT73FqTq1o5GPRrPIduuHMEp6DiU03KCcAWeJZSlfDNymvlu1MlqFME/hrQ8hEy@vger.kernel.org
X-Gm-Message-State: AFuF++kdOK/JC29RObMJt+RE8YTOiG/PFg16wZAYqgnmaoptD2WbZHRx
	dueGEYqZQx4AsZL4Fg9nZaK/SMILFw2OUdguU1zlT3ldCdfJejr0WSoG6oZUQhbw
X-Gm-Gg: AR+sD13tYlWMz+dFI0jK3P59xR3zO2ni12K5KRccFJ1inSCTD80xOAPd9BuYIkLzXxV
	ZVAMkMBj2SC+IDBDh4UZi6fP/HHICCP0JHmawp7pBCxACru9whQ/k487Hl+kxd3ngoiJgcAZXIf
	NotHB+majgfvabHIGIuQSRhGGs+LOKt1QqOAse/pmUuLbmdFvb3Fi1tDOgM8QIxqvnGMcLDMm/0
	/6IIGg6+1bPCfatHp62CVrRdcwo3gZNhLvaBpvMvq6WE0T/u6RT+5G025DwTk8BNTvTCdVbjCHB
	mZzu2aMeN+Vch5kDJtNdMS16zYyUvJBpHt6UNPLI4d1A7lANYKJ3xKzbKOGaFG+5kZcvHFz7DsQ
	4UaXqQxYFYBssZXtM+xvnHJNcrmRXAfmUypheHANYafaCAYAvTxcmnvC6zbUUKFV3AQ7fluI1DT
	1pU0cp1DtKAX2TdB+QaTbuWPDnWZMjR2hghNnvJudC1c0FJjIgT98Bwylu1mTZ
X-Received: by 2002:a05:6938:a086:20b0:c20:38c2:2b7f with SMTP id a640c23a62f3a-c246a684286mr1173749266b.12.1787434847817;
        Sat, 22 Aug 2026 14:40:47 -0700 (PDT)
Received: from m2.. ([37.142.151.124])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c24966f99basm466778466b.37.2026.08.22.14.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 14:40:47 -0700 (PDT)
From: Michael Zaidman <michael.zaidman@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Germain Hebert <germain.hebert@ca.abb.com>,
	Rio Liu <rio@r26.me>,
	Bruno Giacomazzi <brunoceg1@gmail.com>,
	Christina Quast <contact@christina-quast.de>,
	linux-input@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zaidman <michael.zaidman@gmail.com>,
	Chris Keeser <chriskeeser@meta.com>
Subject: [PATCH 11/13] HID: ft260: i2c: fix large write transaction failure
Date: Sun, 23 Aug 2026 00:39:39 +0300
Message-ID: <20260822213941.98882-12-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260822213941.98882-1-michael.zaidman@gmail.com>
References: <20260822213941.98882-1-michael.zaidman@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a regression from commit 5afac727defa ("HID: ft260: missed NACK
from busy device"), which waited for bus-idle after every HID write
report except when the report flag was exactly FT260_FLAG_START.

Multi-report I2C writes keep the bus busy between chunks for atomicity.
Treating those middle reports like a final STOP caused ft260_xfer_status()
to spin on -EAGAIN after the second HID report and fail large writes.
Write-then-read combined transfers still worked.

Pass the bus-busy check policy from the caller: ft260_i2c_write() and
ft260_smbus_write() wait for idle only when the report they send carries
STOP; intermediate chunks and the command phase of a combined transfer
do not.

The SMBus side matters for register reads. The command phase is written
with FT260_FLAG_START and no STOP, because a repeated START read follows
and the controller deliberately keeps the bus busy to keep the
transaction atomic. Checking the busy bit there makes
ft260_xfer_status() return -EAGAIN on every retry and the command write
fail with -EIO, which breaks probing of clients that read registers:

  ads1x19 6-0040: Failed to read config register: -5
  leds-pca963x: probe of 6-0008 failed with error -5

Fixes: 5afac727defa ("HID: ft260: missed NACK from busy device")
Reported-by: Chris Keeser <chriskeeser@meta.com>
Closes: https://github.com/MichaelZaidman/hid-ft260/issues/35
Tested-by: Chris Keeser <chriskeeser@meta.com>
Reported-by: Bruno Giacomazzi <brunoceg1@gmail.com>
Closes: https://github.com/MichaelZaidman/hid-ft260/issues/42
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index a2f4b6e5a16b..36687c086b40 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -566,9 +566,14 @@ static int ft260_xfer_status(struct ft260_device *dev, u8 bus_busy)
 	}
 
 	dev->clock = le16_to_cpu(report.clock);
-	ft260_dbg("bus_status %#02x, clock %u\n", report.bus_status,
-		  dev->clock);
+	ft260_dbg("bus_status %#02x, clock %u, bus_busy %#02x\n",
+		  report.bus_status, dev->clock, bus_busy);
 
+	/*
+	 * Do not check the busy bit for combined transactions
+	 * since the controller keeps the bus busy between writing
+	 * and reading IOs to ensure an atomic operation.
+	 */
 	if (report.bus_status & (FT260_I2C_STATUS_CTRL_BUSY | bus_busy))
 		return -EAGAIN;
 
@@ -602,13 +607,10 @@ static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
 }
 
 static int ft260_hid_output_report_check_status(struct ft260_device *dev,
-						u8 *data, int len)
+						u8 *data, int len, u8 bus_busy)
 {
-	u8 bus_busy;
 	int ret, usec, try = 100;
 	struct hid_device *hdev = dev->hdev;
-	struct ft260_i2c_write_request_report *rep =
-		(struct ft260_i2c_write_request_report *)data;
 
 	ret = ft260_hid_output_report(hdev, data, len);
 	if (ret < 0) {
@@ -625,16 +627,6 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 		ft260_dbg("wait %d usec, len %d\n", usec, len);
 	}
 
-	/*
-	 * Do not check the busy bit for combined transactions
-	 * since the controller keeps the bus busy between writing
-	 * and reading IOs to ensure an atomic operation.
-	 */
-	if (rep->flag == FT260_FLAG_START)
-		bus_busy = 0;
-	else
-		bus_busy = FT260_I2C_STATUS_BUS_BUSY;
-
 	do {
 		ret = ft260_xfer_status(dev, bus_busy);
 		if (ret != -EAGAIN)
@@ -651,6 +643,7 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 			   int len, u8 flag)
 {
+	u8 bus_busy = 0;
 	int ret, wr_len, idx = 0;
 	struct ft260_i2c_write_request_report *rep =
 		(struct ft260_i2c_write_request_report *)dev->i2c_wr_buf;
@@ -663,8 +656,10 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 	do {
 		if (len <= FT260_WR_I2C_DATA_MAX) {
 			wr_len = len;
-			if (flag == FT260_FLAG_START_STOP)
+			if (flag == FT260_FLAG_START_STOP) {
 				rep->flag |= FT260_FLAG_STOP;
+				bus_busy = FT260_I2C_STATUS_BUS_BUSY;
+			}
 		} else {
 			wr_len = FT260_WR_I2C_DATA_MAX;
 		}
@@ -680,7 +675,7 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 			  rep->flag, data[0]);
 
 		ret = ft260_hid_output_report_check_status(dev, (u8 *)rep,
-							   wr_len + 4);
+							   wr_len + 4, bus_busy);
 		if (ret < 0) {
 			ft260_dbg("%s: failed with %d\n", __func__, ret);
 			return ret;
@@ -721,7 +716,9 @@ static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 	ft260_dbg("rep %#02x addr %#02x cmd %#02x datlen %d replen %d\n",
 		  rep->report, addr, cmd, rep->length, len);
 
-	ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len);
+	ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len,
+						   (flag & FT260_FLAG_STOP) ?
+						   FT260_I2C_STATUS_BUS_BUSY : 0);
 	if (ret < 0)
 		ft260_dbg("%s: failed with %d\n", __func__, ret);
 
-- 
2.43.0

