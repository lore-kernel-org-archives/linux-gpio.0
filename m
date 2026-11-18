Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987756;
	b=B1CfglKx9MOkQr0ygTOS4ORmNevOgmsWginlWbO7rBH1ebFJ1V4fyy8r3qegdV9zWJxq
	 SDXP6caQvhMxSHdRJB/5L5c1Pa+xRYc3VTr38QkmZw/m5tcC+NDaFhVBn7s0189P+A6rO
	 3ZKgNOG/ya18zXmoQm5wukgbmoLgLx1Qu8lrr3m6HJo9Lf7bLEsDpf/CPFxach7jZVBzA
	 wU89GkqJNrOkDzKh0MchNSfBA6hZ9SDMeTr29FDKG4y1Mvh3J8A//PQICYP1vuV/ur2aQ
	 2zilMMQXT+0SqSj1Ikw58Kz6j7NyyAHjtaNOKtlWuLeI0Q/t7A/93BC54gReTBvmIbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987756;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UcP58Y0bARmkg43m0zYf5aLVENASraVo8C7y53oPi9o=;
	b=v8a8hc0qOk2TXd06apOO0oPLC+6M/tsvXtSIfiYkoflaCyZnDncCkUwJfSo7SGE7sPLR
	 UYMhuyoSw/WOgywQLK8dXO7SoY7aVKDYfBB4UU8yDbx72PkO/eZr9AdMPsmt5ZY80UX/H
	 5U6cEjuNgNO1G6zmUv8StIAR7CaPkUVoE+VEfQBVqJpqxbyQHuE8aoWniaWiEtb2kC70h
	 1DZWRFit3bmOfr5iI4NMrPxba0Gb1YNHEPSgqa337PIWURVU/m4HnN600OCJ8H6s9G6bN
	 ygFnigaDHJy+yD+Bt2yofqg1NZ7DXd/M4AWOsS8CHmJgJM9a0OFYzgETms7Ekwu1XCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XRRXF0+D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6642D606A330;
	Wed, 18 Nov 2026 07:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XRRXF0+D
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794987756;
	b=xBlE0I42tEwq5rny6I9jFJET5RamneKGxD5XWEdfkewf7jy/fMQkrQMEtoMQOcbpOMOP
	 Lv0k97k9wYERSrgUKNbPAV7JUlWlh9e0vRBRRFHg/5VDToW6Mgc6S7aQOiuLd2aJVXbMr
	 +LZFl66LsFIPpZED3pKojq+fEcaPpdVXTuepKphXYv8sEw9DmkcwYkXCZ/0gj/dC7b5AG
	 hf1m1n9HurBAB4D3puJ4bd8E8mmwKGOL0JJgdw4CmiurHLaEvreCEb4YHabRfARQsQ+mT
	 iGowKFzLQeHlCCoLM7ZMf8UCUOZAwF4viBNtY2I1FLW20jo/WF5tQ2pBC88M+dUF6nA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794987756;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UcP58Y0bARmkg43m0zYf5aLVENASraVo8C7y53oPi9o=;
	b=f6FPu0+gcnsAXj+AWv7ecq5ibe21hSg933TTwM1taijWaPBvf8z7kXVLTUdH52WTlp1e
	 IMLe4XR8JMVtM8eOEin6kY10AyWCfzCwK24ewXs+6+c70X21SkXiagjTvyL7gld8Bkfwx
	 51478QPnal5/gDgU1S+/egpcqymfRifUuTmo9KDAu4ir+D8mWjrABSMeYu94GAnqovSjJ
	 bXmKp+4DdXoSkCzKB6mZQXOXR/U8HRowMe5ZoGYY/svU50WzSFVFRoYngqpxB2zd4pcG3
	 +NDjdvYL/g5eDksbvshdCKULA4dIvuDu4+6uIE8OpvRP95qmo8jDka2ZSOMBXgOh+Mg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F7541F000C6;
	Wed, 18 Nov 2026 07:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987756;
	bh=UcP58Y0bARmkg43m0zYf5aLVENASraVo8C7y53oPi9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XRRXF0+D/2txIrK7b/BZSNb1ExKyYYO0aQEH09OEBncOU8Y4iB2x6Z8GhQS8RmMzJ
	 Hgmj/I+bQw10dbTVC720byIoa02Xlmrzc3/v1+pnU8og2TA1LaZB7TiP+zfA9Op+0f
	 SvNlX0IhbF5yH3rU0aHoDP5TPiU/94BGR2G3rS2pObmK0iq/mYq64Lou5/+EFwGXaf
	 XhoGuwhm/XAioLoHoijZreDN8P4Lw7ghKWsKrNtA07CsVHwYmd1VTvm42SPJ5C2dkz
	 NpeIJd06qKK8KVQAMgCnzd7Eqsk17OaNhUiau6cY5A/ug/LBShKbG/4b/mcucv8KwM
	 kncvlPFQbQnTA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9F96C4AC5A;
	Wed, 18 Nov 2026 07:42:34 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Wed, 18 Nov 2026 15:42:19 +0800
Subject: [PATCH v15 02/14] gpio: regmap: add
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
Message-Id: <20261118-cv75-gpio-v15-2-e3c563673fe1@ambarella.com>
References: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
In-Reply-To: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987752; l=3591;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=aYiECOQDsnh+xBrOd18QO3IMwGNlRhtJ7z/ORwCm3gI=;
 b=NsBSCtk78p2FxpcB0LDbdvS/S5+N0Jyq+gMTfqtJdUs4cDlaMHiYyeZyORoKE2B+KkZZvvon4
 TRHqfF3tzIlDfafoanCM0aKBXjCGfpbQEFTJV7frtLqt6F9yN0xH+cQ
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


