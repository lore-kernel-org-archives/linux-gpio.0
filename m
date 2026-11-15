Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739501;
	b=Gyn38nYJKacjPn40DpXMX8dwD6M2Mh9MK6Ok7YAj/JC4z3i90zn/2yYh7i5ENHsmnND1
	 xTLz8aBWQ4UTkIGz46f7zROfhBBGMwt0FDpa3h1+JqOO5TqH17RLkxhzgTjC8vnAFf+s2
	 nnOsQaYOcZyz8mr5RqVEyiQ2NoFFw3d8ZE65Nzqa8Y5jYtFw/5sFcZbA37xPzhrv3gIeQ
	 A4BpbI3SJ7xB1dQFJ+H2C7foH8Ijenzj24yWu7DU9JD/QdIDwlk5W5eY6q8UlMXcGhsjF
	 CEdXbQZKjasjJps5NEcP0THNTyrLuMBQ3pfSlRv/XmlOikkI4G2GaF93t6mufJy6qvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739501;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=ojA5QYObotvHggyDV7mTRyLzlC+JStQRmcC9FxoWI2k=;
	b=Ie1KwywV+bW7uYiD7Ytff6nuM4tv5wj8Zzf0uHxrPPx/EJAat39lgQQSFbBgYFcFgBtF
	 M+OpC7+sk3q2z+XRl2EbXpBtClmjLyAwEAlN2f/CGwmpNI395XjuC13WKRGnpFmufx5QL
	 sfJa3g+JuJtU7Y5FA0h74QS9XddKR9AANsSJFkOMzM1+e0Ifgz9tvsEkrWVjG5g7gFsx6
	 PXS3CCwK9rHxBSm8vFVTJelip0oUaIX/pNyAtdyiqXvsHyEbmc4pnTD9S+XMzqcYAXTUq
	 RQ6VlxJbauv6xTbGoAOvcwgz7MNTTNXMV6BgJ2Xi5X9Fp51/0EOAtUVY2INmWH7cPvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="TVRQ/M3b";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C5D606A334;
	Sun, 15 Nov 2026 10:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TVRQ/M3b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E089D1F000C6;
	Sun, 15 Nov 2026 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739501;
	bh=ojA5QYObotvHggyDV7mTRyLzlC+JStQRmcC9FxoWI2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TVRQ/M3bN5JkQoN3aLkpIzDPqsy1LDQGe3qF99zIYrqDH/8YtlG5XJaRg9qK1TKN9
	 J9STfQGKYq2teajnLS1hOJkJ60aIi8m5UC8Rnium5QXS5RILpkHZdZy81CbveTvVDo
	 5uLvYifbgPOm15Uty4bhmRonpQsiKdpBShUbX9iTA3m0Xg1fnrG0PQY42jKfjzRJbO
	 J3JFHbdWTPpFGeuSTeIEJDyINDgu/SJOR5vt70HTs9Y8wcnlyg2fc2vT7VKLlusfGB
	 6fWBThe+yl3edmLJRENcE9Cv3qAW5bIaOQAUGX1GWmKBgrXjUA85o63gBvlftjQWlV
	 yXHUkgK5NBbkQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 09/13] clk: berlin: add Synaptics clock controller helpers
Date: Sun, 15 Nov 2026 18:23:48 +0800
Message-ID: <20261115102401.3520-10-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the configurable divider and gate clock implementation shared by
Synaptics system controllers. Provide the MCU system manager helper for
registering its fixed clocks, gates and peripheral dividers.

Keep clock resources managed by the MFD clock device and obtain the
register range and provider node from its parent.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 MAINTAINERS                        |   1 +
 drivers/clk/Kconfig                |   1 +
 drivers/clk/berlin/Kconfig         |   7 +
 drivers/clk/berlin/Makefile        |   2 +
 drivers/clk/berlin/sl-clk.c        | 279 +++++++++++++++++++++++++++++
 drivers/clk/berlin/sl-clk.h        |  31 ++++
 drivers/clk/berlin/sl-sysmgr-clk.c | 241 +++++++++++++++++++++++++
 drivers/clk/berlin/sl-sysmgr-clk.h |  44 +++++
 8 files changed, 606 insertions(+)
 create mode 100644 drivers/clk/berlin/Kconfig
 create mode 100644 drivers/clk/berlin/sl-clk.c
 create mode 100644 drivers/clk/berlin/sl-clk.h
 create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.c
 create mode 100644 drivers/clk/berlin/sl-sysmgr-clk.h

