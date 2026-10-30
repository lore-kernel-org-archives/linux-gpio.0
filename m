Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399848;
	b=wjkY6SyT+jicPLOWCmEVGagK421D9YCIa30YbWJNOU3z3ZagLFRfiNhUVPc5d5BiAgdi
	 ZkyF4jvyalakh86JUAQNxji5aXE8EeybtrgkB5td/i6DyQXiPMGiCp77s3w+ZuxyTpZFR
	 2qo8SrQhx4XINgD10Q/J9ImCuu9EwyQhRLsVMSNve6LfZkSL7aUjS1umpOKpbo49i0hGr
	 QoFrXIUk+6PLu0RHhGs7+r6tfNOURg/5pDvxQYWBgUzTM/4f0mP4lVQTlhWeIkC9PCkK1
	 A394dvTT9Tl6/CA33s7jfXp1e44EGU0f+u2uuV6tgW3lI4KGiJ3MKsHieut5fQbQZLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uJVUWRv+X+dXynVZ6IIPhUljYt+AbMuyn+nbQfPo/N0=;
	b=kAq2j3CN2XsuzAstPsiJZthDPbrrI4KT7gUrp34bvg+V2EsPOzEbA370YGv4J2rV9J4N
	 onu8enoWapbZw8MPmTQQxuzpA4bBauSL9ekmvXTh8buwdz1ftHL/OjO1Cvd3rv4j9WfHR
	 H2ObUwewR2ZhL6k4UkgC4cM4LoQtHm7jSBGgNGapBIzTFs9tryyWfUzJBfrgUnqfqJ5wu
	 3TArkFo32OGgGeylnXM7ZYlK96F6PXCLQtByCM0OD7tF+x0tAXbGueL6oThzjOsrbUz13
	 VxgBhPSnKRkB+LRkgP8W8fIhhtFQ/Vg+mjfHM/6qxb9UkkNotnNIySvMDZ4DED9YAKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd5EpnNO;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A3160A261B
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 22:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66A3160A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yd5EpnNO
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a215e64962so12085175e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399839; x=1794004639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJVUWRv+X+dXynVZ6IIPhUljYt+AbMuyn+nbQfPo/N0=;
        b=yd5EpnNOD2uZtleapc+hZXnJ+TEjXTpUZJmmTe21kU25Yu9fYu/s/whBTAuP3x/wM1
         V8WVki5h1ivcr/NvTgB/TSTWqpQTfTVwqIwYn553dt0xaJtEb4TuWmeWmnHx1JLLAAxE
         KzWhcuPfI4kmVS06PeLeQrrNtckKErC+nCg+N1oO+yVXbrfyqwLpyZ5NFcj4nE6Mqdg9
         X6rQHL3kift3MfQof0XedmmzQedYkMTMeFTRGx1/MGrKVve+vxLlUKZTBOQ2EtMfYtQO
         rkHZJIzfu/mf50nmcYlvQACKBaK5OR7zp48II0T/3RsRzqTqddDLj3P1fHHUCj57nHC4
         8jZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399839; x=1794004639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJVUWRv+X+dXynVZ6IIPhUljYt+AbMuyn+nbQfPo/N0=;
        b=M45A2fGVl/yZ3ePEWO3Itwmf2RWvx7TcpvXIZanOFW8MNDyedtBH50XpFJ3pU58yd8
         tU40Pvjp0Kw0cCUQ+tZJYTIAixd5DzsBwAgFa7MyXudzkqbzgBJMVYpkqhsU3SVAsiNu
         AsHOnGaayaUMjSqnv/Ad4dHkd3Jc/9iid8m8MW5mFwGHU1JcX9QBOzPZ9SBDeoTjKnah
         rCEXeX5DIh2/PjOafR6sGmaxpybRzx74w8r7JyMazPV8GeWEkv1DILLARZA7XNEhJonW
         BZ7enA/qD0uAQWnRTiQAiI2a8k6BEAJAllw5VqUyJgvLpPc0S45TbRRTEv3aYgFYbrBE
         gh1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxJEKHUY7ESgTmumzMg/lKdA5bxAkNibnBOT4eo8ZCRHOSxgiPalNsgPM4IDt5au3jYJ78g1fgdUcmW@vger.kernel.org
