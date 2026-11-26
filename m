Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716205;
	b=N6zHK+GA5oarJd4Nqc4Mq/fyXjfZDnhv78ST/GuhE5OhJ+4VEazkvMVm8UFxUmckFRVt
	 x3QJJTFTJDQbaafStxwcnY0kOvjwLyOLw4r7nmXKEALsGYIYjh79TZyY7Y8X1iOsZxau+
	 gnsLuR1xvT9PKHt3ytb+o44P823tNSd/BWdInuwLA3qjv3ew7FXpKkb0VpVauA+ohZ0OE
	 yAXq0K+/z+VTKMkvhD+0RpWOwsjfQTplhw9RtsMrU4KG6N3m/7ORjR7jbXZBzIHTW3peo
	 MUT3LXlh4309GMCu6FfLA1vETlHJUWFp1W8aq6tNj7EGDxfgF5pdLCYaz2r3NWtpQjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716205;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WuHE4xVuwPbHoJJDUazvRjThuTJ3/8xHzVYiIGey9/0=;
	b=VuNpe2L/iYPRqr8fUNoS02A7O3fKcXyl3KRvwuAFmAA0HvGMSkUWoiWfm8rdb2j+1zir
	 +ZVfN5q4rqh2kBw3INyM4H4FwQzZMrYSIDEDR/SYx1c/JQynTXE6MqkyAXM3Xr8fbKhP4
	 8pxtMZZp5AGPSfkgAbmB4yW7srsw1jUxHt4t3vsENr3ml2vfXfs8JO+kWCWH0cDIdyBib
	 fDt8xDGxqY+zYSv5D9+fklIm0EfFlMLKNplMa5igeL+obogGRymC25ZZYyDP9MMOd4vf+
	 6jqviRhrb88Gtxv+Djiciq+FZPzdFgttxkEJ5piWtTJGKICAa+d/8yKBbz15t1vphsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jGbETmZr;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF27606A69B
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 18:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF27606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jGbETmZr
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso3348904f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716203; x=1796321003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WuHE4xVuwPbHoJJDUazvRjThuTJ3/8xHzVYiIGey9/0=;
        b=jGbETmZrNFtM3pjEYK+LBOFQJe1WmjF008+9gjsGBzCLSb0JE/OYF+KYRWj1XcMROt
         3POEgILHWdzhVjbHNhZLx+2qTXqB6AdFRMTAgLf6IeIsndzkbmliAz2Ox1OcRtJrcIrd
         xk1rzlUiATS/MXYMRgvXBjzmkhPLYZNV28tifShqgYNcFNYHp2Z2UMK+mtxYNURFtZAY
         wd4+KGbt38dvG9wPr3nfLvdc5H6OW1KTUq2AvktbP6deXZPTpjh/zMv0ZrJrQEA0Knlk
         n0ksfpVkIm4x+C+dmpiQVbycwSe11RMfq13C0DtflN+aQjMu9N849pnEo8d8/U+jU38d
         01Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716203; x=1796321003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WuHE4xVuwPbHoJJDUazvRjThuTJ3/8xHzVYiIGey9/0=;
        b=YG59HFprdBEFvzKeyEhJ0qFy6eXcuLWcygP2P28phpRttPfTTY03d3LLq59Pucgi6/
         IRcLAttFK64UY1bvplkGWnmEaU/1qBEgPxfWsSnyIv9Ddk256qxx8zdXhnof5RTXvkP7
         laJ3d42Lvbjy0tyg5RByShpH+COWY5d2XaQNYYRbB9NNn+SpDdFY9slOOwDcjUao83cv
         pS3tYAMaffc0Ua1rrT3ruJ1FVnEIkE07/xoVtBUhHXi+Xbb1NB81MG0o+CUpJ8ssQOrN
         506+cSTFQN24ukqxE5lU/y61k2zXZ8Q9bdtwTEy+Um25H4Tpq1hoaEc48k7YPxVJz1EH
         a3gA==
