Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794285167;
	b=UceU9ej7POQDM3J38cZkjkHfGqMO2ayfULJ2TXNgd89CEBu6in02naKZIK9kxYiSqiKc
	 0PgFTwCyGZaWFS+IgyzAtq4LY++A2odlKNru/jg36m4XYu9MbOcYAx+uBj4BYWZCsktr7
	 lHHfQfV41L61pVgkZK9ssr9MO0CD6WxUr9M5KN/cqcqfOQAN4MDEv/+SdmFsbQaxHZbvc
	 GRQX3dJYzBbvthPUiHBRrBKjIIe0U4fLtIcALRzW6i6YmXBzeZRH+jn/34VZI1W6+05iM
	 CGaSN6HAJ9kaLqAAJWFb+IKuM5PIyB/SQRCKyiJ8UV0P9dqx9nb1j+2dOSJpvCmXRCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794285167;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UcP58Y0bARmkg43m0zYf5aLVENASraVo8C7y53oPi9o=;
	b=mUyinWHlsjirImvUQWOGFhwO+ygyR1nlCAGK+DeuZTW2eC21ioGmiuUsL0k92fdUS0t+
	 KI0Z5BxPK/HfdV9jeiOdPysM5imhTWGKgg93KL44BVN/EYQILwoowzVYhRHa7qeUppkxF
	 BGkxTHlqYrUEDh/bYaHL+hd+2woC9lGUTxFairLiXICgb4WLA9yFaFpXpvnWkAPsAxY/D
	 aGB1R61EaTTtp7SL0Dh8OS8EAk8H470yAFsjEAiYY2KXDOnXQsYdiaUgQcLQCP7j5qMOj
	 uYoZ144+gxbcocChXun1ehnQw2fp0T/fQo6nAZ9LfknZBZ2KiZtUFQeO2h2MfnYgKJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L0GQu6U4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD81606A333;
	Tue, 10 Nov 2026 04:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L0GQu6U4
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794285166;
	b=Q+OHO8447T7rPupB2VYNT/aGHJ0N5w82tCSe1jkssA04WcbkCtBU4fPfmZBWhEJKgOBK
	 y5uZhrqP1VPmOBtRn4jQM/N4mEiQm1INiBYWJlmKok2uHOU4mmEw2giAUmFgdCZ4cjJpO
	 ERTvUXeFaG+BY3eOEl8e3bsDk7geOPjnky4xODtD0WgiPSR6FvM6LAKXYEz236tqUyY2b
	 fEltJwLwmr72J6nFJbA3cBYQTeah9/c/eRY1/YECxnUZ9mcBQcflOyUVTRbzOeRySRu9O
	 M630L15Khc1B5xbpSt24zEf6/4yQYWyo9vUPnUO7LWgaulJwKqYllBUfoZKL/J9/Byg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794285166;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UcP58Y0bARmkg43m0zYf5aLVENASraVo8C7y53oPi9o=;
	b=iW9uw/7rgtxO3UZS5LACAdaBx4Zc7QArr1ilhurBT4Uc3+tEITdgsUVKca+hGqNyhRvr
	 IMfttqKZYwo4riQ+jfroKBVfNOuAtKag6N+RiYWI2QXOryE23SSCcBH1ulVF/TZUD5v+m
	 TheDs+30j0PNDIiFTof2PGmxs0uBGnm5KWusML3a63zsC7+2U2TOsPkCQjYKkUNirqnIN
	 +yExGz9rtUZUkIVvtW+4XLoJc69Q5K1ArsOlpeSn6nVG/ZW3ZJiSwavQnHLs/Ad/pAH4S
	 eqCFmKp6NUhl2IRi0LR5wxkIbhDjTEuBD60I0ZVObB2/L+xwlTsfAJmymsNQn2m7kfw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 218521F008A2;
	Tue, 10 Nov 2026 04:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794285166;
	bh=UcP58Y0bARmkg43m0zYf5aLVENASraVo8C7y53oPi9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=L0GQu6U4vs6jqYB1sczJi/1RwT9XlkpRjT/Wm7HL1DWBiv0hpGUwvUvuwKapnTJCt
	 N9B1gXluuoSyK2x00zePxCNFF88dwU2ZisQpEavb5CmYy9EbeATQ9IdUpZX7RQojE+
	 gPa2EEQHxPqf2Ww5d4FXpz4o0OyAXBLNQVv1soaAfCeG30eJEwtrnWO76fdTjJmxxs
	 9JMNzIhLj5631QcfUV9+iR8Zo4D+W11lhHpafSQap7vLM0sOwDmKXOqmVJOErTzYeM
	 e6/DcVxCA6AjZjHEMNHfr44+4LMxbco+dd30D4HNgGuEyX0hR/qUovpuL+rbqnYX+a
	 D0ryXXT0CQ6pQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A14DB48855;
	Tue, 10 Nov 2026 04:32:44 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 10 Nov 2026 12:32:27 +0800
Subject: [PATCH v14 02/14] gpio: regmap: add
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
Message-Id: <20261110-cv75-gpio-v14-2-e586aad0467a@ambarella.com>
References: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
In-Reply-To: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794285162; l=3591;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=aYiECOQDsnh+xBrOd18QO3IMwGNlRhtJ7z/ORwCm3gI=;
 b=kX7szq0N94gZ0Nw51q6PL3e18rOB01zJrJJMn3UkITAqa0gnkDOF+VXUKbOZiwnttrsffZ/Za
 sTynBbgADxJAnfLwfTOWaaqniGKf3d34K24+GGp0/r3owsElMdw2dZC
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

Some controllers ignore output writes while a line is still an
input. Add a behaviour flag so the output value is written after
the direction change. This is a legacy quirk. New hardware must not
use it.

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


