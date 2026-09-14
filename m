Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA6341D22C
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 10:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380476; cv=none; b=k+8/79W3e7v0zTtS4hQsBEfpX8ZOxVEjAosUdG01CxBomdnylE8RMH8MT9wg4BpKOr6qROLX833Iy/UQ3kptrZ75BqhgYVIOLBkQCtiBMd6JzkLWQxGD/am8Welq6DfT2x3bPxy8sSxHS8r4h1rmpPGXd7vyc3cUytAYNcaC2LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380476; c=relaxed/simple;
	bh=bhzDysUXJICZl4HNbtJ5X4V1LqWu56fbacBAFiJlnow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bJow9RWG1WH9D4sZ/eO00KyzeafNKY/hvgIg88lvyS/h9RQ9QoEfeZwCyfxR/SJlixNW29utHkysaJ6fTVYmvRYMJYZ2GwmoBoeH4tYRm5OexQ7GifBhRqvci2F2spz79EaDohdDu+sVcR2ydB5TBHWdOFHgdR/SFwS5QbO2WQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=s2sD3+9j; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="s2sD3+9j"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0E261570;
	Mon, 14 Sep 2026 03:07:49 -0700 (PDT)
Received: from e142021.arm.com (unknown [10.57.9.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 330613F7B4;
	Mon, 14 Sep 2026 03:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789380473; bh=bhzDysUXJICZl4HNbtJ5X4V1LqWu56fbacBAFiJlnow=;
	h=From:To:Cc:Subject:Date:From;
	b=s2sD3+9jTNlgFv1NggzXPIaf+b0VAmi72PP4mTnukXKdJfjYJab5PNdMWKr0Z2EuM
	 PG043kOuFqIsn22mAZCcR3t2F41jH8ZqU9fiKv7bl1L6MBoKQrvS4is7lgG9sCtCEA
	 Ibdje8hB6rl0ySp3xFIWEHiRwzDzKj15nT0t6Js0=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2] pinctrl: sunxi: A523: fix voltage withstand encoding
Date: Mon, 14 Sep 2026 12:07:44 +0200
Message-ID: <20260914100744.1039050-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A523 uses the same GPIO voltage "withstand" programming
(setting the input level voltage thresholds) as the previous SoCs, but
for some odd reason inverts the encoding of 1.8V vs. 3.3V.

Add a new bias voltage type to note this difference, and select it for
the A523. At the same time also use the newer "CTL" version, which in
addition allows to turn off the withstand programming for I/O voltages
other than exact 1.8V or 3.3V (for instance for 2.5V sometimes used for
Ethernet PHYs). The A523 has that enable register, but didn't use it
so far.

This fixes eMMC and reportedly Ethernet operation on some A523 boards.

Fixes: 648be4cd9517 ("pinctrl: sunxi: Add support for the Allwinner A523")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Per Larsson <per@palvencia.se>
Tested-by: Juan Manuel Lopez Carrillo <juanmanuellopezcarrillo@gmail.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Chen-Yu Tsai <wens@kernel.org> # Fixes eMMC on Orange Pi 4A
---
Hi,

just added tags and rebased on v7.3-rc1 (but just a context change).
Linus, my apologies, I missed you on the first post, instead CC:ed DT
people for some odd reason.
Can you please take this as a fix ASAP?

Cheers,
Andre

 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c   | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         | 6 ++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h         | 2 ++
 4 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index 462aa1c4a5fa6..e27e4945def26 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -26,7 +26,7 @@ static const u8 a523_r_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
 	.irq_bank_map = a523_r_irq_bank_map,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
 	.pin_base = PL_BASE,
 };
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index b6f78f1f30ac4..88d8acd5bc245 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -26,7 +26,7 @@ static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a523_pinctrl_data = {
 	.irq_banks = ARRAY_SIZE(a523_irq_bank_map),
 	.irq_bank_map = a523_irq_bank_map,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
 };
 
 static int a523_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 25489beeb3125..7b33bcb7f840a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -728,6 +728,7 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 {
 	unsigned short bank;
 	unsigned long flags;
+	bool inverted = false;
 	u32 val, reg;
 	int uV;
 
@@ -766,6 +767,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		reg &= ~IO_BIAS_MASK;
 		writel(reg | val, pctl->membase + sunxi_grp_config_reg(pin));
 		return 0;
+	case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
+		inverted = true;
+		fallthrough;
 	case BIAS_VOLTAGE_PIO_POW_MODE_CTL:
 		val = uV > 1800000 && uV <= 2500000 ? BIT(bank) : 0;
 
@@ -780,6 +784,8 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		fallthrough;
 	case BIAS_VOLTAGE_PIO_POW_MODE_SEL:
 		val = uV <= 1800000 ? 1 : 0;
+		if (inverted)
+			val = !val;
 
 		raw_spin_lock_irqsave(&pctl->lock, flags);
 		reg = readl(pctl->membase + pctl->pow_mod_sel_offset);
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 0daf7600e2fb0..b09df32a3073a 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -116,8 +116,10 @@ enum sunxi_desc_bias_voltage {
 	 * Bias voltage is set through PIO_POW_MOD_SEL_REG
 	 * and PIO_POW_MOD_CTL_REG register, as seen on
 	 * A100 and D1 SoC, for example.
+	 * Some SoCs invert the encoding for 1.8V vs. 3.3V.
 	 */
 	BIAS_VOLTAGE_PIO_POW_MODE_CTL,
+	BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV,
 };
 
 struct sunxi_desc_function {
-- 
2.43.0

