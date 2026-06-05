Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E802BE02C
	for <linux-gpio@vger.kernel.org>; Fri,  5 Jun 2026 01:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780621253; cv=none; b=LJHeci835V4HyFoNUg8KHD6MEVMeJi9F54dRQuGJtIk1Y/8aY3sXbz49knfVRQ9ZFXR1AoOJLWNrJWeLyihsoP6+GxIZ1nYFLN5ZM29wsOSCCFIAfaFOsaI5SFjFNcTrr1dtwmECBIK3q8MnzlcVZLLpp/7xzvDCRg4x6UtJgaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780621253; c=relaxed/simple;
	bh=x3hFYwAiPvlZKk9+fPMM1pZD6sj2EWkFRwILmjFArYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BmzM7XACbBGYRkATcT5kpKzmGWhX1q4zh5ZvMnTKsA0RTrNbeyy3V78X8zQNUOa1akSluDyCxUJeiaKAuF+Qygupkl6BOKoHXQT8k/w8CwLJyXoqITKOPMqtT78bTtNqb461HjVBk7LloBlt0zZydvQVIfNN967V4/kagpygSQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=HumXQT81; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="HumXQT81"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-486539875c1so571206b6e.0
        for <linux-gpio@vger.kernel.org>; Thu, 04 Jun 2026 18:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621238; x=1781226038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXOGCojLUBGZIqNUtQ7tDvedemfOzrCuti6WoAljgjQ=;
        b=HumXQT81dRRRCv6lwk4IzuFxR/rLQgkWK0lkFJXVU0HQCLJkE54RzZ50t5iz4Cl1BU
         vCGkN2oF1KmrU5oCasLRn8YcsEf6k1cCvl2rihWghvy2SRBZaciXvF4cFbqeLHm/DtOb
         roQtF9IMBWYR2/Lp6c2vm0fRPRMSBxh5ILYSx7L4nr8GV1JClEWErkrfAFiwtDuqoSr0
         0N2mZbekrLDyBR4sMa7es5I0HZ0F9PGXR3SOxC1VfpPK7ou8O4ATmLMNx1829e9IVURw
         qsfRIRvXhasK5Uo0wwjXvkcAqW1E3UQoJtoLLE4vpyLlFSeSxFyvkoZHhXmwerrjMwgN
         5urA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621238; x=1781226038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PXOGCojLUBGZIqNUtQ7tDvedemfOzrCuti6WoAljgjQ=;
        b=mhG1BwzKoZzE1hDbjIz7CArcO6e5W/WzGPiVd8cNxXTLD5lBy+4UKZkX3JIZeADP4c
         8cUz0J1OnCBGiQ8EOixglLb5h489F9stOkokoWRh11imj3U1MjpqFGWoieD3/gIiYxyN
         LrQnbVQj/v4msSHyulxK+q0RetvX0ewlCJZAJFyf5ov10Y6LkoHl5KCW4MgvElOXw1dx
         VHRFwgCCVFU7r11bdDpYvyJO96vTAEjG+KlLw/S67Ja9OYk1OzDcMQ8wMUqr2iZL53s3
         OAdOoS5fDL+pg9+E7182/Tz8lfLuOE5efNEO6qHDZYQIx5xx7xhHbDuZ1D6Tjt7LXAmu
         7SmA==
X-Forwarded-Encrypted: i=1; AFNElJ+5+3fmYtX80zYk1P3ou7AuKCxBEjHXDZOZLoSnUWyRd0LgTbhzi1M6N6wPH8vfxInPf2zLff3knQIB@vger.kernel.org
X-Gm-Message-State: AOJu0YznIbQA0JnCQGzbi+0Ka4m5MUKkNyGZYABhR+YKhVg7u27r2Eqs
	FiXOhofWgNfrzNKd6uGFrPNA1SAnB0DgOMS8YW26ElF0OxYp7HtaZNNxWcSHy6k/OmU=