diff --git a/MAINTAINERS b/MAINTAINERS
index b5bc76062771..f3067f71d54c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3812,6 +3812,7 @@ F:	Documentation/devicetree/bindings/soc/synaptics/
 F:	arch/arm/boot/dts/synaptics/
 F:	arch/arm/mach-berlin/
 F:	arch/arm64/boot/dts/synaptics/
+F:	drivers/clk/berlin/sl-*
 F:	drivers/pinctrl/berlin/pinctrl-sl2610.c
 F:	drivers/reset/reset-sl2610.c
 F:	drivers/soc/synaptics/
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 37a8e35d4178..906fabfe0d33 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -514,6 +514,7 @@ source "drivers/clk/analogbits/Kconfig"
 source "drivers/clk/anlogic/Kconfig"
 source "drivers/clk/aspeed/Kconfig"
 source "drivers/clk/bcm/Kconfig"
+source "drivers/clk/berlin/Kconfig"
 source "drivers/clk/cix/Kconfig"
 source "drivers/clk/davinci/Kconfig"
 source "drivers/clk/eswin/Kconfig"
diff --git a/drivers/clk/berlin/Kconfig b/drivers/clk/berlin/Kconfig
new file mode 100644
index 000000000000..8f71d4c7a478
--- /dev/null
+++ b/drivers/clk/berlin/Kconfig
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config SL_COMMON_CLK
+	bool
+
+config SL_SYSMGR_CLK
+	bool
diff --git a/drivers/clk/berlin/Makefile b/drivers/clk/berlin/Makefile
index 3733733a4806..5dbd0fd264ad 100644
--- a/drivers/clk/berlin/Makefile
+++ b/drivers/clk/berlin/Makefile
@@ -3,3 +3,5 @@ obj-y += berlin2-avpll.o berlin2-pll.o berlin2-div.o
 obj-$(CONFIG_MACH_BERLIN_BG2)	+= bg2.o
 obj-$(CONFIG_MACH_BERLIN_BG2CD)	+= bg2.o
 obj-$(CONFIG_MACH_BERLIN_BG2Q)	+= bg2q.o
