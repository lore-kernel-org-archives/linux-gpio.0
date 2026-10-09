Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453B74CC63C;
	Fri,  9 Oct 2026 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543580; cv=none; b=oaf2xJLUez+zYcLo9fI0yeU+pt5pNi8sfXDlYMOl+5u6pD5FVSwLH7DtGq8eTsyeRI925DE/up8Z3RYQeG1ysX28R1Igj1bjh+oam4wLut2a3+3nZhsfTI1PikAOSfBHk4xy2+UU+RKFlZMfSvViKkXi4uT8xcofgDy6hOXyR2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543580; c=relaxed/simple;
	bh=dx4xRd3C9AFjrOjzOBxmsY1xg2916zsyLHgPZr1rAnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6i3oRJXpAMVArbWyCsmHTtdB/4m3NN5lGMby+oKoNZb4X2qfy9sRkzj4RzV1ZXyJbckUJ8t+VSkm4LzbxNn4X9v0derImAVyEBJ0X8IWDQBIbACtzMTAZh7vCorKl0WsBWeUuIcg63csmDWbsIfNLrkOhQV0DyPijIDtzcZprc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWdEib5t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWdEib5t"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEF11C2BCFA;
	Fri,  9 Oct 2026 10:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791543579;
	bh=dx4xRd3C9AFjrOjzOBxmsY1xg2916zsyLHgPZr1rAnE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GWdEib5tSaYQ+y7jr4PLhsXYeu9NvXW2Z2Y0uAtR+vOnAQ/+YLrvYdjUtq91RVObe
	 dqGGMu9SS8DWDSvUERZFOd8k00QrTBotJS6X5z+2wvzJknNMUQ+F5VuXnp5m+GLTlW
	 Womp/c2tsP23+2RUft2ldSWU3pZB4Mz7LytUo9kR4+hju+WDjhLCpGlhSP9ImNfNMw
	 OeW3p/60xFaBhGfefNttikipyZatnbdw5yy5JcYy3bD+VEslr1Jw1Fw+Vh9CUyfJzT
	 Q1m7CCz5u3wCkELWVyFbzqNHmvVCdsjn+V5WW83QJA4S47H8YJ6P+/8v8Y8k3Qenfk
	 FvfeOX3rOrPOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19CECA601D;
	Fri,  9 Oct 2026 10:59:39 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Fri, 09 Oct 2026 18:57:55 +0800
Subject: [PATCH 2/7] gpiolib: regmap: add GPIO_REGMAP_QUIRK_SET_AFTER_DIR
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-cv75-gpio-v1-2-5836bd438423@ambarella.com>
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
In-Reply-To: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791543577; l=3494;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=8SJ4Op0QVPbkfMAiDZHOY/JZVCew6YWhITzl2f1L0Ic=;
 b=OtTOdpp9khhi13af97ltnWK92PUEMpqHrBS8/0kpVlXMDEbBZBTvYP4WaLX9hDn/SG5s/0oov
 nKsbsHfYn85Cg1kqmu5mLTQB6VzeAL6Cl9yBSgy8a1eMpC9sBoeSlaP
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

From: Long Zhao <longzhao@ambarella.com>

Some controllers ignore output writes while a line is still an input.
Add a behaviour flag so the output value is written after the direction
change. This is a legacy quirk. New hardware must not use it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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