X-Forwarded-Encrypted: i=1; AL+hErFsxafUvC7SQzU7uojtsajHBEWwyHr1TueBr1bojFMQd/vysHtG3SYj5zUUFy1wO7cMCcnn52bMK574@vger.kernel.org
X-Gm-Message-State: APuU4Z/6J5pSxOi5ch0k0xCJ9FKpRpOiZjyFfweyr2bkb0rKJobqYNL4
	Cr3mtdcGKcAxbEBGb6TMKFbdb/CQu0KBVzsYG37FV8i9STueWh5ha8c=
X-Gm-Gg: AZFdTZddHCqgDxq3voPdiDRcBpIOOs3eD1rTk/vsZ+2xLQ4p3ndft4Zp1EB7uTFCIRj
	ulDfzDL1j5I6HDPpCexaJylB+OW/AJO81Yzde/lpbrF/hFx2qBEUkqGax13zYWpG5b6rS5s+nyy
	Q3TI8sw45Z/QewK1AqOWdZ5o0wN692TVBV4ygOiOYFK7ucR3pWbvM0d8L/C+RcuK9qdhlUs3l1M
	I4GxTZ8iL4Cn62BVaXN+APCygnqny/nAq42jwITRHpTnKUoEB96nMyiIWfxu/GXF9vXx0/FxJPn
	pTWl+S5IYy+2GG6xAvM5Sh7Aazwr3/tIkdrBua9UOb8i4B2RJ9U4lgzcyKB8g/JM1xXyGapqZQO
	RUChVZyFWRxQoFnrf1NxA1KPjUI2F0yw/mt7xat/IIx1qo7WASqFVCk+Gre6RcMWBsp8td4hHv/
	ZWuowHmUVfr4QVkL+5nhMR6ay0aMzDTIYciTtITP3x9ZEUkMoKfbY3F9qLFg+x63++VOkC30dfA
	IxzX/SWUFQwayezbDGj15QnxotadiTOhDP52+ye6oREgqarR36CdcqguiDnFYKylOJCHoFOl6JT
	tn3hP1Bja+7w0tRmLL0jBz3pL/j37Y4vCzhGip/+GzsCw6pyyXLaL0JsAaiqWMOZ2B3BCIcRFpB
	HcvYP0/qXFceOBVADqYg77uUa1GQGcVMoklfJSD9xxsXSqP/MdahXz5ZEZlFtIoqRwUK5Etkccu
	9rEjww
X-Received: by 2002:adf:e008:0:20b0:48f:bba5:732e with SMTP id ffacd0b85a97d-4abb560e1c7mr30064709f8f.57.1795716203246;
        Thu, 26 Nov 2026 10:03:23 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42265115f8f.41.2026.11.26.10.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:03:22 -0800 (PST)
From: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
Subject: [PATCH 4/5] gpio: fxl6408: Add pull-up and pull-down bias configuration
Date: Thu, 26 Nov 2026 19:03:14 +0100
Message-Id: <20261126180315.98034-5-gianfranco.mariotti94@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
References: <20261126180315.98034-1-gianfranco.mariotti94@gmail.com>
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

The FXL6408 and PI4IOE5V6408 GPIO expanders provide per-pin programmable
pull-up / pull-down resistor selection (register 0x0d) and enable
control (register 0x0b).

Expose both registers in the regmap access tables and wire up the
gpio-regmap .set_config callback to support PIN_CONFIG_BIAS_DISABLE,
PIN_CONFIG_BIAS_PULL_UP, and PIN_CONFIG_BIAS_PULL_DOWN.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpio/gpio-fxl6408.c | 47 +++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 5132177ab2837..ae9003fc513a1 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -7,6 +7,7 @@
  * Author: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
  */
 
+#include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
@@ -14,6 +15,7 @@
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
@@ -33,6 +35,12 @@
 /* Bits here make the output High-Z, instead of the OUTPUT value. */
 #define FXL6408_REG_OUTPUT_HIGH_Z	0x07
 
