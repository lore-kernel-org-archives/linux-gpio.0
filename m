Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793074769;
	b=Fzqzzh+c4hrv/g45nyS8WJaoSQzVdqpzTIt9h3uyPMWrFB/KDye3066nMnB4byYM6PQ4
	 hTzbN1eFmOMrCtuumnSXpJBzD+0uQ1lLD+JlzYad+AXqMkU34L7xW94PEE90R9ybfnPIk
	 pvjCkkzYbPlRaLNvcb94jNwda01f2yt662Dcf3tYtSIH9vncm7drQ6uFyrd7Vq+L9qBzx
	 2g9MsaL1FZSRz/W5YthnlPZC9YHge8fYLzODyYExUTaHYbYgdl1ey93ljfr0wzHNcstVA
	 C3c9uXINlUxkbGVYN6oLm59fHGJoVY2G/rRvyukiJKYwaqU/ASaD5DMv6gmSnFW2EYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074769;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+d54rXQIumfUS1Nh4QPlKdXgz/z2AgDR5ARBD6dkc1w=;
	b=pxgDx89XGuGsyqMQSYYdmELYHBcmqiJjXrc1Lmp/+pWzX0EhPH2QuMY20p6lagNSQaCz
	 SB29OjWvIAinHMFAsneY9fw4ctVOcvgktei9T4dhATb/fXRLnOa09h24OVbW+QRtJGe5u
	 KG6/eMEqlpgh0nSowCwJTco2OP4xWFzEc2ZRyW/0O2sFbm5uDQM9nXcG/x5VNu58a45ob
	 MyzVeNd3BE3JvgP8GM0yG6F6seDQMHnimi8CsTLMQNBfSDWo0ARdiKfupSGErZso6RwcQ
	 RMuNGuTG/V7Ua5eX6fCVbj2RXtWM3RXsjPB/ilTG3VJDombQMD+cpTlxddKFU7YegsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIGBIn5L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12DA606A31B;
	Tue, 27 Oct 2026 04:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WIGBIn5L
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793074768;
	b=rp3ywWyJ+Vmp5g64zP7vFm7CJASKgA2vHMdNPVkdQFGQnJGFngMd3iAyIfxXdDgyYmnM
	 C1YQmpHNjtg4FBPUqn4ZxFpLRghohrDJabDjr1BwoVeI48jWbphLDp/nQtiDPG41Ix5Jk
	 X7UANKKBwB2Jq2bzdvKX8eXxtoWo5obIUT32+kq8pEaLyqANpvdN1z2CRYAGXtiJ3zXub
	 9ByNZ9z9U8wN6AyfrGMX3nKcQP56NckxYz8jSJO3hnkkIXuuMPVgyTRJ06e//K3T01pV3
	 Q+DgHMzQvHU2RkE2XVTdYN3iw+EGfzhUJT4ocbXmMtAJpfqiLAK0Mj241WCuFht9wig==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793074768;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+d54rXQIumfUS1Nh4QPlKdXgz/z2AgDR5ARBD6dkc1w=;
	b=zVOMwthrT/DQFtYpONP9ggSOsV9X8ajosI26cbcNhxJdDxi+v7wTrSSJy+5out2bjzqv
	 OjS9Iwd3milCL+ThmbuD52Flq+rZbqu3QD8FH0+UFGBPyTjIT+F96mHDY3iWBT2dDPBen
	 VLs5sMB3R4LxP2Yk4JAXRz9RGV5Z5MyPLAeJlIretXZIZuJ8YN9jw0q2Si+PF8f6fSJh/
	 S0EvMlPpippByfzeiSW+A3tPU0gz2lsTZ9+6+depC5I/tFsFiuuLaRva0j5X7e2O/P1pV
	 YoGzoNxFd+VbyFzCx7q08BAgmAjGtKlVL5rJ5lO1bxCVFEayave545iqRYAsxR1UwzQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4080A1F01828;
	Tue, 27 Oct 2026 04:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793074768;
	bh=+d54rXQIumfUS1Nh4QPlKdXgz/z2AgDR5ARBD6dkc1w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=WIGBIn5LBW+ydJGEMmYvNuuyLKVIcUntCjZRbdXD4xBpka/M+eFhX3lY2D4nV+arJ
	 FmaKiHtEO264NrCfy0aZ06YyvMKem+EJ1TQbyRDSe3Pl9XD+a6le6XAcILUoxr6dm7
	 /ELRaZcSC3H/HC72Anx6TmQDXIOIhehXB0zHC+lIF18d/9wWRx4waA77QuIfDzc6qi
	 8V21A37KER3L+DQyzhK0Dyn/Ex68o8Wh0SpwoGz9g+mGGGkKO1mU9TSMh9Uk8ZlqKg
	 rgqta+pDXtmirf6ay2lIFJeJubi4Q4DzWeB0PdA8rv5NLEOpVQnhVLPILrNAQHBPIk
	 i1aehqKDSuVdw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ADECB44F84;
	Tue, 27 Oct 2026 04:19:26 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 27 Oct 2026 12:18:49 +0800
Subject: [PATCH v12 02/11] gpiolib: regmap: add
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
Message-Id: <20261027-cv75-gpio-v12-2-c22555400e18@ambarella.com>
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
In-Reply-To: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793074764; l=3590;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=zPPnnWR+Tk9KmOlZqDgVRk/jbQEDkUVlLOB0ZfAU6RY=;
 b=P1jNZPaLk9k0j8VYaBi+gakeSxXAIZGGICjHH7CeRkNQDoOyJaX3BNyganHonh4tfBn+8xtaq
 eBTmvkbVTXvB+oGguJI5sYzKob9EyyV4Jj88SvuQlUPPRvvhA9yAXt3
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


