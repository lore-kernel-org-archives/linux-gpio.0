Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C632E493D5A;
	Thu, 10 Sep 2026 13:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047340; cv=none; b=V5iIrNUvZeIenY2olR+I8BtFMfGN1o+zh2wNuxQ5ESIy8kFJvdtSbVXU4OXf1fP5pnXy1BB+3yYH9y0HJX/hCy/p4uyb+dGhmDALlGDtGGPEinmLPqfhwEYeu0wVogQYbXy5wqNmVLGGWTxgETyBnTflHBAxjX1lJwlQfljS/c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047340; c=relaxed/simple;
	bh=NKEooR/BP+QmLw2QaESRChX1MftucmWGYzCzP1r3PIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r0eps47NgFGMeJd7tWlbdND4O4o3hgoVYjrYjPjnWahzX/BLyWc3FzK3UWgkjgfjbvEDghZPteyCVJ8LbcoBLlXihUol49dbcGlW2wyYaAvOWWElk1gJ9+BnqDd1td9k738T6aCObkgA8nAcE6M/o6IVdEXwDCNqDG1XUZiwyxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=JLTE3oih; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="JLTE3oih"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E99522BE;
	Thu, 10 Sep 2026 06:35:33 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A39043F528;
	Thu, 10 Sep 2026 06:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789047337; bh=NKEooR/BP+QmLw2QaESRChX1MftucmWGYzCzP1r3PIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JLTE3oihpM02KQmJ+UpQYOJZAlkNblbqM+ckWNTB+Cj+3Im3OthohBfPpDym52cQU
	 tmlemi/IEHD3aa7j68zk1VgVliaYDbf9fCjw2Pi09xoetF5KyN2FyMQesqcuaieW/0
	 5qPI0gqIozLZCV3qx5BVMKrcwQBlmo8S6SwMkEJY=
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 4/7] pinctrl: sunxi: support A733 generation MMIO register layout
Date: Thu, 10 Sep 2026 15:35:15 +0200
Message-ID: <20260910133519.459011-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910133519.459011-1-andre.przywara@arm.com>
References: <20260910133519.459011-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After Allwinner changed the layout of the pinctrl/GPIO IP MMIO register
frame only a few years back, the new SoC generation (starting with the
A733) changes the layout again: each port now uses 128 instead of 36 or 48
bytes, and the drive level registers move to make space for the new
set/clear data registers. Also the PortA registers start at offset 0x80
instead of 0x0 as before, to make room for non-bank specific registers,
like the pow_mod_sel registers, at the beginning of the MMIO frame. Finally
the IRQ registers move into each bank's region.

