Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716204;
	b=XYWPY6izjLSWn7RQ7JzJCXgA8/NFPWxXP1wXUSFc7RGbCOU188T6W/Jq+jMhj2yw1z5E
	 00GTV6Dq5Hfhhq6+h0icJxQhF4Cy47qOCUklTOIv7jUgnKaam7ev1Qyro2yV8RzhKcW0x
	 qcEwb3BCnRXP6fYg2gnGH4GzVilUgCA6JRA+8y8G3PSwzKDpigm0woaQa8AUHunxWt3MH
	 ITxYhWFmOknny3ewzgN9itfjMxDD31X+syyD4rhmBlw2cjbJOFpiffQl9OGTm/VHhk3sa
	 i2zzLAsyJq8qQvmCFwdsjEdP/b3iTpPtZl3Yz8Yf/JBlsZq06YgJb/CDILe0FEofRwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MWjWbCDRLzNbOgaM4N+L9AIS4oA7KwmKeVxKr/CyST4=;
	b=y36nN0NQ+rGcxuHAFAxY9G/FfVV0ZRfyxVP5sLoy7KT/yWJwg9hJhvLZ96YfY7EZUIXR
	 pYAh32Ue7E1U/q/KI4wCIiQv8W/wQ7lt6QqtEFmnjlUl7V7vZiSZrZ/ZeVajoRbI0d+pj
	 KEHZ1VZftvjNuOoifIYpky16/BT+YVkJgd30Qz3nodVZ4c8/UCJSD5syMSCd8Ufj3FCsQ
	 2XfK9M2DmI5XioITFb17CY+bnWRpqfSAFAG5dO5Rr8Rx4MZ7y1g94RhzUBe0biC/MVKdw
	 FFp0HwuIy6tuMB7n8nzcsMB+JCh7YRFbjwFDva1c53tXCLmlC9/W2L00zoE01tWh/Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EutVzTX3;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B02606A337
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 18:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05B02606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EutVzTX3
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb606491faso38793485e9.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716202; x=1796321002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWjWbCDRLzNbOgaM4N+L9AIS4oA7KwmKeVxKr/CyST4=;
        b=EutVzTX3ArqMEdzUKgVA0SrklEJXHUsiIpN1waVURscx28BvUx3z8sAp9ydSH4/bpG
         PewpjvUbCiHYmIP3/gXCHvjYrS0NPN+UV48LwLURrP7HI/SrsONSl4Ct9UfHwdlPKP3l
         oQjCPbepKJCx3RTw2p5JamEVZk3tg9UY8o7MJgaMYrpkyeGFRhIOWcnYxUJxQhbXqPaS
         2meW3DPMROeMTIBy/G4TEDyew9ULHyUK3bw5YaQ5j4j5AVroBTsiPLiWtsG5EUfRmsZ4
         RIj7PmxZyT1wxj5UVP1iq4xGvd12OL2ittQZuLc5Lc5sUdfEYpi5p5RNt3tTKhZu8RCk
         ILtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716202; x=1796321002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWjWbCDRLzNbOgaM4N+L9AIS4oA7KwmKeVxKr/CyST4=;
        b=K4A8Wy6SM4AHav21m7Bd/9IVS+0JA56gUBRMuQ2PrXcsWbl/LX84vfPE2KpT7eMDJC
         r0ZmulvYARlLrqPlkiIgneWsphrRlsQIqXnEBoBIxsAcidvz+Ycf4A1ckxh21iYwaHEt
         zBCnSy6RQl26QoKN61QXZ7foJ5SDtlo7PczAipNfo3rkgsqeSte+w/1szfMEgzcrz9Zv
         qgyOWCC8ubucxy1CpqasYexjv3mmhlKMV9dx7x8YoY3XqCQ3H8wJKGGJXrDJqlVqM6WU
         1F9DTkkazXuqTN/1K5Pru447eelvE/hDA0Mh/1y+q4HskMVrI8NZHyJ2aH9yKnsOJlGE
         G25g==
X-Forwarded-Encrypted: i=1; AL+hErG2jbCOixipME/zUy0dU9rkOb0aOofa/D1v6V4VZwvRv34AtXzB5B+BgDFMgQUZY+L1apB70lhWVLhq@vger.kernel.org
X-Gm-Message-State: APuU4Z/bA5vwxSvZtTYmApjjS0QPqDxDE/hxtGYdV9Ted9+Baq21AYK5
	FGDXWa72C+/nefXXfg7c421jqNY4vgQPiOENm8FNvr/OKya+gN/Lxf8=
