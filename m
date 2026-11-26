Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795700488;
	b=0OaMcIvV/SWiqiFFWGSDYGLiKrYYmX/MU4t974Jhn7pwxMgD7sB2gRpJCExiKfkKPc3H
	 DrkMomK4sONzE5amBom9Gxcvtmz3LLIPyqHmJW3PGPD7BP6mIEuZWpEtYoMFpT7cRrswl
	 mEUrZ4igapid3UpeX2PUjULMBxuZd06sYIb1SfDU5u2kZlIe9UQleD/fLRUIzX0e25gYI
	 CqNdk1ViQAM2fyX7ysYWssQXssJx3bz8hhkoqQlg4jaFvbJK5whUUrGptjpa8btMLggwF
	 M8IxEtIVuc0tr6qu8A0l+Ygkr4hANw3ag91BDzb8Zt75P4k2SIhp4RomEYt3iJcG6tQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700488;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=v/UER2wxTG76a+x00A+lxOiWLSJ5EK7o4LJAQXuOeRM=;
	b=s/yfPDpQI6rIWst87DBHfBZjVLGyd9W1c/bNDhiS8yCa4Lo/T6zDbSD/MSVPyKGPhpoY
	 tUuLnzD5gjsve/SBsoq9fbA313Scyc08vKEHbCkgPGp7BdqsN3IYvbIHgJgo5U5HohxKo
	 xGSWKEIbQA2tsgdcZhFT6cpYsVtNujZgLCBISZGFN5/96SVwAZfR+m/wFmlKLP40947sN
	 0G68GvQeRygB/33O39+8rgti16g2u8r1Vt3TYaicPDs0RDuR9F9nYwkqrBAwF9GlYyCdV
	 mQrIhiW7PyAPi8/gKksk7eQ9ECbZkoRCOrn0SYGS3M/FOFQ+EXYXyFQEE0CTwIKIuig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jxhsUbiS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776CF606A331;
	Thu, 26 Nov 2026 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jxhsUbiS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795700488;
	b=UnDuLOTAb5RemfxQVuDMR0D2+scM0V5eG8igBX7q1JY3U2xsI+qomNw+F0YCgiVc4RHv
	 uqtWwfkjcpic/biNOCZCQCKL6vp4W4/ug89pL5cAIYIaonj8N+dVRYKDFSW5ihI31Mm5S
	 iNTpqyDnlBc3wB5Wjexsgq8+4vGYOni+1qMXtX6u/QzZFY3TmUGUU2obAVC6zbkixKTBE
	 /hEKUJAswYW2MqbXfiO3RXF2ieYcYJ8Ha9heWm4jnIOJ1I5gUjffCyL2a26dPFr7T37F1
	 cYWochGisMP7NBM4S1tULrxxtiGE+szaf88BKttz4RNGuzdmSHvmbQeHztsCt/MDQ0A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795700488;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=v/UER2wxTG76a+x00A+lxOiWLSJ5EK7o4LJAQXuOeRM=;
	b=VZ3AYOAkOh8NgJu3mWcByBoeTN9T9YlBJS/ynfcF0C872MnQMhI1awS1YdR6FXsC4P3o
	 XcCNzVy2VQp6LllcfyFYLBhaLAvPpkQzpklvVJmgepvZcqCSLt2ipQldfmY/rcljDwrkJ
	 VY2eWGrUA5VI6NiEw8PjplsfkiAcQkTexr9w26tH5Ttl6xAGohYq3udZcxA+3ybEUAY/C
	 XgF0HmM/XFhigZRAFkl+NlFTR+fk2TEjq2FqJX/ahe8GlIBMa41LqFqaR6Dlw/asoSmkl
	 d1LzzbyLkGBB/VFbJnrfm/+Oc88jRLfjvoQ5lQRRqvwF/IgzecLFr1Y1WaKLp5FX21g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 082111F000E0;
	Thu, 26 Nov 2026 13:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700488;
	bh=v/UER2wxTG76a+x00A+lxOiWLSJ5EK7o4LJAQXuOeRM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jxhsUbiS1rSck+Rw9bzs2sZe5w0p+su6TE8MJ4ONWry5YjWc2atlaZsT3kD8kryfR
	 E10eVKHssOTxsaevcMwW+ATu971gV4ZecIzrSfSYlKkMYl6kZBBMcsrKZNXkPSofbz
	 2VbSGEOVcfrsgoz6Kn4jPW5hroKEvXpp8ygvev9/gP1gX4oJCuw9zaVIsPCSMDxGz0
	 C6icUJOjihnzbKonmWIHNvmddGxQHtvTA+lPjICMCWwbhGThjTKMkl1qAg6whnFZKQ
	 8aJD1q9Juw7ArsSmRUnjgb0zvDqlUP60NhZi/VTFgE9N1ydb0B+dgxrWbnfCWjydPX
	 EvYMfd/gjRuYg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8F1DB4D55A;
	Thu, 26 Nov 2026 13:41:12 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 26 Nov 2026 21:41:12 +0800
