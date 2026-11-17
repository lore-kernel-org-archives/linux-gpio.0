Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945912;
	b=pEIyd95sAZ61ZnTTrzzWM4HMgEAm6jpuM42Ck4mArp0G3lgTzhqQuHWsKyRvLDY108I6
	 1D/v/HyIKize7a/rQKnlFUMjhFKmuODnaR6hB6FVCK4Qla5SC+S+Wd9jl72kh7xHzyCM0
	 tqU20sZ3w7GuC7uYtKlaYDqq2S270i8wMEIBBRfpP+VHGd1fDLK4gddabyTskTVvJVtZm
	 rRm6X4uIAzKQEs9A2Sm3kTKKFHCr7nDpUWd+SBhLRHD/BcNC9D5c2gpBebXvCcV/eMpVs
	 TO4Hy+R76TtGh7FERmkFWMjCII+3J4poJAUQZTUbEzYlWvVu7mnzvnRldKiQsxhQpjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TCa0RnoydsxVLT03DHyYOZOOaLc5gZ6BJdmvsECF/XY=;
	b=vxyDuh7CsFuj8E7nSNvJK5FhwMMVgZPSWm/gKV1Z7aUmFA6Mh8P1TBx3LKiHZK+Embrj
	 kvS4mTudTlh+wX4h4B+PNKD2aEqF+xAhKcUIL+4Ag0qjZT5htHGgx8UdsTLjZDQmjxet2
	 J76N6kZlR7wGIowWaZpJF49yVEdYgIBnL0uHd0tsGtaMtN02GxS3GJC418hBY6ZxpEgqO
	 32XY0oNpUr92UHE2mvgmm4rk23lCSXt4+DY3ZSRdf8HEh5q5toLk+8F8iY7r8fh7ov9u8
	 DZHuRxD0w4qrmHfhzJ0vqyQ/wRl8UvvwuPUEwFUXumdLlFBjY1O1aRU4GAHAPFqe4cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yqUGQQpu;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AC660A383D
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 20:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73AC660A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yqUGQQpu
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso2361725e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 12:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794945911; x=1795550711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TCa0RnoydsxVLT03DHyYOZOOaLc5gZ6BJdmvsECF/XY=;
        b=yqUGQQpuFJfvOn1h42r+LKmqo0q175gJjUF3epjGfvLDK5HX26guRRThmenDneYDkC
         9sThMksbVW4v5LHTnhemmT3QBDdgqwZIcfrAzbxN5CSp4OSD7fmvjTeY/a43YIMkfDII
         RI9UGb6JQxo7G5y8LapHWcLjjoJLO8VQnk533f2krl1DgWNJVCRabC7hRQvvXrTLK/rI
         sv9/S+OybdFtEWsteLjFYS97fnZHOGu/ns78MjRvAQpB7VeeInOtZBxOkyBp2yghk1gf
         FP0Dod+NFxC4hVsgZTaC0/8aTqe4qPVfz/F88mzAWdyjzx3ltItTmMyy1tq2kgHVyIjD
         tvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794945911; x=1795550711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TCa0RnoydsxVLT03DHyYOZOOaLc5gZ6BJdmvsECF/XY=;
        b=vZAK8R24mDx//6/HtBDJ7Uqu6qxXFWm8Hp+qP7jyKUzSLDynwWpvz0OPNivC7MsTCb
         lv2v8b0TYmXVX2xaLSU1yENx2WU0QeqQCcYuBlw/h8TsXBthxmvcLQKe/yY1BoNsH9w3
         0N1B7aWkmtSEIodh3+3fEx4I1zqKPxbI7iAbbkQRTzWayB1rKnjRwvJy64BO6ED1tnsd
         UOp2MNgDAoMbWQk/w7AJai3mzj/g8YtKuAOM4dbm3X97vwS0+YkZb5Er59K32tvqSqTK
         Cnd59LcRGxMotGdvdBN2492ianVrJOV0JFKA+zoIbNacz3R6QByWGwRrHCftLec2C803
         foTg==
X-Forwarded-Encrypted: i=1; AL+hErHcy83Kkm5mFurBbOJp9F8PUcRyQJsb8lj6AHOX+aRl+Rue7KhIs5gf67j+qtQtl4HigajMcDlW6b46@vger.kernel.org
X-Gm-Message-State: APuU4Z8LidXrFZGBRDSsndfZjA1UrxzJggUu+rfxhO8Dj2VDUY0DDSDn
	UmkTxTw0D6vW3x+PbIahGTqu79nUPB/tE3npDY4oBLygi71QHGPheSL1
X-Gm-Gg: AYBFou01chJ4qLhuXIuhIzxz0cYBcMwyLTNZvI8zWCs2y2x89M3zxzLzIZCDuRos2HH
	dlESdOewcc6oSX+Yqug8/AybKUG9BsjbwruxfgTP1wughIb5kWK63N11s/B8N5rOZB3fRNNa7LT
	qmUVKNcJi80A200LM/h81BqXpwya0gXKDMkevhkzDe0p2Olqh5LC9avZJJd61tDfYDr7nR6K46k
	EqKjGLTUPgmacaG/T+Ug6ywil6oezyR4GzfQ+72foGWms2G//M+iuSwjgyE/VpKLNPo5nRrCdhe
	JW0sT3nth0qbPbFskbpy6gv32inwuF0ZsemGkxLUCGCc5PyZrNYBHjBkMFxU5yYtCDtY8qYfeNR
	d6qiZ6OkEGDMebm5jvbFptZmcCmsmcrlG030/rw923jRHvMz/Q+buu9XBnoQE0pxQ2A6W1zehyA
	hw8ZrC+A/Zam8Jqor3GfrnwaWL+ni2maGYG5ogM5Ht+31xbRLmZFPLcQmtvD+37FtV75Gh4zLpj
	SvyNBdGlGxQNLrSWQmls5a+PGl2IdEVP3zLt3Ii6If1Jw/d0npv/F7zebbt+6W5T1o+vBnE1Sol
	6OHFxdlQeLvFc5RNgZ53e/SOrn4mCK2i4Weupax9M6Uv3winuQ==