+/* Bits here enable either pull-up or pull-down according to FXL6408_REG_PULL_UP. */
+#define FXL6408_REG_PULL_ENABLE		0x0b
+
+/* Bits set here (when PULL_ENABLE is set) select pull-up instead of pull-down. */
+#define FXL6408_REG_PULL_UP		0x0d
+
 /* Returns the current status (1 = HIGH) of the input pins. */
 #define FXL6408_REG_INPUT_STATUS	0x0f
 
@@ -51,6 +59,8 @@ static const struct regmap_range rd_range[] = {
 	{ FXL6408_REG_IO_DIR, FXL6408_REG_IO_DIR },
 	{ FXL6408_REG_OUTPUT, FXL6408_REG_OUTPUT },
 	{ FXL6408_REG_OUTPUT_HIGH_Z, FXL6408_REG_OUTPUT_HIGH_Z },
+	{ FXL6408_REG_PULL_ENABLE, FXL6408_REG_PULL_ENABLE },
+	{ FXL6408_REG_PULL_UP, FXL6408_REG_PULL_UP },
 	{ FXL6408_REG_INPUT_STATUS, FXL6408_REG_INPUT_STATUS },
 };
 
@@ -59,6 +69,8 @@ static const struct regmap_range wr_range[] = {
 	{ FXL6408_REG_IO_DIR, FXL6408_REG_IO_DIR },
 	{ FXL6408_REG_OUTPUT, FXL6408_REG_OUTPUT },
 	{ FXL6408_REG_OUTPUT_HIGH_Z, FXL6408_REG_OUTPUT_HIGH_Z },
+	{ FXL6408_REG_PULL_ENABLE, FXL6408_REG_PULL_ENABLE },
+	{ FXL6408_REG_PULL_UP, FXL6408_REG_PULL_UP },
 };
 
 static const struct regmap_range volatile_range[] = {
@@ -96,6 +108,38 @@ static const struct regmap_config regmap = {
 	.num_reg_defaults_raw = FXL6408_REG_INT_STS + 1,
 };
 
+static int fxl6408_gpio_set_config(struct gpio_regmap *gpio,
+				   struct gpio_chip *chip,
+				   unsigned int offset, unsigned long config)
+{
+	struct regmap *regmap = gpio_regmap_get_drvdata(gpio);
+	unsigned int mask = BIT(offset);
+	unsigned int enable = 0, pullup = 0;
+	int ret;
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_DISABLE:
+		break;
+	case PIN_CONFIG_BIAS_PULL_UP:
+		enable = mask;
+		pullup = mask;
+		break;
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		enable = mask;
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	if (enable) {
+		ret = regmap_update_bits(regmap, FXL6408_REG_PULL_UP, mask, pullup);
+		if (ret)
+			return ret;
+	}
+
+	return regmap_update_bits(regmap, FXL6408_REG_PULL_ENABLE, mask, enable);
+}
+
 static int fxl6408_identify(struct device *dev, struct regmap *regmap)
 {
 	int val, ret;
@@ -126,6 +170,7 @@ static int fxl6408_probe(struct i2c_client *client)
 		.reg_set_base = GPIO_REGMAP_ADDR(FXL6408_REG_OUTPUT),
 		.reg_dir_out_base = GPIO_REGMAP_ADDR(FXL6408_REG_IO_DIR),
 		.ngpio_per_reg = FXL6408_NGPIO,
+		.set_config = fxl6408_gpio_set_config,
 	};
 
 	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(fxl6408_supplies),
@@ -148,6 +193,8 @@ static int fxl6408_probe(struct i2c_client *client)
 		return dev_err_probe(dev, PTR_ERR(gpio_config.regmap),
 				     "failed to allocate register map\n");
 
+	gpio_config.drvdata = gpio_config.regmap;
+
 	ret = fxl6408_identify(dev, gpio_config.regmap);
 	if (ret)
 		return ret;
-- 
2.25.1

