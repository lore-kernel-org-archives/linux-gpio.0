Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5CD6395DA5;
	Mon, 23 Mar 2026 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263724; cv=none; b=biyyg71h6zbw8DEciMfnvEVdI5xxRjGM/UIu0vkP+qSp7iWBiZBP2R6RYPgJTe+PHqEP8h9ljL3iJJkcOmcds3zGdNEL5iP/CZjHhP24JjN+CWTWKGwdDF66/tNJRe3bZC2OmfAY/losbcx3zjSRJhv6WJ9WM2n+MRcASz/jZr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263724; c=relaxed/simple;
	bh=bU23sLftWdUpqhSjt0sz7i0aaJt0OgbStG2HA8zA6LU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWlnu251YU3jhtc2tHyl7Bbdrsq3LsfBR9kJtoq0tf2aiO3KSGNGflVGBYfX64SJOBQ5T8J6Y4I44E+fxx+fO4wJ8PiNa4yKyvYTns1xcadhoUoDx+4ZZqSHr711QW/i9bcfxHRlnYAmB3vmGVGDXqYuyRhx+AC8tiFwdhwS+rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E15D1684;
	Mon, 23 Mar 2026 04:01:56 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9AD63F73B;
	Mon, 23 Mar 2026 04:01:59 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] pinctrl: sunxi: Rework IRQ remuxing to avoid fixed mux value
Date: Mon, 23 Mar 2026 12:01:47 +0100
Message-ID: <20260323110151.2352832-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323110151.2352832-1-andre.przywara@arm.com>
References: <20260323110151.2352832-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some Allwinner SoCs cannot read the state of a GPIO line when the pin is
muxed to the IRQ function. To access that state anyway, we temporarily
mux that pin back to GPIO input, then return it to the IRQ mux
afterwards. This code assumes that the IRQ mux value is 0x6, even though
newer SoCs (D1/T113/A523/...) encode the IRQ mux with 0xe.

Avoid hardcoding the different IRQ mux values by saving the programmed
value before switching to GPIO input, then restoring the saved value
afterwards. This makes the code robust against future changes of the IRQ
mux value. This also avoids calling the sunxi_pmx_set() function twice,
each of which does a read/modify/write operation, fenced in by the pctl
lock. The new code takes the lock around the whole operation, which is
also safer since it avoids (probably theoretical) races against other
code touching the mux register meanwhile.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 23 ++++++++++++++++-------
 drivers/pinctrl/sunxi/pinctrl-sunxi.h |  1 -
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index d3042e0c9712..6a86b7989b25 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -997,18 +997,27 @@ static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned offset)
 	struct sunxi_pinctrl *pctl = gpiochip_get_data(chip);
 	bool set_mux = pctl->desc->irq_read_needs_mux &&
 		gpiochip_line_is_irq(chip, offset);
-	u32 pin = offset + chip->base;
+	u32 mreg, mshift, mmask, mval;
 	u32 reg, shift, mask, val;
+	unsigned long flags;
 
 	sunxi_data_reg(pctl, offset, &reg, &shift, &mask);
+	if (!set_mux)
+		return (readl(pctl->membase + reg) & mask) >> shift;
 
-	if (set_mux)
-		sunxi_pmx_set(pctl->pctl_dev, pin, SUN4I_FUNC_INPUT);
-
+	/*
+	 * Some SoCs don't read the GPIO value registers correctly
+	 * when the pinmux is not set to GPIO_INPUT. Temporarily switch
+	 * to that mux, to read the correct value.
+	 */
+	sunxi_mux_reg(pctl, offset, &mreg, &mshift, &mmask);
+	raw_spin_lock_irqsave(&pctl->lock, flags);
+	mval = readl(pctl->membase + mreg);
+	writel((mval & ~mmask) | SUN4I_FUNC_INPUT << mshift,
+	       pctl->membase + mreg);
 	val = (readl(pctl->membase + reg) & mask) >> shift;
-
-	if (set_mux)
-		sunxi_pmx_set(pctl->pctl_dev, pin, SUN4I_FUNC_IRQ);
+	writel(mval, pctl->membase + mreg);
+	raw_spin_unlock_irqrestore(&pctl->lock, flags);
 
 	return val;
 }
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 0daf7600e2fb..ec7c977655b5 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -85,7 +85,6 @@
 #define IO_BIAS_MASK		GENMASK(3, 0)
 
 #define SUN4I_FUNC_INPUT	0
-#define SUN4I_FUNC_IRQ		6
 #define SUN4I_FUNC_DISABLED_OLD 7
 #define SUN4I_FUNC_DISABLED_NEW 15
 
-- 
2.43.0

