Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2049A3F0A9B;
	Tue, 13 Oct 2026 14:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791901443; cv=none; b=lEsp7M7aQsJkLp9+IeJ0M3oAnAOkwZj78QjqlM1On6DIqV7jdU23mXpDfDp2tJqaM90mgQ9uuYAcwEyuU3afeA400MAFmUguvHb5hPc73uPrhGpOWmLHeLNBuftj0Hkn2JCvjVJueyR+LabwZ/+rA1ijnBPhq1TFMnkrbBxQajs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791901443; c=relaxed/simple;
	bh=whUjOSqtfOK9pxOtHaz50htccwvvfbQtHEljKwrDPWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bBeDsvXod8ELyStGY/7FFyytYZQKnv1REgBp9Pj2vjjxoijUzsHbV/YHjz58Kj5/7rhi1CXuRcyvEPs9qvgynmTMWfFiDm9zReX1+5phGIjpACq/erFdz9pyPy30ZknVeiQqsHA/fnUu67UCLJnBekl89UnjhWrwS6kdkKyApNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pXbS3sdN; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pXbS3sdN"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FC0F169E;
	Tue, 13 Oct 2026 07:23:56 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F5F23F7B4;
	Tue, 13 Oct 2026 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791901439; bh=whUjOSqtfOK9pxOtHaz50htccwvvfbQtHEljKwrDPWo=;
	h=From:To:Cc:Subject:Date:From;
	b=pXbS3sdNnJAfqEGVkOA7dZb/w7Lrk7RzRAv0U4smbTPNTcOJCSE8VABrDftx8j6KX
	 pdzzXYC4OsY/fxxVl36ImPa66t4rWupakqeM5Qup7nd8pa7Z37XlcuFOJNXsgblbNP
	 bQFXLKy57px6ktdEHaF1lir8YqLXXahxA34AdV0I=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT] pinctrl: sunxi: Fix A733 withstand programming
Date: Tue, 13 Oct 2026 16:23:51 +0200
Message-ID: <20261013142351.771229-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On top of the other pinctrl changes that the Allwinner A733 introduced, it
also uses a different layout for the GPIO_POW_MOD_SEL register, to set up
the GPIO input threshold voltage for each port. For no apparent reason,
it uses now 2 bits per bank, though effectively just always setting the
higher bit to 1 is all that's needed to make it work.

Add a new BIAS_VOLTAGE_PIO_POW_SEL variant, that behaves similar to the
existing one, but uses the 2-bit encoding. Use that variant for the A733
pinctrl driver.

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Reported-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

this goes on top of LinusW's pinctrl/for-next branch, which contains
both the A523 withstand fix and the A733 pinctrl bits.
Did not test on hardware, please have a look!

Cheers,
Andre

 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c       | 12 +++++++++---
 drivers/pinctrl/sunxi/pinctrl-sunxi.h       |  4 ++++
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65b..dcc2254e4089f 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -24,7 +24,7 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
 	.irq_read_needs_mux = true,
-	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT,
 };
 
 static int a733_pinctrl_probe(struct platform_device *pdev)
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 3ee5012463da3..7f4ce73bdc670 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -783,6 +783,7 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 		raw_spin_unlock_irqrestore(&pctl->lock, flags);
 
 		fallthrough;
+	case BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT:
 	case BIAS_VOLTAGE_PIO_POW_MODE_SEL:
 		val = uV <= 1800000 ? 1 : 0;
 		if (inverted)
@@ -790,9 +791,14 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct sunxi_pinctrl *pctl,
 
 		raw_spin_lock_irqsave(&pctl->lock, flags);
 		reg = readl(pctl->membase + pctl->pow_mod_sel_offset);
-		reg &= ~(1 << bank);
-		writel(reg | val << bank,
-		       pctl->membase + pctl->pow_mod_sel_offset);
+		if (pctl->desc->io_bias_cfg_variant == BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT) {
+			reg &= ~(3U << (bank * 2));
+			reg |= (val | 0x2) << (bank * 2);
+		} else {
+			reg &= ~BIT(bank);
+			reg |= val << bank;
+		}
+		writel(reg, pctl->membase + pctl->pow_mod_sel_offset);
 		raw_spin_unlock_irqrestore(&pctl->lock, flags);
 		return 0;
 	default:
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 7c2f29e75519a..0945890a921b6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -122,6 +122,10 @@ enum sunxi_desc_bias_voltage {
 	 * register, as seen on H6 SoC, for example.
 	 */
 	BIAS_VOLTAGE_PIO_POW_MODE_SEL,
+	/*
+	 * Same as above, but using a 2-bits-per-bank encoding.
+	 */
+	BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT,
 	/*
 	 * Bias voltage is set through PIO_POW_MOD_SEL_REG
 	 * and PIO_POW_MOD_CTL_REG register, as seen on
-- 
2.43.0