X-Gm-Gg: Acq92OHvkT9WB15cmjMX37aGUF8bmkAApdCBURuuXxPb2zaiQmhpL+FJCuD34ou3Vg4
	No0V4Fv5ovLAJtdO94fAZw3LfavNMo/PV5N306lS3qxH7qEKEmGi2v+/5KpcFJD1/IfmBpHcz5T
	42HZONwxRmljHranrLu+fLWWmWUGFWrhUKlSj10BJBGPkBcWNJiNw4UnoqOjInUTvVnHGxYG8Yd
	w1Ipg/TQYxB07+ZVL7oDhIL2YGqoA2wgJaetzcZjUTXxSLnLgNsy9ABwSuSgxJQG7v+/BAGsC3L
	vBstJhMXkFdUH+XD/KjH9gB0f3XKre5VLka4PmsMhiKeBisDNkr/3hWHB4YfCHCzzysJ8lyJjFz
	OxWWLNyiG0fNBvEehjX/nMgxROt6/CgIFWIDS3wWBxKaMWCto3IdJVw92SxLQakiE7XlysYzJRD
	6/z7dZpgIW6OnZF/E2YWa9wEindUBQVC5L1wmf/A==
X-Received: by 2002:a05:6808:1a0d:b0:486:5275:8144 with SMTP id 5614622812f47-4868dc44e20mr851607b6e.2.1780621237642;
        Thu, 04 Jun 2026 18:00:37 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:37 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 03/14] net: pcs: pcs-xpcs-regmap: support XPCS memory-mapped MDIO bus via regmap
Date: Thu,  4 Jun 2026 20:00:10 -0500
Message-ID: <20260605010022.968612-4-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

In some DesignWare XPCS implementatons the memory-mapped MDIO bus is
allocated to a register window that does not align to a page boundary.
This makes iomapping the registers problematic.

For example the Toshiba TC9564 (a PCIe Ethernet-AVB/TSN bridge) provides
an "eMAC" subsystem with the XPCS base address cuddled up to XGMAC
registers.

Let's introduce helpers to allow the driver that owns the eMAC to register
an XPCS using is regmap for the memory-mapped MDIO bus.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 MAINTAINERS                         |   2 +
 drivers/net/pcs/Makefile            |   4 +-
 drivers/net/pcs/pcs-xpcs-regmap.c   | 219 ++++++++++++++++++++++++++++
 include/linux/pcs/pcs-xpcs-regmap.h |  20 +++
 4 files changed, 243 insertions(+), 2 deletions(-)
 create mode 100644 drivers/net/pcs/pcs-xpcs-regmap.c
 create mode 100644 include/linux/pcs/pcs-xpcs-regmap.h

diff --git a/MAINTAINERS b/MAINTAINERS
index eb8cdcc76324f..2aa6ea012c848 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25931,8 +25931,10 @@ F:	drivers/net/ethernet/synopsys/
 SYNOPSYS DESIGNWARE ETHERNET XPCS DRIVER
 L:	netdev@vger.kernel.org
 S:	Orphan
+F:	drivers/net/pcs/pcs-xpcs-regmap.c
 F:	drivers/net/pcs/pcs-xpcs.c
 F:	drivers/net/pcs/pcs-xpcs.h
+F	include/linux/pcs/pcs-xpcs-regmap.h
 F:	include/linux/pcs/pcs-xpcs.h
 
 SYNOPSYS DESIGNWARE HDMI RX CONTROLLER DRIVER
diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
index 4f7920618b900..565f1b63fce0b 100644
--- a/drivers/net/pcs/Makefile
+++ b/drivers/net/pcs/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux PCS drivers
 
-pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-plat.o \
-				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
+pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-nxp.o pcs-xpcs-regmap.o \
+				   pcs-xpcs-plat.o pcs-xpcs-wx.o
 
 obj-$(CONFIG_PCS_XPCS)		+= pcs_xpcs.o
 obj-$(CONFIG_PCS_LYNX)		+= pcs-lynx.o
