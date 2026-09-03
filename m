Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1CD37AA78
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788427046; cv=none; b=rtxpFazJhGNNGAnyt/vuLhblN6Gs7KoxJ2es5xj6dz3G5E4nXdMAhxz5bPUJeuuTjKOhTmuragSSzKCyCN7GYOwxORBCReP4BY6Q3ikvom/bGp2Um2G8TfcBmBImN4uXNyk5sNOnpjYsco9funq0+ZmKD6x8CX+gui4Us+KhQIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788427046; c=relaxed/simple;
	bh=RAW3IjTiA5pWZrE8uD9aR7afJJyLRJLAxebVCoQj42E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jUVNtdn/V9eC9fJBj9JvJ9YimkyR2Gm92Xqd3QWFIj6z2p3tnPVFWiELJCCQ49hMr9kGgP+eWvuTuEnaOilXUlXgDLJvtQPQGECLodlzGBOXJXQ/0nIeGyehpky1Ksb1xssTuN1qxnYIg95+ShQ6rXdSFIfk+tSrxM6iciGfqsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wirenboard.com; spf=pass smtp.mailfrom=wirenboard.com; dkim=pass (2048-bit key) header.d=wirenboard.com header.i=@wirenboard.com header.b=cviByZx6; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wirenboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wirenboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wirenboard.com header.i=@wirenboard.com header.b="cviByZx6"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so2025776f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 02:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard.com; s=google; t=1788427042; x=1789031842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H9qD0sFZ2P4s6++zHyN8ZE8Rd94yZI/MQR/y8ugP8/g=;
        b=cviByZx621aeJet8uQmt6GBZkovgfhpxsBH+NIY4332JDtY4jacaSKp9cJl+fhWw2T
         dWw7pnhLusRGqfI+bN4CdccIvfXiWyW15JtWnLV/2FV9gKfyG0u28ZH+8sPNc8EHNqN5
         dSVajPGKWLijxQ2R0bACcB9BBPznbUmKFHjMwiWTWrjv1572YNfMA6+XhO3UyDfvx8RW
         yRYOOTKvzk0LUh6MC7P6gaXaKS+JTFDhkksm2zXXTPw9L7v6YF9sYgEAJ05MqLb/7P8a
         IeFKlQ18EWpkozOafXeFG0lhOT8rmYUXpD/tnHj+XOdWn/ZS1SeAAxYjTo9n4lDiwOAy
         8+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788427042; x=1789031842;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9qD0sFZ2P4s6++zHyN8ZE8Rd94yZI/MQR/y8ugP8/g=;
        b=ocmpTNRggwXyr3ghd/WN8D8iCTWOnALQscXKPhL6QVVZ5MiRMxjLFlyzXZKe4vCizk
         hhVKvJI2K17q5vhcjNynYAD1r5/xftXFdQjZDt4XcBcWy3WVSzS9N+ySmbKWU4j/ak8J
         Bmn+VqVuWSCeczB6+82uGujqop4w7b9HSPPe87CvgVLqqMYCPfYl3Ez35dTs6kG5UoQg
         cxTBVmKBIanXAMNF2c9PXBzOLGlQEtsIo5jEtPQ9WHeJsIlveyIzSb0ZufM6tz3iWeAs
         lKsR27aC9UDzJVEwZWF3UepKj5up72LF3gOnlvZImeXkToedCP6G0nlw538Hzc3PSAWq
         ZjBA==
X-Forwarded-Encrypted: i=1; AKwUvBwBI5gk7ZcCo58AxzLwp1zUYK4frsPcFKPdtu0qS9XV/RsYIKBuTaG1oipfMaOJjY9R8rvIwrsgFNMB@vger.kernel.org
X-Gm-Message-State: AFuF++kGvPZzsPfOhbX8PLYoKMcIiJHDnbrIxo97abilprXgr8nFRElt
	92CzgZRurmeepEfhN2ZRazW6HQvOz5k7cJo2PidcsCOCJvZxComXgeJBtUzJGwI/zig=
