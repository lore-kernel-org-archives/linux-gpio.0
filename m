Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792482882;
	b=ZyiMyZaAAZQ+bmTyyL7kFIwUAKPOTYXfAVYY8ZprXfr17AW72DC9JGI9C42XCYJarzk4
	 kJRSEkPu6cMozqCTTAawDeWj/Kj92wW3CgJ6yJo4Bq3bUPwEOQmjAGTJp6UEH8QkHr4PZ
	 kxyT2G0cOfm09e5rFSJ3F3ut3QF+5kUq1/mJ4jIMTmTDtpdqgYTIEk/DTPPOaCeB50ptY
	 UwvmPhI0/+bQXH0McOPlAdXuEEegp2SCsOwMZxB72zOGFUaHVMLu5y3IZoD+/KhaOoQj+
	 pLJEgRxM22Or+5UAc8WQBJHWhZVk6ZXmsSIMrzuGCLdj11pZtk6eBEZ366iJbr287Sw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482882;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+d54rXQIumfUS1Nh4QPlKdXgz/z2AgDR5ARBD6dkc1w=;
	b=W9vaNdKR/5tlGOJmM07lzJ7gNz/q3XHErOBNx5yfZgVicDh/ptk/NyJMipaI/j6pv5TZ
	 Rxq8AFEmLpww6ark2EDKJKms9o756dOPWQcDZvlnHl08tSEKN6ZfU58aRCi9A3nCoOtNS
	 yqmAiVTT5NOpeLPLO9fbO64bpErbZd2UEOFRaAHAgUml92giKQUo8+jWMhIji0x5JdrVv
	 GS9gQxS8qC6sfsBs7+tRakZM/vXFmczMv97Rqr9DIWUexvjg4QBFk8Ybtffm/kzdQbeMr
	 tTVedST9iN6EijWBRlgPU3PgSI4Y4Vwn34HsRs/C+iWa+7O8qviJoBVZKOPYdlnRuKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f2NjUNd+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802AE606A321;
	Tue, 20 Oct 2026 07:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f2NjUNd+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792482882;
	b=OaODTsLxU7bUtb1xEDOxbmUcFlE+Bnst0pUOHIfg93140+vkoi/DvZ1KjLvgvqTfIAJR
	 mpIMju7qVfBUGFtwryaq65po4/tW2x/6mcBZYiHvy22ru8n9cBHeONu9d8Q+xwe2rh0e/
	 inBdVpOy2kXACZFJXwy0+t+GwrOb8JK0qWr4K+P+ckXwq3ImRz/YR7gCk2GhltQOIrN51
	 6WTRSXSaOa4IVk4dl/edMQtdjkq5+QQKu50DXunRQzVSJmawWwwG8aiBQ2fKOb4yrUkgm
	 HQ7C4ZMD5sUD+7ulmHEJKM4hPVTEbV9mfyeAAlxDLBLLt+arqUaAkMam66etTO1tPtw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792482882;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+d54rXQIumfUS1Nh4QPlKdXgz/z2AgDR5ARBD6dkc1w=;
	b=mq/pwn8Al3UdIO3Osi+wLEtpqVeFFX0o4/IfbgFlSSs9IATh/1pvwSktWb1MP+etwnM1
	 h5YUipEpfD8tHCkaMxWh+2NZFlnYAtudo8bVwYvSiMPFIa6RwDcYC6+4bSuij+lzv0rk/
	 3KldNUMHBoFbT9bGloJCxcvFjQQiPdFkVEW+PYiOUP7KslJbN9BhiSxqOh5Co0krFA384
	 uBZhezgiJZSMyYq6ImY4+J69HHsLQnlMz0fm5EsNBHlddZyB/+2Pu55zHvVq9BTsWYygZ
	 8ot76rtnC7Kfo1ZkCyAhQIz7+R2P6BCMHXVo+BmF2slCY4nKMGYAqd0e5p6oB/EXh7w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C7FD1F000C8;
	Tue, 20 Oct 2026 07:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482882;
	bh=+d54rXQIumfUS1Nh4QPlKdXgz/z2AgDR5ARBD6dkc1w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=f2NjUNd+GUUcBSCsik5NhmEV9ihKGddrr/xsLdEnqQL982AqcixRTRO2enfybM+EM
	 FKng/UakacMfsvRgOHRM9xqF4kjCqnHjMYjZ8gTapORrTBNnB3ksWdu6O2zvvUbJco
	 G20TMHk8/eoIoWSjPF9mxp/MgNI7JEu6bQT28lnoloU9ievj7qJ1wEQy67WlzYWDXT
	 RDrZTFCjuLg0n+VYdP6vSCGYXJIru3zDbe6uF5kmpLgjt6dj26UKI4NhuySKLBurlS
	 tdVmEd2RjzGFkjDK6ORCx7iOwjgaiCuYNHGcTORWyQuszj+XaZMHRCy1iRvoVNk/lt
	 A07trN8aCJ9HQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7DEAF4308A;
	Tue, 20 Oct 2026 07:54:40 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 20 Oct 2026 15:54:06 +0800
