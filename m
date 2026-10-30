Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399850;
	b=PyiEX3VRDaWABVrgXlXoYRE9KF21qR6+qqMfZi/vMlSTHlX15uqJbvmR4R6OVHxopa1I
	 4dC1fcOEmcfr5jUHD29k3It2GamnsJWUkwVpKQ4kD1SwdETT9w3gU2IN8ume2LznsQ/De
	 NcBjNq9NsN2XcQSVzw4P7e7dedCh4036QKPYmR//5A4dXSG5o//cw3l2+GVsCgrvmJqZ5
	 htQRmC3c+aYtIJMRKWOEXYZDOQq64l6R0OtbInkOoqRUqc8T5jUSy7AJTKLItsLC34HzK
	 HEZELD5EWzz3Cf+X/InFpnjVPGWXlcGR9LlBvfkbENJKwdLXTIKuapYnlKGVPen5puQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bn9sP7pOkBKUuF5Aq7GK16TVx6Ldega12jAxTTo8a7Q=;
	b=IU7m9m8qeqZhmrsofyDfDp96+hwUMqhCUS/+fqjwms+IoXEpmevcxCf88zwHHcjG+ghG
	 Rr5DBUBR7bkh7MZ5cb9wAw0tqFH0Pc2RPpOUf+dUUzMiUUhlUj7+TnFpJPQaGdH8llSrA
	 Ey2rWg2RiH1cTEinULOBuqPe0X7UTbKcJrBrOW2wYhaTHm8yqM+g3xmkPQDhnIfPvgvrk
	 Ro1+J2PMVKc7/M+F2JJ5w++rTHYauRptL0gLpeOJVj8Z9dyQtW9CqIXmJSeyS4eYHzdsL
	 k6EiM/4TSA/suR8h/rG05VHa8iVoYmOJbYujzfWP2JVDMO2/miu0y6FbClWaeedzHGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pifx0fcG;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6964860A2615
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 22:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6964860A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pifx0fcG
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e0d1da913so925049f8f.1
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399843; x=1794004643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bn9sP7pOkBKUuF5Aq7GK16TVx6Ldega12jAxTTo8a7Q=;
        b=Pifx0fcGwSiAi84R/0GyOiDP/sPeKP90ZZvgVbVXOHsH2qGKD3XFyMbA174DfwERc9
         mG7RpOYhEBdiVa5MQwQ2Fme1LYeS+0lcFcOUFqtQpDpOYCbA7vCLiaioq+aSMxVYgozA
         rzPrC/wQHbzD+V5Cp4+6VP4QjFzLgAMclAXOYTOfc6wxUVIP1UfPLNDGVVgkv1Ubg97j
         KAnY2zewv1DCOTO6++QBv/5OWrFzyqKCWx/mzTjVjMBZ3iwvYKTUtg6Kn1BYIcn+OxYg
         9ewL3rsL+yLP/jmv2l3u23dQMWIrylSv2IiLB4ZboKEB340ga9xp7o/cgDHDPTkxy5mK
         CDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399843; x=1794004643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bn9sP7pOkBKUuF5Aq7GK16TVx6Ldega12jAxTTo8a7Q=;
        b=kU97ykSPSv/zCT5Cc4pUMPLhqa/zXBX3VUtVwIVBTSiDhEXU/F4rNFo0fNwG6rS80/
         MjAbKoSt6r6RTabNJDGQStUmhj7QXxWJCn6L2iufkRYDTyPbr4TSsMAyDzRavgz/gUdh
         5rjpTlXw/xkVrE6Z8T979lGqhyTCOofgvT2dEONDDXq1xzPV3OVmiEBMGNeTFqIG+r8h
         LJGYf85Agdjb/PhmI+ymh4caF5D6UWSPM+ntxVHU0hcfZW0nA/5TA0+x2JEMMPPKOH+P
         JjpFFVdHqwlCb9M1dy4Xwz2ESc6QQO4qEkxZ0cFI/s32nJh73jDo940/rQ/bMh2MeWcE
         S7lw==
