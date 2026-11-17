Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794945935;
	b=447a3pkd9IulOOxiKtq3dHyZ4oMCKwrZxvhpn0+2easCGHfu/yb6eiF8hVg0bic3I73t
	 Q6KU2nb1athMcvigtrvwHo0leRi5bv60phxZfzVVUMGMSFvkWeWfpLrJPwQ9g/VJg14Kv
	 QwQnpkDhNjs8WeRDJ/iQy/k78DCKbf5VNiE1M4XyUNATWAyte87dU1pVwz74R3ctDUmH8
	 Lds6OTMQcYY1hooV6LjMVes/L+r47vZtyKfBbZvZlqCzLG+aay2r9g+/YvGeXMtl0zUa3
	 dB1Wlciipn//93jiv9hKiRzOa10j/wzvxsIgtrYAWCeKYbtBFrIQ+CeGbDdRfdeY7hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RJRW8/pUEx8tBkwSu8ULpNbc2l9+sxqXJHn/uyDjr2E=;
	b=TD7u3QeaQX6seQAUYxYb853321Bqy0RmyLRaOBeGymDZlQ7VpjouFTYNBrFY9altO8JC
	 L2b9ehNVe0bOETzdcPs+y/OpXRjz+ftbcNefrT8JBPij//no0PrP+QHq9hJkbm4Ur9ykL
	 gEqBaX47nUI54RJAAMPIagJ+oRXjA5GoC/cwyc/7Gj6jCtZS0WMeLFi0WQsZE2rMzP2RD
	 KhE5sU+6iyPIURpOQkjHTcRhQPPzLxZz6Wa+s5JCrpZYQfq7MX9WAunxrWUOLZoOiOkGJ
	 tGOZf5aMmrcTsKGO9Je6zaXmSYqW1jTNdVZCX2HWEQrZtw0yVmF2kSb6JKx8H5KlYog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZwqXXRp;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826AA606B458
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 20:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 826AA606B458
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eZwqXXRp
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so2056165e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 12:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794945933; x=1795550733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJRW8/pUEx8tBkwSu8ULpNbc2l9+sxqXJHn/uyDjr2E=;
        b=eZwqXXRpXTnuGbr0zWQDv0SFW0VKdXA0Gkv36AC7DWNM3f2JCZwrmuhIMKey7QoecS
         H0OeoWbe+Ew3Y5HryOUemzfAIpmTBe0zbo+3cXFeAfcj5TWywnqqUS8KH6+4CNoe5dC5
         DMx9ohgtietqL6V0MOPcjjGV2mYOgHBvXeRTCkeoWJidXvmfcH93RiAwOYfBvFgnbEcQ
         Yt/I3bBD+ffnMoJdyn7goSVtCb5Yu/rXpQ+yp1E6UFTTqGi+Lk7m1Bitzp4Cc0tayru8
         RTzjWbjmRi3knhnx26b7goby3fUx6dhKt2ceH5LUH49XvpfH8Yidkh3HltTbN6YiPo4x
         8Kjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794945933; x=1795550733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RJRW8/pUEx8tBkwSu8ULpNbc2l9+sxqXJHn/uyDjr2E=;
        b=2IMEaTA5s5r0O5DbZxhTWEAQgFf/ZrUJig6uwYHFAOERFJNF+zaDi+WLnaltktZKZO
         neoorbvzksYkn9nt2Sl/S7R676nhn/kRGRb/Cs8A/JSlhFsRXl8NcaS7OIpewlxcv8na
         hVi8NXRf6ZUlOTGD0kqmeuyd2gCnkkLas58ZsI6xy7cNSbLfd2VaNttSxs5TJ2s/+3EM
         pTYOZGiRTzWqA2AI8r8jp3aFoe1GhZ2DUV2zXj6P0rEhj0dsCJ41HGvdTbt8pz3+BiJ/
         Z4Ukzs97UqCOpu0cp3j5VaHu0GIcSPDtHtTkI2jX0I9T/zF7E+nzrRkR2Mwq9M/pm5sc
         fZbQ==
X-Forwarded-Encrypted: i=1; AL+hErEatq7pOikXzJMpZhwHBWlx6hkWFyVK+bDpYT5n1PJnwv2HMuaq3beMWbw2doxHISBra8mcU+ACmEXj@vger.kernel.org
X-Gm-Message-State: APuU4Z9NQxqWbuaRx8unjpzu4wxS740FIOXMwP4o4yxJK07/b+EoAxZ7
	Q7XRctY1juJuedTK3qvSf+kWPgR9pko+gouxeTYWe4bwRWRBpnM+Ew5c