Subject: [PATCH v11 2/9] gpiolib: regmap: add
 GPIO_REGMAP_QUIRK_SET_AFTER_DIR
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261020-cv75-gpio-v11-2-e058bae19571@ambarella.com>
References: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
In-Reply-To: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482878; l=3590;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=zPPnnWR+Tk9KmOlZqDgVRk/jbQEDkUVlLOB0ZfAU6RY=;
 b=ZoJ5CbLMEjLTeGpaU/ZLqRYyjjJFo3c+JV8J2x2lNjxzKwZ3kbkYH2X8B0wZtPh3hNxS7t9KN
 loF7hCLrZ3lAD3lIrTpH5GPcU03xK06OGE0i/j7lmaziIhDBWoIb8xZ
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

Some controllers ignore output writes while a line is still an input.
Add a behaviour flag so the output value is written after the direction
change. This is a legacy quirk. New hardware must not use it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-regmap.c  | 15 +++++++++++++--
 include/linux/gpio/regmap.h | 14 ++++++++++++++
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 51b4d69b8740..0a44deae3d01 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -33,6 +33,7 @@ struct gpio_regmap {
 	unsigned int reg_dir_out_base;
 	unsigned long *fixed_direction_mask;
 	unsigned long *fixed_direction_output;
+	unsigned long quirks;
 
 #ifdef CONFIG_REGMAP_IRQ
 	int regmap_irq_line;
@@ -271,9 +272,17 @@ static int gpio_regmap_direction_output(struct gpio_chip *chip,
 			return ret;
 	}
 
-	gpio_regmap_set(chip, offset, value);
+	if (!(gpio->quirks & GPIO_REGMAP_QUIRK_SET_AFTER_DIR))
+		gpio_regmap_set(chip, offset, value);
 
-	return gpio_regmap_set_direction(chip, offset, true);
+	ret = gpio_regmap_set_direction(chip, offset, true);
+	if (ret)
+		return ret;
+
+	if (gpio->quirks & GPIO_REGMAP_QUIRK_SET_AFTER_DIR)
+		gpio_regmap_set(chip, offset, value);
+
+	return 0;
 }
 
 void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio)
@@ -376,6 +385,8 @@ struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config
 			    config->fixed_direction_output, chip->ngpio);
 	}
 
+	gpio->quirks = config->quirks;
+
 	/* if not set, assume there is only one register */
 	gpio->ngpio_per_reg = config->ngpio_per_reg;
 	if (!gpio->ngpio_per_reg)
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
index 06255756710d..f9090073c852 100644
--- a/include/linux/gpio/regmap.h
+++ b/include/linux/gpio/regmap.h
@@ -3,6 +3,8 @@
 #ifndef _LINUX_GPIO_REGMAP_H
 #define _LINUX_GPIO_REGMAP_H
 
+#include <linux/bits.h>
+
 struct device;
 struct fwnode_handle;
 struct gpio_regmap;
@@ -13,6 +15,14 @@ struct regmap;
 #define GPIO_REGMAP_ADDR_ZERO ((unsigned int)(-1))
 #define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
 
+/*
+ * Write the output value after the line is switched to output.
+ * Needed when hardware ignores output writes while the line is an input.
+ * This is a legacy quirk; new hardware must not use it. Direction changes
+ * will glitch.
+ */
+#define GPIO_REGMAP_QUIRK_SET_AFTER_DIR BIT(0)
+
 /**
  * struct gpio_regmap_config - Description of a generic regmap gpio_chip.
  * @parent:		The parent device
@@ -48,6 +58,7 @@ struct regmap;
  *			(Optional) Bitmap representing the fixed direction of
  *			the GPIO lines. Useful when there are GPIO lines with a
  *			fixed direction mixed together in the same register.
+ * @quirks:		(Optional) Behaviour flags, OR of GPIO_REGMAP_QUIRK_*.
  * @drvdata:		(Optional) Pointer to driver specific data which is
  *			not used by gpio-remap but is provided "as is" to the
  *			driver callback(s).
@@ -98,6 +109,9 @@ struct gpio_regmap_config {
 	unsigned long *fixed_direction_mask;
 	unsigned long *fixed_direction_output;
 
+	/* Regmap GPIO behaviour flags */
+	unsigned long quirks;
+
 #ifdef CONFIG_REGMAP_IRQ
 	struct regmap_irq_chip *regmap_irq_chip;
 	int regmap_irq_line;

-- 
2.34.1