Add yet another quirk bit to mark this case, and set the existing register
offset values to match the new layout. This also requires to add new
members to struct sunxi_pinctrl, to accommodate the extra changes. The
actual runtime code changes are fortunately minor.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 14 ++++++++++++--
 drivers/pinctrl/sunxi/pinctrl-sunxi.h | 14 ++++++++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 5f08c75549b4d..35aa3a8ea1814 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -65,7 +65,7 @@ static struct irq_chip sunxi_pinctrl_level_irq_chip;
  */
 static u32 sunxi_bank_offset(const struct sunxi_pinctrl *pctl, u32 pin)
 {
-	u32 offset = 0;
+	u32 offset = pctl->bank_offset;
 
 	if (pin >= PK_BASE && (pctl->flags & SUNXI_PINCTRL_ELEVEN_BANKS)) {
 		pin -= PK_BASE;
@@ -102,7 +102,7 @@ static void sunxi_dlevel_reg(const struct sunxi_pinctrl *pctl,
 {
 	u32 offset = pin % PINS_PER_BANK * pctl->dlevel_field_width;
 
-	*reg   = sunxi_bank_offset(pctl, pin) + DLEVEL_REGS_OFFSET +
+	*reg   = sunxi_bank_offset(pctl, pin) + pctl->drv_regs_offset +
 		 offset / BITS_PER_TYPE(u32) * sizeof(u32);
 	*shift = offset % BITS_PER_TYPE(u32);
 	*mask  = (BIT(pctl->dlevel_field_width) - 1) << *shift;
@@ -1592,15 +1592,25 @@ int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
 	pctl->flags = flags;
 	if (flags & SUNXI_PINCTRL_NCAT2_REG_LAYOUT) {
 		pctl->bank_mem_size = D1_BANK_MEM_SIZE;
+		pctl->drv_regs_offset = DLEVEL_REGS_OFFSET;
 		pctl->pull_regs_offset = D1_PULL_REGS_OFFSET;
 		pctl->dlevel_field_width = D1_DLEVEL_FIELD_WIDTH;
+	} else if (flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT) {
+		pctl->bank_mem_size = A733_BANK_MEM_SIZE;
+		pctl->bank_offset = A733_BANK_OFFSET;
+		pctl->drv_regs_offset = A733_DLEVEL_REGS_OFFSET;
+		pctl->pull_regs_offset = A733_PULL_REGS_OFFSET;
+		pctl->dlevel_field_width = D1_DLEVEL_FIELD_WIDTH;
 	} else {
 		pctl->bank_mem_size = BANK_MEM_SIZE;
+		pctl->drv_regs_offset = DLEVEL_REGS_OFFSET;
 		pctl->pull_regs_offset = PULL_REGS_OFFSET;
 		pctl->dlevel_field_width = DLEVEL_FIELD_WIDTH;
 	}
 	if (flags & SUNXI_PINCTRL_ELEVEN_BANKS)
 		pctl->pow_mod_sel_offset = PIO_11B_POW_MOD_SEL_REG;
+	else if (flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
+		pctl->pow_mod_sel_offset = PIO_NCAT3_POW_MOD_SEL_REG;
 	else
 		pctl->pow_mod_sel_offset = PIO_POW_MOD_SEL_REG;
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 15aa6fe62dbbc..d09467ed437a3 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -53,6 +53,12 @@
 #define D1_DLEVEL_FIELD_WIDTH	4
 #define D1_PULL_REGS_OFFSET	0x24
 
+#define A733_BANK_MEM_SIZE	0x80
+#define A733_BANK_OFFSET	0x80
+#define A733_DLEVEL_REGS_OFFSET	0x20
+#define A733_PULL_REGS_OFFSET	0x30
+#define A733_IRQ_REGS_OFFSET	0x40
+
 #define PINS_PER_BANK		32
 
 #define IRQ_PER_BANK		32
@@ -94,7 +100,9 @@
 #define SUNXI_PINCTRL_NCAT2_REG_LAYOUT	BIT(8)
 #define SUNXI_PINCTRL_PORTF_SWITCH	BIT(9)
 #define SUNXI_PINCTRL_ELEVEN_BANKS	BIT(10)
+#define SUNXI_PINCTRL_NCAT3_REG_LAYOUT	BIT(11)
 
+#define PIO_NCAT3_POW_MOD_SEL_REG	0x040
 #define PIO_POW_MOD_SEL_REG		0x340
 #define PIO_11B_POW_MOD_SEL_REG		0x380
 #define PIO_POW_MOD_CTL_OFS		0x004
@@ -179,6 +187,8 @@ struct sunxi_pinctrl {
 	struct pinctrl_dev		*pctl_dev;
 	unsigned long			flags;
 	u32				bank_mem_size;
+	u32				bank_offset;
+	u32				drv_regs_offset;
 	u32				pull_regs_offset;
 	u32				dlevel_field_width;
 	u32				pow_mod_sel_offset;
@@ -238,6 +248,10 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
 
 static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 bank)
 {
+	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
+		return pctl->bank_offset + bank * pctl->bank_mem_size +
+		       A733_IRQ_REGS_OFFSET;
+
 	return IRQ_REGS_OFFSET +
 	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
 }
-- 
2.47.3