X-Forwarded-Encrypted: i=1; AKwUvBzE8GOL9WeAVn/ebB89tgKf3wdw6KS0EnMvzDirTRBHB/TTQjdZYMPWCQura10MW8h1FOpSgDGzP1gW@vger.kernel.org
X-Gm-Message-State: AFq9FYIOp1TDZFr7gRzfBiLIA08KCz/glJNqkOsGyoIhSxZBv73+rvXr
	fZfGUhbde9cKY58BrSsIU0wCqKoeOV1mcMDWAIGnyrXtTIdQYEhzFDvB
X-Gm-Gg: AYBFou02FbNqf+YRBgaXSC49D6LdID3TY9s/pNUtvkIATaxoLzIjkOgPio2SqWOxA7F
	dTlOMmOTE/rygwa2n1RC1h7t+3Jeh+oPkqqV2LkwyaPILpIyJL2ZMoMS9XhSwpbCgBm82us7818
	erLidcmN13obLlcAyAvTJVQiG8Bo82IqVvmNgh/XE0WWbzpXYyMO3VAwkblF7HnHRP7IQDngOtD
	R//nQsWjjn7lcbpqaQ4NmXV7sNsZ3pUKQwFLWN3Qi70UdMhSa9tnjDan+aydpuqaS+YqXIeBLQz
	0i62+itWEw3byoihFDYgozjoWISZYCvYSTIMb5L3FNK2t7ggLsJc1REzhx95KG+GID5VA8r65zK
	YzL2/bypOJ8K+5Ac+Sim/3FBgw0kyeJGQEgd0QPcGJ4RTrRpCywhE499JapYP874QHF1+n5X7bz
	oln9Qi8pYvoyL/5dbK03XA0x3oEF9pWPTpPQ3O3FaL0PmZWK/VgRTbKoFpcsIQNShQx6rIne6eQ
	dM81/yJYp9G9VsoBbLRKgycWukpdb9WyhnsTeh93vj9M3V91XuZ7WGRLXAMtFdbBs4AMak4wZ0b
	ujx8+Rs82kWhO3fEe1OFGVKvwLHz
X-Received: by 2002:a05:6000:1146:b0:48e:d40:a87c with SMTP id ffacd0b85a97d-48e64bba760mr13304359f8f.16.1793399842774;
        Fri, 30 Oct 2026 15:37:22 -0700 (PDT)
Received: from m2.. ([37.142.145.227])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm5457300f8f.45.2026.10.30.15.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:37:22 -0700 (PDT)
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
Subject: [PATCH v2 12/15] HID: ft260: i2c: abort in-flight transfers with STOP before reset
Date: Sat, 31 Oct 2026 00:36:34 +0200
Message-ID: <20261030223637.86907-13-michael.zaidman@gmail.com>
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

A transfer that ends without STOP leaves the FT260 I2C controller
with BUS_BUSY set. I2C reset (AN_394 section 4.4.15) restarts the
master but, with the driver still bound, status stays 0x60
(CTRL_IDLE | BUS_BUSY) even when SCL and SDA are pulled up. The
next START then fails with 0x72 (arbitration lost + error) and
further resets do not recover; only a USB replug did.

Add ft260_i2c_abort(): a STOP-only write (flag 0x04, zero payload)
then FT260_SET_I2C_RESET. Use it wherever the host tears down an
open transaction:

  - read wait timeout
  - read status check failure after the HID report arrived
  - write status poll failure after the report was sent
  - SMBus block read with an invalid count (count phase has no STOP)

Leave ft260_i2c_reset() alone for HID output failure (the request
may never have reached the controller), sysfs i2c_reset, and probe.

Tested on a UMFT260EV1A with a 24LC512 at 0x51. Five 1 ms read
timeouts each followed by STOP+reset left bus_status 0x20; raising
the timeout to 25 ms on the same loaded module then read 16 bytes
successfully.

