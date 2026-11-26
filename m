Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795700492;
	b=BK2mHiYiQoBATiiDWASjZ5eF2SGQ1QqdK3zNYDoZnRqvELyuhnGR2NIYUUDGbQCw0gd2
	 5bbDmlMMfrkUiMgflbEB/sF5qaA5srFJC+fBbp3mTmmE6f4jWEGk/dkwhZAVKVrHFbWfM
	 /Rzk02JRKzkhc+yjf2e26f6IZj2i3F9w3hBXAOKZjzemSt6ocnp+9AijaEb5bwHnJQ8t/
	 ASvNOOzLu+2zIhDhmFykTrFjntvnR6mH92tZ4WzzMNXHgOmrn+aVfq2r7BkvgL0pxtRux
	 0z74PDPh2ZotIcncAR8GJc+vRBLCerD5RNS9L6VdmnRHEDJ1QoyJllWS8VssyMxBYbQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700492;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LoFk6tLmqavpwt/x+xZxP3TWszb/19lT2pQ22w/RzXw=;
	b=1rwE8zMm2iI8cqT3K0zdZOnjyBZkSvMaQYBfiimYH+rCVVrC7fHTsVNZPj4YdpJKVbRq
	 tlXJonCNGAH01nX7oMfE1owj+1qFrTZn0fnYkG2AhyBSulfJY/+f25sxtdlUoPLJ5KUxn
	 VTF8Ko5UMDVXZ1pLVoeoYS5DVclh9DVb91FcGAM48empFbopiCkU2npJlkJkOCnLmjndH
	 Aq7ah5Wr/nD9nSkjJUJK4T4n30vrDn0Bi3ojX1i9GOIYUJSAOvbPsHReN0RIM4BGquYdm
	 3g+Ms7oGZTi64h/YlNG0PQ5OBuGQ7gFX8WtqmDq7MF8Zicj1SiO6muss2E497qMn3QQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HkZEcwqs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EF6606A680;
	Thu, 26 Nov 2026 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HkZEcwqs
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795700491;
	b=ewiiNsHEbAKLsNlEGDdiYWumtNCs2zGqIi9EYAJDjs3cKhjldRNeEC68BT9WSZo5utEE
	 FNwVFwTVXRH1C33LuVcjMbGgAxy6gbaZ2+BlC64yffqigJM6yDstCzLaNUg58NBW7ak/U
	 bXhEkaJj8oD9kZVDVc+puTySWnSO8RgT18sCdvJUTs4mh+Q+LQ5Wpl4pqjQ4RMVlkwFq/
	 x8qKacp7wIuIy1xvvJh3zrT5TGuKgrqwDLdcvil5pCeMGDItNOdla3ezDugEC1ei4FyoJ
	 7Jkmn35SSYR7Plg4mNS3wdjB/Xx88EBV+kBCnZd98NybzgSxEGlIDPXVVpxfvmMhlNw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795700491;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LoFk6tLmqavpwt/x+xZxP3TWszb/19lT2pQ22w/RzXw=;
	b=PkatDzbvq761hrXQzB7A0biBhpmTk96EbUoHPgQsizXMaQ+VV4f6O8CTGBCXUB6FP7jl
	 zYD5X1SA6uYWaoZDGVE0oKtyukM9wY1Ht7cImyVSoagqSOGPSr3M5ndHLkcIjbTvGC6t9
	 EY+WZuS1YvIyq2ZHtgFRI+x5V696DHT3HJVJkQ/1i82/YGc1YbgaJa1SOzeOxFfND1mXb
	 scePQ6QIfEVxVRlcfgPVTwLpL9MXzdHT0ynCmOCZtRb4soj/QjkWyePkyVBPzYc+mt4hC
	 MmSZ+5o3g+9WyDPk3KkqPite+4w7ImpZZPAZRDK2/qfzOoCGqsmCjbgv/uXU7NaV7cQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE79D1F000D8;
	Thu, 26 Nov 2026 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700491;
	bh=LoFk6tLmqavpwt/x+xZxP3TWszb/19lT2pQ22w/RzXw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HkZEcwqsARHaVT+PQmaWOkT1+L1fq9dzgYZfCeomKP+q/fPE4Qy3lAQCD+pSIuj9r
	 m1X36UFNS33G232OS8HBZDQsJsedyjvmekIhNUA+sT220Gnjv/AtteLgndKWlGy4JF
	 5HhheyOAinhrkWgU9aBq2Sn5twTt/Lhum42Weo5nov8Vvu8TrXffZ0qcbqjKHVUNAi
	 Ij3HSzjeE8lgUEtZ8mWWUyT/LILO6hEKxJXAYRo1225sHKjgl2qGVivafCz5fEXppH
	 jSTSCPAsliaxtB38o3oAvwaDVNpaQlISx/oFsjp0G/ZYTBwFyyw1juSbAwQeGNSyHL
	 OMq92gwuco5uw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 705014D556;
	Thu, 26 Nov 2026 13:41:12 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 26 Nov 2026 21:41:11 +0800
