Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399856;
	b=n9c3ScIyuVT+4ZoyQnvGP+eYTz2455C6EwoKJpDtLeLp79PcrrQ8pdxHADhFEfleCkdH
	 wTPIjg00wDnZ/3B2iuQT0XfMywPWFFGqW4d0KspLHbQ3BLxMOdAgIslNM+Tet8wcCg2dD
	 ArHaTKSDV7stpqdbGN1a2t+Tv2s7opGNOedS2Gisy3C8eJh2oCV1uXOMj9tgBY7QJOQql
	 tx0rzyju80y2umbIYC5GqABTgDqpCj/jzbnOhcv0PdLmVyvNb73g2SQC6TBq7k6E8yFBi
	 m62lgAB4cUkLJxtQpV35HvwVmpRaoVubcKTAHaLBK0OQiDIhwDA/GmFXDv91gkX5+dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g7GpuRiIRj4DVraCupDVTmqjMX8L6GHmgvZBL/BLQ9A=;
	b=pplR9FLVJEnPIH+oQPGag81mOAKnHSk7pmOpsyqbGHBf3hSblU4r2EbJxLY06oouDCXF
	 SeSAERO+H21AFgaouk/b03eouemaQl3GozPcvNdFrQddcF6p4xa7kEqQ2nckhH3sAjPYV
	 FXEOr5XByY3ycHUXkIJkRJTb3brF/xaJvUvBeIv7rgj5kL5KUrBarRlY8MtYnaWMnWku2
	 7C+BmZOGNReUT6HLopBt3BBlkZCmkdkL4zSwtjdu7ZmQEpgEgCZ3YppoC251YrXTyP8WF
	 Wmu40A8todnITvo8P8/73UkfpTcLwkTdHSIKC//dDbKc6ECjR98ANaTu4M4yKTB8slA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OYKeXa1g;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6705960A5BE3
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 22:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6705960A5BE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OYKeXa1g
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so12648335e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793399845; x=1794004645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g7GpuRiIRj4DVraCupDVTmqjMX8L6GHmgvZBL/BLQ9A=;
        b=OYKeXa1gGPpQxA3whFTS6ivltypONZOdWmQKnRj627TD9pLLQ8F0nTgl9FoIql/39s
         GBiio2Aiwf1kPRgC+blk4DbO4HhB04qKQXm33vDOk5t7m/XuZgoccgHhYg42XWS1jjTa
         vKANcpKh4OEcT6dV6E85g5LEf8xK4ZgeX1b6XaHR15Q0pM5+BPhFbEPbUDM9Vrf6B8Y1
         pDrUJer0qbtMGS/psn2AaUGrMnNjI9+Xc1xVPkHcPRP/DaUPtWOkWJajWzV+gykvJzm2
         0pV8RfpvclPuz8d1lgxU/Dp9Tx1H2La6L27qsNjfjJzTp1v3v7kM8mIgdjctfbQasge7
         LW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793399845; x=1794004645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g7GpuRiIRj4DVraCupDVTmqjMX8L6GHmgvZBL/BLQ9A=;
        b=AOqo8t2jY9oV+CxZY1VZlEycHcPGuSAFqE5alwP5z+E/eU+7J9EIJq54dR6kDuxTaW
         j+h2JPa9uKzwbert23UIT0jQ66wBmCHCiIO1UAmsXnRVkm5BsGwh2Jf5c5iIU2tx+u+h
         O3SNBda0a471VBgI5ClopDjvqNOUDAhD+8m/1RmNz2zxokuM6RlbSdsZAW51VrpWthG0
         rbq0ryFYe/S53DCvaE4+tkmv8ZIRjeF0OlhMCsj3CZdNV4Zb1OlrUSO3gyQs0pPO0Vni
         H90ZDueeBu4sKQRNfS1zum+IprFwpPmUuYh6kyLQrecRGR2IMgP3xQSME3wIuYhfbayv
         96ew==
X-Forwarded-Encrypted: i=1; AKwUvByATXcbUJNY8O0wubS0SgxdlDZWZ/oA9o6eM+/Y8ZR4xiFhhHINIuhtXXoM4QQEQQL0ALO37HIzQcMr@vger.kernel.org
X-Gm-Message-State: AFq9FYL3a2khA3BWDt2kND/URQFDF2L8g8dKOxImaJy8p3g5oYHbjwAr
	pnybqDfY8fIosfg0erTPI7HpQhTnTmnG9V1QuNEfxvXtu5nJfjt9wIyZ
X-Gm-Gg: AYBFou0NRne48nJ4scytRSOWWf+5WFk7qOKJkYkY/ZkTG8KYFVR8fH7gIGyenIZCWQc
	yld/RWBCD+Gfko48d5PIa7b2eFXZ4nHmMZPGDlXuzFWNwyWyndAMsqXv/qD3KNNjeh2o9L558AT
	93f+YQVISv98fV068h3KhwWzLmn50mcgxSXTAKDJYpfk6+hFdYEH/DWtZKr1bS8Rg+0QDSYyOP0
	2P6TwUGS9SvLrDVc0QwtwwulfydTCPrzLJNKWuu1liZJb2Wh/JG4OrlRN4CQfubR/ARmFTikuU/
	Zd0ANnTdtWHXB0ZEvI2lBbRY0AcwvDy6lHMNWgfSP0YBgNn1IoWPrGOqX+uCaW9oB7s+gUCL1a1
	SBSbjxiu2/x/SnHPoTTi4u9VtX6HvNCCG06Qz0aN6+cZ2tvx3El6EFsxiGHIm4siIPF+Q2GPD4Z
	KZyoU+o4BQyerrzcBe9NQBIABhJimmUIwbQgLCtzrmNGqnFqFshz5uuX6Ei0WSOF0exj2ehIK8A
	2lO1tgi1sPuQ8rarAFayr43EQyUVizyYsGZfCVNAd8TGS+SzQ+2wnPnh4gIB3P65iCJ3Y2SemZX
	ycCioXhzdNhQ/9ifsWOgDW23UuEf