This matters more with the 25/75 ms completion timeout from
"HID: ft260: i2c: reduce driver module loading time", which makes
read timeouts more likely than mainline's 5000 ms wait.

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 43 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 923ce6ee9dcf..50f68790c04d 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -549,6 +549,33 @@ static int ft260_i2c_reset(struct hid_device *hdev)
 	return ret;
 }
 
+static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
+				   size_t len);
+
+/*
+ * STOP with no START and no payload. Used by ft260_i2c_abort() when
+ * tearing down an in-flight transfer: I2C reset alone can leave
+ * BUS_BUSY set even when SCL/SDA are idle, and the next START then
+ * fails with arbitration lost.
+ */
+static int ft260_i2c_stop(struct hid_device *hdev, u8 addr)
+{
+	u8 buf[4] = {
+		FT260_I2C_REPORT_MIN,
+		addr,
+		FT260_FLAG_STOP,
+		0,
+	};
+
+	return ft260_hid_output_report(hdev, buf, sizeof(buf));
+}
+
+static int ft260_i2c_abort(struct hid_device *hdev, u8 addr)
+{
+	ft260_i2c_stop(hdev, addr);
+	return ft260_i2c_reset(hdev);
+}
+
 static int ft260_xfer_status(struct ft260_device *dev, u8 bus_busy)
 {
 	struct hid_device *hdev = dev->hdev;
@@ -618,7 +645,8 @@ static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
 }
 
 static int ft260_hid_output_report_check_status(struct ft260_device *dev,
-						u8 *data, int len, u8 bus_busy)
+						u8 *data, int len, u8 addr,
+						u8 bus_busy)
 {
 	int ret, usec, try = 100;
 	struct hid_device *hdev = dev->hdev;
@@ -647,7 +675,7 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 	if (ret == 0)
 		return 0;
 
-	ft260_i2c_reset(hdev);
+	ft260_i2c_abort(hdev, addr);
 	return -EIO;
 }
 
@@ -686,7 +714,8 @@ static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
 			  rep->flag, data[0]);
 
 		ret = ft260_hid_output_report_check_status(dev, (u8 *)rep,
-							   wr_len + 4, bus_busy);
+							   wr_len + 4, addr,
+							   bus_busy);
 		if (ret < 0) {
 			ft260_dbg("failed with %d\n", ret);
 			return ret;
@@ -727,7 +756,7 @@ static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
 	ft260_dbg("rep %#02x addr %#02x cmd %#02x datlen %d replen %d\n",
 		  rep->report, addr, cmd, rep->length, len);
 
-	ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len,
+	ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len, addr,
 						   (flag & FT260_FLAG_STOP) ?
 						   FT260_I2C_STATUS_BUS_BUSY : 0);
 	if (ret < 0)
@@ -795,7 +824,7 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 		timeout_jiffies = msecs_to_jiffies(timeout);
 		if (!wait_for_completion_timeout(&dev->wait, timeout_jiffies)) {
 			ret = -ETIMEDOUT;
-			ft260_i2c_reset(hdev);
+			ft260_i2c_abort(hdev, addr);
 			goto ft260_i2c_read_exit;
 		}
 
@@ -809,7 +838,7 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 		ret = ft260_xfer_status(dev, bus_busy);
 		if (ret < 0) {
 			ret = -EIO;
-			ft260_i2c_reset(hdev);
+			ft260_i2c_abort(hdev, addr);
 			goto ft260_i2c_read_exit;
 		}
 
@@ -993,7 +1022,7 @@ static int ft260_smbus_xfer(struct i2c_adapter *adapter, u16 addr, u16 flags,
 				hid_warn(hdev,
 					 "smbus block read: invalid count %u from slave 0x%02x\n",
 					 count, addr);
-				ft260_i2c_reset(hdev);
+				ft260_i2c_abort(hdev, addr);
 				ret = -EPROTO;
 				goto smbus_exit;
 			}
-- 
2.43.0