Subject: [PATCH v2 4/4] pinctrl: sunxi: add support for the Allwinner V861
 R-PIO
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
Message-Id: <20261126-v861-pinctrl-v2-4-b1875a6a9bb8@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795700469; l=3434;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=2XU7vateLWk9YQRUatN0AylVhwFzxYjWU4A9VGpze8I=;
 b=O0H+bn2Dq5Sb76ZGsyddpbqllcunAK8tkbjlJJtnD/6x1d9dfI94gvMNk+8GecCPdeEbEL6gw
 zmZUjuq4ldABw/p7SDvwGam2C79Qr796BsX/XFdlCREK0vrVLFsCVIa
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

Add the V861 always-on pin controller driver, using the DT based
function tables. The manual calls it RTC_GPIO.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/pinctrl/sunxi/Kconfig                  | 10 ++++++
 drivers/pinctrl/sunxi/Makefile                 |  1 +
 drivers/pinctrl/sunxi/pinctrl-sun252i-v861-r.c | 47 ++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)

diff --git a/drivers/pinctrl/sunxi/Kconfig b/drivers/pinctrl/sunxi/Kconfig
index 2d5ace1e5f5f..80a53d3619d4 100644
--- a/drivers/pinctrl/sunxi/Kconfig
+++ b/drivers/pinctrl/sunxi/Kconfig
@@ -96,6 +96,16 @@ config PINCTRL_SUN252I_V861
 	  PA and PC to PH banks, and is required on boards based on this
 	  SoC.
 
+config PINCTRL_SUN252I_V861_R
+	bool "Support for the Allwinner V861 R-PIO"
+	default RISCV && ARCH_SUNXI
+	select PINCTRL_SUNXI
+	help
+	  Support for the always-on pin controller of the Allwinner V861
+	  SoC. It provides pin multiplexing, GPIOs and GPIO interrupts for
+	  the PL bank, and is required on boards based on this SoC.
+	  Say Y here if you are building a kernel for such a board.
+
 config PINCTRL_SUN50I_A64
 	bool "Support for the Allwinner A64 PIO"
 	default ARM64 && ARCH_SUNXI
diff --git a/drivers/pinctrl/sunxi/Makefile b/drivers/pinctrl/sunxi/Makefile
index dc7559e260e1..f3e601f61ce3 100644
--- a/drivers/pinctrl/sunxi/Makefile
+++ b/drivers/pinctrl/sunxi/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_PINCTRL_SUN8I_H3_R)	+= pinctrl-sun8i-h3-r.o
 obj-$(CONFIG_PINCTRL_SUN8I_V3S)		+= pinctrl-sun8i-v3s.o
 obj-$(CONFIG_PINCTRL_SUN20I_D1)		+= pinctrl-sun20i-d1.o
 obj-$(CONFIG_PINCTRL_SUN252I_V861)	+= pinctrl-sun252i-v861.o
+obj-$(CONFIG_PINCTRL_SUN252I_V861_R)	+= pinctrl-sun252i-v861-r.o
 obj-$(CONFIG_PINCTRL_SUN50I_H5)		+= pinctrl-sun50i-h5.o
 obj-$(CONFIG_PINCTRL_SUN50I_H6)		+= pinctrl-sun50i-h6.o
 obj-$(CONFIG_PINCTRL_SUN50I_H6_R)	+= pinctrl-sun50i-h6-r.o
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun252i-v861-r.c b/drivers/pinctrl/sunxi/pinctrl-sun252i-v861-r.c
new file mode 100644
index 000000000000..57b2d0ef1e14
--- /dev/null
+++ b/drivers/pinctrl/sunxi/pinctrl-sun252i-v861-r.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Allwinner V861 SoC r-pinctrl driver.
+ *
+ * Copyright (c) 2026 Han Gao <gaohan@iscas.ac.cn>
+ */
+
+#include <linux/platform_device.h>
+#include <linux/pinctrl/pinctrl.h>
+
+#include "pinctrl-sunxi.h"
+
+static const u8 v861_r_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PL */
+	{  7 };
+
+static const u8 v861_r_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
+/*	  PL */
+	{ 14 };
+
+static struct sunxi_pinctrl_desc v861_r_pinctrl_data = {
+	.irq_banks = 1,
+	.irq_reg_base = 0x40,	/* PL_INT_CFG0 */
+	.pin_base = PL_BASE,
+};
+
+static int v861_r_pinctrl_probe(struct platform_device *pdev)
+{
+	return sunxi_pinctrl_dt_table_init(pdev, v861_r_nr_bank_pins,
+					   v861_r_irq_bank_muxes,
+					   &v861_r_pinctrl_data,
+					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
+}
+
+static const struct of_device_id v861_r_pinctrl_match[] = {
+	{ .compatible = "allwinner,sun252i-v861-r-pinctrl" },
+	{ }
+};
+
+static struct platform_driver v861_r_pinctrl_driver = {
+	.probe	= v861_r_pinctrl_probe,
+	.driver	= {
+		.name		= "sun252i-v861-r-pinctrl",
+		.of_match_table	= v861_r_pinctrl_match,
+	},
+};
+builtin_platform_driver(v861_r_pinctrl_driver);

-- 
2.55.0