X-Received: by 2002:a05:600c:6099:b0:4a1:992f:d0e7 with SMTP id 5b1f17b1804b1-4ac180f2ac5mr76556665e9.16.1793399844709;
        Fri, 30 Oct 2026 15:37:24 -0700 (PDT)
Received: from m2.. ([37.142.145.227])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71b959c1sm5457300f8f.45.2026.10.30.15.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:37:24 -0700 (PDT)
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
Subject: [PATCH v2 13/15] HID: ft260: i2c: reject an I2C clock outside the supported range
Date: Sat, 31 Oct 2026 00:36:35 +0200
Message-ID: <20261030223637.86907-14-michael.zaidman@gmail.com>
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

The clock sysfs attribute passes any 16-bit value to the chip. The chip
accepts it, reports it back in the I2C status report that clock_show
reads, and runs the bus at the 100 kHz default. A read of 2048 bytes
takes the same 0.298 s after writing 50, 3500 or 65535 as it does after
writing 100, while 60 and 3400 give 0.387 s and 0.058 s. Userspace has
no way to see that the value was not applied.

Refuse a value outside the 60-3400 kHz range named in the datasheet
section 4.4.16. ft260_uart_change_speed() checks the baud rate against
FT260_UART_CFG_BAUD_MIN and FT260_UART_CFG_BAUD_MAX, but termios has no
error return, so it falls back to 9600. A sysfs store can return an
error, so the clock store refuses the value.

FT260_WORD_ATTR_STORE() takes the parse function as a parameter now, so
a word attribute with no range of its own keeps passing kstrtou16.

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 50f68790c04d..f7d01d9e07f7 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -68,6 +68,11 @@ MODULE_PARM_DESC(debug, "Toggle FT260 debugging messages");
 
 #define FT260_WR_I2C_DATA_MAX 60
 #define FT260_WR_UART_DATA_MAX 62
+
+/* I2C bus clock range in kHz, see the FT260 datasheet section 4.4.16 */
+#define FT260_I2C_CLOCK_MIN 60
+#define FT260_I2C_CLOCK_MAX 3400
+
 #define FT260_GPIOCHIP "ft260_gpio"
 #define FT260_GPIO_0_5_COUNT 6
 #define FT260_GPIO_A_H_COUNT 8
@@ -1529,6 +1534,25 @@ static void ft260_attr_dummy_func(struct hid_device *hdev, u8 req, u16 value)
 {
 }
 
+/*
+ * The chip takes any 16-bit value and reports it back in the I2C status
+ * report, but runs the bus at the 100 kHz default when the value is
+ * outside the documented range. The report gives no way to tell the two
+ * cases apart, so refuse the value here.
+ */
+static int ft260_i2c_clock_parse(const char *buf, unsigned int base, u16 *clock)
+{
+	int ret = kstrtou16(buf, base, clock);
+
+	if (ret)
+		return ret;
+
+	if (*clock < FT260_I2C_CLOCK_MIN || *clock > FT260_I2C_CLOCK_MAX)
+		return -EINVAL;
+
+	return 0;
+}
+
 #define FT260_ATTR_SHOW(name, reptype, id, type, func)			       \
 	static ssize_t name##_show(struct device *kdev,			       \
 				   struct device_attribute *attr, char *buf)   \
@@ -1586,9 +1610,9 @@ static void ft260_attr_dummy_func(struct hid_device *hdev, u8 req, u16 value)
 		FT260_ATTR_STORE(name, reptype, FT260_SYSTEM_SETTINGS, req,    \
 				 u8, kstrtou8, func, FT260_STORE_NATIVE)
 
-#define FT260_WORD_ATTR_STORE(name, reptype, req, func)			       \
+#define FT260_WORD_ATTR_STORE(name, reptype, req, strtou, func)		       \
 		FT260_ATTR_STORE(name, reptype, FT260_SYSTEM_SETTINGS, req,    \
-				 u16, kstrtou16, func, cpu_to_le16)
+				 u16, strtou, func, cpu_to_le16)
 
 FT260_SSTAT_ATTR_SHOW(chip_mode);
 static DEVICE_ATTR_RO(chip_mode);
@@ -1641,7 +1665,8 @@ static DEVICE_ATTR_RW(clock_ctl);
 
 FT260_I2CST_ATTR_SHOW(clock);
 FT260_WORD_ATTR_STORE(clock, ft260_set_i2c_speed_report,
-		      FT260_SET_I2C_CLOCK_SPEED, ft260_attr_dummy_func);
+		      FT260_SET_I2C_CLOCK_SPEED, ft260_i2c_clock_parse,
+		      ft260_attr_dummy_func);
 static DEVICE_ATTR_RW(clock);
 
 static ssize_t i2c_reset_store(struct device *kdev,
-- 
2.43.0