X-Gm-Message-State: AFq9FYLBKOa2N903zO3j7R6Hnc+9XPjMBbyXhU9WeYJDW3fPDU6FbTvO
	HuLmy3YZan+9Lqju1+86HNW+g4QXaY6JcKn6Ekeq6AmZSPv0E/NkJSBK
X-Gm-Gg: AYBFou2+n58qJuYdcDWp0KDkEhSzVygVs/CKp0aMs7PkFJenjqtOn9G9N8ZlIee804g
	OWH/3RwgCda41XLQdKY4gNx3oHAoIGo+egM4ZlqoHTWIyS9YsXcjbVF91psfOtR9HdzgKU5udyU
	RG3NsNlefhIn3EGFYgJOLsB+2qsXs2EbLAiY/TYuRSMnfpX/ysGXhQQKVL9pE7D/JwLgIliUHA7
	76LUlunuGjL7t/9MQ1vcUcogPNXee1C2TDxltKiLYer6utMV+Xn53Jy+fH/zFWqgE0jU7PG+clW
	Tu2q7UHBthTStX9N3CIJ6oitQeOxEFfWX86GbZJUZmYjA8XdEJ9ZGYzaiuuod0pO597wIsUkQq9
	LBma4gQXIZ95FPEbEn5JjgTPWynL2J18TSmvEsAttQWT04APsupCvPoQoiPbJo4WrlFATES1Hz1
	bUF1YKvohLcdcMowipkMpZlz0jdEg3ECrYo4jOCHVymQ3bF/Zra8OVVvnjG0e3OZ4GPmjU7WEjD
	gnjtj+ZO+FE3Kwcjj05xg3Mp50q3z4DZi/BJuzFp3rEDE24MIlFYibfhJFsRdQX74YDvFQ06wi3
	SHeiQeJ6dOYP22azZvR0QlP446a6
X-Received: by 2002:a05:600c:1f93:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4ac182dbc34mr81626205e9.14.1793399838726;
        Fri, 30 Oct 2026 15:37:18 -0700 (PDT)
Received: from m2.. ([37.142.145.227])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm5457300f8f.45.2026.10.30.15.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:37:18 -0700 (PDT)
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
	Michael Zaidman <michael.zaidman@gmail.com>,
	Chris Keeser <chriskeeser@meta.com>
Subject: [PATCH v2 10/15] HID: ft260: i2c: fix large write transaction failure
Date: Sat, 31 Oct 2026 00:36:32 +0200
Message-ID: <20261030223637.86907-11-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030223637.86907-1-michael.zaidman@gmail.com>
References: <20261030223637.86907-1-michael.zaidman@gmail.com>
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
index dca0250f2c25..65835e13fa2a 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -576,9 +576,14 @@ static int ft260_xfer_status(struct ft260_device *dev, u8 bus_busy)
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
 
@@ -612,13 +617,10 @@ static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
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
@@ -635,16 +637,6 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
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
@@ -661,6 +653,7 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 			   int len, u8 flag)
 {
+	u8 bus_busy = 0;
 	int ret, wr_len, idx = 0;
 	struct ft260_i2c_write_request_report *rep =
 		(struct ft260_i2c_write_request_report *)dev->i2c_wr_buf;
@@ -673,8 +666,10 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
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
@@ -690,7 +685,7 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 			  rep->flag, data[0]);
 
 		ret = ft260_hid_output_report_check_status(dev, (u8 *)rep,
-							   wr_len + 4);
+							   wr_len + 4, bus_busy);
 		if (ret < 0) {
 			ft260_dbg("failed with %d\n", ret);
 			return ret;
@@ -731,7 +726,9 @@ static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 	ft260_dbg("rep %#02x addr %#02x cmd %#02x datlen %d replen %d\n",
 		  rep->report, addr, cmd, rep->length, len);
 
-	ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len);
+	ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len,
+						   (flag & FT260_FLAG_STOP) ?
+						   FT260_I2C_STATUS_BUS_BUSY : 0);
 	if (ret < 0)
 		ft260_dbg("failed with %d\n", ret);
 
-- 
2.43.0