X-Gm-Gg: AYBFou2sv37WVLOcoWyeG7z9vQTMYLobtoxgZEQOhN0qnzcHwHAmkpxikwO4+cap2YL
	vTyRA1w9urX6+ZBh3R+vOFA07EncOiNltEQjatF4Bz2I9VEki55U5Dn8NopzxkQBife+1Tti/ca
	ULGlGrCfIXXr79sVBF5BcI5OZkszQj2BQ+qsiyNcFcvq83ABQYNtPGO1i4F/tDKahhaL5rx35V8
	R2GDrs6NzLjp2bMdqqnEQ0yMTS5r4JuZsDu/ZYs/COw9CBvjVVDf4XNA/Pb5F5N4zQL6d/rNpvp
	8CtPu7x/J00R6RiXTACxJtagQvETCUDDUBodniyd2u5ZIkVvPlFPC4SwjWqBg1ZYmNX+ejWyQZG
	A8HhukeZgeAzKZSHw0ARwya/c4ILIVNPFrwC2PbhM5MzFGcwPLyIb0lk8AvfE3E2AO8V9pQLOEU
	DZ+hE0QW4q3SF6PaCYHXf1U6KJ9WxdTlZ4jLI8pJB7UNMe1J6ZCAaI++Z666O5h7zC98YBTlYxy
	qt/ySX8Tzgb4NNxE1mkjIqO0WxgTA2M
X-Received: by 2002:a05:6000:471a:b0:484:3311:3176 with SMTP id ffacd0b85a97d-48488f22290mr20813888f8f.23.1788427041742;
        Thu, 03 Sep 2026 02:17:21 -0700 (PDT)
