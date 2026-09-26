Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02D24457C6;
	Sat, 26 Sep 2026 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790434339; cv=none; b=tPCrHwOhLwUtiK6a0grYaw+M8WJ/3zDK1Ktjl/RwWnzOHFxsu464agqr/3hxYHGXMzi1T+g2pUBsbgBFFTlML/etB4lT43fd0cgW9Y6GY0txYmjMajqdV545QBg9oBbBwAtDoUgZzdmnA/L78EZCv3Pv2XBkJztX6ZZ9Oj/QR08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790434339; c=relaxed/simple;
	bh=YhOnroczOeyZBNtumsfhr+6nBMM5ISlTs2iBtvA9eLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b+qsIjWxmUgV4Eb0gaXsEmUVbJs/c5gLTvenvIj1oLNV/KasB9TjHCKnE5DjT5QIop0aUmrUxOHeun2gJOHVdA60CxwIsgT4A5Jsltcbv8hwTDhyLqfzZBPblUMfw+qvnb0qdPF6wIJeNo46XOFrMOiCRoUa/L/zhPQgSeFFUWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=xFl6egS/; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="xFl6egS/"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1790434329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pMERds1aQrUorYxnjOG7U3TBg9X08veCZQ/DwuVV+W8=;
	b=xFl6egS/phrUrCgkYxRPqLQxfqS5RP3ZKrYS1/5OajXWDTiAb7N1l5MP69vR5jHB9KsSFz
	cTWg8UIMCWGQy26ugxRqy3MUfeu+B0jIqmlZKqqBhOl7gjxRDduPd+92qAftJ+Cn49LKLD
	EFc3CWQEWdKDYA5n8oijwhmX2MaMavc=
Date: Sat, 26 Sep 2026 16:51:46 +0200
Subject: [PATCH v2 2/2] pinctrl: apple: Add t8140-pinctrl support
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-apple-pinctrl-t8140-v2-2-620bd11cd2a1@cyberchaos.dev>
References: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
In-Reply-To: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

Ensure the regmap does not attempt to read REG_GPIOx of any of the pins
marked with gpio-reserved-ranges. For this purpose, move the regmap_init
just before the first regmap_read, at which point the valid_mask has
been populated from the gpio-reserved-ranges device tree property.
With this, make the driver accept the new t8140 base compatible as with
this modifications the driver can now be loaded on this SoC without
crashing.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 drivers/pinctrl/pinctrl-apple-gpio.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 6305b96aaa73..6b26a23d283c 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -66,6 +66,13 @@ struct apple_gpio_pinctrl {
 #define REG_GPIOx_DRIVE_STRENGTH1 GENMASK(23, 22)
 #define REG_IRQ(g, x)        (0x800 + 0x40 * (g) + 4 * ((x) >> 5))
 
+static bool apple_gpio_readable_register(struct device *dev, unsigned int reg)
+{
+	struct apple_gpio_pinctrl *pctl = dev_get_drvdata(dev);
+
+	return gpiochip_line_is_valid(&pctl->gpio_chip, reg / 4);
+}
+
 static const struct regmap_config regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
@@ -75,6 +82,7 @@ static const struct regmap_config regmap_config = {
 	.num_reg_defaults_raw = 512,
 	.use_relaxed_mmio = true,
 	.use_raw_spinlock = true,
+	.readable_reg = apple_gpio_readable_register,
 };
 
 /* No locking needed to mask/unmask IRQs as the interrupt mode is per pin-register. */
@@ -90,6 +98,13 @@ static u32 apple_gpio_get_reg(struct apple_gpio_pinctrl *pctl,
 	int ret;
 	u32 val;
 
+	if (!pctl->map)	{
+		pctl->map = devm_regmap_init_mmio(pctl->dev, pctl->base, &regmap_config);
+		if (IS_ERR(pctl->map))
+			return dev_err_probe(pctl->dev, PTR_ERR(pctl->map),
+					"Failed to create regmap\n");
+	}
+
 	ret = regmap_read(pctl->map, REG_GPIO(pin), &val);
 	if (ret)
 		return 0;
@@ -475,11 +490,6 @@ static int apple_gpio_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pctl->base))
 		return PTR_ERR(pctl->base);
 
-	pctl->map = devm_regmap_init_mmio(&pdev->dev, pctl->base, &regmap_config);
-	if (IS_ERR(pctl->map))
-		return dev_err_probe(&pdev->dev, PTR_ERR(pctl->map),
-				     "Failed to create regmap\n");
-
 	for (i = 0; i < npins; i++) {
 		pins[i].number = i;
 		pins[i].name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "PIN%u", i);
@@ -522,6 +532,7 @@ static int apple_gpio_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id apple_gpio_pinctrl_of_match[] = {
+	{ .compatible = "apple,t8140-pinctrl", },
 	{ .compatible = "apple,t8103-pinctrl", },
 	{ .compatible = "apple,pinctrl", },
 	{ }

-- 
2.55.0