Subject: [PATCH v2 3/4] pinctrl: sunxi: add support for the Allwinner V861
 PIO
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
Message-Id: <20261126-v861-pinctrl-v2-3-b1875a6a9bb8@iscas.ac.cn>
References: <20261126-v861-pinctrl-v2-0-b1875a6a9bb8@iscas.ac.cn>
In-Reply-To: <20261126-v861-pinctrl-v2-0-b1875a6a9bb8@iscas.ac.cn>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795700469; l=3594;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=nN8xYmDYcv3N9AFviBCLM+CGuBvP/TwudQVXeShFtXg=;
 b=l8SVdVOwUKOtdCSxeA4xzNd64+UVrZVIB64NuTsTnvX4uo+ITwlRMRQYzZD+KANVA740ajOjE
 LTJPUQgVLrLCzaFZHryRQeiVKk6XI5AiX7O7THXdR+Y/A0yxNlkcQF1
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

Add the V861 main pin controller driver, using the DT based function
tables.

The 1.8 V mode of bank PF is not supported, as none of the existing I/O
bias variants handles its control register.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/pinctrl/sunxi/Kconfig                | 10 ++++++
 drivers/pinctrl/sunxi/Makefile               |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun252i-v861.c | 48 ++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index 831bb1dc9373..2d5ace1e5f5f 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -86,6 +86,16 @@ config PINCTRL_SUN20I_D1
 	default MACH_SUN8I || (RISCV && ARCH_SUNXI)
 	select PINCTRL_SUNXI
 
+config PINCTRL_SUN252I_V861
+	bool "Support for the Allwinner V861 PIO"
+	default RISCV && ARCH_SUNXI
+	select PINCTRL_SUNXI
+	help
+	  Support for the main pin controller of the Allwinner V861 SoC.
+	  It provides pin multiplexing, GPIOs and GPIO interrupts for the
+	  PA and PC to PH banks, and is required on boards based on this
+	  SoC.
+
 config PINCTRL_SUN50I_A64
 	bool "Support for the Allwinner A64 PIO"
 	default ARM64 && ARCH_SUNXI
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index 3658c9d06b49..dc7559e260e1 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_PINCTRL_SUN8I_H3)		+= pinctrl-sun8i-h3.o
 obj-$(CONFIG_PINCTRL_SUN8I_H3_R)	+= pinctrl-sun8i-h3-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_V3S)		+= pinctrl-sun8i-v3s.o
 obj-$(CONFIG_PINCTRL_SUN20I_D1)		+= pinctrl-sun20i-d1.o
+obj-$(CONFIG_PINCTRL_SUN252I_V861)	+= pinctrl-sun252i-v861.o
 obj-$(CONFIG_PINCTRL_SUN50I_H5)		+= pinctrl-sun50i-h5.o
 obj-$(CONFIG_PINCTRL_SUN50I_H6)		+= pinctrl-sun50i-h6.o
 obj-$(CONFIG_PINCTRL_SUN50I_H6_R)	+= pinctrl-sun50i-h6-r.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun252i-v861.c b/drivers/pinctrl/sunxi/pinctrl-sun252i-v861.c
new file mode 100644
index 000000000000..b133da6ddf8f
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun252i-v861.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Allwinner V861 SoC pinctrl driver.
+ *
+ * Copyright (c) 2026 Han Gao <gaohan@iscas.ac.cn>
+ */
+
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-sunxi.h"
+
+static const u8 v861_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG  PH */
+	{ 22,  0, 12, 23, 18,  7,  8, 16 };
+
+static const unsigned int v861_irq_bank_map[] = { 0, 2, 3, 4, 5, 6, 7 };
+
+static const u8 v861_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PA  PB  PC  PD  PE  PF  PG  PH */
+	{ 14,  0, 14, 14, 14, 14, 14, 14 };
+
+static struct sunxi_pinctrl_desc v861_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(v861_irq_bank_map),
+	.irq_bank_map = v861_irq_bank_map,
+};
+
+static int v861_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_dt_table_init(pdev, v861_nr_bank_pins,
+					   v861_irq_bank_muxes,
+					   &v861_pinctrl_data,
+					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
+}
+
+static const struct of_device_id v861_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun252i-v861-pinctrl" },
+	{ }
+};
+
+static struct platform_driver v861_pinctrl_driver = {
+	.probe	= v861_pinctrl_probe,
+	.driver	= {
+		.name		= "sun252i-v861-pinctrl",
+		.of_match_table	= v861_pinctrl_match,
+	},
+};
+builtin_platform_driver(v861_pinctrl_driver);

-- 
2.55.0