Received: from localhost.localdomain ([85.137.25.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72f02sm12073755f8f.3.2026.09.03.02.17.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 02:17:21 -0700 (PDT)
From: Ilya Titov <ilya.titov@wirenboard.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio@elopez.com.ar>,
	linux-gpio@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ilya Titov <ilya.titov@wirenboard.com>
Subject: [PATCH v2] pinctrl: sunxi: keep a shadow copy of the data register output latches
Date: Thu,  3 Sep 2026 12:17:18 +0300
Message-ID: <20260903091718.44042-1-ilya.titov@wirenboard.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260812120114.32501-1-ilya.titov@wirenboard.com>
References: <20260812120114.32501-1-ilya.titov@wirenboard.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Allwinner SoCs, reading a bank's data register returns the pin level,
not the output latch, for pins that are muxed as inputs.  Writing a GPIO
therefore corrupts the output latches of all input-muxed pins in the
same bank: the read-modify-write in sunxi_pinctrl_gpio_set() reads back
their pin levels and writes those into their latches.

This breaks emulated open-drain lines (e.g. a bit-banged I2C bus from
i2c-gpio).  Such a line is released high by muxing it as input and
letting the pull-up raise it, so any concurrent GPIO write in the same
bank stores 1 into its latch.  Driving the line low afterwards is a
non-atomic data-then-mux sequence in sunxi_pinctrl_gpio_direction_output();
if the poisoning write lands between the two steps, the pin actively
drives high (push-pull) instead of low.

Observed in practice as sporadic glitches on a T507 board bit-banging
I2C on port E while other PE GPIOs are toggled.  On a scope the failure
is unmistakable: on a clock pulse where SCL should fall to GND, the line
instead steps *above* its idle high level for the whole low phase — the
pad drives a strong push-pull 3.3 V high, higher than the level the
pull-up sustains on the loaded bus — before the next transition recovers
it.  The same can hit SDA, corrupting data instead of clocks.

Steps to reproduce on any sunxi board with a bit-banged (i2c-gpio) bus:

  # background: toggle any other GPIO of the same bank, e.g. line 21
  gpioset -c <chip> --toggle 100us 21=0 &

  # foreground: keep the bit-banged bus busy
  while :; do i2cdetect -y <bus> 0x50 0x57; done

  # watch SCL/SDA with a scope or logic analyzer: sporadic clock-low
  # phases driven high (above the pull-up level) instead of low

The bank spinlock cannot help: the racing write is a perfectly valid
whole-register RMW that faithfully writes back what the hardware
returned.  There are no set/clear registers on this IP to write a single
bit atomically.

Fix it the same way gpio-mmio handles hardware whose data register read
does not return the output latch: keep a shadow copy of each bank's
latches, base the read-modify-write on the shadow, and only write the
register.  The shadow is seeded from the hardware at probe time so pins
left in output mode by the bootloader keep their state.  Pins that reach
output mode through the gpiolib paths write their value (and thereby
their shadow bit) before the mux switch in
sunxi_pinctrl_gpio_direction_output(); pins muxed to gpio_out directly
through a pinmux node bypass that path, so sunxi_pmx_set() refreshes
their shadow bit from the latch (readable once the pin is in output
mode) to keep them driving their pre-existing level.

Seeding the shadow reads the PIO registers at probe time, which requires
the bus clock to be enabled.  The clock was only requested at the very
end of probe, after devm_pinctrl_register() had already claimed the pin
hogs described in the device tree - which mux pins, and thus access
registers, with the clock still gated.  Move the request ahead of both.
Boards whose bootloader leaves the PIO clock running are unaffected,
which is why the pre-existing hog problem has gone unnoticed since
commit 950707c0eb5c ("pinctrl: sunxi: add clock support").

Fixes: df7b34f4c3d2 ("pinctrl: sunxi: Fix gpio_set behaviour")
Cc: stable@vger.kernel.org
Signed-off-by: Ilya Titov <ilya.titov@wirenboard.com>
---
v2:
 - compute nbanks with DIV_ROUND_UP(last_pin + 1 - pin_base, PINS_PER_BANK)
   instead of round_up(last_pin, PINS_PER_BANK).  last_pin is the highest
   pin number, not a count, so the old form allocated one bank too few
   whenever it was an exact multiple of PINS_PER_BANK, which would let
   sunxi_pmx_set() write past the end of dat_shadow.  No current SoC hits
   this (the closest are PL1 on h616-r and PN1 on a80-r), but a bank with
   a single pin in a future table would.  Reported by Sashiko AI review.
   The allocation size is unchanged for every SoC description in tree.

Tested on a Wiren Board 8.5.1 (Allwinner T507) against a 6.18-based
kernel, where the problem was found: the bit-banged ATECC/RTC bus on
port E survives 200 probe rounds while another PE line is toggled every
100 us in the background, which reliably corrupted transfers before.

The mainline port has not been re-tested on that hardware; it was build
tested on v7.2-rc7 with arm64 allmodconfig and arm allmodconfig (all 28
PINCTRL_SUN* variants, W=1), both without new warnings, and sparse
(v0.6.5) reports nothing for the driver.

 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 76 +++++++++++++++++++++------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  7 +++
 2 files changed, 68 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 25489beeb312..2881a83be99c 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -837,6 +837,21 @@ static void sunxi_pmx_set(struct pinctrl_dev *pctldev,
 	writel((readl(pctl->membase + reg) & ~mask) | config << shift,
 	       pctl->membase + reg);
 
+	/*
+	 * A pin muxed to gpio_out directly through a pinmux node bypasses
+	 * sunxi_pinctrl_gpio_set() and drives whatever its output latch
+	 * holds.  Now that the pin is in output mode the data register
+	 * reads back the latch, so refresh the shadow to keep such pins
+	 * driving their pre-existing level.
+	 */
+	if (config == SUN4I_FUNC_OUTPUT) {
+		u32 *shadow = &pctl->dat_shadow[pin / PINS_PER_BANK];
+
+		sunxi_data_reg(pctl, pin, &reg, &shift, &mask);
+		*shadow = (*shadow & ~mask) |
+			  (readl(pctl->membase + reg) & mask);
+	}
+
 	raw_spin_unlock_irqrestore(&pctl->lock, flags);
 }
 
@@ -1017,21 +1032,29 @@ static int sunxi_pinctrl_gpio_set(struct gpio_chip *chip, unsigned int offset,
 				  int value)
 {
 	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
-	u32 reg, shift, mask, val;
+	u32 *shadow = &pctl->dat_shadow[offset / PINS_PER_BANK];
+	u32 reg, shift, mask;
 	unsigned long flags;
 
 	sunxi_data_reg(pctl, offset, &reg, &shift, &mask);
 
 	raw_spin_lock_irqsave(&pctl->lock, flags);
 
-	val = readl(pctl->membase + reg);
-
+	/*
+	 * Reading the data register returns the pin level, not the output
+	 * latch, for pins muxed as inputs.  A read-modify-write based on
+	 * the register would therefore corrupt the latches of input-muxed
+	 * pins in the same bank (e.g. an emulated open-drain I2C line
+	 * released high), making them drive the wrong level once switched
+	 * to output.  Base the read-modify-write on a shadow copy of the
+	 * latches instead.
+	 */
 	if (value)
-		val |= mask;
+		*shadow |= mask;
 	else
-		val &= ~mask;
+		*shadow &= ~mask;
 
-	writel(val, pctl->membase + reg);
+	writel(*shadow, pctl->membase + reg);
 
 	raw_spin_unlock_irqrestore(&pctl->lock, flags);
 
@@ -1572,7 +1595,7 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	struct pinctrl_pin_desc *pins;
 	struct sunxi_pinctrl *pctl;
 	struct pinmux_ops *pmxops;
-	int i, ret, last_pin, pin_idx;
+	int i, ret, last_pin, pin_idx, nbanks;
 	struct clk *clk;
 
 	pctl = devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
@@ -1610,6 +1633,37 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	if (!pctl->irq_array)
 		return -ENOMEM;
 
+	/*
+	 * The bus clock has to be enabled before the pinctrl device
+	 * registers, as the pin hogs claimed from there access registers.
+	 */
+	ret = of_clk_get_parent_count(node);
+	clk = devm_clk_get_enabled(&pdev->dev, ret == 1 ? NULL : "apb");
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
+
+	/*
+	 * Seed the output latch shadow from the hardware so pins the
+	 * bootloader left in output mode keep their state; see
+	 * sunxi_pinctrl_gpio_set() for why a shadow is needed.  This must
+	 * happen before the pinctrl device registers, as pin hogs can mux
+	 * pins to gpio_out and thereby update the shadow.
+	 */
+	last_pin = pctl->desc->pins[pctl->desc->npins - 1].pin.number;
+	nbanks = DIV_ROUND_UP(last_pin + 1 - pctl->desc->pin_base,
+			      PINS_PER_BANK);
+	pctl->dat_shadow = devm_kcalloc(&pdev->dev, nbanks,
+					sizeof(*pctl->dat_shadow), GFP_KERNEL);
+	if (!pctl->dat_shadow)
+		return -ENOMEM;
+
+	for (i = 0; i < nbanks; i++) {
+		u32 reg, shift, mask;
+
+		sunxi_data_reg(pctl, i * PINS_PER_BANK, &reg, &shift, &mask);
+		pctl->dat_shadow[i] = readl(pctl->membase + reg);
+	}
+
 	ret = sunxi_pinctrl_build_state(pdev);
 	if (ret) {
 		dev_err(&pdev->dev, "dt probe failed: %d\n", ret);
@@ -1665,7 +1719,6 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	if (!pctl->chip)
 		return -ENOMEM;
 
-	last_pin = pctl->desc->pins[pctl->desc->npins - 1].pin.number;
 	pctl->chip->owner = THIS_MODULE;
 	pctl->chip->request = gpiochip_generic_request;
 	pctl->chip->free = gpiochip_generic_free;
@@ -1699,13 +1752,6 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 			goto gpiochip_error;
 	}
 
-	ret = of_clk_get_parent_count(node);
-	clk = devm_clk_get_enabled(&pdev->dev, ret == 1 ? NULL : "apb");
-	if (IS_ERR(clk)) {
-		ret = PTR_ERR(clk);
-		goto gpiochip_error;
-	}
-
 	pctl->irq = devm_kcalloc(&pdev->dev,
 				 pctl->desc->irq_banks,
 				 sizeof(*pctl->irq),
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 0daf7600e2fb..498e88a19f71 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -85,6 +85,7 @@
 #define IO_BIAS_MASK		GENMASK(3, 0)
 
 #define SUN4I_FUNC_INPUT	0
+#define SUN4I_FUNC_OUTPUT	1
 #define SUN4I_FUNC_IRQ		6
 #define SUN4I_FUNC_DISABLED_OLD 7
 #define SUN4I_FUNC_DISABLED_NEW 15
@@ -175,6 +176,12 @@ struct sunxi_pinctrl {
 	int				*irq;
 	unsigned			*irq_array;
 	raw_spinlock_t			lock;
+	/*
+	 * Output latch shadow, one word per bank.  Seeded lockless at
+	 * probe before the pinctrl device registers, protected by @lock
+	 * afterwards.
+	 */
+	u32				*dat_shadow;
 	struct pinctrl_dev		*pctl_dev;
 	unsigned long			flags;
 	u32				bank_mem_size;

base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
-- 
2.50.1 (Apple Git-155)

