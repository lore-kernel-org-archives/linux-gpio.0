Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697735;
	b=BqOuVQrnjssMjM76/6ZdCwdB5BEUM2pzEqoT9tC/Slm/pdNazeWcOEB9+DSpwTtQCZJQ
	 vz/GSkU8WREJzCVE874rMOoP3hUvUbr63WvzDc59h66IqTnaICt74ITQ2gUJ4obIOpxpC
	 ZBRhXD3RDY87L7gAks3GEwKGrxY1ngckiX4D1b9db3qSm3Exs/b6WK1x7EhmO6lv1ZwMR
	 a8PA02jxRm1ZYcQIrCN29lF+4tgDeShrdNIs49U8D9pnW7MQvLmwBubm9psm1D4/TalFp
	 4U3ud+2bWYFahmW2PVIa6zpOC0pxgfG2MTsRR35P+5FSnZtvZ+YfAO/0g0Wkt0jkNdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hh9ybCpP5y8fCdG/ue0SgeIlejwXAiQet93xa73o/ck=;
	b=mXD47J1nZdZnHMn7H1xdTwoar8gb0Xi+k4r3iC9puhDhMlcGNDJA718CsSrpS0tc7bZ3
	 g57JfhCjEmMF0b4HcI7tl5qx9k3XBr8JWXzu3O6vQmDXUZ1j9nh0WZXc4tsa+3b5BRvT6
	 Do6a407skda/CqZVDikK6h5J6LWHqlGZBVuswvRKmF8zwdCOKDolz3QYxRv90f/9sRbv4
	 KysmO+HmnfRQ09sZBVac98hHBQ8AbkPfvOByT4fj/r5un+eZaQ0aU6oWOw0fVP275nIMw
	 1OBgAagzdNsaHl1WKLTz14rSPftRhAZTvASPKIvY6zspx334JDchcCWcdRylZsXmryw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jeFJb/c0";
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C4660A6F62
	for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2026 23:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C4660A6F62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jeFJb/c0
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4922dbcee23so988293f8f.0
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2026 15:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794697733; x=1795302533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hh9ybCpP5y8fCdG/ue0SgeIlejwXAiQet93xa73o/ck=;
        b=jeFJb/c01M9tftwZV+FhKblIVrnpLKLb+K0qW29KG8tNYlpIt2M0ZA/r3nSu2sNB00
         MwRBxF+fvkIJobYzGZlbR9zhP1oSohsw9+QLS/qLiDoNr215xRcFwSxqToxY1PgEr75G
         yYxSxbq6ZprH62dUFNhBIkEqmEUTIkYo0m3OKc18rbjj+64lwlFKnKcFeT/TuI2fIxO8
         PRtGSohTG4gGxMjlnn1dqiOCGxe2BYWtY9zeyiN91yQZltWhb0tuB8CrrBgn1XoUZV6A
         PZzeLPUWEFUUBdoh7wkx6yS4wTgfvAuxvZ7LbaWK0TgMCAYSd3RO1Vkt4JkvyslI6ypC
         8d8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794697733; x=1795302533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hh9ybCpP5y8fCdG/ue0SgeIlejwXAiQet93xa73o/ck=;
        b=XkaTFsuXrfBDiObVlyKbmbH8TAPXWTTfyz0dCUQWFLO9wEbWWvbrDJ/nVN7f0DbA8r
         jFL2kYUoZxAP6jdy6rxRF7uUD/8KqFlXtOJzDL/AOpTgDmgweccWSY8jXmk5Mklryzl6
         9Qkj6XvkXA9SMdK4H2EEj/m+QGJ0XjfBNuFk6/VgzPNO68n/EMOL9YTEAfMFDjW8bVSG
         Fn/Ff6r6+e845ilzJjJrt7UIWo0TPMSNuhx7scrxSCIP/KV03B+pwi2CXs17I2ePxHbT
         Lp59y6ltFHKxGDb9CEedVYuPcS0iDxWyJRdMRDHO/+gxbzuyWXiPuG6E9QCNGann0mTc
         ReYg==
X-Forwarded-Encrypted: i=1; AL+hErEy4m0c5U8y7j6+mLpuhUr/xhlQAGPOD94MCCizKoLQaS0um1NkGvHG4fUxweFvIL1FrCdOWcXlUIDY@vger.kernel.org
X-Gm-Message-State: APuU4Z+SR5xCl4qR0k/xWbw5bwmK3rPHCLlTdWQrAGtL+vA8gnZDvgWh
	7rVxlM+CVmupEqycMyn3ZCJU6paeNx69y2U0J49D8uFeoc62BlUL96h/
X-Gm-Gg: AYBFou0uHc1ljqjypUyKN/0h7U0ULjwIS/pq8bwgjweXQMTK6ULcZ/E2/pNoIAiqF47
	heQLrlk1ZWLZwxqT1L5+lh9cdkvI81WHyLdKasmEGcz+iKJ3QF6P2SnxJOhLmaUh+K54HjVHZfC
	iRQ4X/+fGP2jK3eYn68UBXOaKpbBzupCv2fi6Ij6MN5IC/t9SPj2Ygi1mc4MkfcU4POXUM0H5x1
	O3Nusxgq0zIWNSP8A36WpDbIJnOz/803qvNLCfzwgeyQXW90BXeNDKqtamo62q/rAUPDR6FAPXh
	7OUZrONsZPF177Rw5IVFuqCYSWm1VVSMBJW0H0X6kuUpG6tBiq/f68v+lQ3V/9Ur4xeX01Qwskb
	1GGJbzseawRgoKKYuSGiF6Inyp9Z4VxRXqpDV/tEzDwIyJ+9X0S3xOF+xvC98tVIYI+daC2hANR
	7UWiBqdC53Uz0Pq11zqDwgiZnvN5mumRVVYl2LvR8Tgw7Ahk7GIMTPGxuXp1+GeL0+LMT+bS0JX
	FJc1+fCCYZcYs2B77QR5sC9E2EkoKLKtSrYdyyZTWyJ1aQS+EFvAqxCc4ifjmt9Fj9xQZfD4uXl
	NxVOkzQlBMzSFW5XDgC4Q7y8tBpd
X-Received: by 2002:a05:6000:1a8a:b0:48b:f93:3b87 with SMTP id ffacd0b85a97d-49c726da6e1mr15621389f8f.30.1794697733385;
        Sat, 14 Nov 2026 15:08:53 -0800 (PST)
Received: from m2.. ([37.142.149.161])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm14910018f8f.1.2026.11.14.15.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 15:08:53 -0800 (PST)
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
Subject: [PATCH v3 13/16] HID: ft260: i2c: reject an I2C clock outside the supported range
Date: Sun, 15 Nov 2026 01:07:57 +0200
Message-ID: <20261114230800.1344401-14-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114230800.1344401-1-michael.zaidman@gmail.com>
References: <20261114230800.1344401-1-michael.zaidman@gmail.com>
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
index 5564ed62cc48..391128e4bb35 100644
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