X-Gm-Gg: AYBFou31/ICzBhdMkbcgztZRM42iupSfUz5Gnmx795qux1Dcke2UifTZjfJt/5i6YBZ
	Wk4RLoAat/i9yTUETlnZ27sqqPHdSE/x7jDlCcm4bKhqXoKijQ2KVBJblSWTE74GoL/w4b1z1LY
	3dsWN5KgSpUNez7n8jOGroFBXQfKL9L0w+20zSvrz7lOh8YhiJsTj+jx92bBIH9fmDaXWDMLBmU
	RmUKqdRAqqUcsyNn200QUFOAhool2vn77xC25kBBHDtKOihE5wsaKBTDQgMsXOrhPDP5IZBnE0g
	njHdd+/iI+9TQWGV5nzWhYeUeYUGR583ZwwCpT2QFJGAuGAA0l7Hl5+GPLqe/p5q35nhC6j5k4f
	l1BXuyv2FdwRen4COcsIosdQl1uwtE6TdEMGxHPOgJqg3E/lns4UV9H1/oNu4Dspj+zeawZD2eL
	+PzL9iv1ABBAQclaRrBCiC6pQMJjCfl+5cMLJ2vTWHuibsnL8A1sgoHFYBCJ3Xy7R9xe4PpynfG
	0MH2oZGs/s5lt8R4yA+bCze89h5TcEj1siBAv+qtakgO9f6KBoc5uMF7CEmd0k2dc0DRkay4iJV
	3kbQu67wdOyop4Fw1900nga4akg9
X-Received: by 2002:a05:600c:348f:b0:4a2:191f:7cbd with SMTP id 5b1f17b1804b1-4bb7d9fb07fmr4999995e9.11.1794945932399;
        Tue, 17 Nov 2026 12:05:32 -0800 (PST)
Received: from m2.. ([37.142.154.208])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4a64b60940csm625528f8f.0.2026.11.17.12.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:05:31 -0800 (PST)
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
Subject: [PATCH v4 13/16] HID: ft260: i2c: reject an I2C clock outside the supported range
Date: Tue, 17 Nov 2026 22:04:19 +0200
Message-ID: <20261117200423.19561-14-michael.zaidman@gmail.com>
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
index cf745db8e3f1..d5250bf5da61 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -69,6 +69,11 @@ MODULE_PARM_DESC(debug, "Toggle FT260 debugging messages");
 
 #define FT260_WR_I2C_DATA_MAX 60
 #define FT260_WR_UART_DATA_MAX 60
+
+/* I2C bus clock range in kHz, see the FT260 datasheet section 4.4.16 */
+#define FT260_I2C_CLOCK_MIN 60
+#define FT260_I2C_CLOCK_MAX 3400
+
 #define FT260_GPIOCHIP "ft260_gpio"
 #define FT260_GPIO_0_5_COUNT 6
 #define FT260_GPIO_A_H_COUNT 8
@@ -1592,6 +1597,25 @@ static void ft260_attr_dummy_func(struct hid_device *hdev, u8 req, u16 value)
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
@@ -1649,9 +1673,9 @@ static void ft260_attr_dummy_func(struct hid_device *hdev, u8 req, u16 value)
 		FT260_ATTR_STORE(name, reptype, FT260_SYSTEM_SETTINGS, req,    \
 				 u8, kstrtou8, func, FT260_STORE_NATIVE)
 
-#define FT260_WORD_ATTR_STORE(name, reptype, req, func)			       \
+#define FT260_WORD_ATTR_STORE(name, reptype, req, strtou, func)		       \
 		FT260_ATTR_STORE(name, reptype, FT260_SYSTEM_SETTINGS, req,    \
-				 u16, kstrtou16, func, cpu_to_le16)
+				 u16, strtou, func, cpu_to_le16)
 
 FT260_SSTAT_ATTR_SHOW(chip_mode);
 static DEVICE_ATTR_RO(chip_mode);
@@ -1704,7 +1728,8 @@ static DEVICE_ATTR_RW(clock_ctl);
 
 FT260_I2CST_ATTR_SHOW(clock);
 FT260_WORD_ATTR_STORE(clock, ft260_set_i2c_speed_report,
-		      FT260_SET_I2C_CLOCK_SPEED, ft260_attr_dummy_func);
+		      FT260_SET_I2C_CLOCK_SPEED, ft260_i2c_clock_parse,
+		      ft260_attr_dummy_func);
 static DEVICE_ATTR_RW(clock);
 
 static ssize_t i2c_reset_store(struct device *kdev,
-- 
2.43.0