X-Received: by 2002:a05:600c:3107:b0:4a1:825a:56fd with SMTP id 5b1f17b1804b1-4bb7da47d19mr4644125e9.32.1794945910693;
        Tue, 17 Nov 2026 12:05:10 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a64b60940csm625528f8f.0.2026.11.17.12.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:05:10 -0800 (PST)
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
Subject: [PATCH v4 04/16] HID: ft260: i2c: reduce driver module loading time
Date: Tue, 17 Nov 2026 22:04:10 +0200
Message-ID: <20261117200423.19561-5-michael.zaidman@gmail.com>
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

The HWMON class I2C client drivers register the address range to scan
during the I2C master module probing. For example, the lm75 module
registers eight bus addresses scanned during the ft260 module loading.

In the case of ft260, the bus is scanned by ft260_i2c_read, but due to
an excessive read completion timeout, it took about 40 seconds for the
ft260 driver to scan the lm75 address range before exiting the probe
function.

Adjust the i2c_read timeout so it depends on the amount of data to
read, reducing the lm75 address range scan time to about 200ms.

The 25 ms per-report budget was checked on a UMFT260EV1A with a 24LC512
EEPROM by shrinking the timeout until reads began to fail: a 60-byte
read still completes at 9 ms and times out at 7 ms, against 5.4 ms of
wire time at 100 kHz, so the fixed USB, HID and scheduling overhead
costs a few milliseconds. At the chip's slowest 60 kHz clock that chunk
needs about 9 ms on the wire and a 180-byte chunk about 27 ms. Scale
the wait by 25 ms per 60-byte HID payload so a last chunk of 61..180
bytes gets 50..75 ms, not the single-report 25 ms budget.

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>

---
v2:
Fix for the issue reported by Sashiko: the timeout of the last I2C
read chunk is computed from rd_len, so a chunk of 61..180 bytes gets
50..75 ms, not 25 ms.
---
 drivers/hid/hid-ft260.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index acd92248256f..1b31b484a11b 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -17,6 +17,7 @@
 #include <linux/serial_core.h>
 #include <linux/kfifo.h>
 #include <linux/tty_flip.h>
+#include <linux/math.h>
 #include <linux/minmax.h>
 #include <linux/unaligned.h>
 #include <linux/bits.h>
@@ -49,14 +50,20 @@ MODULE_PARM_DESC(debug, "Toggle FT260 debugging messages");
  * The ft260 input report format defines 62 bytes for the data payload, but
  * when requested 62 bytes, the controller returns 60 and 2 in separate input
  * reports. To achieve better performance with the multi-report read data
- * transfers, we set the maximum read payload length to a multiple of 60.
+ * transfers, we set the maximum read payload length to a multiple of
+ * FT260_RD_ONE_REPORT_MAX.
  * With a 100 kHz I2C clock, one 240 bytes read takes about 1/27 second,
  * which is excessive; On the other hand, some higher layer drivers like at24
  * or optoe limit the i2c reads to 128 bytes. To not block other drivers out
  * of I2C for potentially troublesome amounts of time, we select the maximum
  * read payload length to be 180 bytes.
  */
+#define FT260_RD_ONE_REPORT_MAX 60
 #define FT260_RD_DATA_MAX 180
+
+/* Time in ms to wait for a single HID input report at ONE_REPORT_MAX */
+#define FT260_RD_ONE_REPORT_TO 25
+
 #define FT260_WR_I2C_DATA_MAX 60
 #define FT260_WR_UART_DATA_MAX 60
 #define FT260_GPIOCHIP "ft260_gpio"
@@ -726,8 +733,8 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 			  u16 len, u8 flag)
 {
 	u16 rd_len;
-	u16 rd_data_max = 60;
-	int timeout, ret = 0;
+	u16 rd_data_max = FT260_RD_ONE_REPORT_MAX;
+	int timeout, timeout_jiffies, ret = 0;
 	struct ft260_i2c_read_request_report rep;
 	struct hid_device *hdev = dev->hdev;
 	unsigned long irqflags;
@@ -752,6 +759,8 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 		} else {
 			rd_len = rd_data_max;
 		}
+		timeout = FT260_RD_ONE_REPORT_TO *
+			  DIV_ROUND_UP(rd_len, FT260_RD_ONE_REPORT_MAX);
 		rd_data_max = FT260_RD_DATA_MAX;
 
 		rep.report = FT260_I2C_READ_REQ;
@@ -776,8 +785,8 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 			goto ft260_i2c_read_exit;
 		}
 
-		timeout = msecs_to_jiffies(5000);
-		if (!wait_for_completion_timeout(&dev->wait, timeout)) {
+		timeout_jiffies = msecs_to_jiffies(timeout);
+		if (!wait_for_completion_timeout(&dev->wait, timeout_jiffies)) {
 			ret = -ETIMEDOUT;
 			ft260_i2c_reset(hdev);
 			goto ft260_i2c_read_exit;
-- 
2.43.0

