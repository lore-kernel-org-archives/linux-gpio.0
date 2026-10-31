Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413608;
	b=iRAnRd1slX8rxTyA7/wSFS2FAKAj1Q1BgsnWeZN4iWJhDDj77Q82sI2c0lrARPNl1Lb0
	 zwCHcYKcQIItn/byzRfWmGs18nVfUAUWxxVAkkUJbw5/kCls/dNPk+i2e7APIXu/p+OzZ
	 kH1mEy35jGAxlS/tfuSbXMkT5eczyk42/R439t6w3p048Bvrjig5M1F3Wj6itBHAb6aRh
	 o9Ejt7RLa7+8WcKiGptuG40nix7tN9S4Jb1bpvIifkF01Lklwpral8cnX752+0cdQgebD
	 B9msPajHx2iMwFg9QOlF3W2QW0Xg7F0M83MUlrHupjsKTSQWLC5i22PyCCGh3cbyZPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=onJ9qopBB2j2Cgb6Ett7zzhP9v/di/tu3NzVy6YdsQI=;
	b=m/HjXLQcce4FnS5P6Xfz52e+ra9fGIrvcTOORdJMHPfogullLcVBIjIw91gZjlQv+Gq/
	 6EebgWcWVt677ifNMN0wfeyldACAKKM7OT19G2bkfBB3AU94i4M7hkPNa6dne5ZFcTT1L
	 43/RSMxkOPTJuzVK4t/S+9Ht0iqFonSyiCAXbLWI4nAXL/PAc3B07x20sSPndoiKOuUFJ
	 NeJWb2yPrqTZILyRmv+8IgnDr7mvHIJIvBGGh4lkcvOojLnhfRUf9YduXTROlTyuqBVyM
	 mlSLFYLt2+KN7gBU+jowQU3PV1mqmX+nRC3CmDnMh/uX4IO3JzaoVepz5Dc3pUTSg+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IL1sHmPL;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB5F606A323
	for <linux-gpio@vger.kernel.org>; Sat, 31 Oct 2026 02:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB5F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IL1sHmPL
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-704597ef1d8so525587eaf.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 19:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413607; x=1794018407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=onJ9qopBB2j2Cgb6Ett7zzhP9v/di/tu3NzVy6YdsQI=;
        b=IL1sHmPLKtU0rRg7pygkrSoGdCemnp4peUGe9lQsQ030tgO11MecsUjgIgrc7Mbvo0
         yVRoNCx1afODLfYi3xDfik0x18vPeNj0te/ipCOmoFHtNBj4PvA6hI7QExBlTuvMzOaF
         y8q3VTYqoQAjia5p413YOfp3UvhYDLzZ2px7PJEeYPYIi/yx2rlx/ATVDazOIWbapHi1
         0lT4tiJXv39Jm0kXOy3+vzub3W9oaFiwK05Q8foJycbM++Vc5H+HSieLnbObT2n5u6NG
         hAEnv5sEh5Osd9J92AKSXeA087grqxKaLcGaSA3nAlWVQ3c1f1Q+VrJ/3v+axbEnpNHe
         nEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413607; x=1794018407;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=onJ9qopBB2j2Cgb6Ett7zzhP9v/di/tu3NzVy6YdsQI=;
        b=x5v7KKg7hJBeKGBGKf50iYrdKNjdzzkWDW5OANy2o8hDp6eMNakSNZmTooY9BmUjsl
         rj4Ml1vXtl+2rDAT9ugbw1QH2QymIWlyaFkm0ZLgqGwtxWVPfBeevguBAbsQHXGoB3d6
         s+6NhzBpkt/tq50G+MtNIozNSPYz92u4Q6st64w8AIGx8wtT8z1F8ss77Od8PzqTxVHS
         qSFBbMfZ6ftayMGl3U1hu4cpxkRvL7MEObuKCbDc0z1nCzRGmlhHDiUS0UxMQCS24phU
         ry+Zut3S5vWwmmJn54f0OfD26CPQXOWjbbWMGEX4rPYzMyXqPI1rlKgMlCqyjp9BiLQw
         EV+w==
X-Gm-Message-State: AFq9FYKndYkH5uaGcRhMcHrE1ZC6jv3dXyK+RS7b2/S19wKw9ljllSwm
	TMqyMY3uh5uqN3JoQVR5gRVyAc7qQBNSeH3yUpkb1eyE6kZxoLrErbhYvvYrMQ==
X-Gm-Gg: AYBFou1x65+ygOf6rvqkSfTP+z0+KDN4/zH+AWhuFzZcCYbTR/KV/HwQii++trNGG5G
	bvRcoicOc5VsVPpFkplFKOnKPmq/NxXpKzWwn8ZmIVW836nrYm7mwBbtMxYCThZUVEsMwJYoC9w
	AHFOjLjUN+/YTJw4aCFCrmeBMZw67TjbBLE+AEbhjHE+eaSR1VJj9zWdQ9Ccap7ZUF4O2bu6ntQ
	uPKOUob1uyKNmuNERAXxn8w31SeTymxqLPH46Lcz2r4ECbo74RqU4QEi9qtHeOow+mgUrItTcWV
	fLv9EkKIVPm0lQf5TPAxeLs6RPKN1boRZWHrc0+uV2ijC90/Oq8Ha7QxHk3PVdqlUxYcIH5YAY9
	m2nHxkkAvv7aNDxEdqLFoIuW+xlneNquM/TSMPrVYsUpA+d52X95aF39wmqTtL1odabSYfe/Uy2
	JqcUhdlb3sR0wCwsvyrRYTcrhptWdnIT793GHDGc/wgodJycWM8Kosa1jtsfjcPqWrRVS8U3OYT
	L8BKSiIdEUjly62dDiQ8RDX1K60Yk02s9AFxpRBkXCpLXF7IsczF2/4jaaxGDF9de3nfw2zNKgR
	hYlUtoq3I8R7x4zPf5KZ8Qjj+yoki6p54gfrDZTjLRrSFTWB83yaKsWZl1oc4G5/ACGe2VvmcKS
	BI2UmqQ==