X-Gm-Gg: AZFdTZfFB/CH46gBhj978ZHaoerWP3RMPmMs+uxCJjHi+hSeAnHf4x8kZNjjx9Ite3p
	kM/3g+a/N3pESRLAGXVwBzit0cniYMICMxl2CUAr2b/T76Uu3Yhblob3IjrwOVHw1NlZtSxgkCJ
	Cc7OW4AT9Pk3SlmVD8p76lkrokLECia+CFVzn4BZyJqRsD1xo5seJ70fco7cpGovHU8pj/6RWff
	KbP3fRhTA/OR2bWDgeMjvM57vPjS7Rwd4N1NB/+l5lPP4L+dhjYXgYGzRyvaab2lqjzpEPtlYho
	2+bWledwhQPIXtJqGQhaaiw9j/BhRrgNAg/yyRNi2Ob6vmmwtEIZ2Cs6ZvG87E+SPQC74g/hNd3
	nlVvFQVjZBET+n5c+H+mef7m12ZQPdt9Z+90Ae2JQGaeFcZGxI1Y5RJZyjAwpECsW6mg34YlXwG
	sk/YD5c+M9PmSUeEq1yE0xf8TZonREXuACx6HVrN92G71fHigEBL6cOpu0BqJjpJLbxlTDTRV6M
	24LCfPtaThY228tr5x1QmF6uFZmcWg3ZtjhGy+D7YJZi0Si9eqxF6Kwdov0AEegazHJfDsTWiGa
	EBI6paFssESw5jW1025VMhwavZ5GNks6kqQHE3sLntjOp5RIH59RdExaHHdi3B+coKY/ng1NFhx
	k7trMQ4leHoRrqJRe8yp3pozhniSVQLETmInX2C4fJBH3DH89spl8kQCsYd0=
X-Received: by 2002:a05:600c:37c6:b0:4bb:7033:c938 with SMTP id 5b1f17b1804b1-4bb888147b7mr437653295e9.14.1795716202272;
        Thu, 26 Nov 2026 10:03:22 -0800 (PST)
Received: from localhost.localdomain (host-94-89-17-99.business.telecomitalia.it. [94.89.17.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2052c8sm42265115f8f.41.2026.11.26.10.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:03:21 -0800 (PST)
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
Subject: [PATCH 3/5] gpio: fxl6408: Support optional power supplies and reset GPIO
Date: Thu, 26 Nov 2026 19:03:13 +0100
Message-Id: <20261126180315.98034-4-gianfranco.mariotti94@gmail.com>
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

Enable the optional vcc and vddio power supplies and pulse the optional
reset GPIO (minimum pulse width and recovery time of 150 ns according to
the FXL6408 / PI4IOE5V6408 datasheets) prior to initializing the I2C
regmap and reading the device ID.

Signed-off-by: Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
---
 drivers/gpio/gpio-fxl6408.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 9f80ea1214e03..5132177ab2837 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -7,12 +7,15 @@
  * Author: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
  */
 
+#include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/regmap.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 
 #define FXL6408_REG_DEVICE_ID		0x01
 #define FXL6408_MF_FAIRCHILD		0b101
@@ -106,9 +109,15 @@ static int fxl6408_identify(struct device *dev, struct regmap *regmap)
 	return 0;
 }
 
+static const char * const fxl6408_supplies[] = {
+	"vcc",
+	"vddio",
+};
+
 static int fxl6408_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
+	struct gpio_desc *reset_gpio;
 	int ret;
 	struct gpio_regmap_config gpio_config = {
 		.parent = dev,
@@ -119,6 +128,21 @@ static int fxl6408_probe(struct i2c_client *client)
 		.ngpio_per_reg = FXL6408_NGPIO,
 	};
 
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(fxl6408_supplies),
+					     fxl6408_supplies);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable supplies\n");
+
+	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(reset_gpio),
+				     "failed to get reset GPIO\n");
+	if (reset_gpio) {
+		fsleep(1);
+		gpiod_set_value_cansleep(reset_gpio, 0);
+		fsleep(1);
+	}
+
 	gpio_config.regmap = devm_regmap_init_i2c(client, &regmap);
 	if (IS_ERR(gpio_config.regmap))
 		return dev_err_probe(dev, PTR_ERR(gpio_config.regmap),
-- 
2.25.1