+obj-$(CONFIG_SL_COMMON_CLK)	+= sl-clk.o
+obj-$(CONFIG_SL_SYSMGR_CLK)	+= sl-sysmgr-clk.o
diff --git a/drivers/clk/berlin/sl-clk.c b/drivers/clk/berlin/sl-clk.c
new file mode 100644
index 000000000000..e212320a0637
--- /dev/null
+++ b/drivers/clk/berlin/sl-clk.c
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Synaptics Incorporated
+ * Copyright (c) 2015 Marvell Technology Group Ltd.
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+
+#include "sl-clk.h"
+
+#define SL_CLK_EN		BIT(0)
+#define SL_CLK_PLL_SEL		GENMASK(3, 1)
+#define SL_CLK_PLL_SWITCH	BIT(4)
+#define SL_CLK_DIV_SWITCH	BIT(5)
+#define SL_CLK_DIV3_SWITCH	BIT(6)
+#define SL_CLK_DIV_SEL		GENMASK(9, 7)
+#define SL_MAX_PARENTS	6
+
+struct sl_clk {
+	struct clk_hw hw;
+	void __iomem *reg;
+	spinlock_t *lock;
+	struct device *dev;
+};
+
+#define to_sl_clk(_hw) container_of(_hw, struct sl_clk, hw)
+
+static const unsigned int sl_clk_values[] = { 1, 2, 3, 4, 6, 8, 12 };
+
+static unsigned int sl_clk_value(u32 val)
+{
+	static const u8 div_table[] = { 0, 2, 4, 6, 8, 12, 0, 0 };
+
+	if (val & SL_CLK_DIV3_SWITCH)
+		return 3;
+	if (!(val & SL_CLK_DIV_SWITCH))
+		return 1;
+
+	return div_table[FIELD_GET(SL_CLK_DIV_SEL, val)];
+}
+
+static unsigned long sl_clk_recalc_rate(struct clk_hw *hw,
+					unsigned long parent_rate)
+{
+	struct sl_clk *clk = to_sl_clk(hw);
+	unsigned int divisor = sl_clk_value(readl_relaxed(clk->reg));
+
+	if (WARN_ON_ONCE(!divisor))
+		return 0;
+
+	return parent_rate / divisor;
+}
+
+static unsigned int sl_clk_best(unsigned long parent_rate,
+				unsigned long rate)
+{
+	unsigned long best_diff = ULONG_MAX;
+	unsigned int best = 1, i;
+
+	for (i = 0; i < ARRAY_SIZE(sl_clk_values); i++) {
+		unsigned long candidate = parent_rate / sl_clk_values[i];
+		unsigned long diff = candidate > rate ? candidate - rate :
+							     rate - candidate;
+
+		if (diff < best_diff) {
+			best_diff = diff;
+			best = sl_clk_values[i];
+		}
+	}
+
+	return best;
+}
+
+static int sl_clk_determine_rate(struct clk_hw *hw,
+				 struct clk_rate_request *req)
+{
+	struct clk_hw *parent = clk_hw_get_parent(hw);
+
+	if (!parent)
+		return -EINVAL;
+
+	req->best_parent_hw = parent;
+	req->best_parent_rate = clk_hw_get_rate(parent);
+	req->rate = req->best_parent_rate /
+		    sl_clk_best(req->best_parent_rate, req->rate);
+
+	return 0;
+}
+
+static int sl_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			   unsigned long parent_rate)
+{
+	struct sl_clk *clk = to_sl_clk(hw);
+	unsigned int divisor, select;
+	unsigned long flags;
+	u32 val;
+
+	divisor = sl_clk_best(parent_rate, rate);
+	if (parent_rate / divisor != rate)
+		return -EINVAL;
+
+	spin_lock_irqsave(clk->lock, flags);
+	val = readl_relaxed(clk->reg);
+	val &= ~(SL_CLK_DIV3_SWITCH | SL_CLK_DIV_SWITCH |
+		 SL_CLK_DIV_SEL);
+	if (divisor == 3) {
+		val |= SL_CLK_DIV3_SWITCH;
+	} else if (divisor != 1) {
+		switch (divisor) {
+		case 2:
+			select = 1;
+			break;
+		case 4:
+			select = 2;
+			break;
+		case 6:
+			select = 3;
+			break;
+		case 8:
+			select = 4;
+			break;
+		case 12:
+			select = 5;
+			break;
+		default:
+			spin_unlock_irqrestore(clk->lock, flags);
+			return -EINVAL;
+		}
+		val |= SL_CLK_DIV_SWITCH |
+			FIELD_PREP(SL_CLK_DIV_SEL, select);
+	}
+	writel_relaxed(val, clk->reg);
+	spin_unlock_irqrestore(clk->lock, flags);
+
+	return 0;
+}
+
+static u8 sl_clk_get_parent(struct clk_hw *hw)
+{
+	struct sl_clk *clk = to_sl_clk(hw);
+	u32 val = readl_relaxed(clk->reg);
+	u8 selector;
+	unsigned int index;
+
+	if (!(val & SL_CLK_PLL_SWITCH))
+		return 0;
+
+	selector = FIELD_GET(SL_CLK_PLL_SEL, val);
+	index = selector + 1;
+	if (index < clk_hw_get_num_parents(hw))
+		return index;
+
+	dev_warn(clk->dev, "%s: unsupported parent selector %u\n",
+		 clk_hw_get_name(hw), selector);
+	return 0;
+}
+
+static int sl_clk_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct sl_clk *clk = to_sl_clk(hw);
+	unsigned long flags;
+	u32 val;
+
+	if (index >= clk_hw_get_num_parents(hw) || index >= SL_MAX_PARENTS)
+		return -EINVAL;
+
+	spin_lock_irqsave(clk->lock, flags);
+	val = readl_relaxed(clk->reg);
+	if (!index) {
+		val &= ~SL_CLK_PLL_SWITCH;
+	} else {
+		val &= ~SL_CLK_PLL_SEL;
+		val |= SL_CLK_PLL_SWITCH |
+			FIELD_PREP(SL_CLK_PLL_SEL, index - 1);
+	}
+	writel_relaxed(val, clk->reg);
+	spin_unlock_irqrestore(clk->lock, flags);
+
+	return 0;
+}
+
+static int sl_clk_enable(struct clk_hw *hw)
+{
+	struct sl_clk *clk = to_sl_clk(hw);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(clk->lock, flags);
+	val = readl_relaxed(clk->reg);
+	writel_relaxed(val | SL_CLK_EN, clk->reg);
+	spin_unlock_irqrestore(clk->lock, flags);
+
+	return 0;
+}
+
+static void sl_clk_disable(struct clk_hw *hw)
+{
+	struct sl_clk *clk = to_sl_clk(hw);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(clk->lock, flags);
+	val = readl_relaxed(clk->reg);
+	writel_relaxed(val & ~SL_CLK_EN, clk->reg);
+	spin_unlock_irqrestore(clk->lock, flags);
+}
+
+static int sl_clk_is_enabled(struct clk_hw *hw)
+{
+	struct sl_clk *clk = to_sl_clk(hw);
+
+	return !!(readl_relaxed(clk->reg) & SL_CLK_EN);
+}
+
+static const struct clk_ops sl_clk_ops = {
+	.get_parent = sl_clk_get_parent,
+	.set_parent = sl_clk_set_parent,
+	.recalc_rate = sl_clk_recalc_rate,
+	.determine_rate = sl_clk_determine_rate,
+	.set_rate = sl_clk_set_rate,
+	.enable = sl_clk_enable,
+	.disable = sl_clk_disable,
+	.is_enabled = sl_clk_is_enabled,
+};
+
+struct clk_hw *sl_clk_register(struct device *dev, void __iomem *reg,
+			       const char *name, const char * const *parent_names,
+			       unsigned int num_parents, unsigned long flags,
+			       spinlock_t *lock)
+{
+	struct clk_init_data init = {};
+	struct sl_clk *clk;
+	unsigned int i;
+	int ret;
+
+	if (!dev || !reg || !name || !parent_names || !num_parents ||
+	    num_parents > SL_MAX_PARENTS || !lock)
+		return ERR_PTR(-EINVAL);
+
+	for (i = 0; i < num_parents; i++)
+		if (!parent_names[i])
+			return ERR_PTR(-EINVAL);
+
+	clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	clk->dev = dev;
+	clk->reg = reg;
+	clk->lock = lock;
+
+	init.name = name;
+	init.ops = &sl_clk_ops;
+	init.parent_names = parent_names;
+	init.num_parents = num_parents;
+	init.flags = flags;
+	clk->hw.init = &init;
+
+	ret = devm_clk_hw_register(dev, &clk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &clk->hw;
+}
+EXPORT_SYMBOL_GPL(sl_clk_register);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Synaptics SL261x clock divider support");
diff --git a/drivers/clk/berlin/sl-clk.h b/drivers/clk/berlin/sl-clk.h
new file mode 100644
index 000000000000..7489b26a5e8d
--- /dev/null
+++ b/drivers/clk/berlin/sl-clk.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __SL_CLK_H
+#define __SL_CLK_H
+
+#include <linux/compiler_types.h>
+#include <linux/spinlock_types.h>
+
+struct clk_hw;
+struct device;
+
+struct sl_clk_desc {
+	const char	*name;
+	u32		id;
+	u32		offset;
+	unsigned long	flags;
+};
+
+struct sl_gateclk_desc {
+	const char	*name;
+	const char	*parent_name;
+	u32		id;
+	u8		bit_idx;
+	unsigned long	flags;
+};
+
+struct clk_hw *sl_clk_register(struct device *dev, void __iomem *reg,
+			       const char *name, const char * const *parent_names,
+			       unsigned int num_parents, unsigned long flags,
+			       spinlock_t *lock);
+
+#endif /* __SL_CLK_H */
diff --git a/drivers/clk/berlin/sl-sysmgr-clk.c b/drivers/clk/berlin/sl-sysmgr-clk.c
new file mode 100644
index 000000000000..f3cf921fc3c1
--- /dev/null
+++ b/drivers/clk/berlin/sl-sysmgr-clk.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ *
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/slab.h>
+#include <linux/platform_device.h>
+#include <linux/version.h>
+
+#include "sl-sysmgr-clk.h"
+
+#define CLK_EN		BIT(0)
+#define DIV_CHNG_EN	BIT(1)
+
+struct sl_sysmgr_gateclk {
+	struct clk_hw hw;
+	void __iomem *base;
+	u8 bit_idx;
+};
+
+struct sl_sysmgr_clk {
+	struct clk_hw hw;
+	void __iomem *base;
+	u8 div_bits;
+};
+
+struct sl_sysmgr_clk_priv {
+	struct sl_sysmgr_gateclk *gclks;
+	struct sl_sysmgr_clk *clks;
+};
+
+static DEFINE_SPINLOCK(sl_sysmgr_gateclk_lock);
+
+#define to_sl_sysmgr_gateclk(hw)	container_of(hw, struct sl_sysmgr_gateclk, hw)
+#define to_sl_sysmgr_clk(hw)		container_of(hw, struct sl_sysmgr_clk, hw)
+
+static int sl_sysmgr_gateclk_enable(struct clk_hw *hw)
+{
+	u32 val;
+	struct sl_sysmgr_gateclk *clk = to_sl_sysmgr_gateclk(hw);
+
+	guard(spinlock)(&sl_sysmgr_gateclk_lock);
+
+	val = readl_relaxed(clk->base);
+	if (!(val & BIT(clk->bit_idx))) {
+		val |= BIT(clk->bit_idx);
+		writel_relaxed(val, clk->base);
+	}
+
+	return 0;
+}
+
+static int sl_sysmgr_gateclk_is_enabled(struct clk_hw *hw)
+{
+	u32 val;
+	struct sl_sysmgr_gateclk *clk = to_sl_sysmgr_gateclk(hw);
+
+	guard(spinlock)(&sl_sysmgr_gateclk_lock);
+
+	val = readl_relaxed(clk->base);
+	val &= BIT(clk->bit_idx);
+
+	return val ? 1 : 0;
+}
+
+static const struct clk_ops sl_sysmgr_gateclk_ops = {
+	.enable		= sl_sysmgr_gateclk_enable,
+	.is_enabled	= sl_sysmgr_gateclk_is_enabled,
+};
+
+static int
+sl_sysmgr_gateclk_register(struct device *dev, struct sl_sysmgr_gateclk *gclk,
+			   const char *name, const char *parent_names,
+			   u8 bit_idx, void __iomem *base)
+{
+	struct clk_init_data init;
+
+	init.name = name;
+	init.ops = &sl_sysmgr_gateclk_ops;
+	init.parent_names = &parent_names;
+	init.num_parents = 1;
+	init.flags = 0;
+
+	gclk->bit_idx = bit_idx;
+	gclk->base = base;
+	gclk->hw.init = &init;
+
+	return devm_clk_hw_register(dev, &gclk->hw);
+}
+
+static unsigned long
+sl_sysmgr_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	u32 val, div;
+	struct sl_sysmgr_clk *clk = to_sl_sysmgr_clk(hw);
+
+	val = readl_relaxed(clk->base);
+	div = (val >> 2) & ((1 << clk->div_bits) - 1);
+	++div;
+
+	return parent_rate / div;
+}
+
+static int sl_sysmgr_clk_enable(struct clk_hw *hw)
+{
+	u32 val;
+	struct sl_sysmgr_clk *clk = to_sl_sysmgr_clk(hw);
+
+	val = readl_relaxed(clk->base);
+	if (!(val & CLK_EN)) {
+		val |= CLK_EN;
+		writel_relaxed(val, clk->base);
+	}
+
+	return 0;
+}
+
+static int sl_sysmgr_clk_is_enabled(struct clk_hw *hw)
+{
+	u32 val;
+	struct sl_sysmgr_clk *clk = to_sl_sysmgr_clk(hw);
+
+	val = readl_relaxed(clk->base);
+	val &= CLK_EN;
+
+	return val ? 1 : 0;
+}
+
+static const struct clk_ops sl_sysmgr_clk_ops = {
+	.recalc_rate	= sl_sysmgr_clk_recalc_rate,
+	.enable		= sl_sysmgr_clk_enable,
+	.is_enabled	= sl_sysmgr_clk_is_enabled,
+};
+
+static int
+sl_sysmgr_clk_register(struct device *dev, struct sl_sysmgr_clk *sclk,
+		       const char *name, const char *parent_names,
+		       u8 div_bits, void __iomem *base)
+{
+	struct clk_init_data init;
+
+	init.name = name;
+	init.ops = &sl_sysmgr_clk_ops;
+	init.parent_names = &parent_names;
+	init.num_parents = 1;
+	init.flags = 0;
+
+	sclk->div_bits = div_bits;
+	sclk->base = base;
+	sclk->hw.init = &init;
+
+	return devm_clk_hw_register(dev, &sclk->hw);
+}
+
+int sl_sysmgr_clk_setup(struct platform_device *pdev,
+			const struct sl_sysmgr_fixedclk_desc *fdescs,
+			int fclk_n,
+			const struct sl_sysmgr_gateclk_desc *gdescs,
+			int gclk_n,
+			u32 gclk_offset,
+			const struct sl_sysmgr_clk_desc *descs,
+			int clk_n)
+{
+	struct device_node *parent_np = pdev->dev.parent->of_node;
+	int i, ret, num = fclk_n + gclk_n + clk_n;
+	struct clk_hw_onecell_data *clk_data;
+	struct sl_sysmgr_clk_priv *priv;
+	struct clk_hw *clk_hw;
+	void __iomem *base;
+	u32 id;
+
+	clk_data = devm_kzalloc(&pdev->dev, struct_size(clk_data, hws, num), GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+	clk_data->num = num;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->gclks = devm_kcalloc(&pdev->dev, gclk_n, sizeof(*priv->gclks), GFP_KERNEL);
+	if (!priv->gclks)
+		return -ENOMEM;
+
+	priv->clks = devm_kcalloc(&pdev->dev, clk_n, sizeof(*priv->clks), GFP_KERNEL);
+	if (!priv->clks)
+		return -ENOMEM;
+
+	base = devm_of_iomap(&pdev->dev, parent_np, 0, NULL);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	for (i = 0; i < fclk_n; i++) {
+		clk_hw = devm_clk_hw_register_fixed_rate(&pdev->dev, fdescs[i].name,
+							 NULL, 0,
+							 fdescs[i].rate);
+		if (IS_ERR(clk_hw))
+			return PTR_ERR(clk_hw);
+
+		id = fdescs[i].id;
+		clk_data->hws[id] = clk_hw;
+	}
+
+	for (i = 0; i < gclk_n; i++) {
+		ret = sl_sysmgr_gateclk_register(&pdev->dev, &priv->gclks[i],
+						 gdescs[i].name, gdescs[i].parent_name,
+						 gdescs[i].bit_idx, base + gclk_offset);
+		if (ret)
+			return ret;
+
+		id = gdescs[i].id;
+		clk_data->hws[id] = &priv->gclks[i].hw;
+	}
+
+	for (i = 0; i < clk_n; i++) {
+		ret = sl_sysmgr_clk_register(&pdev->dev, &priv->clks[i],
+					     descs[i].name, descs[i].parent_name,
+					     descs[i].div_bits, base + descs[i].offset);
+		if (ret)
+			return ret;
+
+		id = descs[i].id;
+		clk_data->hws[id] = &priv->clks[i].hw;
+	}
+
+	platform_set_drvdata(pdev, priv);
+
+	return devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get, clk_data);
+}
+EXPORT_SYMBOL_GPL(sl_sysmgr_clk_setup);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
+MODULE_DESCRIPTION("SysMgr domain clk driver for Synaptics SL SoCs");
diff --git a/drivers/clk/berlin/sl-sysmgr-clk.h b/drivers/clk/berlin/sl-sysmgr-clk.h
new file mode 100644
index 000000000000..5ccf388bcccb
--- /dev/null
+++ b/drivers/clk/berlin/sl-sysmgr-clk.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2026 Synaptics Incorporated
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ *
+ */
+
+#ifndef __SL_SYSMGR_CLK_H
+#define __SL_SYSMGR_CLK_H
+
+struct sl_sysmgr_clk_desc {
+	const char	*name;
+	const char	*parent_name;
+	u32		id;
+	u32		offset;
+	u8		div_bits;
+	unsigned long	flags;
+};
+
+struct sl_sysmgr_gateclk_desc {
+	const char	*name;
+	const char	*parent_name;
+	u32		id;
+	u8		bit_idx;
+	unsigned long	flags;
+};
+
+struct sl_sysmgr_fixedclk_desc {
+	const char	*name;
+	u32		id;
+	unsigned long	rate;
+};
+
+int sl_sysmgr_clk_setup(struct platform_device *pdev,
+			const struct sl_sysmgr_fixedclk_desc *fdescs,
+			int fclk_n,
+			const struct sl_sysmgr_gateclk_desc *gdescs,
+			int gclk_n,
+			u32 gclk_offset,
+			const struct sl_sysmgr_clk_desc *descs,
+			int clk_n);
+
+#endif
-- 
2.55.0