X-Received: by 2002:a05:6820:1c84:b0:6dd:696d:b21f with SMTP id 006d021491bc7-714f24e7c6bmr2638903eaf.2.1793413607382;
        Fri, 30 Oct 2026 19:26:47 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167984dsm1438390fac.1.2026.10.30.19.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:47 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH] pinctrl: sunxi: preserve A733 firmware voltage modes
Date: Fri, 30 Oct 2026 22:26:45 -0400
Message-ID: <20261031020640-263f7b05-a7s-pinctrl@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The A733 voltage-selection fields are two bits wide. The main controller
uses a separate VCCIO field at bits 25:24 for PB; the older one-bit
handler instead writes bit1 when PB is requested. A733 R-PIO also
differs from A523: its documented table has SEL at 0x340 and VAL at
0x348, without the A523 control register at 0x344.

Stop using those incompatible layouts on A733. Select BIAS_VOLTAGE_NONE
for both controllers and give A733-R its own descriptor, retaining the
A523-R descriptor and behavior. This preserves firmware voltage modes
when explicit bank supplies are requested. It does not implement dynamic
voltage switching or choose among conflicting manual AUTO descriptions.

The public October 14 discussion recommends this conservative treatment:
https://lore.kernel.org/all/20261014183516.172060-1-vinicius.eduardo.pedrosa@gmail.com/

AI assistance: Codex:gpt-6-astra.

Suggested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
This implements Vinicius Pedrosa's recommended conservative approach
for both A733 controllers, including a separate A733-R descriptor:
https://lore.kernel.org/r/20261014183516.172060-1-vinicius.eduardo.pedrosa@gmail.com
It avoids the disputed AUTO encoding and does not replace that public
discussion with a claim that voltage switching is solved.

The standalone base is official commit
d89e1d186ec9271bf78e62771779e9fc03bf0fc3 plus Pablo Mazzini's three
IRQ-bank v3 patches:
https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
The IRQ changes are prerequisites, not part of this patch's diff.

With the separate A7S DT v2 and its PMIC/bank supplies enabled, two
final-candidate RAM boots preserved the main and R SEL controls and
PF supply selector across kernel handoff. UART0, R-I2C0/PMIC and
read-only MMC0 traffic worked, including after unused-regulator cleanup.
The firmware's PF high-voltage path was verified before each boot.

A regression harness exercised 60 A733 no-read/no-write cases, the old
main-handler wrong-bit counterexample, and the unchanged A523-R
handler behavior. Both changed objects built with W=1. A523-R hardware
was not tested; its behavior is retained and checked by the regression
harness. No analog voltage, UHS or dynamic voltage-switching claim is
made. The read-only VAL observations are not precision measurements.

 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 20 +++++++++++++++----
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c   |  3 ++-
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index cffc1e53eef141cf5f00ec37435af0f8f6a94b45..1cfd8118435066b403f8b9b0b3725e849643ff84 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -30,17 +30,29 @@ static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.pin_base = PL_BASE,
 };
 
+static struct sunxi_pinctrl_desc a733_r_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
+	.irq_bank_map = a523_r_irq_bank_map,
+	/* A733 has two-bit voltage modes, without the A523 control register. */
+	.io_bias_cfg_variant = BIAS_VOLTAGE_NONE,
+	.pin_base = PL_BASE,
+};
+
 static int a523_r_pinctrl_probe(struct platform_device *pdev)
 {
+	struct sunxi_pinctrl_desc *desc;
+
+	desc = (struct sunxi_pinctrl_desc *)of_device_get_match_data(&pdev->dev);
 	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
-					   a523_r_irq_bank_muxes,
-					   &a523_r_pinctrl_data,
+					   a523_r_irq_bank_muxes, desc,
 					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
 static const struct of_device_id a523_r_pinctrl_match[] = {
-	{ .compatible = "allwinner,sun55i-a523-r-pinctrl", },
-	{ .compatible = "allwinner,sun60i-a733-r-pinctrl", },
+	{ .compatible = "allwinner,sun55i-a523-r-pinctrl",
+	  .data = &a523_r_pinctrl_data },
+	{ .compatible = "allwinner,sun60i-a733-r-pinctrl",
+	  .data = &a733_r_pinctrl_data },
 	{}
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index 3ebe926a1bc6ba75716f13804db718174b4be229..e2cd7a431af7bc5ec47e8f5719ab11c22b461658 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -27,7 +27,8 @@ static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = ARRAY_SIZE(a733_irq_bank_map),
 	.irq_bank_map = a733_irq_bank_map,
 	.irq_read_needs_mux = true,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	/* Preserve the firmware-configured two-bit voltage modes. */
+	.io_bias_cfg_variant = BIAS_VOLTAGE_NONE,
 };
 
 static int a733_pinctrl_probe(struct platform_device *pdev)

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
prerequisite-patch-id: 85db03df3394cdcb2780a0da122a74b2c1fe220d
prerequisite-patch-id: a3e883da50bf03e8f522444def66fec7f996ffbe
prerequisite-patch-id: c6889699a6dc13c336ce4cf4659e21b551e9a9fc
-- 
2.53.0