diff --git a/drivers/net/pcs/pcs-xpcs-regmap.c b/drivers/net/pcs/pcs-xpcs-regmap.c
new file mode 100644
index 0000000000000..55cd05d09c7db
--- /dev/null
+++ b/drivers/net/pcs/pcs-xpcs-regmap.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Synopsys DesignWare XPCS regmap helpers
+ *
+ * Copyright (C) 2026 RISCstar Solutions.
+ * Copyright (C) 2024 Serge Semin
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mdio.h>
+#include <linux/pcs/pcs-xpcs.h>
+#include <linux/pcs/pcs-xpcs-regmap.h>
+#include <linux/regmap.h>
+
+#include "pcs-xpcs.h"
+
+/* Page select register for the indirect MMIO CSRs access */
+#define DW_VR_CSR_VIEWPORT		0xff
+
+struct dw_xpcs_regmap {
+	struct device *dev;
+	struct mii_bus *bus;
+	struct regmap *regmap;
+	bool reg_indir;
+};
+
+static ptrdiff_t xpcs_regmap_addr_format(int dev, int reg)
+{
+	return FIELD_PREP(0x1f0000, dev) | FIELD_PREP(0xffff, reg);
+}
+
+static u16 xpcs_regmap_addr_page(ptrdiff_t csr)
+{
+	return FIELD_GET(0x1fff00, csr);
+}
+
+static ptrdiff_t xpcs_regmap_addr_offset(ptrdiff_t csr)
+{
+	return FIELD_GET(0xff, csr);
+}
+
+static int xpcs_regmap_read_reg_indirect(struct dw_xpcs_regmap *pxpcs, int dev,
+					 int reg)
+{
+	ptrdiff_t csr, ofs;
+	unsigned int val;
+	u16 page;
+	int res;
+
+	csr = xpcs_regmap_addr_format(dev, reg);
+	page = xpcs_regmap_addr_page(csr);
+	ofs = xpcs_regmap_addr_offset(csr);
+
+	res = regmap_write(pxpcs->regmap, DW_VR_CSR_VIEWPORT, page);
+	if (res < 0)
+		return res;
+
+	res = regmap_read(pxpcs->regmap, ofs, &val);
+	if (res < 0)
+		return res;
+
+	return val & 0xffff;
+}
+
+static int xpcs_regmap_write_reg_indirect(struct dw_xpcs_regmap *pxpcs, int dev,
+					  int reg, u16 val)
+{
+	ptrdiff_t csr, ofs;
+	u16 page;
+	int res;
+
+	csr = xpcs_regmap_addr_format(dev, reg);
+	page = xpcs_regmap_addr_page(csr);
+	ofs = xpcs_regmap_addr_offset(csr);
+
+	res = regmap_write(pxpcs->regmap, DW_VR_CSR_VIEWPORT, page);
+	if (res < 0)
+		return res;
+
+	return regmap_write(pxpcs->regmap, ofs, val);
+}
+
+static int xpcs_regmap_read_reg_direct(struct dw_xpcs_regmap *pxpcs, int dev,
+				       int reg)
+{
+	unsigned int val;
+	ptrdiff_t csr;
+	int res;
+
+	csr = xpcs_regmap_addr_format(dev, reg);
+	res = regmap_read(pxpcs->regmap, csr, &val);
+	if (res < 0)
+		return res;
+
+	return val & 0xffff;
+}
+
+static int xpcs_regmap_write_reg_direct(struct dw_xpcs_regmap *pxpcs, int dev,
+					int reg, u16 val)
+{
+	ptrdiff_t csr = xpcs_regmap_addr_format(dev, reg);
+
+	return regmap_write(pxpcs->regmap, csr, val);
+}
+
+static int xpcs_regmap_read_c22(struct mii_bus *bus, int addr, int reg)
+{
+	struct dw_xpcs_regmap *pxpcs = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	if (pxpcs->reg_indir)
+		return xpcs_regmap_read_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg);
+	else
+		return xpcs_regmap_read_reg_direct(pxpcs, MDIO_MMD_VEND2, reg);
+}
+
+static int xpcs_regmap_write_c22(struct mii_bus *bus, int addr, int reg, u16 val)
+{
+	struct dw_xpcs_regmap *pxpcs = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	if (pxpcs->reg_indir)
+		return xpcs_regmap_write_reg_indirect(pxpcs, MDIO_MMD_VEND2, reg, val);
+	else
+		return xpcs_regmap_write_reg_direct(pxpcs, MDIO_MMD_VEND2, reg, val);
+}
+
+static int xpcs_regmap_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
+{
+	struct dw_xpcs_regmap *pxpcs = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	if (pxpcs->reg_indir)
+		return xpcs_regmap_read_reg_indirect(pxpcs, dev, reg);
+	else
+		return xpcs_regmap_read_reg_direct(pxpcs, dev, reg);
+}
+
+static int xpcs_regmap_write_c45(struct mii_bus *bus, int addr, int dev,
+				 int reg, u16 val)
+{
+	struct dw_xpcs_regmap *pxpcs = bus->priv;
+
+	if (addr != 0)
+		return -ENODEV;
+
+	if (pxpcs->reg_indir)
+		return xpcs_regmap_write_reg_indirect(pxpcs, dev, reg, val);
+	else
+		return xpcs_regmap_write_reg_direct(pxpcs, dev, reg, val);
+}
+
+static void devm_xpcs_regmap_destroy(void *data)
+{
+	struct dw_xpcs *xpcs = data;
+
+	xpcs_destroy(xpcs);
+}
+
+struct dw_xpcs *devm_xpcs_regmap_register(struct device *dev,
+					  const struct xpcs_regmap_config *config)
+{
+	static atomic_t id = ATOMIC_INIT(-1);
+	struct dw_xpcs_regmap *pxpcs;
+	struct dw_xpcs *xpcs;
+	int ret;
+
+	pxpcs = devm_kzalloc(dev, sizeof(*pxpcs), GFP_KERNEL);
+	if (!pxpcs)
+		return ERR_PTR(-ENOMEM);
+
+	pxpcs->dev = dev;
+	pxpcs->regmap = config->regmap;
+	pxpcs->reg_indir = config->reg_indir;
+
+	pxpcs->bus = devm_mdiobus_alloc_size(dev, 0);
+	if (!pxpcs->bus)
+		return ERR_PTR(-ENOMEM);
+
+	pxpcs->bus->name = "DW XPCS MCI/APB3";
+	pxpcs->bus->read = xpcs_regmap_read_c22;
+	pxpcs->bus->write = xpcs_regmap_write_c22;
+	pxpcs->bus->read_c45 = xpcs_regmap_read_c45;
+	pxpcs->bus->write_c45 = xpcs_regmap_write_c45;
+	pxpcs->bus->phy_mask = ~0;
+	pxpcs->bus->parent = dev;
+	pxpcs->bus->priv = pxpcs;
+
+	snprintf(pxpcs->bus->id, MII_BUS_ID_SIZE,
+		 "dwxpcs-%x", atomic_inc_return(&id));
+
+	/* MDIO-bus here serves as just a back-end engine abstracting out
+	 * the MDIO and MCI/APB3 IO interfaces utilized for the DW XPCS CSRs
+	 * access.
+	 */
+	ret = devm_mdiobus_register(dev, pxpcs->bus);
+	if (ret) {
+		dev_err(dev, "Failed to create MDIO bus\n");
+		return ERR_PTR(ret);
+	}
+
+	xpcs = xpcs_create_mdiodev(pxpcs->bus, 0);
+	if (IS_ERR(xpcs))
+		return xpcs;
+
+	ret = devm_add_action_or_reset(dev, devm_xpcs_regmap_destroy, xpcs);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return xpcs;
+}
+EXPORT_SYMBOL_GPL(devm_xpcs_regmap_register);
diff --git a/include/linux/pcs/pcs-xpcs-regmap.h b/include/linux/pcs/pcs-xpcs-regmap.h
new file mode 100644
index 0000000000000..19c99d4160365
--- /dev/null
+++ b/include/linux/pcs/pcs-xpcs-regmap.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_PCS_XPCS_REGMAP_H
+#define __LINUX_PCS_XPCS_REGMAP_H
+
+#include <linux/types.h>
+
+struct device;
+struct regmap;
+struct dw_xpcs;
+
+struct xpcs_regmap_config {
+	struct regmap *regmap;
+	bool reg_indir;
+};
+
+struct dw_xpcs *devm_xpcs_regmap_register(
+		struct device *dev, const struct xpcs_regmap_config *config);
+
+#endif /* __LINUX_PCS_XPCS_REGMAP_H */
-- 
2.51.0

