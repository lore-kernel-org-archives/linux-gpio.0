Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855151;
	b=NNfxyCA1L+otU6SRWK0EJTKMQyit31sf6Rx1DNJCGul5ZL+kttYzEPYKKlLahq0C+Kb7
	 tvGqZ3/bh86ZDgCx2TlN6Wytow3Yriy218HWzhYTcGTRoozEpIhoOthPXH/wOMYvcv/2Z
	 N/It8n7kTpkaA38gMuaLVO+g/ymgrmtZi7pp1HX8k8+YuqPHTwP+Gb09i3JPSvN2tVGj7
	 S3+mbHUZSbQKatRU1g22zt0DjSxwCM5Ho/tg1AZzSWoNfBwGvXaol8s/3WuYLRGNCol01
	 rPmXFeQwIY4QEad6leAYU0yy/8NXKQyUw190H7YCIvUM0nhrUcBwm+CY7Qb1GNW7mqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855151;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=rbvJS0xl7CYpsd+FTiYuxn7gVuki8LvVWlYqdVSG/Wc=;
	b=nUQytelozrb9d+jqNllpXhR1EMFc4lf6CXb3wVWq/JKGVS/J02cyW5GfY0YECMXVZLiT
	 NZfZn8infur53KcX5eYXPe2eq6Bt1fr8C7pIPRiOkCzIBvvLb6X03qTFytE4/b3UOxmJZ
	 LkDn2lRtFFR/psPrsvUtSVGipcIHyoRpKzrFo7wFnJmvgqgdQpymycRsUW4AkycBYiueW
	 WPRxpTsJWjLwYJid6waMVHeYUHC3D6/GuJzjqJz2DL0jaBFndMOaFHRLCG/9zwyX9DJxJ
	 BvP0ecAf+K3fosvlh7jwHO40m/Y2XCoZhGyGoZ80saIYgWP8aBupjSUSFfQyt2ytu/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=kdTMRetX;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22304606A31B;
	Thu,  5 Nov 2026 05:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22304606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=kdTMRetX
X-UUID: 8a940ac0d8d611f18dc8c9802ae25ab1-20261105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rbvJS0xl7CYpsd+FTiYuxn7gVuki8LvVWlYqdVSG/Wc=;
	b=kdTMRetX0daqa5//CQteR9BJZ/Qft0jxnRezozmPxY4krgCZhZK8UFC3LIiBdZ4wVl9ffBcMSJGwdAZ5XM3NGqEthb3ruhtzZdlE6ZlIk/xFnV4FRp1a59EomMRhgYtbF9E0wo+a62vBwWppXp+gAiF1U0YvY7UmkC+j4BmhIjY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:2848c7e1-b5e3-4e9a-be8a-c4205f2e5911,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:df60a456-6f68-464f-9fe4-a2bcffa484f1,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8a940ac0d8d611f18dc8c9802ae25ab1-20261105
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <shubham.paralikar@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 656119832; Thu, 05 Nov 2026 13:05:38 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 5 Nov 2026 13:05:36 +0800
Received: from mediatek.com (10.233.130.16) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Thu, 5 Nov 2026 13:05:36 +0800
Received: by mediatek.com (Postfix, from userid 10034982)
	id DD1CF200C5; Thu,  5 Nov 2026 13:05:36 +0800 (CST)
From: Shubham Paralikar <shubham.paralikar@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bartosz Golaszewski
	<brgl@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, Shubham
 Paralikar <shubham.paralikar@mediatek.com>
Subject: [PATCH v3] pinctrl: mediatek: Add MT8901/MT8971 ACPI driver
Date: Thu, 5 Nov 2026 13:05:32 +0800
Message-ID: <20261105050535.2551413-1-shubham.paralikar@mediatek.com>
X-Mailer: git-send-email 2.45.2
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
Content-Type: text/plain
X-MTK: N

MT8901 and MT8971 are booted with ACPI firmware and both describe their
GPIO controller with the same _HID, NVDA9221. The existing MediaTek
Paris pinctrl drivers only probe from devicetree and pick their SoC
data from the match table, so neither SoC gets pin control, GPIOs or
EINT interrupts, and two per-SoC drivers could not both bind the one
shared HID.

Add a single driver, pinctrl-mt89xx, that matches NVDA9221 and selects
the MT8901 or MT8971 pin and EINT tables at probe time from the
"ChipId" property in the controller's vendor _DSD. That _DSD uses a
MediaTek UUID rather than the Device Properties UUID, so
device_property_read_u32() cannot read it; pinctrl-mtk-dsd evaluates
_DSD and walks the package directly. All four objects are linked into
one module, pinctrl-mtk-mt89xx.

Make the shared Paris, common-v2 and EINT code work on ACPI and with
these SoCs:

- paris: add mtk_paris_pinctrl_probe_soc() for drivers that pick the
  SoC data themselves. ACPI resources have no names, so map the pin
  register bases by resource index on ACPI. Register a GPIO range and
  request the ACPI _AEI event interrupts, and support
  PIN_CONFIG_BIAS_BUS_HOLD.
- common-v2: on ACPI, count the EINT banks from the MEM resources and
  take the IRQ from the platform device instead of from DT. Add
  reg_order[] field tables for SoCs whose per-pin registers sit at a
  fixed stride (MT8971), wake-event EINT lists and bus-hold bias
  (PU=1, PD=1).
- mtk-eint: add a skip list so the init-time mask sweep leaves
  firmware-owned EINTs alone (MT8971 EINT215, PROCHOT), and add the
  MT8901 debounce table. On SoCs with a wake-event mask (MT8901),
  unmask the event for the static event list at init and for EINTs
  armed through irq_set_wake(), mask it again when wake is disabled,
  and re-apply both on resume.
- MT8901: add EINT-only virtual GPIOs 182-208, such as the xHCI wake
  events, which firmware describes as GpioInt resources on this
  controller. Skip pinmux, direction and pinconf for them, and report
  debounce as unsupported on EINTs without debounce hardware.
- Add mtk_pinctrl_program_bias_by_gpio() in
  include/linux/soc/mediatek/mtk-pinctrl.h so client drivers can
  program pad bias by absolute GPIO number.
- gpio: declare acpi_gpiochip_request_interrupts() and
  acpi_gpiochip_free_interrupts() in linux/gpio/driver.h. MediaTek
  EINT provides .to_irq instead of a gpio_irq_chip, so gpiolib does
  not request the _AEI interrupts for this controller by itself.

Signed-off-by: Shubham Paralikar <shubham.paralikar@mediatek.com>
---
 drivers/pinctrl/mediatek/Kconfig              |   14 +-
 drivers/pinctrl/mediatek/Makefile             |    3 +
 drivers/pinctrl/mediatek/mtk-eint.c           |  251 +-
 drivers/pinctrl/mediatek/mtk-eint.h           |   16 +-
 drivers/pinctrl/mediatek/pinctrl-mt8901.c     | 1437 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mt8971.c     |   58 +
 drivers/pinctrl/mediatek/pinctrl-mt89xx.c     |  102 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |  252 +-
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |   43 +
 drivers/pinctrl/mediatek/pinctrl-mtk-dsd.c    |  140 +
 drivers/pinctrl/mediatek/pinctrl-mtk-dsd.h    |   36 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h | 2296 +++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h | 1646 ++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  144 +-
 drivers/pinctrl/mediatek/pinctrl-paris.h      |    6 +
 include/linux/gpio/driver.h                   |    5 +
 include/linux/soc/mediatek/mtk-pinctrl.h      |   43 +
 17 files changed, 6450 insertions(+), 42 deletions(-)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8901.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8971.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt89xx.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-dsd.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-dsd.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h
 create mode 100644 include/linux/soc/mediatek/mtk-pinctrl.h

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 912d782fb6a5..9575d33a770e 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -39,7 +39,7 @@ config PINCTRL_MTK_MOORE
 
 config PINCTRL_MTK_PARIS
 	tristate
-	depends on OF
+	depends on OF || ACPI
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB
@@ -283,6 +283,18 @@ config PINCTRL_MT8189
           In MTK platform, we support virtual gpio and use it to
           map specific eint which doesn't have real gpio pin.
 
+config PINCTRL_MT89XX
+	tristate "MediaTek MT8901/MT8971 pin control"
+	depends on ACPI
+	depends on ARM64 || COMPILE_TEST
+	default ARM64 && ARCH_MEDIATEK
+	select PINCTRL_MTK_PARIS
+	help
+	  Say yes here to support the pin controller and GPIO driver for
+	  the MediaTek MT8901 and MT8971 SoCs on ACPI platforms.
+	  In MTK platform, we support virtual gpio and use it to
+	  map specific eint which doesn't have real gpio pin.
+
 config PINCTRL_MT8192
 	tristate "MediaTek MT8192 pin control"
 	depends on OF
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
index 9982866359af..e2b459cf1c1f 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -44,3 +44,6 @@ obj-$(CONFIG_PINCTRL_MT8196)		+= pinctrl-mt8196.o
 obj-$(CONFIG_PINCTRL_MT8365)		+= pinctrl-mt8365.o
 obj-$(CONFIG_PINCTRL_MT8516)		+= pinctrl-mt8516.o
 obj-$(CONFIG_PINCTRL_MT6397)		+= pinctrl-mt6397.o
+obj-$(CONFIG_PINCTRL_MT89XX)		+= pinctrl-mtk-mt89xx.o
+pinctrl-mtk-mt89xx-y			:= pinctrl-mt89xx.o pinctrl-mt8901.o \
+					   pinctrl-mt8971.o pinctrl-mtk-dsd.o
diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 827231dc0d24..7b3198396b6e 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -51,6 +51,9 @@ static const struct mtk_eint_regs mtk_generic_eint_regs = {
 	.dbnc_ctrl = 0x500,
 	.dbnc_set  = 0x600,
 	.dbnc_clr  = 0x700,
+	.event     = 0x800,
+	.event_set = 0x840,
+	.event_clr = 0x880,
 };
 
 const unsigned int debounce_time_mt2701[] = {
@@ -73,14 +76,23 @@ const unsigned int debounce_time_mt6878[] = {
 };
 EXPORT_SYMBOL_GPL(debounce_time_mt6878);
 
+const unsigned int debounce_time_mt8901[] = {
+	156, 313, 625, 1250, 20000, 40000, 80000, 160000, 320000, 640000, 0
+};
+EXPORT_SYMBOL_GPL(debounce_time_mt8901);
+
 static void __iomem *mtk_eint_get_offset(struct mtk_eint *eint,
-					 unsigned int eint_num,
+					 unsigned long eint_num,
 					 unsigned int offset)
 {
 	unsigned int idx = eint->pins[eint_num].index;
 	unsigned int inst = eint->pins[eint_num].instance;
 	void __iomem *reg;
 
+	/* Pins without EINT hardware have instance >= nbase. */
+	if (inst >= eint->nbase)
+		return NULL;
+
 	reg = eint->base[inst] + offset + (idx / 32 * 4);
 
 	return reg;
@@ -94,6 +106,10 @@ static unsigned int mtk_eint_can_en_debounce(struct mtk_eint *eint,
 	void __iomem *reg = mtk_eint_get_offset(eint, eint_num,
 						eint->regs->sens);
 
+	/* Pins without EINT hardware cannot debounce. */
+	if (!reg)
+		return 0;
+
 	if (readl(reg) & bit)
 		sens = MTK_EINT_LEVEL_SENSITIVE;
 	else
@@ -111,7 +127,14 @@ static int mtk_eint_flip_edge(struct mtk_eint *eint, int hwirq)
 	unsigned int reg_offset;
 	unsigned int mask = BIT(eint->pins[hwirq].index & 0x1f);
 	unsigned int port = (eint->pins[hwirq].index >> 5) & eint->hw->port_mask;
-	void __iomem *reg = eint->base[eint->pins[hwirq].instance] + (port << 2);
+	unsigned int inst = eint->pins[hwirq].instance;
+	void __iomem *reg;
+
+	/* Sentinel pin: no EINT hardware, nothing to flip. */
+	if (inst >= eint->nbase)
+		return 0;
+
+	reg = eint->base[inst] + (port << 2);
 
 	curr_level = eint->gpio_xlate->get_gpio_state(eint->pctl, hwirq);
 
@@ -136,9 +159,13 @@ static void mtk_eint_mask(struct irq_data *d)
 	unsigned int idx = eint->pins[d->hwirq].index;
 	unsigned int inst = eint->pins[d->hwirq].instance;
 	unsigned int mask = BIT(idx & 0x1f);
-	void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
-						eint->regs->mask_set);
+	void __iomem *reg;
 
+	/* Sentinel pin: no EINT hardware backing this GPIO. */
+	if (inst >= eint->nbase)
+		return;
+
+	reg = mtk_eint_get_offset(eint, d->hwirq, eint->regs->mask_set);
 	eint->cur_mask[inst][idx >> 5] &= ~mask;
 
 	writel(mask, reg);
@@ -150,9 +177,13 @@ static void mtk_eint_unmask(struct irq_data *d)
 	unsigned int idx = eint->pins[d->hwirq].index;
 	unsigned int inst = eint->pins[d->hwirq].instance;
 	unsigned int mask = BIT(idx & 0x1f);
-	void __iomem *reg = mtk_eint_get_offset(eint, d->hwirq,
-						eint->regs->mask_clr);
+	void __iomem *reg;
 
+	/* Sentinel pin: no EINT hardware backing this GPIO. */
+	if (inst >= eint->nbase)
+		return;
+
+	reg = mtk_eint_get_offset(eint, d->hwirq, eint->regs->mask_clr);
 	eint->cur_mask[inst][idx >> 5] |= mask;
 
 	writel(mask, reg);
@@ -161,6 +192,111 @@ static void mtk_eint_unmask(struct irq_data *d)
 		mtk_eint_flip_edge(eint, d->hwirq);
 }
 
+static void mtk_eint_write_event_mask(struct mtk_eint *eint,
+				      unsigned long eint_num,
+				      unsigned int reg_offset)
+{
+	unsigned int idx, inst;
+	unsigned int mask;
+	void __iomem *reg;
+
+	if (!eint->hw->has_event_mask)
+		return;
+
+	if (eint_num >= eint->hw->ap_num)
+		return;
+
+	idx  = eint->pins[eint_num].index;
+	inst = eint->pins[eint_num].instance;
+
+	if (inst >= eint->nbase)
+		return;
+
+	mask = BIT(idx & 0x1f);
+	reg = mtk_eint_get_offset(eint, eint_num, reg_offset);
+	writel(mask, reg);
+}
+
+/*
+ * Clear the event_clr bit for a single EINT so its wake-event is not
+ * suppressed. Mirrors mtk_eint_unmask() addressing: register is banked
+ * per instance and word-indexed by (idx / 32).
+ */
+static void mtk_eint_event_unmask_one(struct mtk_eint *eint,
+				      unsigned long eint_num)
+{
+	mtk_eint_write_event_mask(eint, eint_num, eint->regs->event_clr);
+}
+
+static bool mtk_eint_is_static_event_unmask_pin(struct mtk_eint *eint,
+						unsigned long eint_num)
+{
+	unsigned int i;
+
+	if (!eint->event_pins)
+		return false;
+
+	for (i = 0; i < eint->num_event_pins; i++) {
+		if (eint->event_pins[i] == eint_num)
+			return true;
+	}
+
+	return false;
+}
+
+/*
+ * Set the event mask for a single EINT so its wake-event is suppressed
+ * again. Callers must skip pins in the SoC's static event-unmask list.
+ */
+static void mtk_eint_event_mask_one(struct mtk_eint *eint,
+				    unsigned long eint_num)
+{
+	mtk_eint_write_event_mask(eint, eint_num, eint->regs->event_set);
+}
+
+/*
+ * Clear the event mask of every pin in the SoC's eint_event_unmask list so
+ * their wake events reach the SPM after init and resume.
+ */
+static void mtk_eint_apply_event_unmask(struct mtk_eint *eint)
+{
+	unsigned int i;
+
+	if (!eint->hw->has_event_mask || !eint->event_pins ||
+	    !eint->num_event_pins)
+		return;
+
+	for (i = 0; i < eint->num_event_pins; i++)
+		mtk_eint_event_unmask_one(eint, eint->event_pins[i]);
+}
+
+static void mtk_eint_apply_wake_event_unmask(struct mtk_eint *eint)
+{
+	unsigned int eint_num, pin, shift;
+	unsigned int inst, port, port_num;
+	u32 bits;
+
+	if (!eint->hw->has_event_mask)
+		return;
+
+	for (inst = 0; inst < eint->nbase; inst++) {
+		port_num = DIV_ROUND_UP(eint->base_pin_num[inst], 32);
+		for (port = 0; port < port_num; port++) {
+			bits = eint->wake_mask[inst][port];
+			while (bits) {
+				shift = __ffs(bits);
+				bits &= ~BIT(shift);
+				pin = port * 32 + shift;
+				if (pin >= eint->base_pin_num[inst])
+					continue;
+
+				eint_num = eint->pin_list[inst][pin];
+				mtk_eint_event_unmask_one(eint, eint_num);
+			}
+		}
+	}
+}
+
 static unsigned int mtk_eint_get_mask(struct mtk_eint *eint,
 				      unsigned int eint_num)
 {
@@ -239,10 +375,18 @@ static int mtk_eint_irq_set_wake(struct irq_data *d, unsigned int on)
 	unsigned int shift = idx & 0x1f;
 	unsigned int port = idx >> 5;
 
-	if (on)
+	/* wake_mask[] has nbase entries; pins without EINT hardware cannot wake. */
+	if (inst >= eint->nbase)
+		return 0;
+
+	if (on) {
 		eint->wake_mask[inst][port] |= BIT(shift);
-	else
+		mtk_eint_event_unmask_one(eint, d->hwirq);
+	} else {
 		eint->wake_mask[inst][port] &= ~BIT(shift);
+		if (!mtk_eint_is_static_event_unmask_pin(eint, d->hwirq))
+			mtk_eint_event_mask_one(eint, d->hwirq);
+	}
 
 	return 0;
 }
@@ -250,7 +394,7 @@ static int mtk_eint_irq_set_wake(struct irq_data *d, unsigned int on)
 static void mtk_eint_chip_write_mask(const struct mtk_eint *eint,
 				     unsigned int **buf)
 {
-	int inst, port, port_num;
+	unsigned int inst, port, port_num;
 	void __iomem *reg;
 
 	for (inst = 0; inst < eint->nbase; inst++) {
@@ -270,6 +414,18 @@ static int mtk_eint_irq_request_resources(struct irq_data *d)
 	unsigned int gpio_n;
 	int err;
 
+	/* Pins without EINT hardware cannot be used as interrupts. */
+	if (eint->pins[d->hwirq].instance >= eint->nbase) {
+		dev_info(eint->dev,
+			 "EINT %lu: sentinel pin inst=%u (no EINT HW), rejecting IRQ request\n",
+			 d->hwirq, eint->pins[d->hwirq].instance);
+		return -ENXIO;
+	}
+
+	dev_dbg(eint->dev, "EINT %lu: request_resources inst=%u idx=%u\n",
+		d->hwirq, eint->pins[d->hwirq].instance,
+		eint->pins[d->hwirq].index);
+
 	err = eint->gpio_xlate->get_gpio_n(eint->pctl, d->hwirq,
 					   &gpio_n, &gpio_c);
 	if (err < 0) {
@@ -317,6 +473,31 @@ static struct irq_chip mtk_eint_irq_chip = {
 	.irq_release_resources = mtk_eint_irq_release_resources,
 };
 
+/*
+ * Return the mask_set value for a 32-bit word of bank @inst, leaving
+ * skip-listed EINTs unmasked. dom_en is still set for all EINTs.
+ */
+static unsigned int mtk_eint_mask_word_for_skip(struct mtk_eint *eint,
+						unsigned int inst,
+						unsigned int word_base)
+{
+	unsigned int mask = 0xffffffff;
+	unsigned int k, eint_num, idx;
+
+	for (k = 0; k < eint->num_skip_eint; k++) {
+		eint_num = eint->skip_eint_list[k];
+		if (eint_num >= eint->hw->ap_num)
+			continue;
+		if (eint->pins[eint_num].instance != inst)
+			continue;
+		idx = eint->pins[eint_num].index;
+		if ((idx & ~0x1fu) != word_base)
+			continue;
+		mask &= ~BIT(idx & 0x1f);
+	}
+	return mask;
+}
+
 static unsigned int mtk_eint_hw_init(struct mtk_eint *eint)
 {
 	void __iomem *dom_reg, *mask_reg;
@@ -327,12 +508,38 @@ static unsigned int mtk_eint_hw_init(struct mtk_eint *eint)
 		mask_reg = eint->base[i] + eint->regs->mask_set;
 		for (j = 0; j < eint->base_pin_num[i]; j += 32) {
 			writel(0xffffffff, dom_reg);
-			writel(0xffffffff, mask_reg);
+			writel(mtk_eint_mask_word_for_skip(eint, i, j), mask_reg);
 			dom_reg += 4;
 			mask_reg += 4;
 		}
 	}
+	return 0;
+}
+
+/* Make sure skip-listed EINTs are unmasked and domain enabled. */
+static int mtk_eint_restore_skip_list(struct mtk_eint *eint)
+{
+	unsigned int k, eint_num, inst, idx;
+	void __iomem *reg;
 
+	if (!eint->skip_eint_list || !eint->num_skip_eint)
+		return 0;
+
+	for (k = 0; k < eint->num_skip_eint; k++) {
+		eint_num = eint->skip_eint_list[k];
+		if (eint_num >= eint->hw->ap_num)
+			continue;
+		inst = eint->pins[eint_num].instance;
+		if (inst >= eint->nbase)
+			continue;
+		idx = eint->pins[eint_num].index;
+
+		reg = mtk_eint_get_offset(eint, eint_num, eint->regs->mask_clr);
+		writel(BIT(idx & 0x1f), reg);
+
+		reg = mtk_eint_get_offset(eint, eint_num, eint->regs->dom_en);
+		writel(BIT(idx & 0x1f), reg);
+	}
 	return 0;
 }
 
@@ -371,6 +578,8 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 				shift = __ffs(status);
 				status &= ~BIT(shift);
 				mask = BIT(shift);
+				if (shift + j >= eint->base_pin_num[i])
+					continue;
 				eint_num = eint->pin_list[i][shift + j];
 
 				/*
@@ -436,6 +645,8 @@ EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
 int mtk_eint_do_resume(struct mtk_eint *eint)
 {
 	mtk_eint_chip_write_mask(eint, eint->cur_mask);
+	mtk_eint_apply_event_unmask(eint);
+	mtk_eint_apply_wake_event_unmask(eint);
 
 	return 0;
 }
@@ -536,6 +747,9 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
 {
 	unsigned int size, i, port, virq, inst = 0;
 
+	dev_info(eint->dev, "EINT init: ap_num=%u nbase=%u db_cnt=%u\n",
+		 eint->hw->ap_num, eint->nbase, eint->hw->db_cnt);
+
 	/* If clients don't assign a specific regs, let's use generic one */
 	if (!eint->regs)
 		eint->regs = &mtk_generic_eint_regs;
@@ -553,6 +767,9 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
 				continue;
 			eint->base_pin_num[inst]++;
 		}
+		for (i = 0; i < eint->nbase; i++)
+			dev_info(eint->dev, "EINT init: base[%u] has %u pins\n",
+				 i, eint->base_pin_num[i]);
 	} else {
 		size = eint->hw->ap_num * sizeof(struct mtk_eint_pin);
 		eint->pins = devm_kmalloc(eint->dev, size, GFP_KERNEL);
@@ -602,14 +819,23 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
 	if (!eint->domain)
 		goto err_eint;
 
+	dev_info(eint->dev, "EINT init: irq domain created (ap_num=%u)\n",
+		 eint->hw->ap_num);
+
 	if (eint->hw->db_time) {
 		for (i = 0; i < MTK_EINT_DBNC_MAX; i++)
 			if (eint->hw->db_time[i] == 0)
 				break;
 		eint->num_db_time = i;
+		dev_info(eint->dev, "EINT init: debounce table has %u entries\n",
+			 eint->num_db_time);
+	} else {
+		dev_info(eint->dev, "EINT init: no debounce table (db_time=NULL)\n");
 	}
 
 	mtk_eint_hw_init(eint);
+	dev_info(eint->dev, "EINT init: hw_init done, creating IRQ mappings\n");
+	mtk_eint_restore_skip_list(eint);
 	for (i = 0; i < eint->hw->ap_num; i++) {
 		inst = eint->pins[i].instance;
 		if (inst >= eint->nbase)
@@ -624,9 +850,14 @@ int mtk_eint_do_init(struct mtk_eint *eint, struct mtk_eint_pin *eint_pin)
 	irq_set_chained_handler_and_data(eint->irq, mtk_eint_irq_handler,
 					 eint);
 
+	mtk_eint_apply_event_unmask(eint);
 	return devm_add_action_or_reset(eint->dev, mtk_eint_teardown, eint);
 
 err_eint:
+	if (eint->domain) {
+		irq_domain_remove(eint->domain);
+		eint->domain = NULL;
+	}
 	for (i = 0; i < eint->nbase; i++) {
 		devm_kfree(eint->dev, eint->cur_mask[i]);
 		devm_kfree(eint->dev, eint->wake_mask[i]);
diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
index 3cdd6f6310cd..bc98b0cf335a 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.h
+++ b/drivers/pinctrl/mediatek/mtk-eint.h
@@ -31,6 +31,9 @@ struct mtk_eint_regs {
 	unsigned int	dbnc_ctrl;
 	unsigned int	dbnc_set;
 	unsigned int	dbnc_clr;
+	unsigned int	event;
+	unsigned int	event_set;
+	unsigned int	event_clr;
 };
 
 struct mtk_eint_hw {
@@ -39,6 +42,7 @@ struct mtk_eint_hw {
 	unsigned int	ap_num;
 	unsigned int	db_cnt;
 	const unsigned int *db_time;
+	bool		has_event_mask;
 };
 
 struct mtk_eint_pin {
@@ -53,8 +57,10 @@ extern const unsigned int debounce_time_mt2701[];
 extern const unsigned int debounce_time_mt6765[];
 extern const unsigned int debounce_time_mt6795[];
 extern const unsigned int debounce_time_mt6878[];
+extern const unsigned int debounce_time_mt8901[];
 
 struct mtk_eint;
+struct gpio_chip;
 
 struct mtk_eint_xt {
 	int (*get_gpio_n)(void *data, unsigned long eint_n,
@@ -67,7 +73,7 @@ struct mtk_eint_xt {
 struct mtk_eint {
 	struct device *dev;
 	void __iomem **base;
-	int nbase;
+	unsigned int nbase;
 	u16 *base_pin_num;
 	struct irq_domain *domain;
 	int irq;
@@ -83,6 +89,14 @@ struct mtk_eint {
 	struct mtk_eint_pin *pins;
 	u16 num_db_time;
 
+	/* EINTs whose wake event is unmasked after init and resume */
+	const unsigned int *event_pins;
+	unsigned int num_event_pins;
+
+	/* EINTs owned by firmware that must never be masked */
+	const unsigned int *skip_eint_list;
+	unsigned int num_skip_eint;
+
 	/* Used to fit into various pinctrl device */
 	void *pctl;
 	const struct mtk_eint_xt *gpio_xlate;
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8901.c b/drivers/pinctrl/mediatek/pinctrl-mt8901.c
new file mode 100644
index 000000000000..6f24466fff42
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8901.c
@@ -0,0 +1,1437 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2025 MediaTek Inc.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/acpi.h>
+#include "pinctrl-mtk-mt8901.h"
+#include "pinctrl-paris.h"
+
+#define PIN_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits)  \
+	PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits, 32, 0)
+#define PINS_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits) \
+	PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits, 32, 1)
+
+static const struct mtk_pin_field_calc mt8901_pin_mode_range[] = {
+	PIN_FIELD(0, 181, 0x0300, 0x10, 0, 4),
+};
+
+static const struct mtk_pin_field_calc mt8901_pin_dir_range[] = {
+	PIN_FIELD(0, 181, 0x0000, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt8901_pin_di_range[] = {
+	PIN_FIELD(0, 181, 0x0200, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt8901_pin_do_range[] = {
+	PIN_FIELD(0, 181, 0x0100, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt8901_pin_smt_range[] = {
+	PIN_FIELD_BASE(0, 0, 8, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(1, 1, 8, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(2, 2, 8, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(3, 3, 8, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(4, 4, 8, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(5, 5, 8, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(6, 6, 8, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(7, 7, 8, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(8, 8, 2, 0x0120, 0x10, 13, 1),
+	PIN_FIELD_BASE(9, 9, 2, 0x0120, 0x10, 14, 1),
+	PIN_FIELD_BASE(10, 10, 2, 0x0120, 0x10, 15, 1),
+	PIN_FIELD_BASE(11, 11, 2, 0x0120, 0x10, 16, 1),
+	PIN_FIELD_BASE(12, 12, 1, 0x0140, 0x10, 17, 1),
+	PIN_FIELD_BASE(13, 13, 1, 0x0140, 0x10, 18, 1),
+	PIN_FIELD_BASE(14, 14, 1, 0x0140, 0x10, 14, 1),
+	PIN_FIELD_BASE(15, 15, 1, 0x0140, 0x10, 16, 1),
+	PIN_FIELD_BASE(16, 16, 1, 0x0140, 0x10, 19, 1),
+	PIN_FIELD_BASE(17, 17, 1, 0x0140, 0x10, 20, 1),
+	PIN_FIELD_BASE(18, 18, 1, 0x0140, 0x10, 21, 1),
+	PIN_FIELD_BASE(19, 19, 1, 0x0140, 0x10, 27, 1),
+	PIN_FIELD_BASE(20, 20, 1, 0x0140, 0x10, 28, 1),
+	PIN_FIELD_BASE(21, 21, 1, 0x0140, 0x10, 26, 1),
+	PIN_FIELD_BASE(22, 22, 1, 0x0140, 0x10, 25, 1),
+	PIN_FIELD_BASE(23, 23, 1, 0x0140, 0x10, 0, 1),
+	PIN_FIELD_BASE(24, 24, 1, 0x0140, 0x10, 1, 1),
+	PIN_FIELD_BASE(25, 25, 1, 0x0140, 0x10, 2, 1),
+	PIN_FIELD_BASE(26, 26, 1, 0x0140, 0x10, 3, 1),
+	PIN_FIELD_BASE(27, 27, 1, 0x0140, 0x10, 4, 1),
+	PIN_FIELD_BASE(28, 28, 1, 0x0140, 0x10, 5, 1),
+	PIN_FIELD_BASE(29, 29, 1, 0x0140, 0x10, 6, 1),
+	PIN_FIELD_BASE(30, 30, 1, 0x0140, 0x10, 7, 1),
+	PIN_FIELD_BASE(31, 31, 1, 0x0140, 0x10, 8, 1),
+	PIN_FIELD_BASE(32, 32, 9, 0x0100, 0x10, 0, 1),
+	PIN_FIELD_BASE(33, 33, 1, 0x0140, 0x10, 9, 1),
+	PIN_FIELD_BASE(34, 34, 1, 0x0140, 0x10, 10, 1),
+	PIN_FIELD_BASE(35, 35, 1, 0x0140, 0x10, 11, 1),
+	PIN_FIELD_BASE(36, 36, 9, 0x0100, 0x10, 8, 1),
+	PIN_FIELD_BASE(37, 37, 2, 0x0120, 0x10, 17, 1),
+	PIN_FIELD_BASE(38, 38, 2, 0x0120, 0x10, 18, 1),
+	PIN_FIELD_BASE(39, 39, 1, 0x0140, 0x10, 12, 1),
+	PIN_FIELD_BASE(40, 40, 2, 0x0120, 0x10, 1, 1),
+	PIN_FIELD_BASE(41, 41, 2, 0x0120, 0x10, 2, 1),
+	PIN_FIELD_BASE(42, 42, 2, 0x0120, 0x10, 3, 1),
+	PIN_FIELD_BASE(43, 43, 2, 0x0120, 0x10, 4, 1),
+	PIN_FIELD_BASE(44, 44, 2, 0x0120, 0x10, 5, 1),
+	PIN_FIELD_BASE(45, 45, 2, 0x0120, 0x10, 6, 1),
+	PIN_FIELD_BASE(46, 46, 1, 0x0140, 0x10, 13, 1),
+	PIN_FIELD_BASE(47, 47, 1, 0x0140, 0x10, 15, 1),
+	PIN_FIELD_BASE(48, 48, 2, 0x0120, 0x10, 7, 1),
+	PIN_FIELD_BASE(49, 49, 2, 0x0120, 0x10, 8, 1),
+	PIN_FIELD_BASE(50, 50, 2, 0x0120, 0x10, 9, 1),
+	PIN_FIELD_BASE(51, 51, 2, 0x0120, 0x10, 10, 1),
+	PIN_FIELD_BASE(52, 52, 2, 0x0120, 0x10, 11, 1),
+	PIN_FIELD_BASE(53, 53, 2, 0x0120, 0x10, 12, 1),
+	PIN_FIELD_BASE(54, 54, 5, 0x0120, 0x10, 10, 1),
+	PIN_FIELD_BASE(55, 55, 5, 0x0120, 0x10, 11, 1),
+	PIN_FIELD_BASE(56, 56, 1, 0x0140, 0x10, 22, 1),
+	PIN_FIELD_BASE(57, 57, 1, 0x0140, 0x10, 23, 1),
+	PIN_FIELD_BASE(58, 58, 1, 0x0140, 0x10, 24, 1),
+	PIN_FIELD_BASE(59, 59, 2, 0x0120, 0x10, 0, 1),
+	PIN_FIELD_BASE(60, 60, 9, 0x0100, 0x10, 1, 1),
+	PIN_FIELD_BASE(61, 61, 9, 0x0100, 0x10, 2, 1),
+	PIN_FIELD_BASE(62, 62, 9, 0x0100, 0x10, 3, 1),
+	PIN_FIELD_BASE(63, 63, 9, 0x0100, 0x10, 4, 1),
+	PIN_FIELD_BASE(64, 64, 9, 0x0100, 0x10, 5, 1),
+	PIN_FIELD_BASE(65, 65, 9, 0x0100, 0x10, 6, 1),
+	PIN_FIELD_BASE(66, 66, 5, 0x0120, 0x10, 0, 1),
+	PIN_FIELD_BASE(67, 67, 5, 0x0120, 0x10, 1, 1),
+	PIN_FIELD_BASE(68, 68, 9, 0x0100, 0x10, 7, 1),
+	PIN_FIELD_BASE(69, 69, 7, 0x0110, 0x10, 0, 1),
+	PIN_FIELD_BASE(70, 70, 7, 0x0110, 0x10, 1, 1),
+	PIN_FIELD_BASE(71, 71, 7, 0x0110, 0x10, 2, 1),
+	PIN_FIELD_BASE(72, 72, 7, 0x0110, 0x10, 3, 1),
+	PIN_FIELD_BASE(73, 73, 7, 0x0110, 0x10, 4, 1),
+	PIN_FIELD_BASE(74, 74, 7, 0x0110, 0x10, 5, 1),
+	PIN_FIELD_BASE(75, 75, 7, 0x0110, 0x10, 6, 1),
+	PIN_FIELD_BASE(76, 76, 7, 0x0110, 0x10, 7, 1),
+	PIN_FIELD_BASE(77, 77, 7, 0x0110, 0x10, 8, 1),
+	PIN_FIELD_BASE(78, 78, 7, 0x0110, 0x10, 9, 1),
+	PIN_FIELD_BASE(79, 79, 7, 0x0110, 0x10, 10, 1),
+	PIN_FIELD_BASE(80, 80, 7, 0x0110, 0x10, 11, 1),
+	PIN_FIELD_BASE(81, 81, 7, 0x0110, 0x10, 12, 1),
+	PIN_FIELD_BASE(82, 82, 7, 0x0110, 0x10, 13, 1),
+	PIN_FIELD_BASE(83, 83, 7, 0x0110, 0x10, 14, 1),
+	PIN_FIELD_BASE(84, 84, 7, 0x0110, 0x10, 15, 1),
+	PIN_FIELD_BASE(85, 85, 7, 0x0110, 0x10, 16, 1),
+	PIN_FIELD_BASE(86, 86, 7, 0x0110, 0x10, 17, 1),
+	PIN_FIELD_BASE(87, 87, 7, 0x0110, 0x10, 18, 1),
+	PIN_FIELD_BASE(88, 88, 7, 0x0110, 0x10, 19, 1),
+	PIN_FIELD_BASE(89, 89, 7, 0x0110, 0x10, 20, 1),
+	PIN_FIELD_BASE(90, 90, 7, 0x0110, 0x10, 21, 1),
+	PIN_FIELD_BASE(91, 91, 7, 0x0110, 0x10, 22, 1),
+	PIN_FIELD_BASE(92, 92, 3, 0x0130, 0x10, 16, 1),
+	PIN_FIELD_BASE(93, 93, 3, 0x0130, 0x10, 17, 1),
+	PIN_FIELD_BASE(94, 94, 3, 0x0130, 0x10, 18, 1),
+	PIN_FIELD_BASE(95, 95, 3, 0x0130, 0x10, 19, 1),
+	PIN_FIELD_BASE(96, 96, 3, 0x0130, 0x10, 20, 1),
+	PIN_FIELD_BASE(97, 97, 3, 0x0130, 0x10, 21, 1),
+	PIN_FIELD_BASE(98, 98, 3, 0x0130, 0x10, 22, 1),
+	PIN_FIELD_BASE(99, 99, 3, 0x0130, 0x10, 23, 1),
+	PIN_FIELD_BASE(100, 100, 3, 0x0130, 0x10, 24, 1),
+	PIN_FIELD_BASE(101, 101, 3, 0x0130, 0x10, 25, 1),
+	PIN_FIELD_BASE(102, 102, 3, 0x0130, 0x10, 26, 1),
+	PIN_FIELD_BASE(103, 103, 3, 0x0130, 0x10, 27, 1),
+	PIN_FIELD_BASE(104, 104, 3, 0x0130, 0x10, 28, 1),
+	PIN_FIELD_BASE(105, 105, 3, 0x0130, 0x10, 29, 1),
+	PIN_FIELD_BASE(106, 106, 8, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(107, 107, 8, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(108, 108, 8, 0x00c0, 0x10, 10, 1),
+	PIN_FIELD_BASE(109, 109, 8, 0x00c0, 0x10, 11, 1),
+	PIN_FIELD_BASE(110, 110, 8, 0x00c0, 0x10, 12, 1),
+	PIN_FIELD_BASE(111, 111, 8, 0x00c0, 0x10, 13, 1),
+	PIN_FIELD_BASE(112, 112, 5, 0x0120, 0x10, 15, 1),
+	PIN_FIELD_BASE(113, 113, 5, 0x0120, 0x10, 16, 1),
+	PIN_FIELD_BASE(114, 114, 5, 0x0120, 0x10, 17, 1),
+	PIN_FIELD_BASE(115, 115, 5, 0x0120, 0x10, 18, 1),
+	PIN_FIELD_BASE(116, 116, 5, 0x0120, 0x10, 19, 1),
+	PIN_FIELD_BASE(117, 117, 4, 0x0110, 0x10, 8, 1),
+	PIN_FIELD_BASE(118, 118, 4, 0x0110, 0x10, 9, 1),
+	PIN_FIELD_BASE(119, 119, 4, 0x0110, 0x10, 10, 1),
+	PIN_FIELD_BASE(120, 120, 4, 0x0110, 0x10, 11, 1),
+	PIN_FIELD_BASE(121, 121, 4, 0x0110, 0x10, 12, 1),
+	PIN_FIELD_BASE(122, 122, 4, 0x0110, 0x10, 13, 1),
+	PIN_FIELD_BASE(123, 123, 4, 0x0110, 0x10, 14, 1),
+	PIN_FIELD_BASE(124, 124, 4, 0x0110, 0x10, 15, 1),
+	PIN_FIELD_BASE(125, 125, 4, 0x0110, 0x10, 16, 1),
+	PIN_FIELD_BASE(126, 126, 5, 0x0120, 0x10, 6, 1),
+	PIN_FIELD_BASE(127, 127, 5, 0x0120, 0x10, 7, 1),
+	PIN_FIELD_BASE(128, 128, 5, 0x0120, 0x10, 8, 1),
+	PIN_FIELD_BASE(129, 129, 5, 0x0120, 0x10, 9, 1),
+	PIN_FIELD_BASE(130, 130, 4, 0x0110, 0x10, 17, 1),
+	PIN_FIELD_BASE(131, 131, 4, 0x0110, 0x10, 18, 1),
+	PIN_FIELD_BASE(132, 132, 4, 0x0110, 0x10, 19, 1),
+	PIN_FIELD_BASE(133, 133, 4, 0x0110, 0x10, 20, 1),
+	PIN_FIELD_BASE(134, 134, 3, 0x0130, 0x10, 0, 1),
+	PIN_FIELD_BASE(135, 135, 3, 0x0130, 0x10, 1, 1),
+	PIN_FIELD_BASE(136, 136, 3, 0x0130, 0x10, 2, 1),
+	PIN_FIELD_BASE(137, 137, 3, 0x0130, 0x10, 3, 1),
+	PIN_FIELD_BASE(138, 138, 3, 0x0130, 0x10, 4, 1),
+	PIN_FIELD_BASE(139, 139, 3, 0x0130, 0x10, 5, 1),
+	PIN_FIELD_BASE(140, 140, 3, 0x0130, 0x10, 6, 1),
+	PIN_FIELD_BASE(141, 141, 3, 0x0130, 0x10, 7, 1),
+	PIN_FIELD_BASE(142, 142, 3, 0x0130, 0x10, 8, 1),
+	PIN_FIELD_BASE(143, 143, 3, 0x0130, 0x10, 9, 1),
+	PIN_FIELD_BASE(144, 144, 3, 0x0130, 0x10, 10, 1),
+	PIN_FIELD_BASE(145, 145, 3, 0x0130, 0x10, 11, 1),
+	PIN_FIELD_BASE(146, 146, 3, 0x0130, 0x10, 12, 1),
+	PIN_FIELD_BASE(147, 147, 3, 0x0130, 0x10, 13, 1),
+	PIN_FIELD_BASE(148, 148, 3, 0x0130, 0x10, 14, 1),
+	PIN_FIELD_BASE(149, 149, 3, 0x0130, 0x10, 15, 1),
+	PIN_FIELD_BASE(150, 150, 4, 0x0110, 0x10, 21, 1),
+	PIN_FIELD_BASE(151, 151, 4, 0x0110, 0x10, 26, 1),
+	PIN_FIELD_BASE(152, 152, 4, 0x0110, 0x10, 25, 1),
+	PIN_FIELD_BASE(153, 153, 4, 0x0110, 0x10, 24, 1),
+	PIN_FIELD_BASE(154, 154, 4, 0x0110, 0x10, 22, 1),
+	PIN_FIELD_BASE(155, 155, 4, 0x0110, 0x10, 23, 1),
+	PIN_FIELD_BASE(156, 156, 4, 0x0110, 0x10, 0, 1),
+	PIN_FIELD_BASE(157, 157, 4, 0x0110, 0x10, 1, 1),
+	PIN_FIELD_BASE(158, 158, 4, 0x0110, 0x10, 2, 1),
+	PIN_FIELD_BASE(159, 159, 4, 0x0110, 0x10, 3, 1),
+	PIN_FIELD_BASE(160, 160, 4, 0x0110, 0x10, 4, 1),
+	PIN_FIELD_BASE(161, 161, 4, 0x0110, 0x10, 5, 1),
+	PIN_FIELD_BASE(162, 162, 4, 0x0110, 0x10, 6, 1),
+	PIN_FIELD_BASE(163, 163, 4, 0x0110, 0x10, 7, 1),
+	PIN_FIELD_BASE(164, 164, 5, 0x0120, 0x10, 12, 1),
+	PIN_FIELD_BASE(165, 165, 5, 0x0120, 0x10, 3, 1),
+	PIN_FIELD_BASE(166, 166, 5, 0x0120, 0x10, 4, 1),
+	PIN_FIELD_BASE(167, 167, 5, 0x0120, 0x10, 2, 1),
+	PIN_FIELD_BASE(168, 168, 5, 0x0120, 0x10, 13, 1),
+	PIN_FIELD_BASE(169, 169, 5, 0x0120, 0x10, 14, 1),
+	PIN_FIELD_BASE(170, 170, 5, 0x0120, 0x10, 5, 1),
+	PIN_FIELD_BASE(171, 171, 6, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(172, 172, 6, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(173, 173, 6, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(174, 174, 6, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(175, 175, 6, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(176, 176, 6, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(177, 177, 6, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(178, 178, 6, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(179, 179, 6, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(180, 180, 6, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(181, 181, 10, 0x0080, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt8901_pin_ies_range[] = {
+	PIN_FIELD_BASE(0, 0, 8, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(1, 1, 8, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(2, 2, 8, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(3, 3, 8, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(4, 4, 8, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(5, 5, 8, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(6, 6, 8, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(7, 7, 8, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(8, 8, 2, 0x0070, 0x10, 13, 1),
+	PIN_FIELD_BASE(9, 9, 2, 0x0070, 0x10, 14, 1),
+	PIN_FIELD_BASE(10, 10, 2, 0x0070, 0x10, 15, 1),
+	PIN_FIELD_BASE(11, 11, 2, 0x0070, 0x10, 16, 1),
+	PIN_FIELD_BASE(12, 12, 1, 0x0080, 0x10, 17, 1),
+	PIN_FIELD_BASE(13, 13, 1, 0x0080, 0x10, 18, 1),
+	PIN_FIELD_BASE(14, 14, 1, 0x0080, 0x10, 14, 1),
+	PIN_FIELD_BASE(15, 15, 1, 0x0080, 0x10, 16, 1),
+	PIN_FIELD_BASE(16, 16, 1, 0x0080, 0x10, 19, 1),
+	PIN_FIELD_BASE(17, 17, 1, 0x0080, 0x10, 20, 1),
+	PIN_FIELD_BASE(18, 18, 1, 0x0080, 0x10, 21, 1),
+	PIN_FIELD_BASE(19, 19, 1, 0x0080, 0x10, 27, 1),
+	PIN_FIELD_BASE(20, 20, 1, 0x0080, 0x10, 28, 1),
+	PIN_FIELD_BASE(21, 21, 1, 0x0080, 0x10, 26, 1),
+	PIN_FIELD_BASE(22, 22, 1, 0x0080, 0x10, 25, 1),
+	PIN_FIELD_BASE(23, 23, 1, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(24, 24, 1, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(25, 25, 1, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(26, 26, 1, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(27, 27, 1, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(28, 28, 1, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(29, 29, 1, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(30, 30, 1, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(31, 31, 1, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(32, 32, 9, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(33, 33, 1, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(34, 34, 1, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(35, 35, 1, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(36, 36, 9, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(37, 37, 2, 0x0070, 0x10, 17, 1),
+	PIN_FIELD_BASE(38, 38, 2, 0x0070, 0x10, 18, 1),
+	PIN_FIELD_BASE(39, 39, 1, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(40, 40, 2, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(41, 41, 2, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(42, 42, 2, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(43, 43, 2, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(44, 44, 2, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(45, 45, 2, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(46, 46, 1, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(47, 47, 1, 0x0080, 0x10, 15, 1),
+	PIN_FIELD_BASE(48, 48, 2, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(49, 49, 2, 0x0070, 0x10, 8, 1),
+	PIN_FIELD_BASE(50, 50, 2, 0x0070, 0x10, 9, 1),
+	PIN_FIELD_BASE(51, 51, 2, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(52, 52, 2, 0x0070, 0x10, 11, 1),
+	PIN_FIELD_BASE(53, 53, 2, 0x0070, 0x10, 12, 1),
+	PIN_FIELD_BASE(54, 54, 5, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(55, 55, 5, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(56, 56, 1, 0x0080, 0x10, 22, 1),
+	PIN_FIELD_BASE(57, 57, 1, 0x0080, 0x10, 23, 1),
+	PIN_FIELD_BASE(58, 58, 1, 0x0080, 0x10, 24, 1),
+	PIN_FIELD_BASE(59, 59, 2, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(60, 60, 9, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(61, 61, 9, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(62, 62, 9, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(63, 63, 9, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(64, 64, 9, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(65, 65, 9, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(66, 66, 5, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(67, 67, 5, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(68, 68, 9, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(69, 69, 7, 0x0070, 0x10, 0, 1),
+	PIN_FIELD_BASE(70, 70, 7, 0x0070, 0x10, 1, 1),
+	PIN_FIELD_BASE(71, 71, 7, 0x0070, 0x10, 2, 1),
+	PIN_FIELD_BASE(72, 72, 7, 0x0070, 0x10, 3, 1),
+	PIN_FIELD_BASE(73, 73, 7, 0x0070, 0x10, 4, 1),
+	PIN_FIELD_BASE(74, 74, 7, 0x0070, 0x10, 5, 1),
+	PIN_FIELD_BASE(75, 75, 7, 0x0070, 0x10, 6, 1),
+	PIN_FIELD_BASE(76, 76, 7, 0x0070, 0x10, 7, 1),
+	PIN_FIELD_BASE(77, 77, 7, 0x0070, 0x10, 8, 1),
+	PIN_FIELD_BASE(78, 78, 7, 0x0070, 0x10, 9, 1),
+	PIN_FIELD_BASE(79, 79, 7, 0x0070, 0x10, 10, 1),
+	PIN_FIELD_BASE(80, 80, 7, 0x0070, 0x10, 11, 1),
+	PIN_FIELD_BASE(81, 81, 7, 0x0070, 0x10, 12, 1),
+	PIN_FIELD_BASE(82, 82, 7, 0x0070, 0x10, 13, 1),
+	PIN_FIELD_BASE(83, 83, 7, 0x0070, 0x10, 14, 1),
+	PIN_FIELD_BASE(84, 84, 7, 0x0070, 0x10, 15, 1),
+	PIN_FIELD_BASE(85, 85, 7, 0x0070, 0x10, 16, 1),
+	PIN_FIELD_BASE(86, 86, 7, 0x0070, 0x10, 17, 1),
+	PIN_FIELD_BASE(87, 87, 7, 0x0070, 0x10, 18, 1),
+	PIN_FIELD_BASE(88, 88, 7, 0x0070, 0x10, 19, 1),
+	PIN_FIELD_BASE(89, 89, 7, 0x0070, 0x10, 20, 1),
+	PIN_FIELD_BASE(90, 90, 7, 0x0070, 0x10, 21, 1),
+	PIN_FIELD_BASE(91, 91, 7, 0x0070, 0x10, 22, 1),
+	PIN_FIELD_BASE(92, 92, 3, 0x0080, 0x10, 16, 1),
+	PIN_FIELD_BASE(93, 93, 3, 0x0080, 0x10, 17, 1),
+	PIN_FIELD_BASE(94, 94, 3, 0x0080, 0x10, 18, 1),
+	PIN_FIELD_BASE(95, 95, 3, 0x0080, 0x10, 19, 1),
+	PIN_FIELD_BASE(96, 96, 3, 0x0080, 0x10, 20, 1),
+	PIN_FIELD_BASE(97, 97, 3, 0x0080, 0x10, 21, 1),
+	PIN_FIELD_BASE(98, 98, 3, 0x0080, 0x10, 22, 1),
+	PIN_FIELD_BASE(99, 99, 3, 0x0080, 0x10, 23, 1),
+	PIN_FIELD_BASE(100, 100, 3, 0x0080, 0x10, 24, 1),
+	PIN_FIELD_BASE(101, 101, 3, 0x0080, 0x10, 25, 1),
+	PIN_FIELD_BASE(102, 102, 3, 0x0080, 0x10, 26, 1),
+	PIN_FIELD_BASE(103, 103, 3, 0x0080, 0x10, 27, 1),
+	PIN_FIELD_BASE(104, 104, 3, 0x0080, 0x10, 28, 1),
+	PIN_FIELD_BASE(105, 105, 3, 0x0080, 0x10, 29, 1),
+	PIN_FIELD_BASE(106, 106, 8, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(107, 107, 8, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(108, 108, 8, 0x0050, 0x10, 10, 1),
+	PIN_FIELD_BASE(109, 109, 8, 0x0050, 0x10, 11, 1),
+	PIN_FIELD_BASE(110, 110, 8, 0x0050, 0x10, 12, 1),
+	PIN_FIELD_BASE(111, 111, 8, 0x0050, 0x10, 13, 1),
+	PIN_FIELD_BASE(112, 112, 5, 0x0060, 0x10, 15, 1),
+	PIN_FIELD_BASE(113, 113, 5, 0x0060, 0x10, 16, 1),
+	PIN_FIELD_BASE(114, 114, 5, 0x0060, 0x10, 17, 1),
+	PIN_FIELD_BASE(115, 115, 5, 0x0060, 0x10, 18, 1),
+	PIN_FIELD_BASE(116, 116, 5, 0x0060, 0x10, 19, 1),
+	PIN_FIELD_BASE(117, 117, 4, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(118, 118, 4, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(119, 119, 4, 0x0060, 0x10, 10, 1),
+	PIN_FIELD_BASE(120, 120, 4, 0x0060, 0x10, 11, 1),
+	PIN_FIELD_BASE(121, 121, 4, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(122, 122, 4, 0x0060, 0x10, 13, 1),
+	PIN_FIELD_BASE(123, 123, 4, 0x0060, 0x10, 14, 1),
+	PIN_FIELD_BASE(124, 124, 4, 0x0060, 0x10, 15, 1),
+	PIN_FIELD_BASE(125, 125, 4, 0x0060, 0x10, 16, 1),
+	PIN_FIELD_BASE(126, 126, 5, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(127, 127, 5, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(128, 128, 5, 0x0060, 0x10, 8, 1),
+	PIN_FIELD_BASE(129, 129, 5, 0x0060, 0x10, 9, 1),
+	PIN_FIELD_BASE(130, 130, 4, 0x0060, 0x10, 17, 1),
+	PIN_FIELD_BASE(131, 131, 4, 0x0060, 0x10, 18, 1),
+	PIN_FIELD_BASE(132, 132, 4, 0x0060, 0x10, 19, 1),
+	PIN_FIELD_BASE(133, 133, 4, 0x0060, 0x10, 20, 1),
+	PIN_FIELD_BASE(134, 134, 3, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(135, 135, 3, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(136, 136, 3, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(137, 137, 3, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(138, 138, 3, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(139, 139, 3, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(140, 140, 3, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(141, 141, 3, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(142, 142, 3, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(143, 143, 3, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(144, 144, 3, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(145, 145, 3, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(146, 146, 3, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(147, 147, 3, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(148, 148, 3, 0x0080, 0x10, 14, 1),
+	PIN_FIELD_BASE(149, 149, 3, 0x0080, 0x10, 15, 1),
+	PIN_FIELD_BASE(150, 150, 4, 0x0060, 0x10, 21, 1),
+	PIN_FIELD_BASE(151, 151, 4, 0x0060, 0x10, 26, 1),
+	PIN_FIELD_BASE(152, 152, 4, 0x0060, 0x10, 25, 1),
+	PIN_FIELD_BASE(153, 153, 4, 0x0060, 0x10, 24, 1),
+	PIN_FIELD_BASE(154, 154, 4, 0x0060, 0x10, 22, 1),
+	PIN_FIELD_BASE(155, 155, 4, 0x0060, 0x10, 23, 1),
+	PIN_FIELD_BASE(156, 156, 4, 0x0060, 0x10, 0, 1),
+	PIN_FIELD_BASE(157, 157, 4, 0x0060, 0x10, 1, 1),
+	PIN_FIELD_BASE(158, 158, 4, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(159, 159, 4, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(160, 160, 4, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(161, 161, 4, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(162, 162, 4, 0x0060, 0x10, 6, 1),
+	PIN_FIELD_BASE(163, 163, 4, 0x0060, 0x10, 7, 1),
+	PIN_FIELD_BASE(164, 164, 5, 0x0060, 0x10, 12, 1),
+	PIN_FIELD_BASE(165, 165, 5, 0x0060, 0x10, 3, 1),
+	PIN_FIELD_BASE(166, 166, 5, 0x0060, 0x10, 4, 1),
+	PIN_FIELD_BASE(167, 167, 5, 0x0060, 0x10, 2, 1),
+	PIN_FIELD_BASE(168, 168, 5, 0x0060, 0x10, 13, 1),
+	PIN_FIELD_BASE(169, 169, 5, 0x0060, 0x10, 14, 1),
+	PIN_FIELD_BASE(170, 170, 5, 0x0060, 0x10, 5, 1),
+	PIN_FIELD_BASE(171, 171, 6, 0x0050, 0x10, 0, 1),
+	PIN_FIELD_BASE(172, 172, 6, 0x0050, 0x10, 1, 1),
+	PIN_FIELD_BASE(173, 173, 6, 0x0050, 0x10, 2, 1),
+	PIN_FIELD_BASE(174, 174, 6, 0x0050, 0x10, 3, 1),
+	PIN_FIELD_BASE(175, 175, 6, 0x0050, 0x10, 4, 1),
+	PIN_FIELD_BASE(176, 176, 6, 0x0050, 0x10, 5, 1),
+	PIN_FIELD_BASE(177, 177, 6, 0x0050, 0x10, 6, 1),
+	PIN_FIELD_BASE(178, 178, 6, 0x0050, 0x10, 7, 1),
+	PIN_FIELD_BASE(179, 179, 6, 0x0050, 0x10, 8, 1),
+	PIN_FIELD_BASE(180, 180, 6, 0x0050, 0x10, 9, 1),
+	PIN_FIELD_BASE(181, 181, 10, 0x0020, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt8901_pin_pupd_range[] = {
+	PIN_FIELD_BASE(0, 0, 8, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(1, 1, 8, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(2, 2, 8, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(3, 3, 8, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(4, 4, 8, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(5, 5, 8, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(6, 6, 8, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(7, 7, 8, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(14, 14, 1, 0x00c0, 0x10, 14, 1),
+	PIN_FIELD_BASE(15, 15, 1, 0x00c0, 0x10, 16, 1),
+	PIN_FIELD_BASE(16, 16, 1, 0x00c0, 0x10, 17, 1),
+	PIN_FIELD_BASE(19, 19, 1, 0x00c0, 0x10, 21, 1),
+	PIN_FIELD_BASE(20, 20, 1, 0x00c0, 0x10, 22, 1),
+	PIN_FIELD_BASE(21, 21, 1, 0x00c0, 0x10, 20, 1),
+	PIN_FIELD_BASE(22, 22, 1, 0x00c0, 0x10, 19, 1),
+	PIN_FIELD_BASE(23, 23, 1, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(24, 24, 1, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(25, 25, 1, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(26, 26, 1, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(27, 27, 1, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(28, 28, 1, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(29, 29, 1, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(30, 30, 1, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(31, 31, 1, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(32, 32, 9, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(33, 33, 1, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(34, 34, 1, 0x00c0, 0x10, 10, 1),
+	PIN_FIELD_BASE(35, 35, 1, 0x00c0, 0x10, 11, 1),
+	PIN_FIELD_BASE(36, 36, 9, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(37, 37, 2, 0x00b0, 0x10, 10, 1),
+	PIN_FIELD_BASE(38, 38, 2, 0x00b0, 0x10, 11, 1),
+	PIN_FIELD_BASE(39, 39, 1, 0x00c0, 0x10, 12, 1),
+	PIN_FIELD_BASE(40, 40, 2, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(41, 41, 2, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(42, 42, 2, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(43, 43, 2, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(44, 44, 2, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(45, 45, 2, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(46, 46, 1, 0x00c0, 0x10, 13, 1),
+	PIN_FIELD_BASE(47, 47, 1, 0x00c0, 0x10, 15, 1),
+	PIN_FIELD_BASE(48, 48, 2, 0x00b0, 0x10, 6, 1),
+	PIN_FIELD_BASE(49, 49, 2, 0x00b0, 0x10, 7, 1),
+	PIN_FIELD_BASE(50, 50, 2, 0x00b0, 0x10, 8, 1),
+	PIN_FIELD_BASE(51, 51, 2, 0x00b0, 0x10, 9, 1),
+	PIN_FIELD_BASE(58, 58, 1, 0x00c0, 0x10, 18, 1),
+	PIN_FIELD_BASE(62, 62, 9, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(63, 63, 9, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(64, 64, 9, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(65, 65, 9, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(68, 68, 9, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(74, 74, 7, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(75, 75, 7, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(76, 76, 7, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(77, 77, 7, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(78, 78, 7, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(79, 79, 7, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(80, 80, 7, 0x00b0, 0x10, 6, 1),
+	PIN_FIELD_BASE(81, 81, 7, 0x00b0, 0x10, 7, 1),
+	PIN_FIELD_BASE(82, 82, 7, 0x00b0, 0x10, 8, 1),
+	PIN_FIELD_BASE(83, 83, 7, 0x00b0, 0x10, 9, 1),
+	PIN_FIELD_BASE(84, 84, 7, 0x00b0, 0x10, 10, 1),
+	PIN_FIELD_BASE(85, 85, 7, 0x00b0, 0x10, 11, 1),
+	PIN_FIELD_BASE(86, 86, 7, 0x00b0, 0x10, 12, 1),
+	PIN_FIELD_BASE(87, 87, 7, 0x00b0, 0x10, 13, 1),
+	PIN_FIELD_BASE(90, 90, 7, 0x00b0, 0x10, 14, 1),
+	PIN_FIELD_BASE(91, 91, 7, 0x00b0, 0x10, 15, 1),
+	PIN_FIELD_BASE(94, 94, 3, 0x00c0, 0x10, 12, 1),
+	PIN_FIELD_BASE(95, 95, 3, 0x00c0, 0x10, 13, 1),
+	PIN_FIELD_BASE(96, 96, 3, 0x00c0, 0x10, 14, 1),
+	PIN_FIELD_BASE(97, 97, 3, 0x00c0, 0x10, 15, 1),
+	PIN_FIELD_BASE(98, 98, 3, 0x00c0, 0x10, 16, 1),
+	PIN_FIELD_BASE(99, 99, 3, 0x00c0, 0x10, 17, 1),
+	PIN_FIELD_BASE(100, 100, 3, 0x00c0, 0x10, 18, 1),
+	PIN_FIELD_BASE(101, 101, 3, 0x00c0, 0x10, 19, 1),
+	PIN_FIELD_BASE(102, 102, 3, 0x00c0, 0x10, 20, 1),
+	PIN_FIELD_BASE(103, 103, 3, 0x00c0, 0x10, 21, 1),
+	PIN_FIELD_BASE(104, 104, 3, 0x00c0, 0x10, 22, 1),
+	PIN_FIELD_BASE(105, 105, 3, 0x00c0, 0x10, 23, 1),
+	PIN_FIELD_BASE(106, 106, 8, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(107, 107, 8, 0x0080, 0x10, 9, 1),
+	PIN_FIELD_BASE(108, 108, 8, 0x0080, 0x10, 10, 1),
+	PIN_FIELD_BASE(109, 109, 8, 0x0080, 0x10, 11, 1),
+	PIN_FIELD_BASE(110, 110, 8, 0x0080, 0x10, 12, 1),
+	PIN_FIELD_BASE(111, 111, 8, 0x0080, 0x10, 13, 1),
+	PIN_FIELD_BASE(112, 112, 5, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(113, 113, 5, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(114, 114, 5, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(115, 115, 5, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(116, 116, 5, 0x00a0, 0x10, 9, 1),
+	PIN_FIELD_BASE(125, 125, 4, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(130, 130, 4, 0x00a0, 0x10, 9, 1),
+	PIN_FIELD_BASE(131, 131, 4, 0x00a0, 0x10, 10, 1),
+	PIN_FIELD_BASE(132, 132, 4, 0x00a0, 0x10, 11, 1),
+	PIN_FIELD_BASE(133, 133, 4, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(138, 138, 3, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(139, 139, 3, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(140, 140, 3, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(141, 141, 3, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(142, 142, 3, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(143, 143, 3, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(144, 144, 3, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(145, 145, 3, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(146, 146, 3, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(147, 147, 3, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(148, 148, 3, 0x00c0, 0x10, 10, 1),
+	PIN_FIELD_BASE(149, 149, 3, 0x00c0, 0x10, 11, 1),
+	PIN_FIELD_BASE(150, 150, 4, 0x00a0, 0x10, 13, 1),
+	PIN_FIELD_BASE(151, 151, 4, 0x00a0, 0x10, 18, 1),
+	PIN_FIELD_BASE(152, 152, 4, 0x00a0, 0x10, 17, 1),
+	PIN_FIELD_BASE(153, 153, 4, 0x00a0, 0x10, 16, 1),
+	PIN_FIELD_BASE(154, 154, 4, 0x00a0, 0x10, 14, 1),
+	PIN_FIELD_BASE(155, 155, 4, 0x00a0, 0x10, 15, 1),
+	PIN_FIELD_BASE(156, 156, 4, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(157, 157, 4, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(158, 158, 4, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(159, 159, 4, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(160, 160, 4, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(161, 161, 4, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(162, 162, 4, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(163, 163, 4, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(164, 164, 5, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(167, 167, 5, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(168, 168, 5, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(169, 169, 5, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(170, 170, 5, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(171, 171, 6, 0x0080, 0x10, 0, 1),
+	PIN_FIELD_BASE(172, 172, 6, 0x0080, 0x10, 1, 1),
+	PIN_FIELD_BASE(173, 173, 6, 0x0080, 0x10, 2, 1),
+	PIN_FIELD_BASE(174, 174, 6, 0x0080, 0x10, 3, 1),
+	PIN_FIELD_BASE(175, 175, 6, 0x0080, 0x10, 4, 1),
+	PIN_FIELD_BASE(176, 176, 6, 0x0080, 0x10, 5, 1),
+	PIN_FIELD_BASE(177, 177, 6, 0x0080, 0x10, 6, 1),
+	PIN_FIELD_BASE(178, 178, 6, 0x0080, 0x10, 7, 1),
+	PIN_FIELD_BASE(179, 179, 6, 0x0080, 0x10, 8, 1),
+	PIN_FIELD_BASE(180, 180, 6, 0x0080, 0x10, 9, 1),
+};
+
+static const struct mtk_pin_field_calc mt8901_pin_r0_range[] = {
+	PIN_FIELD_BASE(0, 0, 8, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(1, 1, 8, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(2, 2, 8, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(3, 3, 8, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(4, 4, 8, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(5, 5, 8, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(6, 6, 8, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(7, 7, 8, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(14, 14, 1, 0x00e0, 0x10, 14, 1),
+	PIN_FIELD_BASE(15, 15, 1, 0x00e0, 0x10, 16, 1),
+	PIN_FIELD_BASE(16, 16, 1, 0x00e0, 0x10, 17, 1),
+	PIN_FIELD_BASE(19, 19, 1, 0x00e0, 0x10, 21, 1),
+	PIN_FIELD_BASE(20, 20, 1, 0x00e0, 0x10, 22, 1),
+	PIN_FIELD_BASE(21, 21, 1, 0x00e0, 0x10, 20, 1),
+	PIN_FIELD_BASE(22, 22, 1, 0x00e0, 0x10, 19, 1),
+	PIN_FIELD_BASE(23, 23, 1, 0x00e0, 0x10, 0, 1),
+	PIN_FIELD_BASE(24, 24, 1, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(25, 25, 1, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(26, 26, 1, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(27, 27, 1, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(28, 28, 1, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(29, 29, 1, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(30, 30, 1, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(31, 31, 1, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(32, 32, 9, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(33, 33, 1, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(34, 34, 1, 0x00e0, 0x10, 10, 1),
+	PIN_FIELD_BASE(35, 35, 1, 0x00e0, 0x10, 11, 1),
+	PIN_FIELD_BASE(36, 36, 9, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(37, 37, 2, 0x00d0, 0x10, 10, 1),
+	PIN_FIELD_BASE(38, 38, 2, 0x00d0, 0x10, 11, 1),
+	PIN_FIELD_BASE(39, 39, 1, 0x00e0, 0x10, 12, 1),
+	PIN_FIELD_BASE(40, 40, 2, 0x00d0, 0x10, 0, 1),
+	PIN_FIELD_BASE(41, 41, 2, 0x00d0, 0x10, 1, 1),
+	PIN_FIELD_BASE(42, 42, 2, 0x00d0, 0x10, 2, 1),
+	PIN_FIELD_BASE(43, 43, 2, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(44, 44, 2, 0x00d0, 0x10, 4, 1),
+	PIN_FIELD_BASE(45, 45, 2, 0x00d0, 0x10, 5, 1),
+	PIN_FIELD_BASE(46, 46, 1, 0x00e0, 0x10, 13, 1),
+	PIN_FIELD_BASE(47, 47, 1, 0x00e0, 0x10, 15, 1),
+	PIN_FIELD_BASE(48, 48, 2, 0x00d0, 0x10, 6, 1),
+	PIN_FIELD_BASE(49, 49, 2, 0x00d0, 0x10, 7, 1),
+	PIN_FIELD_BASE(50, 50, 2, 0x00d0, 0x10, 8, 1),
+	PIN_FIELD_BASE(51, 51, 2, 0x00d0, 0x10, 9, 1),
+	PIN_FIELD_BASE(58, 58, 1, 0x00e0, 0x10, 18, 1),
+	PIN_FIELD_BASE(62, 62, 9, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(63, 63, 9, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(64, 64, 9, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(65, 65, 9, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(68, 68, 9, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(74, 74, 7, 0x00d0, 0x10, 0, 1),
+	PIN_FIELD_BASE(75, 75, 7, 0x00d0, 0x10, 1, 1),
+	PIN_FIELD_BASE(76, 76, 7, 0x00d0, 0x10, 2, 1),
+	PIN_FIELD_BASE(77, 77, 7, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(78, 78, 7, 0x00d0, 0x10, 4, 1),
+	PIN_FIELD_BASE(79, 79, 7, 0x00d0, 0x10, 5, 1),
+	PIN_FIELD_BASE(80, 80, 7, 0x00d0, 0x10, 6, 1),
+	PIN_FIELD_BASE(81, 81, 7, 0x00d0, 0x10, 7, 1),
+	PIN_FIELD_BASE(82, 82, 7, 0x00d0, 0x10, 8, 1),
+	PIN_FIELD_BASE(83, 83, 7, 0x00d0, 0x10, 9, 1),
+	PIN_FIELD_BASE(84, 84, 7, 0x00d0, 0x10, 10, 1),
+	PIN_FIELD_BASE(85, 85, 7, 0x00d0, 0x10, 11, 1),
+	PIN_FIELD_BASE(86, 86, 7, 0x00d0, 0x10, 12, 1),
+	PIN_FIELD_BASE(87, 87, 7, 0x00d0, 0x10, 13, 1),
+	PIN_FIELD_BASE(90, 90, 7, 0x00d0, 0x10, 14, 1),
+	PIN_FIELD_BASE(91, 91, 7, 0x00d0, 0x10, 15, 1),
+	PIN_FIELD_BASE(94, 94, 3, 0x00e0, 0x10, 12, 1),
+	PIN_FIELD_BASE(95, 95, 3, 0x00e0, 0x10, 13, 1),
+	PIN_FIELD_BASE(96, 96, 3, 0x00e0, 0x10, 14, 1),
+	PIN_FIELD_BASE(97, 97, 3, 0x00e0, 0x10, 15, 1),
+	PIN_FIELD_BASE(98, 98, 3, 0x00e0, 0x10, 16, 1),
+	PIN_FIELD_BASE(99, 99, 3, 0x00e0, 0x10, 17, 1),
+	PIN_FIELD_BASE(100, 100, 3, 0x00e0, 0x10, 18, 1),
+	PIN_FIELD_BASE(101, 101, 3, 0x00e0, 0x10, 19, 1),
+	PIN_FIELD_BASE(102, 102, 3, 0x00e0, 0x10, 20, 1),
+	PIN_FIELD_BASE(103, 103, 3, 0x00e0, 0x10, 21, 1),
+	PIN_FIELD_BASE(104, 104, 3, 0x00e0, 0x10, 22, 1),
+	PIN_FIELD_BASE(105, 105, 3, 0x00e0, 0x10, 23, 1),
+	PIN_FIELD_BASE(106, 106, 8, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(107, 107, 8, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(108, 108, 8, 0x0090, 0x10, 10, 1),
+	PIN_FIELD_BASE(109, 109, 8, 0x0090, 0x10, 11, 1),
+	PIN_FIELD_BASE(110, 110, 8, 0x0090, 0x10, 12, 1),
+	PIN_FIELD_BASE(111, 111, 8, 0x0090, 0x10, 13, 1),
+	PIN_FIELD_BASE(112, 112, 5, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(113, 113, 5, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(114, 114, 5, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(115, 115, 5, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(116, 116, 5, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(125, 125, 4, 0x00c0, 0x10, 8, 1),
+	PIN_FIELD_BASE(130, 130, 4, 0x00c0, 0x10, 9, 1),
+	PIN_FIELD_BASE(131, 131, 4, 0x00c0, 0x10, 10, 1),
+	PIN_FIELD_BASE(132, 132, 4, 0x00c0, 0x10, 11, 1),
+	PIN_FIELD_BASE(133, 133, 4, 0x00c0, 0x10, 12, 1),
+	PIN_FIELD_BASE(138, 138, 3, 0x00e0, 0x10, 0, 1),
+	PIN_FIELD_BASE(139, 139, 3, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(140, 140, 3, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(141, 141, 3, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(142, 142, 3, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(143, 143, 3, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(144, 144, 3, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(145, 145, 3, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(146, 146, 3, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(147, 147, 3, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(148, 148, 3, 0x00e0, 0x10, 10, 1),
+	PIN_FIELD_BASE(149, 149, 3, 0x00e0, 0x10, 11, 1),
+	PIN_FIELD_BASE(150, 150, 4, 0x00c0, 0x10, 13, 1),
+	PIN_FIELD_BASE(151, 151, 4, 0x00c0, 0x10, 18, 1),
+	PIN_FIELD_BASE(152, 152, 4, 0x00c0, 0x10, 17, 1),
+	PIN_FIELD_BASE(153, 153, 4, 0x00c0, 0x10, 16, 1),
+	PIN_FIELD_BASE(154, 154, 4, 0x00c0, 0x10, 14, 1),
+	PIN_FIELD_BASE(155, 155, 4, 0x00c0, 0x10, 15, 1),
+	PIN_FIELD_BASE(156, 156, 4, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(157, 157, 4, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(158, 158, 4, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(159, 159, 4, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(160, 160, 4, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(161, 161, 4, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(162, 162, 4, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(163, 163, 4, 0x00c0, 0x10, 7, 1),
+	PIN_FIELD_BASE(164, 164, 5, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(167, 167, 5, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(168, 168, 5, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(169, 169, 5, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(170, 170, 5, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(171, 171, 6, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(172, 172, 6, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(173, 173, 6, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(174, 174, 6, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(175, 175, 6, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(176, 176, 6, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(177, 177, 6, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(178, 178, 6, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(179, 179, 6, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(180, 180, 6, 0x0090, 0x10, 9, 1),
+};
+
+static const struct mtk_pin_field_calc mt8901_pin_r1_range[] = {
+	PIN_FIELD_BASE(0, 0, 8, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(1, 1, 8, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(2, 2, 8, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(3, 3, 8, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(4, 4, 8, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(5, 5, 8, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(6, 6, 8, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(7, 7, 8, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(14, 14, 1, 0x00f0, 0x10, 14, 1),
+	PIN_FIELD_BASE(15, 15, 1, 0x00f0, 0x10, 16, 1),
+	PIN_FIELD_BASE(16, 16, 1, 0x00f0, 0x10, 17, 1),
+	PIN_FIELD_BASE(19, 19, 1, 0x00f0, 0x10, 21, 1),
+	PIN_FIELD_BASE(20, 20, 1, 0x00f0, 0x10, 22, 1),
+	PIN_FIELD_BASE(21, 21, 1, 0x00f0, 0x10, 20, 1),
+	PIN_FIELD_BASE(22, 22, 1, 0x00f0, 0x10, 19, 1),
+	PIN_FIELD_BASE(23, 23, 1, 0x00f0, 0x10, 0, 1),
+	PIN_FIELD_BASE(24, 24, 1, 0x00f0, 0x10, 1, 1),
+	PIN_FIELD_BASE(25, 25, 1, 0x00f0, 0x10, 2, 1),
+	PIN_FIELD_BASE(26, 26, 1, 0x00f0, 0x10, 3, 1),
+	PIN_FIELD_BASE(27, 27, 1, 0x00f0, 0x10, 4, 1),
+	PIN_FIELD_BASE(28, 28, 1, 0x00f0, 0x10, 5, 1),
+	PIN_FIELD_BASE(29, 29, 1, 0x00f0, 0x10, 6, 1),
+	PIN_FIELD_BASE(30, 30, 1, 0x00f0, 0x10, 7, 1),
+	PIN_FIELD_BASE(31, 31, 1, 0x00f0, 0x10, 8, 1),
+	PIN_FIELD_BASE(32, 32, 9, 0x00d0, 0x10, 0, 1),
+	PIN_FIELD_BASE(33, 33, 1, 0x00f0, 0x10, 9, 1),
+	PIN_FIELD_BASE(34, 34, 1, 0x00f0, 0x10, 10, 1),
+	PIN_FIELD_BASE(35, 35, 1, 0x00f0, 0x10, 11, 1),
+	PIN_FIELD_BASE(36, 36, 9, 0x00d0, 0x10, 6, 1),
+	PIN_FIELD_BASE(37, 37, 2, 0x00e0, 0x10, 10, 1),
+	PIN_FIELD_BASE(38, 38, 2, 0x00e0, 0x10, 11, 1),
+	PIN_FIELD_BASE(39, 39, 1, 0x00f0, 0x10, 12, 1),
+	PIN_FIELD_BASE(40, 40, 2, 0x00e0, 0x10, 0, 1),
+	PIN_FIELD_BASE(41, 41, 2, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(42, 42, 2, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(43, 43, 2, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(44, 44, 2, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(45, 45, 2, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(46, 46, 1, 0x00f0, 0x10, 13, 1),
+	PIN_FIELD_BASE(47, 47, 1, 0x00f0, 0x10, 15, 1),
+	PIN_FIELD_BASE(48, 48, 2, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(49, 49, 2, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(50, 50, 2, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(51, 51, 2, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(58, 58, 1, 0x00f0, 0x10, 18, 1),
+	PIN_FIELD_BASE(62, 62, 9, 0x00d0, 0x10, 1, 1),
+	PIN_FIELD_BASE(63, 63, 9, 0x00d0, 0x10, 2, 1),
+	PIN_FIELD_BASE(64, 64, 9, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(65, 65, 9, 0x00d0, 0x10, 4, 1),
+	PIN_FIELD_BASE(68, 68, 9, 0x00d0, 0x10, 5, 1),
+	PIN_FIELD_BASE(74, 74, 7, 0x00e0, 0x10, 0, 1),
+	PIN_FIELD_BASE(75, 75, 7, 0x00e0, 0x10, 1, 1),
+	PIN_FIELD_BASE(76, 76, 7, 0x00e0, 0x10, 2, 1),
+	PIN_FIELD_BASE(77, 77, 7, 0x00e0, 0x10, 3, 1),
+	PIN_FIELD_BASE(78, 78, 7, 0x00e0, 0x10, 4, 1),
+	PIN_FIELD_BASE(79, 79, 7, 0x00e0, 0x10, 5, 1),
+	PIN_FIELD_BASE(80, 80, 7, 0x00e0, 0x10, 6, 1),
+	PIN_FIELD_BASE(81, 81, 7, 0x00e0, 0x10, 7, 1),
+	PIN_FIELD_BASE(82, 82, 7, 0x00e0, 0x10, 8, 1),
+	PIN_FIELD_BASE(83, 83, 7, 0x00e0, 0x10, 9, 1),
+	PIN_FIELD_BASE(84, 84, 7, 0x00e0, 0x10, 10, 1),
+	PIN_FIELD_BASE(85, 85, 7, 0x00e0, 0x10, 11, 1),
+	PIN_FIELD_BASE(86, 86, 7, 0x00e0, 0x10, 12, 1),
+	PIN_FIELD_BASE(87, 87, 7, 0x00e0, 0x10, 13, 1),
+	PIN_FIELD_BASE(90, 90, 7, 0x00e0, 0x10, 14, 1),
+	PIN_FIELD_BASE(91, 91, 7, 0x00e0, 0x10, 15, 1),
+	PIN_FIELD_BASE(94, 94, 3, 0x00f0, 0x10, 12, 1),
+	PIN_FIELD_BASE(95, 95, 3, 0x00f0, 0x10, 13, 1),
+	PIN_FIELD_BASE(96, 96, 3, 0x00f0, 0x10, 14, 1),
+	PIN_FIELD_BASE(97, 97, 3, 0x00f0, 0x10, 15, 1),
+	PIN_FIELD_BASE(98, 98, 3, 0x00f0, 0x10, 16, 1),
+	PIN_FIELD_BASE(99, 99, 3, 0x00f0, 0x10, 17, 1),
+	PIN_FIELD_BASE(100, 100, 3, 0x00f0, 0x10, 18, 1),
+	PIN_FIELD_BASE(101, 101, 3, 0x00f0, 0x10, 19, 1),
+	PIN_FIELD_BASE(102, 102, 3, 0x00f0, 0x10, 20, 1),
+	PIN_FIELD_BASE(103, 103, 3, 0x00f0, 0x10, 21, 1),
+	PIN_FIELD_BASE(104, 104, 3, 0x00f0, 0x10, 22, 1),
+	PIN_FIELD_BASE(105, 105, 3, 0x00f0, 0x10, 23, 1),
+	PIN_FIELD_BASE(106, 106, 8, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(107, 107, 8, 0x00a0, 0x10, 9, 1),
+	PIN_FIELD_BASE(108, 108, 8, 0x00a0, 0x10, 10, 1),
+	PIN_FIELD_BASE(109, 109, 8, 0x00a0, 0x10, 11, 1),
+	PIN_FIELD_BASE(110, 110, 8, 0x00a0, 0x10, 12, 1),
+	PIN_FIELD_BASE(111, 111, 8, 0x00a0, 0x10, 13, 1),
+	PIN_FIELD_BASE(112, 112, 5, 0x00d0, 0x10, 5, 1),
+	PIN_FIELD_BASE(113, 113, 5, 0x00d0, 0x10, 6, 1),
+	PIN_FIELD_BASE(114, 114, 5, 0x00d0, 0x10, 7, 1),
+	PIN_FIELD_BASE(115, 115, 5, 0x00d0, 0x10, 8, 1),
+	PIN_FIELD_BASE(116, 116, 5, 0x00d0, 0x10, 9, 1),
+	PIN_FIELD_BASE(125, 125, 4, 0x00d0, 0x10, 8, 1),
+	PIN_FIELD_BASE(130, 130, 4, 0x00d0, 0x10, 9, 1),
+	PIN_FIELD_BASE(131, 131, 4, 0x00d0, 0x10, 10, 1),
+	PIN_FIELD_BASE(132, 132, 4, 0x00d0, 0x10, 11, 1),
+	PIN_FIELD_BASE(133, 133, 4, 0x00d0, 0x10, 12, 1),
+	PIN_FIELD_BASE(138, 138, 3, 0x00f0, 0x10, 0, 1),
+	PIN_FIELD_BASE(139, 139, 3, 0x00f0, 0x10, 1, 1),
+	PIN_FIELD_BASE(140, 140, 3, 0x00f0, 0x10, 2, 1),
+	PIN_FIELD_BASE(141, 141, 3, 0x00f0, 0x10, 3, 1),
+	PIN_FIELD_BASE(142, 142, 3, 0x00f0, 0x10, 4, 1),
+	PIN_FIELD_BASE(143, 143, 3, 0x00f0, 0x10, 5, 1),
+	PIN_FIELD_BASE(144, 144, 3, 0x00f0, 0x10, 6, 1),
+	PIN_FIELD_BASE(145, 145, 3, 0x00f0, 0x10, 7, 1),
+	PIN_FIELD_BASE(146, 146, 3, 0x00f0, 0x10, 8, 1),
+	PIN_FIELD_BASE(147, 147, 3, 0x00f0, 0x10, 9, 1),
+	PIN_FIELD_BASE(148, 148, 3, 0x00f0, 0x10, 10, 1),
+	PIN_FIELD_BASE(149, 149, 3, 0x00f0, 0x10, 11, 1),
+	PIN_FIELD_BASE(150, 150, 4, 0x00d0, 0x10, 13, 1),
+	PIN_FIELD_BASE(151, 151, 4, 0x00d0, 0x10, 18, 1),
+	PIN_FIELD_BASE(152, 152, 4, 0x00d0, 0x10, 17, 1),
+	PIN_FIELD_BASE(153, 153, 4, 0x00d0, 0x10, 16, 1),
+	PIN_FIELD_BASE(154, 154, 4, 0x00d0, 0x10, 14, 1),
+	PIN_FIELD_BASE(155, 155, 4, 0x00d0, 0x10, 15, 1),
+	PIN_FIELD_BASE(156, 156, 4, 0x00d0, 0x10, 0, 1),
+	PIN_FIELD_BASE(157, 157, 4, 0x00d0, 0x10, 1, 1),
+	PIN_FIELD_BASE(158, 158, 4, 0x00d0, 0x10, 2, 1),
+	PIN_FIELD_BASE(159, 159, 4, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(160, 160, 4, 0x00d0, 0x10, 4, 1),
+	PIN_FIELD_BASE(161, 161, 4, 0x00d0, 0x10, 5, 1),
+	PIN_FIELD_BASE(162, 162, 4, 0x00d0, 0x10, 6, 1),
+	PIN_FIELD_BASE(163, 163, 4, 0x00d0, 0x10, 7, 1),
+	PIN_FIELD_BASE(164, 164, 5, 0x00d0, 0x10, 2, 1),
+	PIN_FIELD_BASE(167, 167, 5, 0x00d0, 0x10, 0, 1),
+	PIN_FIELD_BASE(168, 168, 5, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(169, 169, 5, 0x00d0, 0x10, 4, 1),
+	PIN_FIELD_BASE(170, 170, 5, 0x00d0, 0x10, 1, 1),
+	PIN_FIELD_BASE(171, 171, 6, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(172, 172, 6, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(173, 173, 6, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(174, 174, 6, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(175, 175, 6, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(176, 176, 6, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(177, 177, 6, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(178, 178, 6, 0x00a0, 0x10, 7, 1),
+	PIN_FIELD_BASE(179, 179, 6, 0x00a0, 0x10, 8, 1),
+	PIN_FIELD_BASE(180, 180, 6, 0x00a0, 0x10, 9, 1),
+};
+
+static const struct mtk_pin_field_calc mt8901_pin_pu_range[] = {
+	PIN_FIELD_BASE(8, 8, 2, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(9, 9, 2, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(10, 10, 2, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(11, 11, 2, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(12, 12, 1, 0x00d0, 0x10, 0, 1),
+	PIN_FIELD_BASE(13, 13, 1, 0x00d0, 0x10, 1, 1),
+	PIN_FIELD_BASE(17, 17, 1, 0x00d0, 0x10, 2, 1),
+	PIN_FIELD_BASE(18, 18, 1, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(52, 52, 2, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(53, 53, 2, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(54, 54, 5, 0x00b0, 0x10, 8, 1),
+	PIN_FIELD_BASE(55, 55, 5, 0x00b0, 0x10, 9, 1),
+	PIN_FIELD_BASE(56, 56, 1, 0x00d0, 0x10, 4, 1),
+	PIN_FIELD_BASE(57, 57, 1, 0x00d0, 0x10, 5, 1),
+	PIN_FIELD_BASE(59, 59, 2, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(60, 60, 9, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(61, 61, 9, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(66, 66, 5, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(67, 67, 5, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(69, 69, 7, 0x00c0, 0x10, 0, 1),
+	PIN_FIELD_BASE(70, 70, 7, 0x00c0, 0x10, 1, 1),
+	PIN_FIELD_BASE(71, 71, 7, 0x00c0, 0x10, 2, 1),
+	PIN_FIELD_BASE(72, 72, 7, 0x00c0, 0x10, 3, 1),
+	PIN_FIELD_BASE(73, 73, 7, 0x00c0, 0x10, 4, 1),
+	PIN_FIELD_BASE(88, 88, 7, 0x00c0, 0x10, 5, 1),
+	PIN_FIELD_BASE(89, 89, 7, 0x00c0, 0x10, 6, 1),
+	PIN_FIELD_BASE(92, 92, 3, 0x00d0, 0x10, 4, 1),
+	PIN_FIELD_BASE(93, 93, 3, 0x00d0, 0x10, 5, 1),
+	PIN_FIELD_BASE(117, 117, 4, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(118, 118, 4, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(119, 119, 4, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(120, 120, 4, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(121, 121, 4, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(122, 122, 4, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(123, 123, 4, 0x00b0, 0x10, 6, 1),
+	PIN_FIELD_BASE(124, 124, 4, 0x00b0, 0x10, 7, 1),
+	PIN_FIELD_BASE(126, 126, 5, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(127, 127, 5, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(128, 128, 5, 0x00b0, 0x10, 6, 1),
+	PIN_FIELD_BASE(129, 129, 5, 0x00b0, 0x10, 7, 1),
+	PIN_FIELD_BASE(134, 134, 3, 0x00d0, 0x10, 0, 1),
+	PIN_FIELD_BASE(135, 135, 3, 0x00d0, 0x10, 1, 1),
+	PIN_FIELD_BASE(136, 136, 3, 0x00d0, 0x10, 2, 1),
+	PIN_FIELD_BASE(137, 137, 3, 0x00d0, 0x10, 3, 1),
+	PIN_FIELD_BASE(165, 165, 5, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(166, 166, 5, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(181, 181, 10, 0x0060, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt8901_pin_pd_range[] = {
+	PIN_FIELD_BASE(8, 8, 2, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(9, 9, 2, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(10, 10, 2, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(11, 11, 2, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(12, 12, 1, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(13, 13, 1, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(17, 17, 1, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(18, 18, 1, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(52, 52, 2, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(53, 53, 2, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(54, 54, 5, 0x0090, 0x10, 8, 1),
+	PIN_FIELD_BASE(55, 55, 5, 0x0090, 0x10, 9, 1),
+	PIN_FIELD_BASE(56, 56, 1, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(57, 57, 1, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(59, 59, 2, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(60, 60, 9, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(61, 61, 9, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(66, 66, 5, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(67, 67, 5, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(69, 69, 7, 0x00a0, 0x10, 0, 1),
+	PIN_FIELD_BASE(70, 70, 7, 0x00a0, 0x10, 1, 1),
+	PIN_FIELD_BASE(71, 71, 7, 0x00a0, 0x10, 2, 1),
+	PIN_FIELD_BASE(72, 72, 7, 0x00a0, 0x10, 3, 1),
+	PIN_FIELD_BASE(73, 73, 7, 0x00a0, 0x10, 4, 1),
+	PIN_FIELD_BASE(88, 88, 7, 0x00a0, 0x10, 5, 1),
+	PIN_FIELD_BASE(89, 89, 7, 0x00a0, 0x10, 6, 1),
+	PIN_FIELD_BASE(92, 92, 3, 0x00b0, 0x10, 4, 1),
+	PIN_FIELD_BASE(93, 93, 3, 0x00b0, 0x10, 5, 1),
+	PIN_FIELD_BASE(117, 117, 4, 0x0090, 0x10, 0, 1),
+	PIN_FIELD_BASE(118, 118, 4, 0x0090, 0x10, 1, 1),
+	PIN_FIELD_BASE(119, 119, 4, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(120, 120, 4, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(121, 121, 4, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(122, 122, 4, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(123, 123, 4, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(124, 124, 4, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(126, 126, 5, 0x0090, 0x10, 4, 1),
+	PIN_FIELD_BASE(127, 127, 5, 0x0090, 0x10, 5, 1),
+	PIN_FIELD_BASE(128, 128, 5, 0x0090, 0x10, 6, 1),
+	PIN_FIELD_BASE(129, 129, 5, 0x0090, 0x10, 7, 1),
+	PIN_FIELD_BASE(134, 134, 3, 0x00b0, 0x10, 0, 1),
+	PIN_FIELD_BASE(135, 135, 3, 0x00b0, 0x10, 1, 1),
+	PIN_FIELD_BASE(136, 136, 3, 0x00b0, 0x10, 2, 1),
+	PIN_FIELD_BASE(137, 137, 3, 0x00b0, 0x10, 3, 1),
+	PIN_FIELD_BASE(165, 165, 5, 0x0090, 0x10, 2, 1),
+	PIN_FIELD_BASE(166, 166, 5, 0x0090, 0x10, 3, 1),
+	PIN_FIELD_BASE(181, 181, 10, 0x0050, 0x10, 0, 1),
+};
+
+static const struct mtk_pin_field_calc mt8901_pin_drv_range[] = {
+	PIN_FIELD_BASE(0, 0, 8, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(1, 1, 8, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(2, 2, 8, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(3, 3, 8, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(4, 4, 8, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(5, 5, 8, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(6, 6, 8, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(7, 7, 8, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(8, 8, 2, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(9, 9, 2, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(10, 10, 2, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(11, 11, 2, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(12, 12, 1, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(13, 13, 1, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(14, 14, 1, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(15, 15, 1, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(16, 16, 1, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(17, 17, 1, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(18, 18, 1, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(19, 19, 1, 0x0020, 0x10, 21, 3),
+	PIN_FIELD_BASE(20, 20, 1, 0x0020, 0x10, 24, 3),
+	PIN_FIELD_BASE(21, 21, 1, 0x0020, 0x10, 18, 3),
+	PIN_FIELD_BASE(22, 22, 1, 0x0020, 0x10, 15, 3),
+	PIN_FIELD_BASE(23, 23, 1, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(24, 24, 1, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(25, 25, 1, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(26, 26, 1, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(27, 27, 1, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(28, 28, 1, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(29, 29, 1, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(30, 30, 1, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(31, 31, 1, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(32, 32, 9, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(33, 33, 1, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(34, 34, 1, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(35, 35, 1, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(36, 36, 9, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(37, 37, 2, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(38, 38, 2, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(39, 39, 1, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(40, 40, 2, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(41, 41, 2, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(42, 42, 2, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(43, 43, 2, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(44, 44, 2, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(45, 45, 2, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(46, 46, 1, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(47, 47, 1, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(48, 48, 2, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(49, 49, 2, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(50, 50, 2, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(51, 51, 2, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(52, 52, 2, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(53, 53, 2, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(54, 54, 5, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(55, 55, 5, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(56, 56, 1, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(57, 57, 1, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(58, 58, 1, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(59, 59, 2, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(60, 60, 9, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(61, 61, 9, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(62, 62, 9, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(63, 63, 9, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(64, 64, 9, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(65, 65, 9, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(66, 66, 5, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(67, 67, 5, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(68, 68, 9, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(69, 69, 7, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(70, 70, 7, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(71, 71, 7, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(72, 72, 7, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(73, 73, 7, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(74, 74, 7, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(75, 75, 7, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(76, 76, 7, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(77, 77, 7, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(78, 78, 7, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(79, 79, 7, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(80, 80, 7, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(81, 81, 7, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(82, 82, 7, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(83, 83, 7, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(84, 84, 7, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(85, 85, 7, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(86, 86, 7, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(87, 87, 7, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(88, 88, 7, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(89, 89, 7, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(90, 90, 7, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(91, 91, 7, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(92, 92, 3, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(93, 93, 3, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(94, 94, 3, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(95, 95, 3, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(96, 96, 3, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(97, 97, 3, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(98, 98, 3, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(99, 99, 3, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(100, 100, 3, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(101, 101, 3, 0x0020, 0x10, 15, 3),
+	PIN_FIELD_BASE(102, 102, 3, 0x0020, 0x10, 18, 3),
+	PIN_FIELD_BASE(103, 103, 3, 0x0020, 0x10, 21, 3),
+	PIN_FIELD_BASE(104, 104, 3, 0x0020, 0x10, 24, 3),
+	PIN_FIELD_BASE(105, 105, 3, 0x0020, 0x10, 27, 3),
+	PIN_FIELD_BASE(106, 106, 8, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(107, 107, 8, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(108, 108, 8, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(109, 109, 8, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(110, 110, 8, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(111, 111, 8, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(112, 112, 5, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(113, 113, 5, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(114, 114, 5, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(115, 115, 5, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(116, 116, 5, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(117, 117, 4, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(118, 118, 4, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(119, 119, 4, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(120, 120, 4, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(121, 121, 4, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(122, 122, 4, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(123, 123, 4, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(124, 124, 4, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(125, 125, 4, 0x0010, 0x10, 18, 3),
+	PIN_FIELD_BASE(126, 126, 5, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(127, 127, 5, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(128, 128, 5, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(129, 129, 5, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(130, 130, 4, 0x0010, 0x10, 21, 3),
+	PIN_FIELD_BASE(131, 131, 4, 0x0010, 0x10, 24, 3),
+	PIN_FIELD_BASE(132, 132, 4, 0x0010, 0x10, 27, 3),
+	PIN_FIELD_BASE(133, 133, 4, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(134, 134, 3, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(135, 135, 3, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(136, 136, 3, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(137, 137, 3, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(138, 138, 3, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(139, 139, 3, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(140, 140, 3, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(141, 141, 3, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(142, 142, 3, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(143, 143, 3, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(144, 144, 3, 0x0010, 0x10, 0, 3),
+	PIN_FIELD_BASE(145, 145, 3, 0x0010, 0x10, 3, 3),
+	PIN_FIELD_BASE(146, 146, 3, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(147, 147, 3, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(148, 148, 3, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(149, 149, 3, 0x0010, 0x10, 15, 3),
+	PIN_FIELD_BASE(150, 150, 4, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(151, 151, 4, 0x0020, 0x10, 18, 3),
+	PIN_FIELD_BASE(152, 152, 4, 0x0020, 0x10, 15, 3),
+	PIN_FIELD_BASE(153, 153, 4, 0x0020, 0x10, 12, 3),
+	PIN_FIELD_BASE(154, 154, 4, 0x0020, 0x10, 6, 3),
+	PIN_FIELD_BASE(155, 155, 4, 0x0020, 0x10, 9, 3),
+	PIN_FIELD_BASE(156, 156, 4, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(157, 157, 4, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(158, 158, 4, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(159, 159, 4, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(160, 160, 4, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(161, 161, 4, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(162, 162, 4, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(163, 163, 4, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(164, 164, 5, 0x0010, 0x10, 6, 3),
+	PIN_FIELD_BASE(165, 165, 5, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(166, 166, 5, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(167, 167, 5, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(168, 168, 5, 0x0010, 0x10, 9, 3),
+	PIN_FIELD_BASE(169, 169, 5, 0x0010, 0x10, 12, 3),
+	PIN_FIELD_BASE(170, 170, 5, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(171, 171, 6, 0x0000, 0x10, 0, 3),
+	PIN_FIELD_BASE(172, 172, 6, 0x0000, 0x10, 3, 3),
+	PIN_FIELD_BASE(173, 173, 6, 0x0000, 0x10, 6, 3),
+	PIN_FIELD_BASE(174, 174, 6, 0x0000, 0x10, 9, 3),
+	PIN_FIELD_BASE(175, 175, 6, 0x0000, 0x10, 12, 3),
+	PIN_FIELD_BASE(176, 176, 6, 0x0000, 0x10, 15, 3),
+	PIN_FIELD_BASE(177, 177, 6, 0x0000, 0x10, 18, 3),
+	PIN_FIELD_BASE(178, 178, 6, 0x0000, 0x10, 21, 3),
+	PIN_FIELD_BASE(179, 179, 6, 0x0000, 0x10, 24, 3),
+	PIN_FIELD_BASE(180, 180, 6, 0x0000, 0x10, 27, 3),
+	PIN_FIELD_BASE(181, 181, 10, 0x0000, 0x10, 0, 3),
+};
+
+static const struct mtk_pin_field_calc mt8901_pin_drv_adv_range[] = {
+	PIN_FIELD_BASE(8, 8, 2, 0x0030, 0x10, 6, 3),
+	PIN_FIELD_BASE(9, 9, 2, 0x0030, 0x10, 9, 3),
+	PIN_FIELD_BASE(10, 10, 2, 0x0030, 0x10, 12, 3),
+	PIN_FIELD_BASE(11, 11, 2, 0x0030, 0x10, 15, 3),
+	PIN_FIELD_BASE(12, 12, 1, 0x0040, 0x10, 0, 3),
+	PIN_FIELD_BASE(13, 13, 1, 0x0040, 0x10, 3, 3),
+	PIN_FIELD_BASE(17, 17, 1, 0x0040, 0x10, 6, 3),
+	PIN_FIELD_BASE(18, 18, 1, 0x0040, 0x10, 9, 3),
+	PIN_FIELD_BASE(52, 52, 2, 0x0030, 0x10, 0, 3),
+	PIN_FIELD_BASE(53, 53, 2, 0x0030, 0x10, 3, 3),
+	PIN_FIELD_BASE(54, 54, 5, 0x0030, 0x10, 24, 3),
+	PIN_FIELD_BASE(55, 55, 5, 0x0030, 0x10, 27, 3),
+	PIN_FIELD_BASE(56, 56, 1, 0x0040, 0x10, 12, 3),
+	PIN_FIELD_BASE(57, 57, 1, 0x0040, 0x10, 15, 3),
+	PIN_FIELD_BASE(60, 60, 9, 0x0020, 0x10, 0, 3),
+	PIN_FIELD_BASE(61, 61, 9, 0x0020, 0x10, 3, 3),
+	PIN_FIELD_BASE(66, 66, 5, 0x0030, 0x10, 0, 3),
+	PIN_FIELD_BASE(67, 67, 5, 0x0030, 0x10, 3, 3),
+	PIN_FIELD_BASE(70, 70, 7, 0x0030, 0x10, 0, 3),
+	PIN_FIELD_BASE(71, 71, 7, 0x0030, 0x10, 3, 3),
+	PIN_FIELD_BASE(72, 72, 7, 0x0030, 0x10, 6, 3),
+	PIN_FIELD_BASE(73, 73, 7, 0x0030, 0x10, 9, 3),
+	PIN_FIELD_BASE(88, 88, 7, 0x0030, 0x10, 12, 3),
+	PIN_FIELD_BASE(89, 89, 7, 0x0030, 0x10, 15, 3),
+	PIN_FIELD_BASE(92, 92, 3, 0x0040, 0x10, 12, 3),
+	PIN_FIELD_BASE(93, 93, 3, 0x0040, 0x10, 15, 3),
+	PIN_FIELD_BASE(117, 117, 4, 0x0030, 0x10, 0, 3),
+	PIN_FIELD_BASE(118, 118, 4, 0x0030, 0x10, 3, 3),
+	PIN_FIELD_BASE(119, 119, 4, 0x0030, 0x10, 6, 3),
+	PIN_FIELD_BASE(120, 120, 4, 0x0030, 0x10, 9, 3),
+	PIN_FIELD_BASE(121, 121, 4, 0x0030, 0x10, 12, 3),
+	PIN_FIELD_BASE(122, 122, 4, 0x0030, 0x10, 15, 3),
+	PIN_FIELD_BASE(123, 123, 4, 0x0030, 0x10, 18, 3),
+	PIN_FIELD_BASE(124, 124, 4, 0x0030, 0x10, 21, 3),
+	PIN_FIELD_BASE(126, 126, 5, 0x0030, 0x10, 12, 3),
+	PIN_FIELD_BASE(127, 127, 5, 0x0030, 0x10, 15, 3),
+	PIN_FIELD_BASE(128, 128, 5, 0x0030, 0x10, 18, 3),
+	PIN_FIELD_BASE(129, 129, 5, 0x0030, 0x10, 21, 3),
+	PIN_FIELD_BASE(134, 134, 3, 0x0040, 0x10, 0, 3),
+	PIN_FIELD_BASE(135, 135, 3, 0x0040, 0x10, 3, 3),
+	PIN_FIELD_BASE(136, 136, 3, 0x0040, 0x10, 6, 3),
+	PIN_FIELD_BASE(137, 137, 3, 0x0040, 0x10, 9, 3),
+	PIN_FIELD_BASE(165, 165, 5, 0x0030, 0x10, 6, 3),
+	PIN_FIELD_BASE(166, 166, 5, 0x0030, 0x10, 9, 3),
+};
+
+static const struct mtk_pin_field_calc mt8901_pin_rsel_range[] = {
+	PIN_FIELD_BASE(8, 8, 2, 0x0110, 0x10, 6, 3),
+	PIN_FIELD_BASE(9, 9, 2, 0x0110, 0x10, 9, 3),
+	PIN_FIELD_BASE(10, 10, 2, 0x0110, 0x10, 12, 3),
+	PIN_FIELD_BASE(11, 11, 2, 0x0110, 0x10, 15, 3),
+	PIN_FIELD_BASE(12, 12, 1, 0x0130, 0x10, 0, 1),
+	PIN_FIELD_BASE(13, 13, 1, 0x0130, 0x10, 1, 1),
+	PIN_FIELD_BASE(17, 17, 1, 0x0130, 0x10, 2, 1),
+	PIN_FIELD_BASE(18, 18, 1, 0x0130, 0x10, 3, 1),
+	PIN_FIELD_BASE(52, 52, 2, 0x0110, 0x10, 0, 3),
+	PIN_FIELD_BASE(53, 53, 2, 0x0110, 0x10, 3, 3),
+	PIN_FIELD_BASE(54, 54, 5, 0x0110, 0x10, 12, 3),
+	PIN_FIELD_BASE(55, 55, 5, 0x0110, 0x10, 15, 3),
+	PIN_FIELD_BASE(56, 56, 1, 0x0130, 0x10, 4, 1),
+	PIN_FIELD_BASE(57, 57, 1, 0x0130, 0x10, 5, 1),
+	PIN_FIELD_BASE(60, 60, 9, 0x00f0, 0x10, 0, 3),
+	PIN_FIELD_BASE(61, 61, 9, 0x00f0, 0x10, 3, 3),
+	PIN_FIELD_BASE(66, 66, 5, 0x0110, 0x10, 0, 1),
+	PIN_FIELD_BASE(67, 67, 5, 0x0110, 0x10, 1, 1),
+	PIN_FIELD_BASE(70, 70, 7, 0x0100, 0x10, 0, 3),
+	PIN_FIELD_BASE(71, 71, 7, 0x0100, 0x10, 3, 3),
+	PIN_FIELD_BASE(72, 72, 7, 0x0100, 0x10, 6, 3),
+	PIN_FIELD_BASE(73, 73, 7, 0x0100, 0x10, 9, 3),
+	PIN_FIELD_BASE(88, 88, 7, 0x0100, 0x10, 12, 3),
+	PIN_FIELD_BASE(89, 89, 7, 0x0100, 0x10, 15, 3),
+	PIN_FIELD_BASE(92, 92, 3, 0x0120, 0x10, 12, 3),
+	PIN_FIELD_BASE(93, 93, 3, 0x0120, 0x10, 15, 3),
+	PIN_FIELD_BASE(117, 117, 4, 0x0100, 0x10, 0, 3),
+	PIN_FIELD_BASE(118, 118, 4, 0x0100, 0x10, 3, 3),
+	PIN_FIELD_BASE(119, 119, 4, 0x0100, 0x10, 6, 3),
+	PIN_FIELD_BASE(120, 120, 4, 0x0100, 0x10, 9, 3),
+	PIN_FIELD_BASE(121, 121, 4, 0x0100, 0x10, 12, 3),
+	PIN_FIELD_BASE(122, 122, 4, 0x0100, 0x10, 15, 3),
+	PIN_FIELD_BASE(123, 123, 4, 0x0100, 0x10, 18, 3),
+	PIN_FIELD_BASE(124, 124, 4, 0x0100, 0x10, 21, 3),
+	PIN_FIELD_BASE(126, 126, 5, 0x0110, 0x10, 8, 1),
+	PIN_FIELD_BASE(127, 127, 5, 0x0110, 0x10, 9, 1),
+	PIN_FIELD_BASE(128, 128, 5, 0x0110, 0x10, 10, 1),
+	PIN_FIELD_BASE(129, 129, 5, 0x0110, 0x10, 11, 1),
+	PIN_FIELD_BASE(134, 134, 3, 0x0120, 0x10, 0, 3),
+	PIN_FIELD_BASE(135, 135, 3, 0x0120, 0x10, 3, 3),
+	PIN_FIELD_BASE(136, 136, 3, 0x0120, 0x10, 6, 3),
+	PIN_FIELD_BASE(137, 137, 3, 0x0120, 0x10, 9, 3),
+	PIN_FIELD_BASE(165, 165, 5, 0x0110, 0x10, 2, 3),
+	PIN_FIELD_BASE(166, 166, 5, 0x0110, 0x10, 5, 3),
+};
+
+static const unsigned int mt8901_pull_type[] = {
+	MTK_PULL_PUPD_R1R0_TYPE, /*0*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*1*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*2*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*3*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*4*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*5*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*6*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*7*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*8*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*9*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*10*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*11*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*12*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*13*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*14*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*15*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*16*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*17*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*18*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*19*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*20*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*21*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*22*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*23*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*24*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*25*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*26*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*27*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*28*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*29*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*30*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*31*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*32*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*33*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*34*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*35*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*36*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*37*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*38*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*39*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*40*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*41*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*42*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*43*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*44*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*45*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*46*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*47*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*48*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*49*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*50*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*51*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*52*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*53*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*54*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*55*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*56*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*57*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*58*/
+	MTK_PULL_PU_PD_TYPE, /*59*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*60*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*61*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*62*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*63*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*64*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*65*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*66*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*67*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*68*/
+	MTK_PULL_PU_PD_TYPE, /*69*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*70*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*71*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*72*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*73*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*74*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*75*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*76*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*77*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*78*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*79*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*80*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*81*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*82*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*83*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*84*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*85*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*86*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*87*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*88*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*89*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*90*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*91*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*92*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*93*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*94*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*95*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*96*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*97*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*98*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*99*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*100*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*101*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*102*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*103*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*104*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*105*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*106*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*107*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*108*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*109*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*110*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*111*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*112*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*113*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*114*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*115*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*116*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*117*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*118*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*119*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*120*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*121*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*122*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*123*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*124*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*125*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*126*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*127*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*128*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*129*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*130*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*131*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*132*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*133*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*134*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*135*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*136*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*137*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*138*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*139*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*140*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*141*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*142*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*143*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*144*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*145*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*146*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*147*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*148*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*149*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*150*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*151*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*152*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*153*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*154*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*155*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*156*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*157*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*158*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*159*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*160*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*161*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*162*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*163*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*164*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*165*/
+	MTK_PULL_PU_PD_RSEL_TYPE, /*166*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*167*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*168*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*169*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*170*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*171*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*172*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*173*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*174*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*175*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*176*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*177*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*178*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*179*/
+	MTK_PULL_PUPD_R1R0_TYPE, /*180*/
+	MTK_PULL_PU_PD_TYPE, /*181*/
+};
+
+static const struct mtk_pin_reg_calc mt8901_reg_cals[PINCTRL_PIN_REG_MAX] = {
+	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt8901_pin_mode_range),
+	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt8901_pin_dir_range),
+	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt8901_pin_di_range),
+	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt8901_pin_do_range),
+	[PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt8901_pin_smt_range),
+	[PINCTRL_PIN_REG_IES] = MTK_RANGE(mt8901_pin_ies_range),
+	[PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt8901_pin_pupd_range),
+	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt8901_pin_r0_range),
+	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt8901_pin_r1_range),
+	[PINCTRL_PIN_REG_PU] = MTK_RANGE(mt8901_pin_pu_range),
+	[PINCTRL_PIN_REG_PD] = MTK_RANGE(mt8901_pin_pd_range),
+	[PINCTRL_PIN_REG_DRV] = MTK_RANGE(mt8901_pin_drv_range),
+	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt8901_pin_drv_adv_range),
+	[PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt8901_pin_rsel_range),
+};
+
+static const char * const mt8901_pinctrl_register_base_name[] = {
+	"iocfg0", "iocfg_lt2", "iocfg_lt3", "iocfg_rt1", "iocfg_rt2", "iocfg_rt3",
+	"iocfg_tr", "iocfg_rt0", "iocfg_lt1", "iocfg_lb", "iocfg_rb",
+};
+
+static const struct mtk_eint_hw mt8901_eint_hw = {
+	.port_mask = 0xf,
+	.ports     = 7,
+	.ap_num    = 209,
+	.db_cnt    = 32,
+	.db_time   = debounce_time_mt8901,
+	.has_event_mask = true,
+};
+
+static const unsigned int eint_event_mt8901[] = {20};
+
+/* Selected by pinctrl-mt89xx.c from the ACPI _DSD ChipId. */
+const struct mtk_pin_soc mt8901_data = {
+	.reg_cal = mt8901_reg_cals,
+	.pins = mtk_pins_mt8901,
+	.npins = ARRAY_SIZE(mtk_pins_mt8901),
+	.ngrps = ARRAY_SIZE(mtk_pins_mt8901),
+	.eint_hw = &mt8901_eint_hw,
+	.eint_pin = eint_pins_mt8901,
+	.nfuncs = 8,
+	.gpio_m = 0,
+	.base_names = mt8901_pinctrl_register_base_name,
+	.nbase_names = ARRAY_SIZE(mt8901_pinctrl_register_base_name),
+	.pull_type = mt8901_pull_type,
+	.pin_rsel = NULL,
+	.npin_rsel = 0,
+	.bias_set_combo = mtk_pinconf_bias_set_combo,
+	.bias_get_combo = mtk_pinconf_bias_get_combo,
+	.drive_set = mtk_pinconf_drive_set_rev1,
+	.drive_get = mtk_pinconf_drive_get_rev1,
+	.adv_drive_set = mtk_pinconf_adv_drive_set_raw,
+	.adv_drive_get = mtk_pinconf_adv_drive_get_raw,
+	.eint_event = eint_event_mt8901,
+	.total_wake_eints =	ARRAY_SIZE(eint_event_mt8901),
+};
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8971.c b/drivers/pinctrl/mediatek/pinctrl-mt8971.c
new file mode 100644
index 000000000000..951d3feeafa3
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8971.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 MediaTek Inc.
+ */
+
+#include <dt-bindings/pinctrl/mt65xx.h>
+#include <linux/acpi.h>
+#include <linux/module.h>
+
+#include "mtk-eint.h"
+#include "pinctrl-mtk-common-v2.h"
+#include "pinctrl-mtk-mt8971.h"
+
+/* Pin register bases. The remaining memory resources are EINT banks. */
+static const char * const mt8971_pinctrl_register_base_name[] = {
+	"iocfg0", "iocfg1",
+};
+
+static const struct mtk_eint_hw mt8971_eint_hw = {
+	.port_mask = 0xf,
+	.ports     = 4,
+	.ap_num    = 216,
+	.db_cnt    = 32,
+	/*
+	 * The debounce registers are not confirmed for MT8971 yet, so leave
+	 * db_time unset and report debounce as unsupported.
+	 */
+	.db_time   = NULL,
+};
+
+static const unsigned int eint_event_mt8971[] = {20};
+
+/* EINT215 is used by firmware for PROCHOT and must stay unmasked. */
+static const unsigned int mt8971_skip_eint_list[] = {215};
+
+const struct mtk_pin_soc mt8971_data = {
+	.reg_in_order = true,
+	.reg_order = mt8971_reg_order,
+	.reg_order_stride = 0x4000,
+	.pins = mtk_pins_mt8971,
+	.npins = ARRAY_SIZE(mtk_pins_mt8971),
+	.ngrps = ARRAY_SIZE(mtk_pins_mt8971),
+	.eint_hw = &mt8971_eint_hw,
+	.eint_pin = eint_pins_mt8971,
+	.nfuncs = 8,
+	.gpio_m = 0,
+	.base_names = mt8971_pinctrl_register_base_name,
+	.nbase_names = ARRAY_SIZE(mt8971_pinctrl_register_base_name),
+	.pull_type = NULL,
+	.drive_set = mtk_pinconf_drive_set_rev1,
+	.drive_get = mtk_pinconf_drive_get_rev1,
+	.adv_drive_set = mtk_pinconf_adv_drive_set_raw,
+	.adv_drive_get = mtk_pinconf_adv_drive_get_raw,
+	.eint_event = eint_event_mt8971,
+	.total_wake_eints = ARRAY_SIZE(eint_event_mt8971),
+	.skip_eint_list = mt8971_skip_eint_list,
+	.n_skip_eint = ARRAY_SIZE(mt8971_skip_eint_list),
+};
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt89xx.c b/drivers/pinctrl/mediatek/pinctrl-mt89xx.c
new file mode 100644
index 000000000000..c55d8d14a983
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mt89xx.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 MediaTek Inc.
+ *
+ * MediaTek MT8901/MT8971 pinctrl driver
+ *
+ * Both SoCs use the same ACPI HID, so the SoC data is selected from the
+ * ChipId property in the vendor _DSD. The _DSD also carries size fields;
+ * they are only checked against the built-in tables, not applied.
+ */
+
+#include <linux/acpi.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include "pinctrl-mtk-common-v2.h"
+#include "pinctrl-mtk-dsd.h"
+#include "pinctrl-paris.h"
+
+/* ChipId values are defined by firmware. */
+enum mtk_gpio_chip_id {
+	MTK_GPIO_CHIP_MT8971 = 0,
+	MTK_GPIO_CHIP_MT8901 = 1,
+	/* ChipId 2 and 3 are not supported. */
+	MTK_GPIO_CHIP_MAX = 4,
+};
+
+static const struct mtk_pin_soc *const mtk_gpio_soc_table[MTK_GPIO_CHIP_MAX] = {
+	[MTK_GPIO_CHIP_MT8971] = &mt8971_data,
+	[MTK_GPIO_CHIP_MT8901] = &mt8901_data,
+};
+
+static int mtk89xx_probe(struct platform_device *pdev)
+{
+	struct mtk_gpio_dsd_info dsd = { 0 };
+	const struct mtk_pin_soc *soc;
+	int ret;
+
+	ret = mtk_gpio_read_dsd_info(&pdev->dev, &dsd);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Failed to read MediaTek GPIO _DSD ChipId\n");
+
+	if (dsd.chip_id >= MTK_GPIO_CHIP_MAX ||
+	    !mtk_gpio_soc_table[dsd.chip_id])
+		return dev_err_probe(&pdev->dev, -ENODEV,
+				     "Unsupported/unimplemented ChipId(%u)\n",
+				     dsd.chip_id);
+
+	soc = mtk_gpio_soc_table[dsd.chip_id];
+
+	dev_info(&pdev->dev,
+		 "ChipId(%u) RegLength(0x%x) EintRegLength(0x%x) TotalGpios(%u)\n",
+		 dsd.chip_id, dsd.reg_length, dsd.eint_reg_length,
+		 dsd.total_gpios);
+	dev_info(&pdev->dev,
+		 "TotalEintPins(%u) IoBaseAddrMaxIdx(%u) EintBaseIdx(%u)\n",
+		 dsd.total_eint_pins, dsd.io_base_addr_max_idx,
+		 dsd.eint_base_idx);
+	dev_info(&pdev->dev,
+		 "NumberOfPinsPerBank(%u) EintModuleIdx(%u) BankCount(%u)\n",
+		 dsd.number_of_pins_per_bank, dsd.eint_module_idx,
+		 dsd.bank_count);
+
+	/* Cross check these values against the ACPI values. */
+	if (dsd.total_gpios && dsd.total_gpios != soc->npins)
+		dev_warn(&pdev->dev,
+			 "_DSD TotalGpios(%u) != compiled npins(%u) for ChipId(%u), not applied\n",
+			 dsd.total_gpios, soc->npins, dsd.chip_id);
+
+	if (dsd.total_eint_pins && soc->eint_hw &&
+	    dsd.total_eint_pins != soc->eint_hw->ap_num)
+		dev_warn(&pdev->dev,
+			 "_DSD TotalEintPins(%u) != compiled ap_num(%u) for ChipId(%u), not applied\n",
+			 dsd.total_eint_pins, soc->eint_hw->ap_num, dsd.chip_id);
+
+	return mtk_paris_pinctrl_probe_soc(pdev, soc);
+}
+
+static const struct acpi_device_id mtk89xx_acpi_match[] = {
+	{ "NVDA9221", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, mtk89xx_acpi_match);
+
+static struct platform_driver mtk89xx_pinctrl_driver = {
+	.driver = {
+		.name = "mtk89xx-pinctrl",
+		.acpi_match_table = mtk89xx_acpi_match,
+		.pm = pm_sleep_ptr(&mtk_paris_pinctrl_pm_ops),
+	},
+	.probe = mtk89xx_probe,
+};
+
+static int __init mtk89xx_pinctrl_init(void)
+{
+	return platform_driver_register(&mtk89xx_pinctrl_driver);
+}
+arch_initcall(mtk89xx_pinctrl_init);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MediaTek MT8901/MT8971 single-binary Pinctrl Driver");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index faa6dbf0f635..c8d88c9d3f05 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (C) 2018 MediaTek Inc.
+ * Copyright (C) 2018-2026 MediaTek Inc.
  *
  * Author: Sean Wang <sean.wang@mediatek.com>
  *
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/soc/mediatek/mtk-pinctrl.h>
 
 #include "mtk-eint.h"
 #include "pinctrl-mtk-common-v2.h"
@@ -81,7 +82,50 @@ static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
 	bool found = false;
 	u32 bits;
 
-	if (hw->soc->reg_cal && hw->soc->reg_cal[field].range) {
+	/*
+	 * With reg_in_order, each pin has a fixed-size register block:
+	 * offset = reg_order[field].offset + pin * reg_order_stride.
+	 * Fields not present on this SoC have a zero mask and are handled by
+	 * the "not supported" path below.
+	 */
+	if (hw->soc->reg_in_order && hw->soc->reg_order &&
+	    hw->soc->reg_order[field].mask) {
+		const struct mtk_pin_field_order *o = &hw->soc->reg_order[field];
+
+		if (desc->number > U32_MAX / hw->soc->reg_order_stride) {
+			dev_err(hw->dev,
+				"pin %d * reg_order_stride overflow\n",
+				desc->number);
+			return -EINVAL;
+		}
+
+		if (o->offset > U32_MAX - desc->number * hw->soc->reg_order_stride) {
+			dev_err(hw->dev,
+				"offset + pin %d * reg_order_stride overflow\n",
+				desc->number);
+			return -EINVAL;
+		}
+
+		if (o->index >= hw->nbase) {
+			dev_err(hw->dev,
+				"Invalid base for field %d for pin = %d (%s)\n",
+				field, desc->number, desc->name);
+			return -EINVAL;
+		}
+
+		pfd->index  = o->index;
+		pfd->offset = o->offset +
+			      desc->number * hw->soc->reg_order_stride;
+		pfd->bitpos = o->bitpos;
+		pfd->mask   = o->mask;
+		/* Fields never cross a register boundary in this layout. */
+		pfd->next   = 0;
+
+		return 0;
+	}
+
+	if (!hw->soc->reg_in_order && hw->soc->reg_cal &&
+	    hw->soc->reg_cal[field].range) {
 		rc = &hw->soc->reg_cal[field];
 	} else {
 		dev_dbg(hw->dev,
@@ -369,26 +413,49 @@ static const struct mtk_eint_xt mtk_eint_xt = {
 int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	int ret, i, j, count_reg_names;
+	int ret, i, count_reg_names;
+	unsigned int j, nbase;
+	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
+	struct resource *res;
+
+	dev_info(&pdev->dev, "EINT build: starting (CONFIG_EINT_MTK=%d)\n",
+		 IS_ENABLED(CONFIG_EINT_MTK));
 
 	if (!IS_ENABLED(CONFIG_EINT_MTK))
 		return 0;
 
-	if (!of_property_read_bool(np, "interrupt-controller"))
+	if (is_of_node(fwnode) && !of_property_read_bool(np, "interrupt-controller"))
 		return -ENODEV;
 
 	hw->eint = devm_kzalloc(hw->dev, sizeof(*hw->eint), GFP_KERNEL);
 	if (!hw->eint)
 		return -ENOMEM;
 
-	count_reg_names = of_property_count_strings(np, "reg-names");
+	if (is_of_node(fwnode)) {
+		count_reg_names = of_property_count_strings(np, "reg-names");
+	} else {
+		count_reg_names = 0;
+		for (i = 0; i < pdev->num_resources; i++) {
+			struct resource *r = &pdev->resource[i];
+
+			if (resource_type(r) == IORESOURCE_MEM)
+				count_reg_names++;
+		}
+	}
 	if (count_reg_names < 0)
 		return -EINVAL;
 
-	hw->eint->nbase = count_reg_names - (int)hw->soc->nbase_names;
-	if (hw->eint->nbase <= 0)
+	dev_info(&pdev->dev,
+		 "EINT build: count_reg_names=%d nbase_names=%u\n",
+		 count_reg_names, hw->soc->nbase_names);
+
+	/* need at least one EINT bank after the pin register bases */
+	if ((unsigned int)count_reg_names <= hw->soc->nbase_names)
 		return -EINVAL;
 
+	nbase = (unsigned int)count_reg_names - hw->soc->nbase_names;
+	hw->eint->nbase = nbase;
+
 	hw->eint->base = devm_kmalloc_array(&pdev->dev, hw->eint->nbase,
 					    sizeof(*hw->eint->base), GFP_KERNEL | __GFP_ZERO);
 	if (!hw->eint->base) {
@@ -397,20 +464,30 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 	}
 
 	for (i = hw->soc->nbase_names, j = 0; i < count_reg_names; i++, j++) {
-		hw->eint->base[j] = of_iomap(np, i);
-		if (IS_ERR(hw->eint->base[j])) {
-			ret = PTR_ERR(hw->eint->base[j]);
+		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
+		hw->eint->base[j] = is_of_node(fwnode) ? of_iomap(np, i) :
+				ioremap(res->start, resource_size(res));
+		if (!hw->eint->base[j]) {
+			ret = -ENOMEM;
 			goto err_free_eint;
 		}
+		dev_info(&pdev->dev, "EINT build: base[%u] mapped @ %pK (res %d)\n",
+			 j, hw->eint->base[j], i);
 	}
 
-	hw->eint->irq = irq_of_parse_and_map(np, 0);
-	if (!hw->eint->irq) {
-		ret = -EINVAL;
+	hw->eint->irq = is_of_node(fwnode)
+			? irq_of_parse_and_map(np, 0)
+			: platform_get_irq(pdev, 0);
+	if (hw->eint->irq <= 0) {
+		dev_err(&pdev->dev, "EINT build: failed to get IRQ (irq=%d)\n",
+			hw->eint->irq);
+		ret = hw->eint->irq < 0 ? hw->eint->irq : -EINVAL;
 		goto err_free_eint;
 	}
+	dev_info(&pdev->dev, "EINT build: got IRQ %d\n", hw->eint->irq);
 
 	if (!hw->soc->eint_hw) {
+		dev_err(&pdev->dev, "EINT build: soc->eint_hw is NULL\n");
 		ret = -ENODEV;
 		goto err_free_eint;
 	}
@@ -419,15 +496,29 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 	hw->eint->hw = hw->soc->eint_hw;
 	hw->eint->pctl = hw;
 	hw->eint->gpio_xlate = &mtk_eint_xt;
+	hw->eint->event_pins = hw->soc->eint_event;
+	hw->eint->num_event_pins = hw->soc->total_wake_eints;
+	hw->eint->skip_eint_list = hw->soc->skip_eint_list;
+	hw->eint->num_skip_eint = hw->soc->n_skip_eint;
+
+	dev_info(&pdev->dev,
+		 "EINT build: eint_hw ap_num=%u db_cnt=%u, skip_list=%u entries\n",
+		 hw->eint->hw->ap_num, hw->eint->hw->db_cnt,
+		 hw->eint->num_skip_eint);
 
 	ret = mtk_eint_do_init(hw->eint, hw->soc->eint_pin);
-	if (ret)
+	if (ret) {
+		dev_err(&pdev->dev, "EINT build: mtk_eint_do_init failed (%d)\n",
+			ret);
 		goto err_free_eint;
+	}
+
+	dev_info(&pdev->dev, "EINT build: complete\n");
 
 	return 0;
 
 err_free_eint:
-	for (j = 0; j < hw->eint->nbase; j++) {
+	for (j = 0; j < nbase; j++) {
 		if (hw->eint->base[j])
 			iounmap(hw->eint->base[j]);
 	}
@@ -609,10 +700,15 @@ static int mtk_pinconf_bias_set_pu_pd(struct mtk_pinctrl *hw,
 	if (arg == MTK_DISABLE) {
 		pu = 0;
 		pd = 0;
-	} else if ((arg == MTK_ENABLE) && pullup) {
+	} else if (arg == MTK_ENABLE && pullup == MTK_BUS_HOLD) {
+		if (pd_only)
+			return -EINVAL; /* bus-hold needs both PU and PD */
+		pu = 1;
+		pd = 1;
+	} else if ((arg == MTK_ENABLE) && pullup == 1) {
 		pu = 1;
 		pd = 0;
-	} else if ((arg == MTK_ENABLE) && !pullup) {
+	} else if ((arg == MTK_ENABLE) && pullup == 0) {
 		pu = 0;
 		pd = 1;
 	} else {
@@ -634,6 +730,12 @@ static int mtk_pinconf_bias_set_pullsel_pullen(struct mtk_pinctrl *hw,
 {
 	int err, enable;
 
+	/* Bus-hold is not supported for PULLSEL/PULLEN path; reject explicitly */
+	if (pullup == MTK_BUS_HOLD) {
+		err = -EINVAL;
+		goto out;
+	}
+
 	if (arg == MTK_DISABLE)
 		enable = 0;
 	else if (arg == MTK_ENABLE)
@@ -659,6 +761,12 @@ static int mtk_pinconf_bias_set_pupd_r1_r0(struct mtk_pinctrl *hw,
 {
 	int err, r0, r1;
 
+	/* Bus-hold is not supported for R1R0 path; reject explicitly */
+	if (pullup == MTK_BUS_HOLD) {
+		err = -EINVAL;
+		goto out;
+	}
+
 	if ((arg == MTK_DISABLE) || (arg == MTK_PUPD_SET_R1R0_00)) {
 		pullup = 0;
 		r0 = 0;
@@ -779,7 +887,8 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
 	else
 		try_all_type = MTK_PULL_TYPE_MASK;
 
-	if (try_all_type & MTK_PULL_RSEL_TYPE) {
+	/* Bus-hold is not supported by the RSEL path, skip it */
+	if ((try_all_type & MTK_PULL_RSEL_TYPE) && pullup != MTK_BUS_HOLD) {
 		err = mtk_pinconf_bias_set_pu_pd_rsel(hw, desc, pullup, arg);
 		if (!err)
 			return 0;
@@ -788,7 +897,7 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
 	if (try_all_type & MTK_PULL_PD_TYPE) {
 		err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg, true);
 		if (!err)
-			return err;
+			return 0;
 	}
 
 	if (try_all_type & MTK_PULL_PU_PD_TYPE) {
@@ -814,6 +923,96 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
 }
 EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
 
+/* Registered controllers, used to find the owner of a GPIO number. */
+static LIST_HEAD(mtk_pinctrl_instances);
+static DEFINE_MUTEX(mtk_pinctrl_instances_lock);
+
+void mtk_pinctrl_register_instance(struct mtk_pinctrl *hw)
+{
+	mutex_lock(&mtk_pinctrl_instances_lock);
+	list_add_tail(&hw->instance_node, &mtk_pinctrl_instances);
+	mutex_unlock(&mtk_pinctrl_instances_lock);
+}
+EXPORT_SYMBOL_GPL(mtk_pinctrl_register_instance);
+
+void mtk_pinctrl_unregister_instance(struct mtk_pinctrl *hw)
+{
+	mutex_lock(&mtk_pinctrl_instances_lock);
+	list_del(&hw->instance_node);
+	mutex_unlock(&mtk_pinctrl_instances_lock);
+}
+EXPORT_SYMBOL_GPL(mtk_pinctrl_unregister_instance);
+
+/* Map the public API values to the internal ones. */
+static int mtk_pinctrl_public_pullup_to_internal(u32 pub, u32 *out)
+{
+	switch (pub) {
+	case MTK_PIN_PULLDOWN:
+		*out = MTK_PULLDOWN;
+		return 0;
+	case MTK_PIN_PULLUP:
+		*out = MTK_PULLUP;
+		return 0;
+	case MTK_PIN_BUS_HOLD:
+		*out = MTK_BUS_HOLD;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mtk_pinctrl_public_arg_to_internal(u32 pub, u32 *out)
+{
+	switch (pub) {
+	case MTK_PIN_ENABLE:
+		*out = MTK_ENABLE;
+		return 0;
+	case MTK_PIN_DISABLE:
+		*out = MTK_DISABLE;
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+int mtk_pinctrl_program_bias_by_gpio(unsigned int gpio, u32 pullup, u32 arg)
+{
+	struct mtk_pinctrl *hw;
+	const struct mtk_pin_desc *desc;
+	u32 int_pullup, int_arg;
+	int err;
+
+	err = mtk_pinctrl_public_pullup_to_internal(pullup, &int_pullup);
+	if (err)
+		return err;
+	err = mtk_pinctrl_public_arg_to_internal(arg, &int_arg);
+	if (err)
+		return err;
+
+	err = -ENODEV;
+	mutex_lock(&mtk_pinctrl_instances_lock);
+	list_for_each_entry(hw, &mtk_pinctrl_instances, instance_node) {
+		if (gpio >= hw->soc->npins)
+			continue;
+
+		desc = &hw->soc->pins[gpio];
+		if (desc->number != gpio)
+			continue;
+
+		if (!hw->soc->bias_set_combo) {
+			err = -EOPNOTSUPP;
+			break;
+		}
+
+		err = hw->soc->bias_set_combo(hw, desc, int_pullup, int_arg);
+		break;
+	}
+	mutex_unlock(&mtk_pinctrl_instances_lock);
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(mtk_pinctrl_program_bias_by_gpio);
+
 static int mtk_rsel_get_si_unit(struct mtk_pinctrl *hw,
 				const struct mtk_pin_desc *desc,
 				u32 pullup, u32 rsel_val, u32 *si_unit)
@@ -872,6 +1071,13 @@ static int mtk_pinconf_bias_get_pu_pd_rsel(struct mtk_pinctrl *hw,
 			mtk_rsel_get_si_unit(hw, desc, *pullup, rsel, enable);
 		else
 			*enable = rsel + MTK_PULL_SET_RSEL_000;
+	} else if (pu == 1 && pd == 1) {
+		/* Keeper (bus-hold) reports pull-up resistance via up-RSEL lookup */
+		*pullup = MTK_BUS_HOLD;
+		if (hw->rsel_si_unit)
+			mtk_rsel_get_si_unit(hw, desc, *pullup, rsel, enable);
+		else
+			*enable = rsel + MTK_PULL_SET_RSEL_000;
 	} else {
 		err = -EINVAL;
 		goto out;
@@ -904,8 +1110,12 @@ static int mtk_pinconf_bias_get_pu_pd(struct mtk_pinctrl *hw,
 	} else if (pu == 0 && pd == 1) {
 		*pullup = 0;
 		*enable = MTK_ENABLE;
-	} else
+	} else if (pu == 1 && pd == 1) {
+		*pullup = MTK_BUS_HOLD;
+		*enable = MTK_ENABLE;
+	} else {
 		err = -EINVAL;
+	}
 
 out:
 	return err;
@@ -1006,7 +1216,7 @@ int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
 	if (try_all_type & MTK_PULL_PD_TYPE) {
 		err = mtk_pinconf_bias_get_pd(hw, desc, pullup, enable);
 		if (!err)
-			return err;
+			return 0;
 	}
 
 	if (try_all_type & MTK_PULL_PU_PD_TYPE) {
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index fa7c0ed49346..ade9e845817f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -15,6 +15,8 @@
 #define MTK_OUTPUT     1
 #define MTK_DISABLE    0
 #define MTK_ENABLE     1
+#define MTK_BUS_HOLD   2
+/* 0 = pull-down, 1 = pull-up, 2 = bus-hold (tri-state) */
 #define MTK_PULLDOWN   0
 #define MTK_PULLUP     1
 #define MTK_PULL_PU_PD_TYPE		BIT(0)
@@ -155,6 +157,23 @@ struct mtk_pin_field_calc {
 	u8  fixed;
 };
 
+/**
+ * struct mtk_pin_field_order - pin field at a fixed per-pin stride
+ * @index:	the index pointing to the entry in the base address list
+ * @offset:	the register offset relative to the base address, for pin 0
+ * @mask:	the mask used to filter out the field from the register
+ * @bitpos:	the start bit relative to the register, for pin 0
+ *
+ * Used by SoCs whose per-pin registers are at offset + pin * reg_order_stride.
+ * A field never crosses a register boundary.
+ */
+struct mtk_pin_field_order {
+	u8  index;
+	u32 offset;
+	u32 mask;
+	u8  bitpos;
+};
+
 /**
  * struct mtk_pin_rsel - the structure that provides bias resistance selection.
  * @s_pin:		the start pin within the rsel range
@@ -236,6 +255,16 @@ struct mtk_pin_soc {
 	const struct mtk_pin_reg_calc	*reg_cal;
 	const struct mtk_pin_desc	*pins;
 	unsigned int			npins;
+
+	/* Use reg_order[] and reg_order_stride instead of reg_cal[] */
+	bool				reg_in_order;
+	const struct mtk_pin_field_order *reg_order;
+	u32				reg_order_stride;
+
+	/* EINTs configured by firmware that must not be masked at init */
+	const unsigned int		*skip_eint_list;
+	unsigned int			n_skip_eint;
+
 	const struct group_desc		*grps;
 	unsigned int			ngrps;
 	const struct pinfunction	*funcs;
@@ -284,6 +313,10 @@ struct mtk_pin_soc {
 	int (*adv_drive_get)(struct mtk_pinctrl *hw,
 			     const struct mtk_pin_desc *desc, u32 *val);
 
+	/* EINTs that can wake the system */
+	const unsigned int		*eint_event;
+	unsigned int			total_wake_eints;
+
 	/* Specific driver data */
 	void				*driver_data;
 };
@@ -302,6 +335,9 @@ struct mtk_pinctrl {
 	spinlock_t lock;
 	/* identify rsel setting by si unit or rsel define in dts node */
 	bool rsel_si_unit;
+	struct pinctrl_gpio_range	range;
+	/* Registry node, see mtk_pinctrl_register_instance in common-v2.c */
+	struct list_head		instance_node;
 };
 
 void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set);
@@ -340,6 +376,13 @@ int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc,
 			      u32 *pullup, u32 *enable);
 
+/*
+ * Used by mtk_paris_pinctrl_probe() to register controllers for
+ * mtk_pinctrl_program_bias_by_gpio().
+ */
+void mtk_pinctrl_register_instance(struct mtk_pinctrl *hw);
+void mtk_pinctrl_unregister_instance(struct mtk_pinctrl *hw);
+
 int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
 			  const struct mtk_pin_desc *desc, u32 arg);
 int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-dsd.c b/drivers/pinctrl/mediatek/pinctrl-mtk-dsd.c
new file mode 100644
index 000000000000..18927740c13c
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-dsd.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 MediaTek Inc.
+ *
+ * ACPI _DSD reader for the MediaTek GPIO vendor UUID.
+ *
+ * This is not a Device Properties UUID, so device_property_read_*() cannot
+ * read it. Evaluate _DSD and walk the package directly.
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/uuid.h>
+
+#include "pinctrl-mtk-dsd.h"
+
+static const guid_t mtk_gpio_dsd_uuid =
+	GUID_INIT(0x351b4cc0, 0x67a7, 0x4e18,
+		  0x83, 0x8c, 0x7f, 0x44, 0xd6, 0xb1, 0x69, 0xd6);
+
+struct mtk_dsd_field {
+	const char *name;
+	u32 *out;
+};
+
+/* Parse a properties package of (name, integer) pairs. */
+static bool mtk_dsd_props_from_package(const union acpi_object *props,
+				       struct mtk_dsd_field *fields,
+				       unsigned int nfields)
+{
+	unsigned int i, j;
+	bool found_chip_id = false;
+
+	if (props->type != ACPI_TYPE_PACKAGE)
+		return false;
+
+	for (i = 0; i < props->package.count; i++) {
+		const union acpi_object *entry = &props->package.elements[i];
+		const union acpi_object *key, *val;
+
+		if (entry->type != ACPI_TYPE_PACKAGE ||
+		    entry->package.count != 2)
+			continue;
+
+		key = &entry->package.elements[0];
+		val = &entry->package.elements[1];
+
+		if (key->type != ACPI_TYPE_STRING ||
+		    val->type != ACPI_TYPE_INTEGER)
+			continue;
+
+		for (j = 0; j < nfields; j++) {
+			if (strcmp(key->string.pointer, fields[j].name))
+				continue;
+
+			*fields[j].out = (u32)val->integer.value;
+			if (!strcmp(fields[j].name, "ChipId"))
+				found_chip_id = true;
+			break;
+		}
+	}
+
+	return found_chip_id;
+}
+
+/**
+ * mtk_gpio_read_dsd_info - read the MediaTek vendor _DSD
+ * @dev: the platform device
+ * @info: output, zeroed and then filled in
+ *
+ * Return: 0 on success, with @info->chip_id valid. -ENODEV if there is no
+ * ACPI companion or _DSD, -EINVAL if _DSD is malformed, -ENOENT if the
+ * vendor UUID or ChipId is missing.
+ */
+int mtk_gpio_read_dsd_info(struct device *dev, struct mtk_gpio_dsd_info *info)
+{
+	acpi_handle handle = ACPI_HANDLE(dev);
+	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *top;
+	acpi_status status;
+	unsigned int i;
+	int ret = -ENOENT;
+
+	struct mtk_dsd_field fields[] = {
+		{ "ChipId",              &info->chip_id },
+		{ "RegLength",           &info->reg_length },
+		{ "EintRegLength",       &info->eint_reg_length },
+		{ "TotalGpios",          &info->total_gpios },
+		{ "TotalEintPins",       &info->total_eint_pins },
+		{ "IoBaseAddrMaxIdx",    &info->io_base_addr_max_idx },
+		{ "EintBaseIdx",         &info->eint_base_idx },
+		{ "NumberOfPinsPerBank", &info->number_of_pins_per_bank },
+		{ "EintModuleIdx",       &info->eint_module_idx },
+		{ "BankCount",           &info->bank_count },
+	};
+
+	memset(info, 0, sizeof(*info));
+
+	if (!handle)
+		return -ENODEV;
+
+	status = acpi_evaluate_object_typed(handle, "_DSD", NULL, &buf,
+					    ACPI_TYPE_PACKAGE);
+	if (ACPI_FAILURE(status))
+		return -ENODEV;
+
+	top = buf.pointer;
+
+	if (!top || top->type != ACPI_TYPE_PACKAGE) {
+		ret = -EINVAL;
+		goto out_free;
+	}
+
+	/* _DSD returns (UUID, properties package) pairs; find ours. */
+	for (i = 0; i + 1 < top->package.count; i += 2) {
+		const union acpi_object *uuid_obj = &top->package.elements[i];
+		const union acpi_object *props_obj = &top->package.elements[i + 1];
+
+		if (uuid_obj->type != ACPI_TYPE_BUFFER ||
+		    uuid_obj->buffer.length != 16)
+			continue;
+
+		if (!guid_equal((const guid_t *)uuid_obj->buffer.pointer,
+				&mtk_gpio_dsd_uuid))
+			continue;
+
+		ret = mtk_dsd_props_from_package(props_obj, fields,
+						 ARRAY_SIZE(fields)) ?
+		      0 : -ENOENT;
+		break;
+	}
+
+out_free:
+	ACPI_FREE(buf.pointer);
+	return ret;
+}
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-dsd.h b/drivers/pinctrl/mediatek/pinctrl-mtk-dsd.h
new file mode 100644
index 000000000000..b33a4a37616b
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-dsd.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2026 MediaTek Inc.
+ *
+ * ACPI _DSD reader for the MediaTek GPIO vendor UUID.
+ *
+ * Used where one ACPI HID covers several SoCs (MT8901 and MT8971). The
+ * ChipId property selects the SoC.
+ */
+#ifndef __PINCTRL_MTK_DSD_H
+#define __PINCTRL_MTK_DSD_H
+
+#include <linux/types.h>
+
+struct device;
+
+struct mtk_gpio_dsd_info {
+	u32 chip_id;
+	u32 reg_length;
+	u32 eint_reg_length;
+	u32 total_gpios;
+	u32 total_eint_pins;
+	u32 io_base_addr_max_idx;
+	u32 eint_base_idx;
+	u32 number_of_pins_per_bank;
+	u32 eint_module_idx;
+	u32 bank_count;
+};
+
+/*
+ * Return 0 on success with info->chip_id valid; other fields are 0
+ * if firmware does not provide them. Negative errno on failure.
+ */
+int mtk_gpio_read_dsd_info(struct device *dev, struct mtk_gpio_dsd_info *info);
+
+#endif /* __PINCTRL_MTK_DSD_H */
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h
new file mode 100644
index 000000000000..cac25af38110
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h
@@ -0,0 +1,2296 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025 MediaTek Inc.
+ *
+ */
+
+#ifndef __PINCTRL_MTK_MT8901_H
+#define __PINCTRL_MTK_MT8901_H
+
+#include "pinctrl-paris.h"
+
+#define INVALID_BASE	0xFF
+
+static const struct mtk_pin_desc mtk_pins_mt8901[] = {
+	MTK_PIN(
+		0, "GPIO0",
+		MTK_EINT_FUNCTION(0, 0),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO0"),
+		MTK_FUNCTION(1, "O:ESPI_SCK")
+	),
+	MTK_PIN(
+		1, "GPIO1",
+		MTK_EINT_FUNCTION(0, 1),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO1"),
+		MTK_FUNCTION(1, "B1_ESPI_IO0")
+	),
+	MTK_PIN(
+		2, "GPIO2",
+		MTK_EINT_FUNCTION(0, 2),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO2"),
+		MTK_FUNCTION(1, "B1_ESPI_IO1")
+	),
+	MTK_PIN(
+		3, "GPIO3",
+		MTK_EINT_FUNCTION(0, 3),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO3"),
+		MTK_FUNCTION(1, "B1_ESPI_IO2")
+	),
+	MTK_PIN(
+		4, "GPIO4",
+		MTK_EINT_FUNCTION(0, 4),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO4"),
+		MTK_FUNCTION(1, "B1_ESPI_IO3")
+	),
+	MTK_PIN(
+		5, "GPIO5",
+		MTK_EINT_FUNCTION(0, 5),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO5"),
+		MTK_FUNCTION(1, "O_ESPI_CSN")
+	),
+	MTK_PIN(
+		6, "GPIO6",
+		MTK_EINT_FUNCTION(0, 6),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO6"),
+		MTK_FUNCTION(1, "O_ESPI_RESET_O"),
+		MTK_FUNCTION(2, "I1_ESPI_RESET_I")
+	),
+	MTK_PIN(
+		7, "GPIO7",
+		MTK_EINT_FUNCTION(0, 7),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO7"),
+		MTK_FUNCTION(1, "I1_ESPI_ALERT")
+	),
+	MTK_PIN(
+		8, "GPIO8",
+		MTK_EINT_FUNCTION(0, 8),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO8"),
+		MTK_FUNCTION(1, "B1_I2C_SCL3"),
+		MTK_FUNCTION(2, "B1_DISP_SCL2"),
+		MTK_FUNCTION(4, "O_PMSR_SMAP"),
+		MTK_FUNCTION(6, "O_MD32_0_TXD"),
+		MTK_FUNCTION(7, "O_MD32_1_TXD")
+	),
+	MTK_PIN(
+		9, "GPIO9",
+		MTK_EINT_FUNCTION(0, 9),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO9"),
+		MTK_FUNCTION(1, "B1_I2C_SDA3"),
+		MTK_FUNCTION(2, "B1_DISP_SDA2"),
+		MTK_FUNCTION(4, "O_PMSR_SMAP_MAX"),
+		MTK_FUNCTION(6, "I1_MD32_0_RXD"),
+		MTK_FUNCTION(7, "I1_MD32_1_RXD")
+	),
+	MTK_PIN(
+		10, "GPIO10",
+		MTK_EINT_FUNCTION(0, 10),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO10"),
+		MTK_FUNCTION(1, "B1_I2C_SCL4"),
+		MTK_FUNCTION(2, "B1_DISP_SCL2"),
+		MTK_FUNCTION(4, "O_PMSR_SMAP_MAX_W"),
+		MTK_FUNCTION(6, "O_MD32_0_GPIO0"),
+		MTK_FUNCTION(7, "O_MD32_1_GPIO0")
+	),
+	MTK_PIN(
+		11, "GPIO11",
+		MTK_EINT_FUNCTION(0, 11),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO11"),
+		MTK_FUNCTION(1, "B1_I2C_SDA4"),
+		MTK_FUNCTION(2, "B1_DISP_SDA2")
+	),
+	MTK_PIN(
+		12, "GPIO12",
+		MTK_EINT_FUNCTION(0, 12),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO12"),
+		MTK_FUNCTION(1, "B0_SPMI_M_SCL"),
+		MTK_FUNCTION(2, "B0_TP_GPIO31_AO")
+	),
+	MTK_PIN(
+		13, "GPIO13",
+		MTK_EINT_FUNCTION(0, 13),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO13"),
+		MTK_FUNCTION(1, "B0_SPMI_M_SDA"),
+		MTK_FUNCTION(2, "B0_TP_GPIO6_AO")
+	),
+	MTK_PIN(
+		14, "GPIO14",
+		MTK_EINT_FUNCTION(0, 14),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO14"),
+		MTK_FUNCTION(1, "I0_DPAUX_HPD_IN_2"),
+		MTK_FUNCTION(7, "O_DBG_MON_A0")
+	),
+	MTK_PIN(
+		15, "GPIO15",
+		MTK_EINT_FUNCTION(0, 15),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO15"),
+		MTK_FUNCTION(1, "I0_DPAUX_HPD_IN_3"),
+		MTK_FUNCTION(2, "B0_TP_GPIO25_AO"),
+		MTK_FUNCTION(7, "O_DBG_MON_A1")
+	),
+	MTK_PIN(
+		16, "GPIO16",
+		MTK_EINT_FUNCTION(0, 16),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO16"),
+		MTK_FUNCTION(1, "O_USB4_L_TCPC_RESET"),
+		MTK_FUNCTION(7, "O_DBG_MON_A18")
+	),
+	MTK_PIN(
+		17, "GPIO17",
+		MTK_EINT_FUNCTION(0, 17),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO17"),
+		MTK_FUNCTION(1, "B0_SPMI_P_SCL")
+	),
+	MTK_PIN(
+		18, "GPIO18",
+		MTK_EINT_FUNCTION(0, 18),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO18"),
+		MTK_FUNCTION(1, "B0_SPMI_P_SDA")
+	),
+	MTK_PIN(
+		19, "GPIO19",
+		MTK_EINT_FUNCTION(0, 19),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO19"),
+		MTK_FUNCTION(1, "B0_TP_GPIO29_AO")
+	),
+	MTK_PIN(
+		20, "GPIO20",
+		MTK_EINT_FUNCTION(0, 20),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO20"),
+		MTK_FUNCTION(1, "B0_TP_GPIO30_AO")
+	),
+	MTK_PIN(
+		21, "GPIO21",
+		MTK_EINT_FUNCTION(0, 21),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO21"),
+		MTK_FUNCTION(1, "B1_PROCHOT")
+	),
+	MTK_PIN(
+		22, "GPIO22",
+		MTK_EINT_FUNCTION(0, 22),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO22"),
+		MTK_FUNCTION(1, "I0_RTC32K_CK")
+	),
+	MTK_PIN(
+		23, "GPIO23",
+		MTK_EINT_FUNCTION(0, 23),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO23"),
+		MTK_FUNCTION(1, "B0_TP_GPIO0_AO")
+	),
+	MTK_PIN(
+		24, "GPIO24",
+		MTK_EINT_FUNCTION(0, 24),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO24"),
+		MTK_FUNCTION(2, "B0_TP_GPIO1_AO"),
+		MTK_FUNCTION(3, "O_CMMCLK1"),
+		MTK_FUNCTION(4, "O_SROOT_GPIO_O"),
+		MTK_FUNCTION(5, "O_MD32_10_TXD"),
+		MTK_FUNCTION(6, "O_MD32_11_TXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_A3")
+	),
+	MTK_PIN(
+		25, "GPIO25",
+		MTK_EINT_FUNCTION(0, 25),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO25"),
+		MTK_FUNCTION(1, "B0_TP_GPIO2_AO"),
+		MTK_FUNCTION(2, "I0_VBUSVALID_0P"),
+		MTK_FUNCTION(4, "I0_SROOT_GPIO_I"),
+		MTK_FUNCTION(5, "I1_MD32_10_RXD"),
+		MTK_FUNCTION(6, "I1_MD32_11_RXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_A4")
+	),
+	MTK_PIN(
+		26, "GPIO26",
+		MTK_EINT_FUNCTION(0, 26),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO26"),
+		MTK_FUNCTION(1, "B0_TP_GPIO3_AO"),
+		MTK_FUNCTION(5, "O_MD32_12_TXD"),
+		MTK_FUNCTION(6, "O_MD32_13_TXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_A5")
+	),
+	MTK_PIN(
+		27, "GPIO27",
+		MTK_EINT_FUNCTION(0, 27),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO27"),
+		MTK_FUNCTION(1, "B0_TP_GPIO4_AO"),
+		MTK_FUNCTION(5, "I1_MD32_12_RXD"),
+		MTK_FUNCTION(6, "I1_MD32_13_RXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_A6")
+	),
+	MTK_PIN(
+		28, "GPIO28",
+		MTK_EINT_FUNCTION(0, 28),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO28"),
+		MTK_FUNCTION(1, "B0_TP_GPIO5_AO"),
+		MTK_FUNCTION(5, "O_MD32_12_GPIO0"),
+		MTK_FUNCTION(6, "O_MD32_13_GPIO0"),
+		MTK_FUNCTION(7, "O_DBG_MON_A7")
+	),
+	MTK_PIN(
+		29, "GPIO29",
+		MTK_EINT_FUNCTION(0, 29),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO29"),
+		MTK_FUNCTION(1, "B1_THERMTRIP")
+	),
+	MTK_PIN(
+		30, "GPIO30",
+		MTK_EINT_FUNCTION(0, 30),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO30"),
+		MTK_FUNCTION(1, "B0_TP_GPIO7_AO"),
+		MTK_FUNCTION(2, "O_CMMCLK0"),
+		MTK_FUNCTION(4, "I0_CLUSTER0_SLV_CPUEB_JTAG_TRSTN"),
+		MTK_FUNCTION(5, "I0_CLUSTER1_SLV_CPUEB_JTAG_TRSTN"),
+		MTK_FUNCTION(6, "I0_OSROOT_GPIO_I"),
+		MTK_FUNCTION(7, "O_DBG_MON_A8")
+	),
+	MTK_PIN(
+		31, "GPIO31",
+		MTK_EINT_FUNCTION(0, 31),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO31"),
+		MTK_FUNCTION(1, "B0_TP_GPIO8_AO"),
+		MTK_FUNCTION(2, "O_CMMCLK1"),
+		MTK_FUNCTION(4, "I1_CLUSTER0_SLV_CPUEB_JTAG_TMS"),
+		MTK_FUNCTION(5, "I1_CLUSTER1_SLV_CPUEB_JTAG_TMS"),
+		MTK_FUNCTION(6, "O_OSROOT_GPIO_O"),
+		MTK_FUNCTION(7, "O_DBG_MON_A9")
+	),
+	MTK_PIN(
+		32, "GPIO32",
+		MTK_EINT_FUNCTION(0, 32),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO32"),
+		MTK_FUNCTION(1, "B0_TP_GPIO9_AO"),
+		MTK_FUNCTION(5, "O_SROOT_UTX"),
+		MTK_FUNCTION(6, "I1_TP_UCTS1_VLP"),
+		MTK_FUNCTION(7, "O_DBG_MON_A10")
+	),
+	MTK_PIN(
+		33, "GPIO33",
+		MTK_EINT_FUNCTION(0, 33),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO33"),
+		MTK_FUNCTION(1, "B0_TP_GPIO10_AO"),
+		MTK_FUNCTION(2, "O_CMMCLK2"),
+		MTK_FUNCTION(3, "I0_VBUSVALID_1P"),
+		MTK_FUNCTION(4, "I1_CLUSTER0_SLV_CPUEB_JTAG_TCK"),
+		MTK_FUNCTION(5, "I1_CLUSTER1_SLV_CPUEB_JTAG_TCK"),
+		MTK_FUNCTION(6, "I0_SROOT_TCK"),
+		MTK_FUNCTION(7, "I0_OSROOT_TCK")
+	),
+	MTK_PIN(
+		34, "GPIO34",
+		MTK_EINT_FUNCTION(0, 34),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO34"),
+		MTK_FUNCTION(1, "B0_TP_GPIO11_AO"),
+		MTK_FUNCTION(2, "O_CMMCLK4"),
+		MTK_FUNCTION(3, "I0_VBUSVALID_3P"),
+		MTK_FUNCTION(4, "I1_CLUSTER0_SLV_CPUEB_JTAG_TDI"),
+		MTK_FUNCTION(5, "I1_CLUSTER1_SLV_CPUEB_JTAG_TDI"),
+		MTK_FUNCTION(6, "I0_SROOT_TDI"),
+		MTK_FUNCTION(7, "I0_OSROOT_TDI")
+	),
+	MTK_PIN(
+		35, "GPIO35",
+		MTK_EINT_FUNCTION(0, 35),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO35"),
+		MTK_FUNCTION(1, "B0_TP_GPIO12_AO"),
+		MTK_FUNCTION(2, "O_SCP_PWM_1_VLP"),
+		MTK_FUNCTION(4, "O_CLUSTER0_SLV_CPUEB_JTAG_TDO"),
+		MTK_FUNCTION(5, "O_CLUSTER1_SLV_CPUEB_JTAG_TDO"),
+		MTK_FUNCTION(6, "O_SROOT_TDO"),
+		MTK_FUNCTION(7, "O_OSROOT_TDO")
+	),
+	MTK_PIN(
+		36, "GPIO36",
+		MTK_EINT_FUNCTION(0, 36),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO36"),
+		MTK_FUNCTION(1, "B0_TP_GPIO22_AO"),
+		MTK_FUNCTION(5, "I1_SROOT_URX"),
+		MTK_FUNCTION(6, "O_TP_URTS1_VLP"),
+		MTK_FUNCTION(7, "O_DBG_MON_A31")
+	),
+	MTK_PIN(
+		37, "GPIO37",
+		MTK_EINT_FUNCTION(0, 37),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO37"),
+		MTK_FUNCTION(1, "B0_TP_GPIO23_AO"),
+		MTK_FUNCTION(2, "O_CMMCLK3"),
+		MTK_FUNCTION(4, "O_SCP_PWM_2_VLP"),
+		MTK_FUNCTION(6, "O_MD32_5_GPIO0"),
+		MTK_FUNCTION(7, "O_DBG_MON_A11")
+	),
+	MTK_PIN(
+		38, "GPIO38",
+		MTK_EINT_FUNCTION(0, 38),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO38"),
+		MTK_FUNCTION(1, "B0_TP_GPIO24_AO"),
+		MTK_FUNCTION(2, "O_SCP_VREQ_VAO")
+	),
+	MTK_PIN(
+		39, "GPIO39",
+		MTK_EINT_FUNCTION(0, 39),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO39"),
+		MTK_FUNCTION(1, "B0_TP_GPIO13_AO"),
+		MTK_FUNCTION(2, "O_SCP_PWM_2_VLP"),
+		MTK_FUNCTION(3, "O_CMMCLK0"),
+		MTK_FUNCTION(4, "I0_VBUSVALID_2P"),
+		MTK_FUNCTION(5, "O_MD32_10_GPIO0"),
+		MTK_FUNCTION(6, "I0_SROOT_TMS"),
+		MTK_FUNCTION(7, "I0_OSROOT_TMS")
+	),
+	MTK_PIN(
+		40, "GPIO40",
+		MTK_EINT_FUNCTION(0, 40),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO40"),
+		MTK_FUNCTION(1, "B0_TP_GPIO14_AO"),
+		MTK_FUNCTION(2, "I0_VBUSVALID_1P"),
+		MTK_FUNCTION(3, "O_URTS2"),
+		MTK_FUNCTION(4, "O_TP_URTS2_VLP"),
+		MTK_FUNCTION(5, "O_SPMI_P_TRIG_FLAG"),
+		MTK_FUNCTION(6, "I1_MD32_5_RXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_A13")
+	),
+	MTK_PIN(
+		41, "GPIO41",
+		MTK_EINT_FUNCTION(0, 41),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO41"),
+		MTK_FUNCTION(1, "B0_TP_GPIO15_AO"),
+		MTK_FUNCTION(2, "I0_VBUSVALID_0P"),
+		MTK_FUNCTION(3, "I1_UCTS2"),
+		MTK_FUNCTION(4, "I1_TP_UCTS2_VLP"),
+		MTK_FUNCTION(5, "O_SPMI_S_TRIG_FLAG"),
+		MTK_FUNCTION(6, "O_MD32_5_TXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_A12")
+	),
+	MTK_PIN(
+		42, "GPIO42",
+		MTK_EINT_FUNCTION(0, 42),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO42"),
+		MTK_FUNCTION(1, "B0_TP_GPIO16_AO"),
+		MTK_FUNCTION(2, "O_CMMCLK3"),
+		MTK_FUNCTION(3, "O_UTXD2"),
+		MTK_FUNCTION(4, "O_TP_UTXD2_VLP"),
+		MTK_FUNCTION(5, "O_SPMI_M_TRIG_FLAG"),
+		MTK_FUNCTION(6, "I0_SROOT_NTRST"),
+		MTK_FUNCTION(7, "I0_OSROOT_NTRST")
+	),
+	MTK_PIN(
+		43, "GPIO43",
+		MTK_EINT_FUNCTION(0, 43),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO43"),
+		MTK_FUNCTION(1, "B0_TP_GPIO17_AO"),
+		MTK_FUNCTION(2, "O_CMMCLK4"),
+		MTK_FUNCTION(3, "I1_URXD2"),
+		MTK_FUNCTION(4, "I1_TP_URXD2_VLP"),
+		MTK_FUNCTION(5, "O_MD32_4_TXD"),
+		MTK_FUNCTION(6, "O_MD32PCM_UTXD_AO_VLP")
+	),
+	MTK_PIN(
+		44, "GPIO44",
+		MTK_EINT_FUNCTION(0, 44),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO44"),
+		MTK_FUNCTION(1, "B0_TP_GPIO18_AO"),
+		MTK_FUNCTION(2, "I1_TP_UCTS2_VLP"),
+		MTK_FUNCTION(3, "I1_UCTS2"),
+		MTK_FUNCTION(5, "I1_MD32_4_RXD"),
+		MTK_FUNCTION(6, "I1_MD32PCM_URXD_AO_VLP")
+	),
+	MTK_PIN(
+		45, "GPIO45",
+		MTK_EINT_FUNCTION(0, 45),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO45"),
+		MTK_FUNCTION(1, "B0_TP_GPIO19_AO"),
+		MTK_FUNCTION(2, "O_TP_URTS2_VLP"),
+		MTK_FUNCTION(3, "O_URTS2"),
+		MTK_FUNCTION(5, "O_MD32_4_GPIO0"),
+		MTK_FUNCTION(6, "O_MD32_11_GPIO0")
+	),
+	MTK_PIN(
+		46, "GPIO46",
+		MTK_EINT_FUNCTION(0, 46),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO46"),
+		MTK_FUNCTION(1, "B0_TP_GPIO20_AO"),
+		MTK_FUNCTION(2, "I0_VBUSVALID_2P"),
+		MTK_FUNCTION(3, "O_SCP_VREQ_VAO"),
+		MTK_FUNCTION(4, "O_SCP_PWM_1_VLP"),
+		MTK_FUNCTION(5, "O_SROOT_GPIO_O"),
+		MTK_FUNCTION(6, "O_OSROOT_GPIO_O")
+	),
+	MTK_PIN(
+		47, "GPIO47",
+		MTK_EINT_FUNCTION(0, 47),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO47"),
+		MTK_FUNCTION(1, "B0_TP_GPIO21_AO"),
+		MTK_FUNCTION(2, "I0_VBUSVALID_3P"),
+		MTK_FUNCTION(3, "O_CMMCLK2"),
+		MTK_FUNCTION(5, "I0_SROOT_GPIO_I"),
+		MTK_FUNCTION(6, "I0_OSROOT_GPIO_I"),
+		MTK_FUNCTION(7, "O_DBG_MON_A2")
+	),
+	MTK_PIN(
+		48, "GPIO48",
+		MTK_EINT_FUNCTION(0, 48),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO48"),
+		MTK_FUNCTION(1, "O_UTXD0"),
+		MTK_FUNCTION(2, "O_TP_UTXD1_VLP"),
+		MTK_FUNCTION(6, "O_ADSP_UTXD0"),
+		MTK_FUNCTION(7, "O_DBG_MON_A19")
+	),
+	MTK_PIN(
+		49, "GPIO49",
+		MTK_EINT_FUNCTION(0, 49),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO49"),
+		MTK_FUNCTION(1, "I1_URXD0"),
+		MTK_FUNCTION(2, "I1_TP_URXD1_VLP"),
+		MTK_FUNCTION(6, "I1_ADSP_URXD0"),
+		MTK_FUNCTION(7, "O_DBG_MON_A20")
+	),
+	MTK_PIN(
+		50, "GPIO50",
+		MTK_EINT_FUNCTION(0, 50),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO50"),
+		MTK_FUNCTION(1, "O_TP_UTXD2_VLP"),
+		MTK_FUNCTION(2, "O_UTXD2"),
+		MTK_FUNCTION(4, "B0_TP_GPIO26_AO"),
+		MTK_FUNCTION(5, "O_TP_UTXD1_VLP"),
+		MTK_FUNCTION(7, "O_SROOT_UTX")
+	),
+	MTK_PIN(
+		51, "GPIO51",
+		MTK_EINT_FUNCTION(0, 51),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO51"),
+		MTK_FUNCTION(1, "I1_TP_URXD2_VLP"),
+		MTK_FUNCTION(2, "I1_URXD2"),
+		MTK_FUNCTION(4, "B0_TP_GPIO27_AO"),
+		MTK_FUNCTION(5, "I1_TP_URXD1_VLP"),
+		MTK_FUNCTION(7, "I1_SROOT_URX")
+	),
+	MTK_PIN(
+		52, "GPIO52",
+		MTK_EINT_FUNCTION(0, 52),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO52"),
+		MTK_FUNCTION(1, "B1_USB4_L_PD_SCL"),
+		MTK_FUNCTION(7, "O_ADSP_UTXD0")
+	),
+	MTK_PIN(
+		53, "GPIO53",
+		MTK_EINT_FUNCTION(0, 53),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO53"),
+		MTK_FUNCTION(1, "B1_USB4_L_PD_SDA"),
+		MTK_FUNCTION(5, "O_MD32_7_TXD"),
+		MTK_FUNCTION(6, "O_MD32_6_TXD"),
+		MTK_FUNCTION(7, "I1_ADSP_URXD0")
+	),
+	MTK_PIN(
+		54, "GPIO54",
+		MTK_EINT_FUNCTION(0, 54),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO54"),
+		MTK_FUNCTION(1, "B1_USB4_R_PD_SCL"),
+		MTK_FUNCTION(4, "I1_CKM_SCL"),
+		MTK_FUNCTION(5, "I1_MD32_7_RXD"),
+		MTK_FUNCTION(6, "I1_USB4_L_PAR_SCL"),
+		MTK_FUNCTION(7, "O_PBUD_CTRL_UTXD_AO_VLP")
+	),
+	MTK_PIN(
+		55, "GPIO55",
+		MTK_EINT_FUNCTION(0, 55),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO55"),
+		MTK_FUNCTION(1, "B1_USB4_R_PD_SDA"),
+		MTK_FUNCTION(4, "B1_CKM_SDA"),
+		MTK_FUNCTION(5, "O_MD32_7_GPIO0"),
+		MTK_FUNCTION(6, "B1_USB4_L_PAR_SDA"),
+		MTK_FUNCTION(7, "I1_PBUD_CTRL_URXD_AO_VLP")
+	),
+	MTK_PIN(
+		56, "GPIO56",
+		MTK_EINT_FUNCTION(0, 56),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO56"),
+		MTK_FUNCTION(1, "B0_SPMI_S_SCL")
+	),
+	MTK_PIN(
+		57, "GPIO57",
+		MTK_EINT_FUNCTION(0, 57),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO57"),
+		MTK_FUNCTION(1, "B0_SPMI_S_SDA")
+	),
+	MTK_PIN(
+		58, "GPIO58",
+		MTK_EINT_FUNCTION(0, 58),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO58"),
+		MTK_FUNCTION(1, "O_WATCHDOG")
+	),
+	MTK_PIN(
+		59, "GPIO59",
+		MTK_EINT_FUNCTION(0, 59),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO59"),
+		MTK_FUNCTION(1, "B0_PAD_RESET_DRAM_0")
+	),
+	MTK_PIN(
+		60, "GPIO60",
+		MTK_EINT_FUNCTION(0, 60),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO60"),
+		MTK_FUNCTION(1, "B1_I2C_SCL0"),
+		MTK_FUNCTION(5, "O_MD32_2_TXD"),
+		MTK_FUNCTION(6, "O_MD32_3_TXD")
+	),
+	MTK_PIN(
+		61, "GPIO61",
+		MTK_EINT_FUNCTION(0, 61),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO61"),
+		MTK_FUNCTION(1, "B1_I2C_SDA0"),
+		MTK_FUNCTION(5, "I1_MD32_2_RXD"),
+		MTK_FUNCTION(6, "I1_MD32_3_RXD")
+	),
+	MTK_PIN(
+		62, "GPIO62",
+		MTK_EINT_FUNCTION(0, 62),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO62"),
+		MTK_FUNCTION(1, "I0_DMIC0_DAT"),
+		MTK_FUNCTION(6, "O_TP_UTXD1_VLP"),
+		MTK_FUNCTION(7, "O_DBG_MON_B0")
+	),
+	MTK_PIN(
+		63, "GPIO63",
+		MTK_EINT_FUNCTION(0, 63),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO63"),
+		MTK_FUNCTION(1, "O_DMIC0_CLK"),
+		MTK_FUNCTION(6, "I1_TP_URXD1_VLP"),
+		MTK_FUNCTION(7, "O_DBG_MON_B1")
+	),
+	MTK_PIN(
+		64, "GPIO64",
+		MTK_EINT_FUNCTION(0, 64),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO64"),
+		MTK_FUNCTION(1, "I0_DMIC1_DAT"),
+		MTK_FUNCTION(5, "O_MD32_2_GPIO0"),
+		MTK_FUNCTION(6, "O_MD32_3_GPIO0"),
+		MTK_FUNCTION(7, "O_DBG_MON_B2")
+	),
+	MTK_PIN(
+		65, "GPIO65",
+		MTK_EINT_FUNCTION(0, 65),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO65"),
+		MTK_FUNCTION(1, "O_DMIC1_CLK"),
+		MTK_FUNCTION(7, "O_DBG_MON_B3")
+	),
+	MTK_PIN(
+		66, "GPIO66",
+		MTK_EINT_FUNCTION(0, 66),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO66"),
+		MTK_FUNCTION(1, "O_SOUNDWIRE0_CK"),
+		MTK_FUNCTION(3, "I1_TP_UCTS0_VLP"),
+		MTK_FUNCTION(4, "O_SPI_HID_IRQ_S_MON0"),
+		MTK_FUNCTION(7, "O_VADSP_UTXD0")
+	),
+	MTK_PIN(
+		67, "GPIO67",
+		MTK_EINT_FUNCTION(0, 67),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO67"),
+		MTK_FUNCTION(1, "B0_SOUNDWIRE0_D0"),
+		MTK_FUNCTION(3, "O_TP_URTS0_VLP"),
+		MTK_FUNCTION(7, "I1_VADSP_URXD0")
+	),
+	MTK_PIN(
+		68, "GPIO68",
+		MTK_EINT_FUNCTION(0, 68),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO68"),
+		MTK_FUNCTION(1, "O_SCP_PWM_0_VLP"),
+		MTK_FUNCTION(2, "O_PWM_VLP"),
+		MTK_FUNCTION(3, "B0_TP_GPIO28_AO")
+	),
+	MTK_PIN(
+		69, "GPIO69",
+		MTK_EINT_FUNCTION(0, 69),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO69"),
+		MTK_FUNCTION(1, "B0_PAD_RESET_DRAM_8")
+	),
+	MTK_PIN(
+		70, "GPIO70",
+		MTK_EINT_FUNCTION(0, 70),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO70"),
+		MTK_FUNCTION(1, "B1_SCP_SCL0"),
+		MTK_FUNCTION(4, "I0_VADSP_JTAG0_TCK"),
+		MTK_FUNCTION(5, "I1_PCIE4_USB3_PAR_SCL"),
+		MTK_FUNCTION(6, "I1_SCP_JTAG0_TCK_VLP"),
+		MTK_FUNCTION(7, "B1_SROOT_SCL")
+	),
+	MTK_PIN(
+		71, "GPIO71",
+		MTK_EINT_FUNCTION(0, 71),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO71"),
+		MTK_FUNCTION(1, "B1_SCP_SDA0"),
+		MTK_FUNCTION(4, "I1_VADSP_JTAG0_TMS"),
+		MTK_FUNCTION(5, "B1_PCIE4_USB3_PAR_SDA"),
+		MTK_FUNCTION(6, "B1_SCP_JTAG0_TMS_VLP"),
+		MTK_FUNCTION(7, "B1_SROOT_SDA")
+	),
+	MTK_PIN(
+		72, "GPIO72",
+		MTK_EINT_FUNCTION(0, 72),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO72"),
+		MTK_FUNCTION(1, "B1_SCP_SCL2"),
+		MTK_FUNCTION(2, "B1_I3C_HCI_AO_SCL"),
+		MTK_FUNCTION(4, "I1_VADSP_JTAG0_TDI"),
+		MTK_FUNCTION(5, "I1_PCIE5_PAR_SCL"),
+		MTK_FUNCTION(6, "I1_SCP_JTAG0_TDI_VLP"),
+		MTK_FUNCTION(7, "O_OSROOT_UTX")
+	),
+	MTK_PIN(
+		73, "GPIO73",
+		MTK_EINT_FUNCTION(0, 73),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO73"),
+		MTK_FUNCTION(1, "B1_SCP_SDA2"),
+		MTK_FUNCTION(2, "B1_I3C_HCI_AO_SDA"),
+		MTK_FUNCTION(4, "O_VADSP_JTAG0_TDO"),
+		MTK_FUNCTION(5, "B1_PCIE5_PAR_SDA"),
+		MTK_FUNCTION(6, "O_SCP_JTAG0_TDO_VLP"),
+		MTK_FUNCTION(7, "I1_OSROOT_URX")
+	),
+	MTK_PIN(
+		74, "GPIO74",
+		MTK_EINT_FUNCTION(0, 74),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO74"),
+		MTK_FUNCTION(1, "I0_SCP_SPIS0_SCL"),
+		MTK_FUNCTION(2, "O_SPI2_CLK"),
+		MTK_FUNCTION(3, "O_SCP_SPIM0_CK"),
+		MTK_FUNCTION(4, "I1_SPM_JTAG_TCK_VLP"),
+		MTK_FUNCTION(5, "I1_SSPM_JTAG_TCK_VLP"),
+		MTK_FUNCTION(6, "I1_PBUD_CTRL_JTAG_TCK_VLP"),
+		MTK_FUNCTION(7, "I0_OSROOT_TCK")
+	),
+	MTK_PIN(
+		75, "GPIO75",
+		MTK_EINT_FUNCTION(0, 75),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO75"),
+		MTK_FUNCTION(1, "B0_SCP_SPIS0_SIO0"),
+		MTK_FUNCTION(2, "B0_SPI2_MI"),
+		MTK_FUNCTION(3, "B0_SCP_SPIM0_SIO0"),
+		MTK_FUNCTION(4, "I1_SPM_JTAG_TDI_VLP"),
+		MTK_FUNCTION(5, "I1_SSPM_JTAG_TDI_VLP"),
+		MTK_FUNCTION(6, "I1_PBUD_CTRL_JTAG_TDI_VLP"),
+		MTK_FUNCTION(7, "I0_OSROOT_TDI")
+	),
+	MTK_PIN(
+		76, "GPIO76",
+		MTK_EINT_FUNCTION(0, 76),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO76"),
+		MTK_FUNCTION(1, "B0_SCP_SPIS0_SIO1"),
+		MTK_FUNCTION(2, "B0_SPI2_MO"),
+		MTK_FUNCTION(3, "B0_SCP_SPIM0_SIO1"),
+		MTK_FUNCTION(4, "B1_SPM_JTAG_TDO_VLP"),
+		MTK_FUNCTION(5, "O_SSPM_JTAG_TDO_VLP"),
+		MTK_FUNCTION(6, "O_PBUD_CTRL_JTAG_TDO_VLP"),
+		MTK_FUNCTION(7, "O_OSROOT_TDO")
+	),
+	MTK_PIN(
+		77, "GPIO77",
+		MTK_EINT_FUNCTION(0, 77),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO77"),
+		MTK_FUNCTION(1, "B0_SCP_SPIS0_SIO2"),
+		MTK_FUNCTION(2, "B0_SPI2_WP"),
+		MTK_FUNCTION(3, "B0_SCP_SPIM0_SIO2"),
+		MTK_FUNCTION(4, "I1_SPM_JTAG_TMS_VLP"),
+		MTK_FUNCTION(5, "I1_SSPM_JTAG_TMS_VLP"),
+		MTK_FUNCTION(6, "I1_PBUD_CTRL_JTAG_TMS_VLP"),
+		MTK_FUNCTION(7, "I0_OSROOT_TMS")
+	),
+	MTK_PIN(
+		78, "GPIO78",
+		MTK_EINT_FUNCTION(0, 78),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO78"),
+		MTK_FUNCTION(1, "B0_SCP_SPIS0_SIO3"),
+		MTK_FUNCTION(2, "B0_SPI2_HOLD"),
+		MTK_FUNCTION(3, "B0_SCP_SPIM0_SIO3"),
+		MTK_FUNCTION(4, "I0_SPM_JTAG_TRSTN_VLP"),
+		MTK_FUNCTION(5, "I0_SSPM_JTAG_TRSTN_VLP"),
+		MTK_FUNCTION(6, "I0_PBUD_CTRL_JTAG_TRSTN_VLP"),
+		MTK_FUNCTION(7, "I0_OSROOT_NTRST")
+	),
+	MTK_PIN(
+		79, "GPIO79",
+		MTK_EINT_FUNCTION(0, 79),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO79"),
+		MTK_FUNCTION(1, "I1_SCP_SPIS0_CS"),
+		MTK_FUNCTION(2, "O_SPI2_CSB"),
+		MTK_FUNCTION(3, "O_SCP_SPIM0_CS"),
+		MTK_FUNCTION(4, "I1_VADSP_JTAG0_TRSTN"),
+		MTK_FUNCTION(6, "I0_SCP_JTAG0_TRSTN_VLP")
+	),
+	MTK_PIN(
+		80, "GPIO80",
+		MTK_EINT_FUNCTION(0, 80),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO80"),
+		MTK_FUNCTION(1, "O_SPI0_CLK"),
+		MTK_FUNCTION(2, "B0_SPI0_OSROOT_CLK"),
+		MTK_FUNCTION(4, "I1_SSPM_JTAG_TCK_VLP"),
+		MTK_FUNCTION(5, "I0_VADSP_JTAG0_TCK"),
+		MTK_FUNCTION(6, "I1_SPM_JTAG_TCK_VLP"),
+		MTK_FUNCTION(7, "I1_SCP_JTAG0_TCK_VLP")
+	),
+	MTK_PIN(
+		81, "GPIO81",
+		MTK_EINT_FUNCTION(0, 81),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO81"),
+		MTK_FUNCTION(1, "B0_SPI0_MI"),
+		MTK_FUNCTION(2, "I0_SPI0_OSROOT_MI"),
+		MTK_FUNCTION(4, "I1_SSPM_JTAG_TDI_VLP"),
+		MTK_FUNCTION(5, "I1_VADSP_JTAG0_TDI"),
+		MTK_FUNCTION(6, "I1_SPM_JTAG_TDI_VLP"),
+		MTK_FUNCTION(7, "I1_SCP_JTAG0_TDI_VLP")
+	),
+	MTK_PIN(
+		82, "GPIO82",
+		MTK_EINT_FUNCTION(0, 82),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO82"),
+		MTK_FUNCTION(1, "B0_SPI0_MO"),
+		MTK_FUNCTION(2, "O_SPI0_OSROOT_MO"),
+		MTK_FUNCTION(4, "O_SSPM_JTAG_TDO_VLP"),
+		MTK_FUNCTION(5, "O_VADSP_JTAG0_TDO"),
+		MTK_FUNCTION(6, "B1_SPM_JTAG_TDO_VLP"),
+		MTK_FUNCTION(7, "O_SCP_JTAG0_TDO_VLP")
+	),
+	MTK_PIN(
+		83, "GPIO83",
+		MTK_EINT_FUNCTION(0, 83),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO83"),
+		MTK_FUNCTION(1, "O_SPI0_CSB0"),
+		MTK_FUNCTION(2, "O_SPI0_OSROOT_CSB"),
+		MTK_FUNCTION(4, "I1_SSPM_JTAG_TMS_VLP"),
+		MTK_FUNCTION(5, "I1_VADSP_JTAG0_TMS"),
+		MTK_FUNCTION(6, "I1_SPM_JTAG_TMS_VLP"),
+		MTK_FUNCTION(7, "B1_SCP_JTAG0_TMS_VLP")
+	),
+	MTK_PIN(
+		84, "GPIO84",
+		MTK_EINT_FUNCTION(0, 84),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO84"),
+		MTK_FUNCTION(1, "O_SPI0_CSB1"),
+		MTK_FUNCTION(4, "I0_SSPM_JTAG_TRSTN_VLP"),
+		MTK_FUNCTION(5, "I1_VADSP_JTAG0_TRSTN"),
+		MTK_FUNCTION(6, "I0_SPM_JTAG_TRSTN_VLP"),
+		MTK_FUNCTION(7, "I0_SCP_JTAG0_TRSTN_VLP")
+	),
+	MTK_PIN(
+		85, "GPIO85",
+		MTK_EINT_FUNCTION(0, 85),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO85"),
+		MTK_FUNCTION(1, "O_DISP_PWM"),
+		MTK_FUNCTION(4, "B1_U4CP_JTAG_TMS"),
+		MTK_FUNCTION(5, "I0_CLUSTER0_UDI_TDI_1"),
+		MTK_FUNCTION(6, "I0_CLUSTER1_UDI_TDI_1"),
+		MTK_FUNCTION(7, "O_DBG_MON_A21")
+	),
+	MTK_PIN(
+		86, "GPIO86",
+		MTK_EINT_FUNCTION(0, 86),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO86"),
+		MTK_FUNCTION(1, "O_DISP_BL_EN"),
+		MTK_FUNCTION(4, "I1_U4CP_JTAG_TDI"),
+		MTK_FUNCTION(5, "O_CLUSTER0_UDI_TDO_1"),
+		MTK_FUNCTION(6, "O_CLUSTER1_UDI_TDO_1"),
+		MTK_FUNCTION(7, "O_DBG_MON_A22")
+	),
+	MTK_PIN(
+		87, "GPIO87",
+		MTK_EINT_FUNCTION(0, 87),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO87"),
+		MTK_FUNCTION(1, "B0_DISP_GPIO_N_1"),
+		MTK_FUNCTION(4, "O_U4CP_JTAG_TDO"),
+		MTK_FUNCTION(5, "I0_CLUSTER0_UDI_TDI_2"),
+		MTK_FUNCTION(6, "I0_CLUSTER1_UDI_TDI_2"),
+		MTK_FUNCTION(7, "O_DBG_MON_A23")
+	),
+	MTK_PIN(
+		88, "GPIO88",
+		MTK_EINT_FUNCTION(0, 88),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO88"),
+		MTK_FUNCTION(1, "B1_DISP_SCL1"),
+		MTK_FUNCTION(4, "I1_U4CP_JTAG_TCK"),
+		MTK_FUNCTION(5, "I1_EDP0_SCL"),
+		MTK_FUNCTION(6, "I1_HDMITX_DBG_I2C_SCL")
+	),
+	MTK_PIN(
+		89, "GPIO89",
+		MTK_EINT_FUNCTION(0, 89),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO89"),
+		MTK_FUNCTION(1, "B1_DISP_SDA1"),
+		MTK_FUNCTION(4, "I0_U4CP_JTAG_TRSTN"),
+		MTK_FUNCTION(5, "B1_EDP0_SDA"),
+		MTK_FUNCTION(6, "B1_HDMITX_DBG_I2C_SDA")
+	),
+	MTK_PIN(
+		90, "GPIO90",
+		MTK_EINT_FUNCTION(0, 90),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO90"),
+		MTK_FUNCTION(1, "B0_DISP_GPIO_N2"),
+		MTK_FUNCTION(4, "O_CLKM0_C"),
+		MTK_FUNCTION(5, "O_CLUSTER0_UDI_TDO_2"),
+		MTK_FUNCTION(6, "O_CLUSTER1_UDI_TDO_2"),
+		MTK_FUNCTION(7, "O_DBG_MON_A24")
+	),
+	MTK_PIN(
+		91, "GPIO91",
+		MTK_EINT_FUNCTION(0, 91),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO91"),
+		MTK_FUNCTION(1, "I0_DPAUX_HPD_IN_4"),
+		MTK_FUNCTION(4, "O_CLKM1_C"),
+		MTK_FUNCTION(5, "I0_CLUSTER0_UDI_TDI_3"),
+		MTK_FUNCTION(6, "I0_CLUSTER1_UDI_TDI_3"),
+		MTK_FUNCTION(7, "O_DBG_MON_A25")
+	),
+	MTK_PIN(
+		92, "GPIO92",
+		MTK_EINT_FUNCTION(0, 92),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO92"),
+		MTK_FUNCTION(1, "B1_I2C_SCL5"),
+		MTK_FUNCTION(2, "O_TP_UTXD0_VLP"),
+		MTK_FUNCTION(3, "O_SSPM_UTXD_AO_VLP"),
+		MTK_FUNCTION(4, "O_TSFDC_FOUT"),
+		MTK_FUNCTION(5, "O_CLUSTER0_UDI_TDO_3"),
+		MTK_FUNCTION(6, "O_CLUSTER1_UDI_TDO_3"),
+		MTK_FUNCTION(7, "O_DBG_MON_A26")
+	),
+	MTK_PIN(
+		93, "GPIO93",
+		MTK_EINT_FUNCTION(0, 93),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO93"),
+		MTK_FUNCTION(1, "B1_I2C_SDA5"),
+		MTK_FUNCTION(2, "I1_TP_URXD0_VLP"),
+		MTK_FUNCTION(3, "I1_SSPM_URXD_AO_VLP"),
+		MTK_FUNCTION(4, "O_TSFDC_SDO"),
+		MTK_FUNCTION(5, "I0_CLUSTER0_UDI_TDI_4"),
+		MTK_FUNCTION(6, "I0_CLUSTER1_UDI_TDI_4"),
+		MTK_FUNCTION(7, "O_DBG_MON_A27")
+	),
+	MTK_PIN(
+		94, "GPIO94",
+		MTK_EINT_FUNCTION(0, 94),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO94"),
+		MTK_FUNCTION(1, "O_CMFLASH0"),
+		MTK_FUNCTION(4, "I0_TSFDC_26M"),
+		MTK_FUNCTION(5, "O_CLUSTER0_UDI_TDO_4"),
+		MTK_FUNCTION(6, "O_CLUSTER1_UDI_TDO_4"),
+		MTK_FUNCTION(7, "O_DBG_MON_A28")
+	),
+	MTK_PIN(
+		95, "GPIO95",
+		MTK_EINT_FUNCTION(0, 95),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO95"),
+		MTK_FUNCTION(1, "O_CMFLASH1"),
+		MTK_FUNCTION(4, "I0_TSFDC_SCF"),
+		MTK_FUNCTION(5, "I0_CLUSTER0_UDI_TDI_5"),
+		MTK_FUNCTION(6, "I0_CLUSTER1_UDI_TDI_5"),
+		MTK_FUNCTION(7, "O_DBG_MON_A29")
+	),
+	MTK_PIN(
+		96, "GPIO96",
+		MTK_EINT_FUNCTION(0, 96),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO96"),
+		MTK_FUNCTION(1, "O_CMVREF0"),
+		MTK_FUNCTION(2, "O_CMFLASH1"),
+		MTK_FUNCTION(4, "I0_TSFDC_SCK"),
+		MTK_FUNCTION(5, "O_CLUSTER0_UDI_TDO_5"),
+		MTK_FUNCTION(6, "O_CLUSTER1_UDI_TDO_5"),
+		MTK_FUNCTION(7, "O_DBG_MON_A30")
+	),
+	MTK_PIN(
+		97, "GPIO97",
+		MTK_EINT_FUNCTION(0, 97),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO97"),
+		MTK_FUNCTION(1, "O_CMVREF1"),
+		MTK_FUNCTION(2, "O_CMFLASH0"),
+		MTK_FUNCTION(4, "I0_TSFDC_SDI"),
+		MTK_FUNCTION(5, "I0_CLUSTER0_UDI_TDI_6"),
+		MTK_FUNCTION(6, "I0_CLUSTER1_UDI_TDI_6"),
+		MTK_FUNCTION(7, "O_U4CP_UTXD")
+	),
+	MTK_PIN(
+		98, "GPIO98",
+		MTK_EINT_FUNCTION(0, 98),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO98"),
+		MTK_FUNCTION(2, "O_CMFLASH2"),
+		MTK_FUNCTION(4, "I0_RG_TSFDC_LDO_EN"),
+		MTK_FUNCTION(5, "O_CLUSTER0_UDI_TDO_6"),
+		MTK_FUNCTION(6, "O_CLUSTER1_UDI_TDO_6"),
+		MTK_FUNCTION(7, "I1_U4CP_URXD")
+	),
+	MTK_PIN(
+		99, "GPIO99",
+		MTK_EINT_FUNCTION(0, 99),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO99"),
+		MTK_FUNCTION(1, "I0_MCU_M_PMIC_POC_I"),
+		MTK_FUNCTION(4, "I0_DA_TSFDC_LDO_MODE"),
+		MTK_FUNCTION(5, "I0_CLUSTER0_UDI_TDI_7"),
+		MTK_FUNCTION(6, "I0_CLUSTER1_UDI_TDI_7"),
+		MTK_FUNCTION(7, "O_U4CP_URTS")
+	),
+	MTK_PIN(
+		100, "GPIO100",
+		MTK_EINT_FUNCTION(0, 100),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO100"),
+		MTK_FUNCTION(1, "I0_MCU_B_PMIC_POC_I"),
+		MTK_FUNCTION(4, "I0_RG_TSFDC_LDO_REFSEL1"),
+		MTK_FUNCTION(5, "O_CLUSTER0_UDI_TDO_7"),
+		MTK_FUNCTION(6, "O_CLUSTER1_UDI_TDO_7"),
+		MTK_FUNCTION(7, "I1_U4CP_UCTS")
+	),
+	MTK_PIN(
+		101, "GPIO101",
+		MTK_EINT_FUNCTION(0, 101),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO101"),
+		MTK_FUNCTION(1, "O_CMFLASH2"),
+		MTK_FUNCTION(2, "O_CMVREF1"),
+		MTK_FUNCTION(3, "I1_UCTS0"),
+		MTK_FUNCTION(4, "I0_RG_TSFDC_LDO_REFSEL0"),
+		MTK_FUNCTION(5, "I1_U4CP_JTAG_TCK"),
+		MTK_FUNCTION(6, "I1_PBUD_CTRL_JTAG_TCK_VCORE"),
+		MTK_FUNCTION(7, "O_CLKM0_A")
+	),
+	MTK_PIN(
+		102, "GPIO102",
+		MTK_EINT_FUNCTION(0, 102),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO102"),
+		MTK_FUNCTION(1, "O_CMFLASH3"),
+		MTK_FUNCTION(2, "O_CMVREF0"),
+		MTK_FUNCTION(3, "O_URTS0"),
+		MTK_FUNCTION(4, "O_TSFDC_BG_COMP"),
+		MTK_FUNCTION(5, "B1_U4CP_JTAG_TMS"),
+		MTK_FUNCTION(6, "I1_PBUD_CTRL_JTAG_TMS_VCORE"),
+		MTK_FUNCTION(7, "O_CLKM1_A")
+	),
+	MTK_PIN(
+		103, "GPIO103",
+		MTK_EINT_FUNCTION(0, 103),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO103"),
+		MTK_FUNCTION(1, "O_CMVREF2"),
+		MTK_FUNCTION(2, "O_UTXD0"),
+		MTK_FUNCTION(4, "O_CLKM2_B"),
+		MTK_FUNCTION(5, "I1_U4CP_JTAG_TDI"),
+		MTK_FUNCTION(6, "I1_PBUD_CTRL_JTAG_TDI_VCORE"),
+		MTK_FUNCTION(7, "O_CLKM2_A")
+	),
+	MTK_PIN(
+		104, "GPIO104",
+		MTK_EINT_FUNCTION(0, 104),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO104"),
+		MTK_FUNCTION(1, "O_CMVREF3"),
+		MTK_FUNCTION(2, "I1_URXD0"),
+		MTK_FUNCTION(4, "O_CLKM3_B"),
+		MTK_FUNCTION(5, "O_U4CP_JTAG_TDO"),
+		MTK_FUNCTION(6, "O_PBUD_CTRL_JTAG_TDO_VCORE"),
+		MTK_FUNCTION(7, "O_CLKM3_A")
+	),
+	MTK_PIN(
+		105, "GPIO105",
+		MTK_EINT_FUNCTION(0, 105),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO105"),
+		MTK_FUNCTION(2, "O_CMFLASH3"),
+		MTK_FUNCTION(4, "O_CLKM0_B"),
+		MTK_FUNCTION(5, "I0_U4CP_JTAG_TRSTN"),
+		MTK_FUNCTION(6, "I0_PBUD_CTRL_JTAG_TRSTN_VCORE"),
+		MTK_FUNCTION(7, "O_PMSR_SMAP")
+	),
+	MTK_PIN(
+		106, "GPIO106",
+		MTK_EINT_FUNCTION(0, 106),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO106"),
+		MTK_FUNCTION(1, "B0_SPINOR_CK")
+	),
+	MTK_PIN(
+		107, "GPIO107",
+		MTK_EINT_FUNCTION(0, 107),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO107"),
+		MTK_FUNCTION(1, "B0_SPINOR_IO0")
+	),
+	MTK_PIN(
+		108, "GPIO108",
+		MTK_EINT_FUNCTION(0, 108),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO108"),
+		MTK_FUNCTION(1, "B0_SPINOR_IO1")
+	),
+	MTK_PIN(
+		109, "GPIO109",
+		MTK_EINT_FUNCTION(0, 109),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO109"),
+		MTK_FUNCTION(1, "B0_SPINOR_IO2")
+	),
+	MTK_PIN(
+		110, "GPIO110",
+		MTK_EINT_FUNCTION(0, 110),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO110"),
+		MTK_FUNCTION(1, "B0_SPINOR_IO3")
+	),
+	MTK_PIN(
+		111, "GPIO111",
+		MTK_EINT_FUNCTION(0, 111),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO111"),
+		MTK_FUNCTION(1, "B1_SPINOR_CS")
+	),
+	MTK_PIN(
+		112, "GPIO112",
+		MTK_EINT_FUNCTION(0, 112),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO112"),
+		MTK_FUNCTION(1, "O_SPI1_CLK"),
+		MTK_FUNCTION(5, "I1_HFRP_JTAG1_TCK")
+	),
+	MTK_PIN(
+		113, "GPIO113",
+		MTK_EINT_FUNCTION(0, 113),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO113"),
+		MTK_FUNCTION(1, "B0_SPI1_MI"),
+		MTK_FUNCTION(5, "I1_HFRP_JTAG1_TMS")
+	),
+	MTK_PIN(
+		114, "GPIO114",
+		MTK_EINT_FUNCTION(0, 114),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO114"),
+		MTK_FUNCTION(1, "B0_SPI1_MO"),
+		MTK_FUNCTION(5, "I1_HFRP_JTAG1_TDI")
+	),
+	MTK_PIN(
+		115, "GPIO115",
+		MTK_EINT_FUNCTION(0, 115),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO115"),
+		MTK_FUNCTION(1, "O_SPI1_CSB0"),
+		MTK_FUNCTION(5, "O_HFRP_JTAG1_TDO")
+	),
+	MTK_PIN(
+		116, "GPIO116",
+		MTK_EINT_FUNCTION(0, 116),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO116"),
+		MTK_FUNCTION(1, "O_SPI1_CSB1"),
+		MTK_FUNCTION(5, "I0_HFRP_JTAG1_TRSTN")
+	),
+	MTK_PIN(
+		117, "GPIO117",
+		MTK_EINT_FUNCTION(0, 117),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO117"),
+		MTK_FUNCTION(1, "B1_I2C_SCL1"),
+		MTK_FUNCTION(2, "B1_OSROOT_SCL"),
+		MTK_FUNCTION(4, "O_SPI_CS_S_MON0"),
+		MTK_FUNCTION(5, "I1_USB4_L_PAR_SCL"),
+		MTK_FUNCTION(6, "I1_CKM_SCL"),
+		MTK_FUNCTION(7, "I1_USB4_R_PAR_SCL")
+	),
+	MTK_PIN(
+		118, "GPIO118",
+		MTK_EINT_FUNCTION(0, 118),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO118"),
+		MTK_FUNCTION(1, "B1_I2C_SDA1"),
+		MTK_FUNCTION(2, "B1_OSROOT_SDA"),
+		MTK_FUNCTION(4, "O_SPI_SCL_S_MON0"),
+		MTK_FUNCTION(5, "B1_USB4_L_PAR_SDA"),
+		MTK_FUNCTION(6, "B1_CKM_SDA"),
+		MTK_FUNCTION(7, "B1_USB4_R_PAR_SDA")
+	),
+	MTK_PIN(
+		119, "GPIO119",
+		MTK_EINT_FUNCTION(0, 119),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO119"),
+		MTK_FUNCTION(1, "B1_I2C_SCL2"),
+		MTK_FUNCTION(4, "I1_HDMITX_DBG_I2C_SCL"),
+		MTK_FUNCTION(5, "O_CLUSTER0_MBISTREADEN_TRIGGER"),
+		MTK_FUNCTION(6, "O_CLUSTER1_MBISTREADEN_TRIGGER"),
+		MTK_FUNCTION(7, "O_PMSR_SMAP_MAX")
+	),
+	MTK_PIN(
+		120, "GPIO120",
+		MTK_EINT_FUNCTION(0, 120),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO120"),
+		MTK_FUNCTION(1, "B1_I2C_SDA2+J130_S133"),
+		MTK_FUNCTION(4, "B1_HDMITX_DBG_I2C_SDA"),
+		MTK_FUNCTION(5, "O_CLUSTER0_MBISTWRITEEN_TRIGGER"),
+		MTK_FUNCTION(6, "O_CLUSTER1_MBISTWRITEEN_TRIGGER"),
+		MTK_FUNCTION(7, "O_PMSR_SMAP_MAX_W")
+	),
+	MTK_PIN(
+		121, "GPIO121",
+		MTK_EINT_FUNCTION(0, 121),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO121"),
+		MTK_FUNCTION(1, "B1_I3C_SCL0"),
+		MTK_FUNCTION(2, "B1_I3C_HCI_0_AO_SCL"),
+		MTK_FUNCTION(4, "I1_PCIE5_PAR_SCL"),
+		MTK_FUNCTION(5, "O_CLUSTER0_AD_ILDO_DTEST0"),
+		MTK_FUNCTION(6, "O_CLUSTER1_AD_ILDO_DTEST0"),
+		MTK_FUNCTION(7, "I1_USB4_R_PAR_SCL")
+	),
+	MTK_PIN(
+		122, "GPIO122",
+		MTK_EINT_FUNCTION(0, 122),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO122"),
+		MTK_FUNCTION(1, "B1_I3C_SDA0"),
+		MTK_FUNCTION(2, "B1_I3C_HCI_0_AO_SDA"),
+		MTK_FUNCTION(4, "B1_PCIE5_PAR_SDA"),
+		MTK_FUNCTION(5, "O_CLUSTER0_AD_ILDO_DTEST1"),
+		MTK_FUNCTION(6, "O_CLUSTER1_AD_ILDO_DTEST1"),
+		MTK_FUNCTION(7, "B1_USB4_R_PAR_SDA")
+	),
+	MTK_PIN(
+		123, "GPIO123",
+		MTK_EINT_FUNCTION(0, 123),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO123"),
+		MTK_FUNCTION(1, "B1_I3C_SCL1"),
+		MTK_FUNCTION(2, "B1_I3C_HCI_1_AO_SCL"),
+		MTK_FUNCTION(4, "I1_PCIE4_USB3_PAR_SCL"),
+		MTK_FUNCTION(5, "O_CLUSTER0_AD_ILDO_DTEST2"),
+		MTK_FUNCTION(6, "O_CLUSTER1_AD_ILDO_DTEST2"),
+		MTK_FUNCTION(7, "O_VADSP_UTXD0")
+	),
+	MTK_PIN(
+		124, "GPIO124",
+		MTK_EINT_FUNCTION(0, 124),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO124"),
+		MTK_FUNCTION(1, "B1_I3C_SDA1"),
+		MTK_FUNCTION(2, "B1_I3C_HCI_1_AO_SDA"),
+		MTK_FUNCTION(4, "B1_PCIE4_USB3_PAR_SDA"),
+		MTK_FUNCTION(5, "O_CLUSTER0_AD_ILDO_DTEST3"),
+		MTK_FUNCTION(6, "O_CLUSTER1_AD_ILDO_DTEST3"),
+		MTK_FUNCTION(7, "I1_VADSP_URXD0")
+	),
+	MTK_PIN(
+		125, "GPIO125",
+		MTK_EINT_FUNCTION(0, 125),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO125"),
+		MTK_FUNCTION(1, "O_I2SIN_1_MCK"),
+		MTK_FUNCTION(4, "I0_TSFDC_SCK"),
+		MTK_FUNCTION(6, "O_CLKM2_C")
+	),
+	MTK_PIN(
+		126, "GPIO126",
+		MTK_EINT_FUNCTION(0, 126),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO126"),
+		MTK_FUNCTION(1, "O_SOUNDWIRE1_CK"),
+		MTK_FUNCTION(2, "O_I2SIN_1_BCK"),
+		MTK_FUNCTION(4, "O_CLUSTER0_AD_ILDO_DTEST4"),
+		MTK_FUNCTION(5, "O_CLUSTER1_AD_ILDO_DTEST4"),
+		MTK_FUNCTION(6, "I0_ADSP_JTAG0_TCK"),
+		MTK_FUNCTION(7, "I1_HFRP_JTAG0_TCK")
+	),
+	MTK_PIN(
+		127, "GPIO127",
+		MTK_EINT_FUNCTION(0, 127),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO127"),
+		MTK_FUNCTION(1, "B0_SOUNDWIRE1_D0"),
+		MTK_FUNCTION(2, "O_I2SOUT1_DO"),
+		MTK_FUNCTION(4, "O_CLUSTER0_AD_ILDO_DTEST5"),
+		MTK_FUNCTION(5, "O_CLUSTER1_AD_ILDO_DTEST5"),
+		MTK_FUNCTION(6, "I1_ADSP_JTAG0_TMS"),
+		MTK_FUNCTION(7, "B1_HFRP_JTAG0_TMS")
+	),
+	MTK_PIN(
+		128, "GPIO128",
+		MTK_EINT_FUNCTION(0, 128),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO128"),
+		MTK_FUNCTION(1, "B0_SOUNDWIRE1_D1"),
+		MTK_FUNCTION(2, "I0_I2SIN_1_DI"),
+		MTK_FUNCTION(4, "O_CLUSTER0_AD_ILDO_DTEST6"),
+		MTK_FUNCTION(5, "O_CLUSTER1_AD_ILDO_DTEST6"),
+		MTK_FUNCTION(6, "I1_ADSP_JTAG0_TDI"),
+		MTK_FUNCTION(7, "I1_HFRP_JTAG0_TDI")
+	),
+	MTK_PIN(
+		129, "GPIO129",
+		MTK_EINT_FUNCTION(0, 129),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO129"),
+		MTK_FUNCTION(1, "B0_SOUNDWIRE1_D2"),
+		MTK_FUNCTION(2, "O_I2SIN_1_LRCK"),
+		MTK_FUNCTION(4, "O_CLUSTER0_AD_ILDO_DTEST7"),
+		MTK_FUNCTION(5, "O_CLUSTER1_AD_ILDO_DTEST7"),
+		MTK_FUNCTION(6, "O_ADSP_JTAG0_TDO"),
+		MTK_FUNCTION(7, "O_HFRP_JTAG0_TDO")
+	),
+	MTK_PIN(
+		130, "GPIO130",
+		MTK_EINT_FUNCTION(0, 130),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO130"),
+		MTK_FUNCTION(1, "B0_I2SIN0_BCK"),
+		MTK_FUNCTION(3, "O_DISP_CLKM0"),
+		MTK_FUNCTION(4, "I0_TSFDC_26M"),
+		MTK_FUNCTION(5, "I0_RG_TSFDC_LDO_EN"),
+		MTK_FUNCTION(6, "O_CCU0_URTS"),
+		MTK_FUNCTION(7, "O_DBG_MON_B4")
+	),
+	MTK_PIN(
+		131, "GPIO131",
+		MTK_EINT_FUNCTION(0, 131),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO131"),
+		MTK_FUNCTION(1, "I0_I2SIN0_DI"),
+		MTK_FUNCTION(3, "O_DISP_CLKM1"),
+		MTK_FUNCTION(4, "O_TSFDC_FOUT"),
+		MTK_FUNCTION(5, "I0_DA_TSFDC_LDO_MODE"),
+		MTK_FUNCTION(6, "I1_CCU0_UCTS"),
+		MTK_FUNCTION(7, "O_DBG_MON_B5")
+	),
+	MTK_PIN(
+		132, "GPIO132",
+		MTK_EINT_FUNCTION(0, 132),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO132"),
+		MTK_FUNCTION(1, "O_I2SOUT0_DO"),
+		MTK_FUNCTION(3, "O_DISP_CLKM2"),
+		MTK_FUNCTION(4, "O_TSFDC_SDO"),
+		MTK_FUNCTION(5, "I0_RG_TSFDC_LDO_REFSEL1"),
+		MTK_FUNCTION(6, "O_CCU1_URTS"),
+		MTK_FUNCTION(7, "O_DBG_MON_B6")
+	),
+	MTK_PIN(
+		133, "GPIO133",
+		MTK_EINT_FUNCTION(0, 133),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO133"),
+		MTK_FUNCTION(1, "B0_I2SIN0_LRCK"),
+		MTK_FUNCTION(3, "O_DISP_CLKM3"),
+		MTK_FUNCTION(4, "I0_TSFDC_SCF"),
+		MTK_FUNCTION(5, "I0_RG_TSFDC_LDO_REFSEL0"),
+		MTK_FUNCTION(6, "I1_CCU1_UCTS"),
+		MTK_FUNCTION(7, "O_DBG_MON_B7")
+	),
+	MTK_PIN(
+		134, "GPIO134",
+		MTK_EINT_FUNCTION(0, 134),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO134"),
+		MTK_FUNCTION(1, "B1_SCP_SCL1"),
+		MTK_FUNCTION(2, "B1_VADSP_SCL0"),
+		MTK_FUNCTION(3, "B1_SROOT_SCL"),
+		MTK_FUNCTION(4, "O_SSPM_UTXD_AO_VLP"),
+		MTK_FUNCTION(5, "O_SPI_HID_IRQ_S_MON0"),
+		MTK_FUNCTION(6, "I1_ADSP_JTAG0_TRSTN"),
+		MTK_FUNCTION(7, "O_DBG_MON_B8")
+	),
+	MTK_PIN(
+		135, "GPIO135",
+		MTK_EINT_FUNCTION(0, 135),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO135"),
+		MTK_FUNCTION(1, "B1_SCP_SDA1"),
+		MTK_FUNCTION(2, "B1_VADSP_SDA0"),
+		MTK_FUNCTION(3, "B1_SROOT_SDA"),
+		MTK_FUNCTION(4, "I1_SSPM_URXD_AO_VLP"),
+		MTK_FUNCTION(7, "O_DBG_MON_B9")
+	),
+	MTK_PIN(
+		136, "GPIO136",
+		MTK_EINT_FUNCTION(0, 136),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO136"),
+		MTK_FUNCTION(1, "O_CMVREF2"),
+		MTK_FUNCTION(2, "B1_SCP_SCL3"),
+		MTK_FUNCTION(3, "B1_VADSP_SCL0"),
+		MTK_FUNCTION(4, "B1_SCP_SCL1"),
+		MTK_FUNCTION(5, "I1_MD32_8_RXD"),
+		MTK_FUNCTION(6, "I1_MD32_9_RXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_B10")
+	),
+	MTK_PIN(
+		137, "GPIO137",
+		MTK_EINT_FUNCTION(0, 137),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO137"),
+		MTK_FUNCTION(1, "O_CMVREF3"),
+		MTK_FUNCTION(2, "B1_SCP_SDA3"),
+		MTK_FUNCTION(3, "B1_VADSP_SDA0"),
+		MTK_FUNCTION(4, "B1_SCP_SDA1"),
+		MTK_FUNCTION(5, "O_MD32_8_GPIO0"),
+		MTK_FUNCTION(6, "O_MD32_9_GPIO0"),
+		MTK_FUNCTION(7, "O_DBG_MON_B11")
+	),
+	MTK_PIN(
+		138, "GPIO138",
+		MTK_EINT_FUNCTION(0, 138),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO138"),
+		MTK_FUNCTION(1, "B0_DISP_GPIO_N3"),
+		MTK_FUNCTION(2, "I0_DISP_LSPII"),
+		MTK_FUNCTION(4, "O_CLKM1_B"),
+		MTK_FUNCTION(5, "O_MD32_8_TXD"),
+		MTK_FUNCTION(6, "O_MD32_9_TXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_B12")
+	),
+	MTK_PIN(
+		139, "GPIO139",
+		MTK_EINT_FUNCTION(0, 139),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO139"),
+		MTK_FUNCTION(1, "B0_DISP_GPIO_N4"),
+		MTK_FUNCTION(2, "O_DISP_HSYNC0"),
+		MTK_FUNCTION(3, "O_DISP_HSYNC1"),
+		MTK_FUNCTION(4, "O_CLKM0_A"),
+		MTK_FUNCTION(5, "O_CLKM0_B"),
+		MTK_FUNCTION(6, "O_CLKM0_C"),
+		MTK_FUNCTION(7, "O_DBG_MON_B13")
+	),
+	MTK_PIN(
+		140, "GPIO140",
+		MTK_EINT_FUNCTION(0, 140),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO140"),
+		MTK_FUNCTION(1, "B0_DISP_GPIO_N5"),
+		MTK_FUNCTION(2, "O_DISP_VSYNC0"),
+		MTK_FUNCTION(3, "O_DISP_VSYNC1"),
+		MTK_FUNCTION(4, "O_CLKM1_A"),
+		MTK_FUNCTION(5, "O_CLKM1_B"),
+		MTK_FUNCTION(6, "O_CLKM1_C"),
+		MTK_FUNCTION(7, "O_DBG_MON_A14")
+	),
+	MTK_PIN(
+		141, "GPIO141",
+		MTK_EINT_FUNCTION(0, 141),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO141"),
+		MTK_FUNCTION(1, "B0_DISP_GPIO_N6"),
+		MTK_FUNCTION(2, "O_DISP_HSYNC2"),
+		MTK_FUNCTION(3, "O_DISP_HSYNC3"),
+		MTK_FUNCTION(4, "O_CLKM2_A"),
+		MTK_FUNCTION(5, "O_CLKM2_B"),
+		MTK_FUNCTION(6, "O_CLKM2_C"),
+		MTK_FUNCTION(7, "O_DBG_MON_A15")
+	),
+	MTK_PIN(
+		142, "GPIO142",
+		MTK_EINT_FUNCTION(0, 142),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO142"),
+		MTK_FUNCTION(1, "B0_DISP_GPIO_N7"),
+		MTK_FUNCTION(2, "O_DISP_VSYNC2"),
+		MTK_FUNCTION(3, "O_DISP_VSYNC3"),
+		MTK_FUNCTION(4, "O_CLKM3_A"),
+		MTK_FUNCTION(5, "O_CLKM3_B"),
+		MTK_FUNCTION(6, "O_CLKM3_C"),
+		MTK_FUNCTION(7, "O_DBG_MON_A16")
+	),
+	MTK_PIN(
+		143, "GPIO143",
+		MTK_EINT_FUNCTION(0, 143),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO143"),
+		MTK_FUNCTION(1, "I0_MCU_M_PMIC_POC_I"),
+		MTK_FUNCTION(2, "I0_JTCK_SEL1"),
+		MTK_FUNCTION(3, "O_JTAGAP_JTCK"),
+		MTK_FUNCTION(4, "I0_ADSP_JTAG1_TCK"),
+		MTK_FUNCTION(5, "I0_ADSP_JTAG0_TCK"),
+		MTK_FUNCTION(6, "I0_CLUSTER0_UDI_TCK"),
+		MTK_FUNCTION(7, "I0_CLUSTER1_UDI_TCK")
+	),
+	MTK_PIN(
+		144, "GPIO144",
+		MTK_EINT_FUNCTION(0, 144),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO144"),
+		MTK_FUNCTION(1, "I0_MCU_B_PMIC_POC_I"),
+		MTK_FUNCTION(2, "B1_JTMS_SEL1"),
+		MTK_FUNCTION(3, "O_JTAGAP_JTMS"),
+		MTK_FUNCTION(4, "I1_ADSP_JTAG1_TMS"),
+		MTK_FUNCTION(5, "I1_ADSP_JTAG0_TMS"),
+		MTK_FUNCTION(6, "I0_CLUSTER0_UDI_TMS"),
+		MTK_FUNCTION(7, "I0_CLUSTER1_UDI_TMS")
+	),
+	MTK_PIN(
+		145, "GPIO145",
+		MTK_EINT_FUNCTION(0, 145),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO145"),
+		MTK_FUNCTION(1, "I1_UCTS0"),
+		MTK_FUNCTION(2, "I1_JTDI_SEL1"),
+		MTK_FUNCTION(3, "O_JTAGAP_JTDI"),
+		MTK_FUNCTION(4, "I1_ADSP_JTAG1_TDI"),
+		MTK_FUNCTION(5, "I1_ADSP_JTAG0_TDI"),
+		MTK_FUNCTION(6, "I0_CLUSTER0_UDI_TDI_0"),
+		MTK_FUNCTION(7, "I0_CLUSTER1_UDI_TDI_0")
+	),
+	MTK_PIN(
+		146, "GPIO146",
+		MTK_EINT_FUNCTION(0, 146),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO146"),
+		MTK_FUNCTION(1, "O_URTS0"),
+		MTK_FUNCTION(2, "O_JTDO_SEL1"),
+		MTK_FUNCTION(3, "I0_JTAGAP_JTDO"),
+		MTK_FUNCTION(4, "O_ADSP_JTAG1_TDO"),
+		MTK_FUNCTION(5, "O_ADSP_JTAG0_TDO"),
+		MTK_FUNCTION(6, "O_CLUSTER0_UDI_TDO_0"),
+		MTK_FUNCTION(7, "O_CLUSTER1_UDI_TDO_0")
+	),
+	MTK_PIN(
+		147, "GPIO147",
+		MTK_EINT_FUNCTION(0, 147),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO147"),
+		MTK_FUNCTION(2, "I1_JTRSTn_SEL1"),
+		MTK_FUNCTION(3, "O_JTAGAP_JTRSTn"),
+		MTK_FUNCTION(4, "I1_ADSP_JTAG1_TRSTN"),
+		MTK_FUNCTION(5, "I1_ADSP_JTAG0_TRSTN"),
+		MTK_FUNCTION(6, "I0_CLUSTER0_UDI_NTRST"),
+		MTK_FUNCTION(7, "I0_CLUSTER1_UDI_NTRST")
+	),
+	MTK_PIN(
+		148, "GPIO148",
+		MTK_EINT_FUNCTION(0, 148),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO148"),
+		MTK_FUNCTION(1, "O_SRCLKENA0")
+	),
+	MTK_PIN(
+		149, "GPIO149",
+		MTK_EINT_FUNCTION(0, 149),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO149"),
+		MTK_FUNCTION(1, "O_SRCLKENA1")
+	),
+	MTK_PIN(
+		150, "GPIO150",
+		MTK_EINT_FUNCTION(0, 150),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO150"),
+		MTK_FUNCTION(2, "O_NVJTAG_SEL"),
+		MTK_FUNCTION(4, "I0_TSFDC_SDI"),
+		MTK_FUNCTION(5, "O_TSFDC_BG_COMP"),
+		MTK_FUNCTION(6, "O_CLKM3_C"),
+		MTK_FUNCTION(7, "I0_HFRP_JTAG0_TRSTN")
+	),
+	MTK_PIN(
+		151, "GPIO151",
+		MTK_EINT_FUNCTION(0, 151),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO151"),
+		MTK_FUNCTION(1, "I1_JTRSTn_SEL1"),
+		MTK_FUNCTION(2, "O_JTAGAP_JTRSTn"),
+		MTK_FUNCTION(6, "I0_HFRP_JTAG1_TRSTN"),
+		MTK_FUNCTION(7, "I1_ADSP_JTAG1_TRSTN")
+	),
+	MTK_PIN(
+		152, "GPIO152",
+		MTK_EINT_FUNCTION(0, 152),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO152"),
+		MTK_FUNCTION(1, "B1_JTMS_SEL1"),
+		MTK_FUNCTION(2, "O_JTAGAP_JTMS"),
+		MTK_FUNCTION(6, "I1_HFRP_JTAG1_TMS"),
+		MTK_FUNCTION(7, "I1_ADSP_JTAG1_TMS")
+	),
+	MTK_PIN(
+		153, "GPIO153",
+		MTK_EINT_FUNCTION(0, 153),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO153"),
+		MTK_FUNCTION(1, "O_JTDO_SEL1"),
+		MTK_FUNCTION(2, "I0_JTAGAP_JTDO"),
+		MTK_FUNCTION(6, "O_HFRP_JTAG1_TDO"),
+		MTK_FUNCTION(7, "O_ADSP_JTAG1_TDO")
+	),
+	MTK_PIN(
+		154, "GPIO154",
+		MTK_EINT_FUNCTION(0, 154),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO154"),
+		MTK_FUNCTION(1, "I0_JTCK_SEL1"),
+		MTK_FUNCTION(2, "O_JTAGAP_JTCK"),
+		MTK_FUNCTION(6, "I1_HFRP_JTAG1_TCK"),
+		MTK_FUNCTION(7, "I0_ADSP_JTAG1_TCK")
+	),
+	MTK_PIN(
+		155, "GPIO155",
+		MTK_EINT_FUNCTION(0, 155),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO155"),
+		MTK_FUNCTION(1, "I1_JTDI_SEL1"),
+		MTK_FUNCTION(2, "O_JTAGAP_JTDI"),
+		MTK_FUNCTION(6, "I1_HFRP_JTAG1_TDI"),
+		MTK_FUNCTION(7, "I1_ADSP_JTAG1_TDI")
+	),
+	MTK_PIN(
+		156, "GPIO156",
+		MTK_EINT_FUNCTION(0, 156),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO156"),
+		MTK_FUNCTION(1, "O_TP_UTXD0_VLP"),
+		MTK_FUNCTION(2, "O_UTXD3"),
+		MTK_FUNCTION(3, "O_VADSP_UTXD1"),
+		MTK_FUNCTION(4, "O_SPI_SIO0_S_MON0"),
+		MTK_FUNCTION(5, "O_ADSP_UTXD1"),
+		MTK_FUNCTION(6, "I0_SROOT_TCK"),
+		MTK_FUNCTION(7, "O_OSROOT_UTX")
+	),
+	MTK_PIN(
+		157, "GPIO157",
+		MTK_EINT_FUNCTION(0, 157),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO157"),
+		MTK_FUNCTION(1, "I1_TP_URXD0_VLP"),
+		MTK_FUNCTION(2, "I1_URXD3"),
+		MTK_FUNCTION(3, "I1_VADSP_URXD1"),
+		MTK_FUNCTION(4, "O_SPI_SIO1_S_MON0"),
+		MTK_FUNCTION(5, "I1_ADSP_URXD1"),
+		MTK_FUNCTION(6, "I0_SROOT_TDI"),
+		MTK_FUNCTION(7, "I1_OSROOT_URX")
+	),
+	MTK_PIN(
+		158, "GPIO158",
+		MTK_EINT_FUNCTION(0, 158),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO158"),
+		MTK_FUNCTION(1, "O_TP_URTS0_VLP"),
+		MTK_FUNCTION(2, "O_URTS3"),
+		MTK_FUNCTION(3, "O_VADSP_URTS1"),
+		MTK_FUNCTION(4, "O_SPI_SIO2_S_MON0"),
+		MTK_FUNCTION(5, "O_ADSP_URTX1"),
+		MTK_FUNCTION(6, "O_SROOT_TDO"),
+		MTK_FUNCTION(7, "O_PBUD_CTRL_UTXD_AO_VLP")
+	),
+	MTK_PIN(
+		159, "GPIO159",
+		MTK_EINT_FUNCTION(0, 159),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO159"),
+		MTK_FUNCTION(1, "I1_TP_UCTS0_VLP"),
+		MTK_FUNCTION(2, "I1_UCTS3"),
+		MTK_FUNCTION(3, "I1_VADSP_UCTS1"),
+		MTK_FUNCTION(4, "O_SPI_SIO3_S_MON0"),
+		MTK_FUNCTION(5, "I1_ADSP_UCTS1"),
+		MTK_FUNCTION(6, "I0_SROOT_TMS"),
+		MTK_FUNCTION(7, "I1_PBUD_CTRL_URXD_AO_VLP")
+	),
+	MTK_PIN(
+		160, "GPIO160",
+		MTK_EINT_FUNCTION(0, 160),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO160"),
+		MTK_FUNCTION(1, "O_UTXD1"),
+		MTK_FUNCTION(2, "O_ADSP_UTXD1"),
+		MTK_FUNCTION(3, "O_HFRP_UTXD1"),
+		MTK_FUNCTION(4, "O_CCU1_UTXD"),
+		MTK_FUNCTION(5, "O_PBUD_CTRL_UTXD_AO_VCORE"),
+		MTK_FUNCTION(6, "O_U4CP_UTXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_B14")
+	),
+	MTK_PIN(
+		161, "GPIO161",
+		MTK_EINT_FUNCTION(0, 161),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO161"),
+		MTK_FUNCTION(1, "I1_URXD1"),
+		MTK_FUNCTION(2, "I1_ADSP_URXD1"),
+		MTK_FUNCTION(3, "I1_HFRP_URXD1"),
+		MTK_FUNCTION(4, "I1_CCU1_URXD"),
+		MTK_FUNCTION(5, "I1_PBUD_CTRL_URXD_AO_VCORE"),
+		MTK_FUNCTION(6, "I1_U4CP_URXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_B15")
+	),
+	MTK_PIN(
+		162, "GPIO162",
+		MTK_EINT_FUNCTION(0, 162),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO162"),
+		MTK_FUNCTION(1, "O_URTS1"),
+		MTK_FUNCTION(2, "O_ADSP_URTX1"),
+		MTK_FUNCTION(3, "O_HFRP_URTS1"),
+		MTK_FUNCTION(4, "O_CCU0_UTXD"),
+		MTK_FUNCTION(5, "O_PBUD_CTRL_UTXD_AO_VCORE"),
+		MTK_FUNCTION(6, "O_U4CP_URTS"),
+		MTK_FUNCTION(7, "O_DBG_MON_B16")
+	),
+	MTK_PIN(
+		163, "GPIO163",
+		MTK_EINT_FUNCTION(0, 163),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO163"),
+		MTK_FUNCTION(1, "I1_UCTS1"),
+		MTK_FUNCTION(2, "I1_ADSP_UCTS1"),
+		MTK_FUNCTION(3, "I1_HFRP_UCTS1"),
+		MTK_FUNCTION(4, "I1_CCU0_URXD"),
+		MTK_FUNCTION(5, "I1_PBUD_CTRL_URXD_AO_VCORE"),
+		MTK_FUNCTION(6, "I1_U4CP_UCTS"),
+		MTK_FUNCTION(7, "O_DBG_MON_B17")
+	),
+	MTK_PIN(
+		164, "GPIO164",
+		MTK_EINT_FUNCTION(0, 164),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO164"),
+		MTK_FUNCTION(1, "O_HDMITX_DC_CTRL"),
+		MTK_FUNCTION(6, "I0_SROOT_NTRST"),
+		MTK_FUNCTION(7, "O_DBG_MON_B18")
+	),
+	MTK_PIN(
+		165, "GPIO165",
+		MTK_EINT_FUNCTION(0, 165),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO165"),
+		MTK_FUNCTION(1, "B1_DISP_SCL0"),
+		MTK_FUNCTION(4, "I1_EDP0_SCL"),
+		MTK_FUNCTION(5, "O_CCU0_URTS"),
+		MTK_FUNCTION(6, "O_CCU1_URTS"),
+		MTK_FUNCTION(7, "I1_MD32_6_RXD")
+	),
+	MTK_PIN(
+		166, "GPIO166",
+		MTK_EINT_FUNCTION(0, 166),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO166"),
+		MTK_FUNCTION(1, "B1_DISP_SDA0"),
+		MTK_FUNCTION(4, "B1_EDP0_SDA"),
+		MTK_FUNCTION(5, "I1_CCU0_UCTS"),
+		MTK_FUNCTION(6, "I1_CCU1_UCTS"),
+		MTK_FUNCTION(7, "O_MD32_6_GPIO0")
+	),
+	MTK_PIN(
+		167, "GPIO167",
+		MTK_EINT_FUNCTION(0, 167),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO167"),
+		MTK_FUNCTION(1, "B0_DISP_GPIO_N0"),
+		MTK_FUNCTION(5, "O_CLUSTER0_AD_ILDO_DTEST0"),
+		MTK_FUNCTION(6, "O_CLUSTER1_AD_ILDO_DTEST0"),
+		MTK_FUNCTION(7, "O_DBG_MON_B19")
+	),
+	MTK_PIN(
+		168, "GPIO168",
+		MTK_EINT_FUNCTION(0, 168),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO168"),
+		MTK_FUNCTION(1, "I0_DPAUX_HPD_IN_0"),
+		MTK_FUNCTION(5, "O_CLUSTER0_AD_ILDO_DTEST1"),
+		MTK_FUNCTION(6, "O_CLUSTER1_AD_ILDO_DTEST1"),
+		MTK_FUNCTION(7, "O_DBG_MON_B20")
+	),
+	MTK_PIN(
+		169, "GPIO169",
+		MTK_EINT_FUNCTION(0, 169),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO169"),
+		MTK_FUNCTION(1, "I0_DPAUX_HPD_IN_1"),
+		MTK_FUNCTION(5, "O_CLUSTER0_AD_ILDO_DTEST3"),
+		MTK_FUNCTION(6, "O_CLUSTER1_AD_ILDO_DTEST3"),
+		MTK_FUNCTION(7, "O_DBG_MON_B21")
+	),
+	MTK_PIN(
+		170, "GPIO170",
+		MTK_EINT_FUNCTION(0, 170),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO170"),
+		MTK_FUNCTION(1, "O_USB4_R_TCPC_RESET"),
+		MTK_FUNCTION(5, "O_CLUSTER0_AD_ILDO_DTEST2"),
+		MTK_FUNCTION(6, "O_CLUSTER1_AD_ILDO_DTEST2"),
+		MTK_FUNCTION(7, "O_DBG_MON_A17")
+	),
+	MTK_PIN(
+		171, "GPIO171",
+		MTK_EINT_FUNCTION(0, 171),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO171"),
+		MTK_FUNCTION(1, "O_PCIE_PERSTN"),
+		MTK_FUNCTION(4, "O_MD32_14_GPIO0"),
+		MTK_FUNCTION(7, "O_DBG_MON_B22")
+	),
+	MTK_PIN(
+		172, "GPIO172",
+		MTK_EINT_FUNCTION(0, 172),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO172"),
+		MTK_FUNCTION(1, "B1_PCIE_CLKREQN_0P"),
+		MTK_FUNCTION(2, "I1_PCIE_PRSNT_0P"),
+		MTK_FUNCTION(5, "O_HFRP_UTXD1"),
+		MTK_FUNCTION(6, "O_CCU0_UTXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_B23")
+	),
+	MTK_PIN(
+		173, "GPIO173",
+		MTK_EINT_FUNCTION(0, 173),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO173"),
+		MTK_FUNCTION(1, "B1_PCIE_CLKREQN_1P"),
+		MTK_FUNCTION(2, "I1_PCIE_PRSNT_1P"),
+		MTK_FUNCTION(5, "I1_HFRP_URXD1"),
+		MTK_FUNCTION(6, "I1_CCU0_URXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_B24")
+	),
+	MTK_PIN(
+		174, "GPIO174",
+		MTK_EINT_FUNCTION(0, 174),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO174"),
+		MTK_FUNCTION(1, "B1_PCIE_CLKREQN_2P"),
+		MTK_FUNCTION(2, "I1_PCIE_PRSNT_2P"),
+		MTK_FUNCTION(4, "O_MD32PCM_UTXD_AO_VLP"),
+		MTK_FUNCTION(5, "O_HFRP_URTS1"),
+		MTK_FUNCTION(6, "O_CCU1_UTXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_B25")
+	),
+	MTK_PIN(
+		175, "GPIO175",
+		MTK_EINT_FUNCTION(0, 175),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO175"),
+		MTK_FUNCTION(1, "B1_PCIE_CLKREQN_3P"),
+		MTK_FUNCTION(2, "I1_PCIE_PRSNT_3P"),
+		MTK_FUNCTION(4, "I1_MD32PCM_URXD_AO_VLP"),
+		MTK_FUNCTION(5, "I1_HFRP_UCTS1"),
+		MTK_FUNCTION(6, "I1_CCU1_URXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_B26")
+	),
+	MTK_PIN(
+		176, "GPIO176",
+		MTK_EINT_FUNCTION(0, 176),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO176"),
+		MTK_FUNCTION(1, "B1_PCIE_CLKREQN_4P"),
+		MTK_FUNCTION(2, "I1_PCIE_PRSNT_4P"),
+		MTK_FUNCTION(4, "O_MD32_14_TXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_B27")
+	),
+	MTK_PIN(
+		177, "GPIO177",
+		MTK_EINT_FUNCTION(0, 177),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO177"),
+		MTK_FUNCTION(1, "B1_PCIE_CLKREQN_5P"),
+		MTK_FUNCTION(2, "I1_PCIE_PRSNT_5P"),
+		MTK_FUNCTION(4, "I1_MD32_14_RXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_B28")
+	),
+	MTK_PIN(
+		178, "GPIO178",
+		MTK_EINT_FUNCTION(0, 178),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO178"),
+		MTK_FUNCTION(1, "B1_PCIE_CLKREQN_6P"),
+		MTK_FUNCTION(2, "I1_PCIE_PRSNT_6P"),
+		MTK_FUNCTION(4, "O_MD32_15_TXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_B29")
+	),
+	MTK_PIN(
+		179, "GPIO179",
+		MTK_EINT_FUNCTION(0, 179),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO179"),
+		MTK_FUNCTION(1, "B1_PCIE_CLKREQN_7P"),
+		MTK_FUNCTION(2, "I1_PCIE_PRSNT_7P"),
+		MTK_FUNCTION(4, "I1_MD32_15_RXD"),
+		MTK_FUNCTION(7, "O_DBG_MON_B30")
+	),
+	MTK_PIN(
+		180, "GPIO180",
+		MTK_EINT_FUNCTION(0, 180),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO180"),
+		MTK_FUNCTION(1, "I1_PCIE_WAKEN"),
+		MTK_FUNCTION(4, "O_MD32_15_GPIO0"),
+		MTK_FUNCTION(7, "O_DBG_MON_B31")
+	),
+	MTK_PIN(
+		181, "GPIO181",
+		MTK_EINT_FUNCTION(0, 181),
+		DRV_GRP4,
+		MTK_FUNCTION(0, "B_GPIO181"),
+		MTK_FUNCTION(1, "O_GPU_PWRGOOD")
+	),
+	/*
+	 * Virtual GPIOs: EINT-only lines that have no pad.  Firmware refers to
+	 * them by EINT number, e.g. the xHCI wake events (EINT 181-186) are
+	 * described as ACPI GpioInt resources on this controller.
+	 */
+	MTK_PIN(
+		182, "GPIO182",
+		MTK_EINT_FUNCTION(0, 182),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		183, "GPIO183",
+		MTK_EINT_FUNCTION(0, 183),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		184, "GPIO184",
+		MTK_EINT_FUNCTION(0, 184),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		185, "GPIO185",
+		MTK_EINT_FUNCTION(0, 185),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		186, "GPIO186",
+		MTK_EINT_FUNCTION(0, 186),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		187, "GPIO187",
+		MTK_EINT_FUNCTION(0, 187),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		188, "GPIO188",
+		MTK_EINT_FUNCTION(0, 188),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		189, "GPIO189",
+		MTK_EINT_FUNCTION(0, 189),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		190, "GPIO190",
+		MTK_EINT_FUNCTION(0, 190),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		191, "GPIO191",
+		MTK_EINT_FUNCTION(0, 191),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		192, "GPIO192",
+		MTK_EINT_FUNCTION(0, 192),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		193, "GPIO193",
+		MTK_EINT_FUNCTION(0, 193),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		194, "GPIO194",
+		MTK_EINT_FUNCTION(0, 194),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		195, "GPIO195",
+		MTK_EINT_FUNCTION(0, 195),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		196, "GPIO196",
+		MTK_EINT_FUNCTION(0, 196),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		197, "GPIO197",
+		MTK_EINT_FUNCTION(0, 197),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		198, "GPIO198",
+		MTK_EINT_FUNCTION(0, 198),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		199, "GPIO199",
+		MTK_EINT_FUNCTION(0, 199),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		200, "GPIO200",
+		MTK_EINT_FUNCTION(0, 200),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		201, "GPIO201",
+		MTK_EINT_FUNCTION(0, 201),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		202, "GPIO202",
+		MTK_EINT_FUNCTION(0, 202),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		203, "GPIO203",
+		MTK_EINT_FUNCTION(0, 203),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		204, "GPIO204",
+		MTK_EINT_FUNCTION(0, 204),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		205, "GPIO205",
+		MTK_EINT_FUNCTION(0, 205),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		206, "GPIO206",
+		MTK_EINT_FUNCTION(0, 206),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		207, "GPIO207",
+		MTK_EINT_FUNCTION(0, 207),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+	MTK_PIN(
+		208, "GPIO208",
+		MTK_EINT_FUNCTION(0, 208),
+		DRV_GRP4,
+		MTK_FUNCTION(0, NULL)
+	),
+};
+
+static struct mtk_eint_pin eint_pins_mt8901[] = {
+	MTK_EINT_PIN(0, 0, 16, 0),
+	MTK_EINT_PIN(1, 0, 17, 0),
+	MTK_EINT_PIN(2, 0, 18, 0),
+	MTK_EINT_PIN(3, 0, 19, 0),
+	MTK_EINT_PIN(4, 0, 20, 0),
+	MTK_EINT_PIN(5, 0, 21, 0),
+	MTK_EINT_PIN(6, 0, 22, 0),
+	MTK_EINT_PIN(7, 0, 23, 0),
+	MTK_EINT_PIN(8, 0, 24, 0),
+	MTK_EINT_PIN(9, 0, 25, 0),
+	MTK_EINT_PIN(10, 0, 26, 0),
+	MTK_EINT_PIN(11, 0, 27, 0),
+	MTK_EINT_PIN(12, INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(13, INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(14, 0, 28, 0),
+	MTK_EINT_PIN(15, 0, 29, 0),
+	MTK_EINT_PIN(16, 0, 30, 0),
+	MTK_EINT_PIN(17, INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(18, INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(19, 0, 31, 0),
+	MTK_EINT_PIN(20, 0, 0, 1),
+	MTK_EINT_PIN(21, 0, 1, 1),
+	MTK_EINT_PIN(22, INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(23, 0, 2, 1),
+	MTK_EINT_PIN(24, 0, 3, 1),
+	MTK_EINT_PIN(25, 0, 4, 1),
+	MTK_EINT_PIN(26, 0, 5, 1),
+	MTK_EINT_PIN(27, 0, 6, 1),
+	MTK_EINT_PIN(28, 0, 7, 1),
+	MTK_EINT_PIN(29, 0, 8, 1),
+	MTK_EINT_PIN(30, 0, 9, 1),
+	MTK_EINT_PIN(31, 0, 10, 1),
+	MTK_EINT_PIN(32, 1, 0, 1),
+	MTK_EINT_PIN(33, 0, 32, 0),
+	MTK_EINT_PIN(34, 0, 33, 0),
+	MTK_EINT_PIN(35, 0, 34, 0),
+	MTK_EINT_PIN(36, 1, 1, 1),
+	MTK_EINT_PIN(37, 0, 11, 1),
+	MTK_EINT_PIN(38, 0, 12, 1),
+	MTK_EINT_PIN(39, 0, 35, 0),
+	MTK_EINT_PIN(40, 0, 36, 0),
+	MTK_EINT_PIN(41, 0, 37, 0),
+	MTK_EINT_PIN(42, 0, 13, 1),
+	MTK_EINT_PIN(43, 0, 14, 1),
+	MTK_EINT_PIN(44, 0, 38, 0),
+	MTK_EINT_PIN(45, 0, 39, 0),
+	MTK_EINT_PIN(46, 0, 40, 0),
+	MTK_EINT_PIN(47, 0, 15, 1),
+	MTK_EINT_PIN(48, 0, 41, 0),
+	MTK_EINT_PIN(49, 0, 42, 0),
+	MTK_EINT_PIN(50, 0, 43, 0),
+	MTK_EINT_PIN(51, 0, 44, 0),
+	MTK_EINT_PIN(52, 0, 45, 0),
+	MTK_EINT_PIN(53, 0, 46, 0),
+	MTK_EINT_PIN(54, 2, 13, 0),
+	MTK_EINT_PIN(55, 2, 14, 0),
+	MTK_EINT_PIN(56, INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(57, INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(58, INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(59, INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(60, 1, 3, 0),
+	MTK_EINT_PIN(61, 1, 4, 0),
+	MTK_EINT_PIN(62, 1, 5, 0),
+	MTK_EINT_PIN(63, 1, 6, 0),
+	MTK_EINT_PIN(64, 1, 7, 0),
+	MTK_EINT_PIN(65, 1, 8, 0),
+	MTK_EINT_PIN(66, 2, 15, 0),
+	MTK_EINT_PIN(67, 2, 16, 0),
+	MTK_EINT_PIN(68, 1, 2, 1),
+	MTK_EINT_PIN(69, INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(70, 2, 17, 0),
+	MTK_EINT_PIN(71, 2, 18, 0),
+	MTK_EINT_PIN(72, 2, 19, 0),
+	MTK_EINT_PIN(73, 2, 20, 0),
+	MTK_EINT_PIN(74, 2, 21, 0),
+	MTK_EINT_PIN(75, 2, 22, 0),
+	MTK_EINT_PIN(76, 2, 23, 0),
+	MTK_EINT_PIN(77, 2, 24, 0),
+	MTK_EINT_PIN(78, 2, 25, 0),
+	MTK_EINT_PIN(79, 2, 26, 0),
+	MTK_EINT_PIN(80, 2, 27, 0),
+	MTK_EINT_PIN(81, 2, 28, 0),
+	MTK_EINT_PIN(82, 2, 29, 1),
+	MTK_EINT_PIN(83, 2, 30, 1),
+	MTK_EINT_PIN(84, 2, 31, 1),
+	MTK_EINT_PIN(85, 2, 32, 1),
+	MTK_EINT_PIN(86, 2, 33, 0),
+	MTK_EINT_PIN(87, 2, 34, 0),
+	MTK_EINT_PIN(88, 2, 35, 0),
+	MTK_EINT_PIN(89, 2, 36, 0),
+	MTK_EINT_PIN(90, 2, 37, 0),
+	MTK_EINT_PIN(91, 2, 38, 0),
+	MTK_EINT_PIN(92, 2, 39, 0),
+	MTK_EINT_PIN(93, 2, 40, 0),
+	MTK_EINT_PIN(94, 2, 0, 1),
+	MTK_EINT_PIN(95, 2, 1, 1),
+	MTK_EINT_PIN(96, 2, 2, 1),
+	MTK_EINT_PIN(97, 2, 3, 1),
+	MTK_EINT_PIN(98, 2, 41, 0),
+	MTK_EINT_PIN(99, 2, 4, 1),
+	MTK_EINT_PIN(100, 2, 5, 1),
+	MTK_EINT_PIN(101, 2, 6, 1),
+	MTK_EINT_PIN(102, 2, 7, 1),
+	MTK_EINT_PIN(103, 2, 8, 1),
+	MTK_EINT_PIN(104, 2, 9, 1),
+	MTK_EINT_PIN(105, 2, 10, 1),
+	MTK_EINT_PIN(106, 0, 47, 0),
+	MTK_EINT_PIN(107, 0, 48, 0),
+	MTK_EINT_PIN(108, 0, 49, 0),
+	MTK_EINT_PIN(109, 0, 50, 0),
+	MTK_EINT_PIN(110, 0, 51, 0),
+	MTK_EINT_PIN(111, 0, 52, 0),
+	MTK_EINT_PIN(112, 2, 42, 0),
+	MTK_EINT_PIN(113, 2, 43, 0),
+	MTK_EINT_PIN(114, 2, 44, 0),
+	MTK_EINT_PIN(115, 2, 45, 0),
+	MTK_EINT_PIN(116, 2, 46, 0),
+	MTK_EINT_PIN(117, 2, 47, 0),
+	MTK_EINT_PIN(118, 2, 48, 0),
+	MTK_EINT_PIN(119, 2, 49, 0),
+	MTK_EINT_PIN(120, 2, 50, 0),
+	MTK_EINT_PIN(121, 2, 51, 0),
+	MTK_EINT_PIN(122, 2, 52, 0),
+	MTK_EINT_PIN(123, 2, 53, 0),
+	MTK_EINT_PIN(124, 2, 54, 0),
+	MTK_EINT_PIN(125, 2, 55, 0),
+	MTK_EINT_PIN(126, 2, 56, 0),
+	MTK_EINT_PIN(127, 2, 57, 0),
+	MTK_EINT_PIN(128, 2, 58, 0),
+	MTK_EINT_PIN(129, 2, 59, 0),
+	MTK_EINT_PIN(130, 2, 60, 0),
+	MTK_EINT_PIN(131, 2, 61, 0),
+	MTK_EINT_PIN(132, 2, 62, 0),
+	MTK_EINT_PIN(133, 2, 63, 0),
+	MTK_EINT_PIN(134, 2, 64, 0),
+	MTK_EINT_PIN(135, 2, 65, 0),
+	MTK_EINT_PIN(136, 2, 66, 0),
+	MTK_EINT_PIN(137, 2, 67, 0),
+	MTK_EINT_PIN(138, 2, 11, 1),
+	MTK_EINT_PIN(139, 2, 12, 1),
+	MTK_EINT_PIN(140, 2, 68, 0),
+	MTK_EINT_PIN(141, 2, 69, 0),
+	MTK_EINT_PIN(142, 2, 70, 0),
+	MTK_EINT_PIN(143, 2, 71, 0),
+	MTK_EINT_PIN(144, 2, 72, 0),
+	MTK_EINT_PIN(145, 2, 73, 0),
+	MTK_EINT_PIN(146, 2, 74, 0),
+	MTK_EINT_PIN(147, 2, 75, 0),
+	MTK_EINT_PIN(148, INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(149, INVALID_BASE, 0, 0),
+	MTK_EINT_PIN(150, 2, 76, 0),
+	MTK_EINT_PIN(151, 2, 77, 0),
+	MTK_EINT_PIN(152, 2, 78, 0),
+	MTK_EINT_PIN(153, 2, 79, 0),
+	MTK_EINT_PIN(154, 2, 80, 0),
+	MTK_EINT_PIN(155, 2, 81, 0),
+	MTK_EINT_PIN(156, 2, 82, 0),
+	MTK_EINT_PIN(157, 2, 83, 0),
+	MTK_EINT_PIN(158, 2, 84, 0),
+	MTK_EINT_PIN(159, 2, 85, 0),
+	MTK_EINT_PIN(160, 2, 86, 0),
+	MTK_EINT_PIN(161, 2, 87, 0),
+	MTK_EINT_PIN(162, 2, 88, 0),
+	MTK_EINT_PIN(163, 2, 89, 0),
+	MTK_EINT_PIN(164, 2, 90, 0),
+	MTK_EINT_PIN(165, 2, 91, 0),
+	MTK_EINT_PIN(166, 2, 92, 0),
+	MTK_EINT_PIN(167, 2, 93, 0),
+	MTK_EINT_PIN(168, 2, 94, 0),
+	MTK_EINT_PIN(169, 2, 95, 0),
+	MTK_EINT_PIN(170, 2, 96, 0),
+	MTK_EINT_PIN(171, 2, 97, 0),
+	MTK_EINT_PIN(172, 2, 98, 0),
+	MTK_EINT_PIN(173, 2, 99, 0),
+	MTK_EINT_PIN(174, 2, 100, 0),
+	MTK_EINT_PIN(175, 2, 101, 0),
+	MTK_EINT_PIN(176, 2, 102, 0),
+	MTK_EINT_PIN(177, 2, 103, 0),
+	MTK_EINT_PIN(178, 2, 104, 0),
+	MTK_EINT_PIN(179, 2, 105, 0),
+	MTK_EINT_PIN(180, 2, 106, 0),
+	MTK_EINT_PIN(181, 3, 0, 0),
+	MTK_EINT_PIN(182, 3, 1, 0),
+	MTK_EINT_PIN(183, 3, 2, 0),
+	MTK_EINT_PIN(184, 3, 3, 0),
+	MTK_EINT_PIN(185, 3, 4, 0),
+	MTK_EINT_PIN(186, 3, 5, 0),
+	MTK_EINT_PIN(187, 3, 6, 0),
+	MTK_EINT_PIN(188, 3, 7, 0),
+	MTK_EINT_PIN(189, 3, 8, 0),
+	MTK_EINT_PIN(190, 3, 9, 0),
+	MTK_EINT_PIN(191, 3, 10, 0),
+	MTK_EINT_PIN(192, 3, 11, 0),
+	MTK_EINT_PIN(193, 3, 12, 0),
+	MTK_EINT_PIN(194, 3, 13, 0),
+	MTK_EINT_PIN(195, 3, 14, 0),
+	MTK_EINT_PIN(196, 3, 15, 0),
+	MTK_EINT_PIN(197, 3, 16, 0),
+	MTK_EINT_PIN(198, 3, 17, 0),
+	MTK_EINT_PIN(199, 3, 18, 0),
+	MTK_EINT_PIN(200, 3, 19, 0),
+	MTK_EINT_PIN(201, 3, 20, 0),
+	MTK_EINT_PIN(202, 3, 21, 0),
+	MTK_EINT_PIN(203, 3, 22, 0),
+	MTK_EINT_PIN(204, 3, 23, 0),
+	MTK_EINT_PIN(205, 3, 24, 0),
+	MTK_EINT_PIN(206, 3, 25, 0),
+	MTK_EINT_PIN(207, 3, 26, 0),
+	MTK_EINT_PIN(208, 3, 27, 0),
+};
+#endif /* __PINCTRL_MTK_MT8901_H */
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h
new file mode 100644
index 000000000000..7e59bc9507a1
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8971.h
@@ -0,0 +1,1646 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2026 MediaTek Inc.
+ *
+ * MediaTek MT8971 pin data.
+ */
+#ifndef __PINCTRL_MTK_MT8971_H
+#define __PINCTRL_MTK_MT8971_H
+
+#include "pinctrl-paris.h"
+
+static const struct mtk_pin_field_order mt8971_reg_order[PINCTRL_PIN_REG_MAX] = {
+	[PINCTRL_PIN_REG_DIR]     = { .index = 0, .offset = 0x00, .mask = 0x1,  .bitpos = 0 },
+	[PINCTRL_PIN_REG_DO]      = { .index = 0, .offset = 0x10, .mask = 0x1,  .bitpos = 0 },
+	[PINCTRL_PIN_REG_DI]      = { .index = 0, .offset = 0x20, .mask = 0x1,  .bitpos = 0 },
+	[PINCTRL_PIN_REG_MODE]    = { .index = 0, .offset = 0x30, .mask = 0xf,  .bitpos = 0 },
+	[PINCTRL_PIN_REG_DRV]     = { .index = 1, .offset = 0x00, .mask = 0x7,  .bitpos = 0 },
+	[PINCTRL_PIN_REG_DRV_ADV] = { .index = 1, .offset = 0x00, .mask = 0x1f, .bitpos = 8 },
+	[PINCTRL_PIN_REG_IES]     = { .index = 1, .offset = 0x00, .mask = 0x1,  .bitpos = 16 },
+	[PINCTRL_PIN_REG_SMT]     = { .index = 1, .offset = 0x00, .mask = 0x1,  .bitpos = 17 },
+	[PINCTRL_PIN_REG_PU]      = { .index = 1, .offset = 0x00, .mask = 0x1,  .bitpos = 18 },
+	[PINCTRL_PIN_REG_PD]      = { .index = 1, .offset = 0x00, .mask = 0x1,  .bitpos = 19 },
+	[PINCTRL_PIN_REG_PUPD]    = { .index = 1, .offset = 0x00, .mask = 0x1,  .bitpos = 20 },
+	[PINCTRL_PIN_REG_R0]      = { .index = 1, .offset = 0x00, .mask = 0x1,  .bitpos = 21 },
+	[PINCTRL_PIN_REG_R1]      = { .index = 1, .offset = 0x00, .mask = 0x1,  .bitpos = 22 },
+	[PINCTRL_PIN_REG_RSEL]    = { .index = 1, .offset = 0x00, .mask = 0x7,  .bitpos = 24 },
+	[PINCTRL_PIN_REG_SR]      = { .index = 1, .offset = 0x00, .mask = 0x1,  .bitpos = 27 },
+};
+
+static struct mtk_eint_pin eint_pins_mt8971[] = {
+	MTK_EINT_PIN(0, 4, 5, 1),
+	MTK_EINT_PIN(1, 4, 7, 1),
+	MTK_EINT_PIN(2, 4, 60, 0),
+	MTK_EINT_PIN(3, 4, 2, 1),
+	MTK_EINT_PIN(4, 4, 3, 1),
+	MTK_EINT_PIN(5, 4, 73, 0),
+	MTK_EINT_PIN(6, 4, 16, 1),
+	MTK_EINT_PIN(7, 4, 22, 0),
+	MTK_EINT_PIN(8, 4, 96, 0),
+	MTK_EINT_PIN(9, 4, 99, 0),
+	MTK_EINT_PIN(10, 4, 28, 0),
+	MTK_EINT_PIN(11, 4, 34, 0),
+	MTK_EINT_PIN(12, 5, 0, 0),
+	MTK_EINT_PIN(13, 5, 0, 0),
+	MTK_EINT_PIN(14, 4, 44, 0),
+	MTK_EINT_PIN(15, 0, 46, 0),
+	MTK_EINT_PIN(16, 4, 19, 0),
+	MTK_EINT_PIN(17, 5, 0, 0),
+	MTK_EINT_PIN(18, 5, 0, 0),
+	MTK_EINT_PIN(19, 0, 56, 0),
+	MTK_EINT_PIN(20, 4, 8, 1),
+	MTK_EINT_PIN(21, 4, 9, 1),
+	MTK_EINT_PIN(22, 5, 0, 0),
+	MTK_EINT_PIN(23, 4, 0, 1),
+	MTK_EINT_PIN(24, 4, 10, 1),
+	MTK_EINT_PIN(25, 4, 1, 1),
+	MTK_EINT_PIN(26, 3, 0, 1),
+	MTK_EINT_PIN(27, 3, 1, 1),
+	MTK_EINT_PIN(28, 0, 2, 1),
+	MTK_EINT_PIN(29, 4, 11, 1),
+	MTK_EINT_PIN(30, 3, 2, 1),
+	MTK_EINT_PIN(31, 3, 3, 1),
+	MTK_EINT_PIN(32, 3, 4, 1),
+	MTK_EINT_PIN(33, 3, 5, 0),
+	MTK_EINT_PIN(34, 3, 9, 0),
+	MTK_EINT_PIN(35, 3, 10, 0),
+	MTK_EINT_PIN(36, 3, 11, 0),
+	MTK_EINT_PIN(37, 3, 6, 0),
+	MTK_EINT_PIN(38, 3, 12, 0),
+	MTK_EINT_PIN(39, 3, 13, 0),
+	MTK_EINT_PIN(40, 4, 61, 0),
+	MTK_EINT_PIN(41, 4, 62, 0),
+	MTK_EINT_PIN(42, 4, 12, 1),
+	MTK_EINT_PIN(43, 4, 13, 1),
+	MTK_EINT_PIN(44, 4, 63, 0),
+	MTK_EINT_PIN(45, 4, 64, 0),
+	MTK_EINT_PIN(46, 0, 9, 0),
+	MTK_EINT_PIN(47, 4, 14, 1),
+	MTK_EINT_PIN(48, 4, 65, 0),
+	MTK_EINT_PIN(49, 4, 66, 0),
+	MTK_EINT_PIN(50, 4, 67, 0),
+	MTK_EINT_PIN(51, 4, 68, 0),
+	MTK_EINT_PIN(52, 4, 69, 0),
+	MTK_EINT_PIN(53, 4, 70, 0),
+	MTK_EINT_PIN(54, 4, 71, 0),
+	MTK_EINT_PIN(55, 4, 72, 0),
+	MTK_EINT_PIN(56, 5, 0, 0),
+	MTK_EINT_PIN(57, 5, 0, 0),
+	MTK_EINT_PIN(58, 5, 0, 0),
+	MTK_EINT_PIN(59, 5, 0, 0),
+	MTK_EINT_PIN(60, 4, 74, 0),
+	MTK_EINT_PIN(61, 4, 75, 0),
+	MTK_EINT_PIN(62, 4, 76, 0),
+	MTK_EINT_PIN(63, 4, 77, 0),
+	MTK_EINT_PIN(64, 4, 78, 0),
+	MTK_EINT_PIN(65, 4, 79, 0),
+	MTK_EINT_PIN(66, 0, 57, 0),
+	MTK_EINT_PIN(67, 0, 58, 0),
+	MTK_EINT_PIN(68, 4, 15, 1),
+	MTK_EINT_PIN(69, 4, 4, 1),
+	MTK_EINT_PIN(70, 4, 80, 0),
+	MTK_EINT_PIN(71, 4, 81, 0),
+	MTK_EINT_PIN(72, 4, 82, 0),
+	MTK_EINT_PIN(73, 4, 83, 0),
+	MTK_EINT_PIN(74, 4, 84, 0),
+	MTK_EINT_PIN(75, 4, 85, 0),
+	MTK_EINT_PIN(76, 4, 86, 0),
+	MTK_EINT_PIN(77, 4, 20, 0),
+	MTK_EINT_PIN(78, 4, 21, 0),
+	MTK_EINT_PIN(79, 4, 87, 0),
+	MTK_EINT_PIN(80, 4, 88, 0),
+	MTK_EINT_PIN(81, 4, 89, 0),
+	MTK_EINT_PIN(82, 4, 90, 0),
+	MTK_EINT_PIN(83, 4, 91, 0),
+	MTK_EINT_PIN(84, 4, 17, 1),
+	MTK_EINT_PIN(85, 4, 92, 0),
+	MTK_EINT_PIN(86, 4, 93, 0),
+	MTK_EINT_PIN(87, 4, 23, 0),
+	MTK_EINT_PIN(88, 4, 94, 0),
+	MTK_EINT_PIN(89, 4, 95, 0),
+	MTK_EINT_PIN(90, 3, 7, 0),
+	MTK_EINT_PIN(91, 3, 8, 0),
+	MTK_EINT_PIN(92, 4, 97, 0),
+	MTK_EINT_PIN(93, 4, 98, 0),
+	MTK_EINT_PIN(94, 0, 3, 1),
+	MTK_EINT_PIN(95, 0, 4, 1),
+	MTK_EINT_PIN(96, 0, 5, 1),
+	MTK_EINT_PIN(97, 0, 6, 1),
+	MTK_EINT_PIN(98, 0, 59, 0),
+	MTK_EINT_PIN(99, 0, 60, 0),
+	MTK_EINT_PIN(100, 0, 10, 0),
+	MTK_EINT_PIN(101, 0, 11, 0),
+	MTK_EINT_PIN(102, 0, 12, 0),
+	MTK_EINT_PIN(103, 0, 13, 0),
+	MTK_EINT_PIN(104, 0, 14, 0),
+	MTK_EINT_PIN(105, 0, 15, 0),
+	MTK_EINT_PIN(106, 4, 24, 0),
+	MTK_EINT_PIN(107, 4, 25, 0),
+	MTK_EINT_PIN(108, 4, 26, 0),
+	MTK_EINT_PIN(109, 4, 27, 0),
+	MTK_EINT_PIN(110, 4, 29, 0),
+	MTK_EINT_PIN(111, 4, 30, 0),
+	MTK_EINT_PIN(112, 0, 16, 0),
+	MTK_EINT_PIN(113, 0, 17, 0),
+	MTK_EINT_PIN(114, 0, 18, 0),
+	MTK_EINT_PIN(115, 0, 19, 0),
+	MTK_EINT_PIN(116, 0, 7, 1),
+	MTK_EINT_PIN(117, 4, 31, 0),
+	MTK_EINT_PIN(118, 4, 32, 0),
+	MTK_EINT_PIN(119, 4, 33, 0),
+	MTK_EINT_PIN(120, 4, 35, 0),
+	MTK_EINT_PIN(121, 4, 36, 0),
+	MTK_EINT_PIN(122, 4, 37, 0),
+	MTK_EINT_PIN(123, 4, 38, 0),
+	MTK_EINT_PIN(124, 4, 39, 0),
+	MTK_EINT_PIN(125, 0, 20, 0),
+	MTK_EINT_PIN(126, 0, 0, 1),
+	MTK_EINT_PIN(127, 0, 1, 1),
+	MTK_EINT_PIN(128, 0, 21, 0),
+	MTK_EINT_PIN(129, 0, 8, 1),
+	MTK_EINT_PIN(130, 0, 22, 0),
+	MTK_EINT_PIN(131, 0, 23, 0),
+	MTK_EINT_PIN(132, 0, 24, 0),
+	MTK_EINT_PIN(133, 0, 25, 0),
+	MTK_EINT_PIN(134, 4, 40, 0),
+	MTK_EINT_PIN(135, 4, 41, 0),
+	MTK_EINT_PIN(136, 4, 42, 0),
+	MTK_EINT_PIN(137, 4, 43, 0),
+	MTK_EINT_PIN(138, 0, 26, 0),
+	MTK_EINT_PIN(139, 0, 27, 0),
+	MTK_EINT_PIN(140, 0, 28, 0),
+	MTK_EINT_PIN(141, 0, 29, 0),
+	MTK_EINT_PIN(142, 0, 30, 0),
+	MTK_EINT_PIN(143, 0, 31, 0),
+	MTK_EINT_PIN(144, 0, 32, 0),
+	MTK_EINT_PIN(145, 0, 33, 0),
+	MTK_EINT_PIN(146, 0, 34, 0),
+	MTK_EINT_PIN(147, 0, 35, 0),
+	MTK_EINT_PIN(148, 5, 0, 0),
+	MTK_EINT_PIN(149, 5, 0, 0),
+	MTK_EINT_PIN(150, 0, 36, 0),
+	MTK_EINT_PIN(151, 0, 37, 0),
+	MTK_EINT_PIN(152, 0, 38, 0),
+	MTK_EINT_PIN(153, 0, 39, 0),
+	MTK_EINT_PIN(154, 0, 40, 0),
+	MTK_EINT_PIN(155, 0, 41, 0),
+	MTK_EINT_PIN(156, 0, 42, 0),
+	MTK_EINT_PIN(157, 0, 43, 0),
+	MTK_EINT_PIN(158, 0, 44, 0),
+	MTK_EINT_PIN(159, 0, 45, 0),
+	MTK_EINT_PIN(160, 0, 47, 0),
+	MTK_EINT_PIN(161, 0, 48, 0),
+	MTK_EINT_PIN(162, 0, 49, 0),
+	MTK_EINT_PIN(163, 0, 50, 0),
+	MTK_EINT_PIN(164, 4, 45, 0),
+	MTK_EINT_PIN(165, 4, 46, 0),
+	MTK_EINT_PIN(166, 4, 47, 0),
+	MTK_EINT_PIN(167, 4, 18, 0),
+	MTK_EINT_PIN(168, 4, 48, 0),
+	MTK_EINT_PIN(169, 4, 49, 0),
+	MTK_EINT_PIN(170, 4, 6, 1),
+	MTK_EINT_PIN(171, 4, 50, 0),
+	MTK_EINT_PIN(172, 4, 51, 0),
+	MTK_EINT_PIN(173, 4, 52, 0),
+	MTK_EINT_PIN(174, 4, 53, 0),
+	MTK_EINT_PIN(175, 4, 54, 0),
+	MTK_EINT_PIN(176, 4, 55, 0),
+	MTK_EINT_PIN(177, 4, 56, 0),
+	MTK_EINT_PIN(178, 4, 57, 0),
+	MTK_EINT_PIN(179, 4, 58, 0),
+	MTK_EINT_PIN(180, 4, 59, 0),
+	MTK_EINT_PIN(181, 5, 0, 0),
+	MTK_EINT_PIN(182, 0, 51, 0),
+	MTK_EINT_PIN(183, 0, 52, 0),
+	MTK_EINT_PIN(184, 0, 53, 0),
+	MTK_EINT_PIN(185, 0, 54, 0),
+	MTK_EINT_PIN(186, 0, 55, 0),
+	MTK_EINT_PIN(187, 1, 0, 1),
+	MTK_EINT_PIN(188, 1, 1, 1),
+	MTK_EINT_PIN(189, 1, 2, 1),
+	MTK_EINT_PIN(190, 1, 3, 1),
+	MTK_EINT_PIN(191, 1, 4, 0),
+	MTK_EINT_PIN(192, 1, 5, 0),
+	MTK_EINT_PIN(193, 1, 6, 0),
+	MTK_EINT_PIN(194, 1, 7, 0),
+	MTK_EINT_PIN(195, 1, 8, 0),
+	MTK_EINT_PIN(196, 1, 9, 0),
+	MTK_EINT_PIN(197, 1, 10, 0),
+	MTK_EINT_PIN(198, 1, 11, 0),
+	MTK_EINT_PIN(199, 1, 12, 0),
+	MTK_EINT_PIN(200, 1, 13, 0),
+	MTK_EINT_PIN(201, 1, 14, 0),
+	MTK_EINT_PIN(202, 1, 15, 0),
+	MTK_EINT_PIN(203, 1, 16, 0),
+	MTK_EINT_PIN(204, 1, 17, 0),
+	MTK_EINT_PIN(205, 1, 18, 0),
+	MTK_EINT_PIN(206, 1, 19, 0),
+	MTK_EINT_PIN(207, 1, 20, 0),
+	MTK_EINT_PIN(208, 1, 21, 0),
+	MTK_EINT_PIN(209, 1, 22, 0),
+	MTK_EINT_PIN(210, 1, 23, 0),
+	MTK_EINT_PIN(211, 1, 24, 0),
+	MTK_EINT_PIN(212, 1, 25, 0),
+	MTK_EINT_PIN(213, 1, 26, 0),
+	MTK_EINT_PIN(214, 1, 27, 0),
+	MTK_EINT_PIN(215, 2, 0, 1),
+};
+
+static const struct mtk_pin_desc mtk_pins_mt8971[] = {
+	MTK_PIN(0, "GPIO0", MTK_EINT_FUNCTION(0, 0), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO0"),
+		MTK_FUNCTION(1, "O:ESPI_SCK"),
+		MTK_FUNCTION(8, "B0:DISP_GPIO_N8"),
+		MTK_FUNCTION(9, "O:UTXD6")),
+	MTK_PIN(1, "GPIO1", MTK_EINT_FUNCTION(0, 1), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO1"),
+		MTK_FUNCTION(1, "B1:ESPI_IO0"),
+		MTK_FUNCTION(8, "B0:DISP_GPIO_N9"),
+		MTK_FUNCTION(9, "I1:URXD6")),
+	MTK_PIN(2, "GPIO2", MTK_EINT_FUNCTION(0, 2), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO2"),
+		MTK_FUNCTION(1, "B1:ESPI_IO1"),
+		MTK_FUNCTION(8, "B0:DISP_GPIO_N10"),
+		MTK_FUNCTION(9, "I1:UCTS6")),
+	MTK_PIN(3, "GPIO3", MTK_EINT_FUNCTION(0, 3), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO3"),
+		MTK_FUNCTION(1, "B1:ESPI_IO2"),
+		MTK_FUNCTION(8, "B0:DISP_GPIO_N12")),
+	MTK_PIN(4, "GPIO4", MTK_EINT_FUNCTION(0, 4), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO4"),
+		MTK_FUNCTION(1, "B1:ESPI_IO3"),
+		MTK_FUNCTION(8, "B0:DISP_GPIO_N13")),
+	MTK_PIN(5, "GPIO5", MTK_EINT_FUNCTION(0, 5), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO5"),
+		MTK_FUNCTION(1, "O:ESPI_CSN"),
+		MTK_FUNCTION(8, "B0:DISP_GPIO_N11"),
+		MTK_FUNCTION(9, "O:URTS6")),
+	MTK_PIN(6, "GPIO6", MTK_EINT_FUNCTION(0, 6), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO6"),
+		MTK_FUNCTION(1, "O:ESPI_RESET_O"),
+		MTK_FUNCTION(2, "I1:ESPI_RESET_I"),
+		MTK_FUNCTION(8, "B0:DISP_GPIO_N14")),
+	MTK_PIN(7, "GPIO7", MTK_EINT_FUNCTION(0, 7), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO7"),
+		MTK_FUNCTION(1, "I1:ESPI_ALERT"),
+		MTK_FUNCTION(8, "B0:DISP_GPIO_N15")),
+	MTK_PIN(8, "GPIO8", MTK_EINT_FUNCTION(0, 8), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO8"),
+		MTK_FUNCTION(1, "B1:I2C_SCL3"),
+		MTK_FUNCTION(2, "B1:DISP_SCL2"),
+		MTK_FUNCTION(4, "O:PMSR_SMAP"),
+		MTK_FUNCTION(6, "O:MD32_0_TXD"),
+		MTK_FUNCTION(7, "O:MD32_1_TXD"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N18")),
+	MTK_PIN(9, "GPIO9", MTK_EINT_FUNCTION(0, 9), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO9"),
+		MTK_FUNCTION(1, "B1:I2C_SDA3"),
+		MTK_FUNCTION(2, "B1:DISP_SDA2"),
+		MTK_FUNCTION(4, "O:PMSR_SMAP_MAX"),
+		MTK_FUNCTION(6, "I1:MD32_0_RXD"),
+		MTK_FUNCTION(7, "I1:MD32_1_RXD"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N19")),
+	MTK_PIN(10, "GPIO10", MTK_EINT_FUNCTION(0, 10), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO10"),
+		MTK_FUNCTION(1, "B1:I2C_SCL4"),
+		MTK_FUNCTION(2, "B1:DISP_SCL2"),
+		MTK_FUNCTION(4, "O:PMSR_SMAP_MAX_W"),
+		MTK_FUNCTION(6, "O:MD32_0_GPIO0"),
+		MTK_FUNCTION(7, "O:MD32_1_GPIO0"),
+		MTK_FUNCTION(8, "B1:DISP_SCL0"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N20")),
+	MTK_PIN(11, "GPIO11", MTK_EINT_FUNCTION(0, 11), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO11"),
+		MTK_FUNCTION(1, "B1:I2C_SDA4"),
+		MTK_FUNCTION(2, "B1:DISP_SDA2"),
+		MTK_FUNCTION(8, "B1:DISP_SDA0"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N21")),
+	MTK_PIN(12, "GPIO12", MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO12"),
+		MTK_FUNCTION(1, "B0:SPMI_M_SCL"),
+		MTK_FUNCTION(2, "B0:TP_GPIO31_AO")),
+	MTK_PIN(13, "GPIO13", MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO13"),
+		MTK_FUNCTION(1, "B0:SPMI_M_SDA"),
+		MTK_FUNCTION(2, "B0:TP_GPIO6_AO")),
+	MTK_PIN(14, "GPIO14", MTK_EINT_FUNCTION(0, 14), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO14"),
+		MTK_FUNCTION(1, "I0:DPAUX_HPD_IN_2"),
+		MTK_FUNCTION(7, "O:DBG_MON_A0"),
+		MTK_FUNCTION(8, "B0:DISP_GPIO_N2")),
+	MTK_PIN(15, "GPIO15", MTK_EINT_FUNCTION(0, 15), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO15"),
+		MTK_FUNCTION(1, "I0:DPAUX_HPD_IN_3"),
+		MTK_FUNCTION(2, "B0:TP_GPIO25_AO"),
+		MTK_FUNCTION(7, "O:DBG_MON_A1"),
+		MTK_FUNCTION(8, "B0:DISP_GPIO_N3")),
+	MTK_PIN(16, "GPIO16", MTK_EINT_FUNCTION(0, 16), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO16"),
+		MTK_FUNCTION(1, "O:USB4_L_TCPC_RESET"),
+		MTK_FUNCTION(7, "O:DBG_MON_A18"),
+		MTK_FUNCTION(8, "I0:VBUSVALID_0P")),
+	MTK_PIN(17, "GPIO17", MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO17"),
+		MTK_FUNCTION(1, "B0:SPMI_P_SCL")),
+	MTK_PIN(18, "GPIO18", MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO18"),
+		MTK_FUNCTION(1, "B0:SPMI_P_SDA")),
+	MTK_PIN(19, "GPIO19", MTK_EINT_FUNCTION(0, 19), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO19"),
+		MTK_FUNCTION(1, "B0:TP_GPIO29_AO"),
+		MTK_FUNCTION(8, "I0:AVB_CLK2")),
+	MTK_PIN(20, "GPIO20", MTK_EINT_FUNCTION(0, 20), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO20"),
+		MTK_FUNCTION(1, "B0:TP_GPIO30_AO"),
+		MTK_FUNCTION(8, "O:SOC_ERR_inv")),
+	MTK_PIN(21, "GPIO21", MTK_EINT_FUNCTION(0, 21), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO21"),
+		MTK_FUNCTION(1, "B1:PROCHOT")),
+	MTK_PIN(22, "GPIO22", MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO22"),
+		MTK_FUNCTION(1, "I0:RTC32K_CK")),
+	MTK_PIN(23, "GPIO23", MTK_EINT_FUNCTION(0, 23), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO23"),
+		MTK_FUNCTION(1, "B0:TP_GPIO0_AO")),
+	MTK_PIN(24, "GPIO24", MTK_EINT_FUNCTION(0, 24), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO24"),
+		MTK_FUNCTION(1, "O:SOC_ERR"),
+		MTK_FUNCTION(2, "B0:TP_GPIO1_AO"),
+		MTK_FUNCTION(4, "O:SROOT_GPIO_O"),
+		MTK_FUNCTION(7, "O:DBG_MON_A3")),
+	MTK_PIN(25, "GPIO25", MTK_EINT_FUNCTION(0, 25), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO25"),
+		MTK_FUNCTION(1, "B0:TP_GPIO2_AO"),
+		MTK_FUNCTION(2, "I0:VBUSVALID_0P"),
+		MTK_FUNCTION(4, "I0:SROOT_GPIO_I"),
+		MTK_FUNCTION(7, "O:DBG_MON_A4"),
+		MTK_FUNCTION(8, "O:PCIE_PERSTN_4P")),
+	MTK_PIN(26, "GPIO26", MTK_EINT_FUNCTION(0, 26), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO26"),
+		MTK_FUNCTION(1, "B0:TP_GPIO3_AO"),
+		MTK_FUNCTION(2, "O:CMMCLK1"),
+		MTK_FUNCTION(4, "B0:SPI0_OSROOT_CLK"),
+		MTK_FUNCTION(7, "O:DBG_MON_A5"),
+		MTK_FUNCTION(8, "O:SPI6_CLK")),
+	MTK_PIN(27, "GPIO27", MTK_EINT_FUNCTION(0, 27), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO27"),
+		MTK_FUNCTION(1, "B0:TP_GPIO4_AO"),
+		MTK_FUNCTION(2, "O:CMMCLK2"),
+		MTK_FUNCTION(4, "I0:SPI0_OSROOT_MI"),
+		MTK_FUNCTION(7, "O:DBG_MON_A6"),
+		MTK_FUNCTION(8, "B0:SPI6_MI")),
+	MTK_PIN(28, "GPIO28", MTK_EINT_FUNCTION(0, 28), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO28"),
+		MTK_FUNCTION(1, "B0:TP_GPIO5_AO"),
+		MTK_FUNCTION(7, "O:DBG_MON_A7"),
+		MTK_FUNCTION(8, "O:SOC_ERR_inv")),
+	MTK_PIN(29, "GPIO29", MTK_EINT_FUNCTION(0, 29), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO29"),
+		MTK_FUNCTION(1, "B1:THERMTRIP")),
+	MTK_PIN(30, "GPIO30", MTK_EINT_FUNCTION(0, 30), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO30"),
+		MTK_FUNCTION(1, "B0:TP_GPIO7_AO"),
+		MTK_FUNCTION(2, "O:CMMCLK0"),
+		MTK_FUNCTION(4, "I0:CLUSTER0_CPUEB_JTAG_TRSTN"),
+		MTK_FUNCTION(6, "I0:OSROOT_GPIO_I"),
+		MTK_FUNCTION(7, "O:DBG_MON_A8"),
+		MTK_FUNCTION(8, "O:ETHER_MDC")),
+	MTK_PIN(31, "GPIO31", MTK_EINT_FUNCTION(0, 31), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO31"),
+		MTK_FUNCTION(1, "B0:TP_GPIO8_AO"),
+		MTK_FUNCTION(2, "O:CMMCLK1"),
+		MTK_FUNCTION(4, "I1:CLUSTER0_CPUEB_JTAG_TMS"),
+		MTK_FUNCTION(6, "O:OSROOT_GPIO_O"),
+		MTK_FUNCTION(7, "O:DBG_MON_A9"),
+		MTK_FUNCTION(8, "B1:ETHER_MDIO")),
+	MTK_PIN(32, "GPIO32", MTK_EINT_FUNCTION(0, 32), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO32"),
+		MTK_FUNCTION(1, "B0:TP_GPIO9_AO"),
+		MTK_FUNCTION(2, "O:CMMCLK4"),
+		MTK_FUNCTION(5, "O:SROOT_UTX"),
+		MTK_FUNCTION(6, "I1:TP_UCTS1_VLP"),
+		MTK_FUNCTION(7, "O:DBG_MON_A10")),
+	MTK_PIN(33, "GPIO33", MTK_EINT_FUNCTION(0, 33), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO33"),
+		MTK_FUNCTION(1, "B0:TP_GPIO10_AO"),
+		MTK_FUNCTION(2, "O:CMMCLK2"),
+		MTK_FUNCTION(3, "I0:VBUSVALID_1P"),
+		MTK_FUNCTION(4, "I1:CLUSTER0_CPUEB_JTAG_TCK"),
+		MTK_FUNCTION(6, "I0:SROOT_TCK"),
+		MTK_FUNCTION(7, "I0:OSROOT_TCK"),
+		MTK_FUNCTION(8, "B0:ETHER_AUX_PPS0")),
+	MTK_PIN(34, "GPIO34", MTK_EINT_FUNCTION(0, 34), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO34"),
+		MTK_FUNCTION(1, "B0:TP_GPIO11_AO"),
+		MTK_FUNCTION(2, "O:CMMCLK4"),
+		MTK_FUNCTION(4, "I1:CLUSTER0_CPUEB_JTAG_TDI"),
+		MTK_FUNCTION(6, "I0:SROOT_TDI"),
+		MTK_FUNCTION(7, "I0:OSROOT_TDI"),
+		MTK_FUNCTION(8, "B0:ETHER_AUX_PPS1")),
+	MTK_PIN(35, "GPIO35", MTK_EINT_FUNCTION(0, 35), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO35"),
+		MTK_FUNCTION(1, "B0:TP_GPIO12_AO"),
+		MTK_FUNCTION(2, "O:SCP_PWM_1_VLP"),
+		MTK_FUNCTION(3, "O:CMMCLK3"),
+		MTK_FUNCTION(4, "O:CLUSTER0_CPUEB_JTAG_TDO"),
+		MTK_FUNCTION(6, "O:SROOT_TDO"),
+		MTK_FUNCTION(7, "O:OSROOT_TDO"),
+		MTK_FUNCTION(8, "B0:ETHER_AUX_PPS2")),
+	MTK_PIN(36, "GPIO36", MTK_EINT_FUNCTION(0, 36), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO36"),
+		MTK_FUNCTION(1, "B0:TP_GPIO22_AO"),
+		MTK_FUNCTION(4, "O:SPI0_OSROOT_MO"),
+		MTK_FUNCTION(5, "I1:SROOT_URX"),
+		MTK_FUNCTION(6, "O:TP_URTS1_VLP"),
+		MTK_FUNCTION(7, "O:DBG_MON_A31"),
+		MTK_FUNCTION(8, "B0:SPI6_MO")),
+	MTK_PIN(37, "GPIO37", MTK_EINT_FUNCTION(0, 37), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO37"),
+		MTK_FUNCTION(1, "B0:TP_GPIO23_AO"),
+		MTK_FUNCTION(2, "O:CMMCLK3"),
+		MTK_FUNCTION(4, "O:SCP_PWM_2_VLP"),
+		MTK_FUNCTION(6, "O:MD32_5_GPIO0"),
+		MTK_FUNCTION(7, "O:DBG_MON_A11"),
+		MTK_FUNCTION(8, "I0:ETHER_INTR")),
+	MTK_PIN(38, "GPIO38", MTK_EINT_FUNCTION(0, 38), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO38"),
+		MTK_FUNCTION(1, "B0:TP_GPIO24_AO"),
+		MTK_FUNCTION(2, "O:SCP_VREQ_VAO"),
+		MTK_FUNCTION(3, "I0:DCA_LSPII_IN"),
+		MTK_FUNCTION(4, "O:SPI0_OSROOT_CSB"),
+		MTK_FUNCTION(8, "O:SPI6_CSB0")),
+	MTK_PIN(39, "GPIO39", MTK_EINT_FUNCTION(0, 39), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO39"),
+		MTK_FUNCTION(1, "B0:TP_GPIO13_AO"),
+		MTK_FUNCTION(2, "O:SCP_PWM_2_VLP"),
+		MTK_FUNCTION(3, "O:CMMCLK0"),
+		MTK_FUNCTION(4, "I0:VBUSVALID_2P"),
+		MTK_FUNCTION(6, "I0:SROOT_TMS"),
+		MTK_FUNCTION(7, "I0:OSROOT_TMS"),
+		MTK_FUNCTION(8, "B0:ETHER_AUX_PPS3")),
+	MTK_PIN(40, "GPIO40", MTK_EINT_FUNCTION(0, 40), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO40"),
+		MTK_FUNCTION(1, "B0:TP_GPIO14_AO"),
+		MTK_FUNCTION(2, "I0:VBUSVALID_1P"),
+		MTK_FUNCTION(3, "O:URTS2"),
+		MTK_FUNCTION(4, "O:TP_URTS2_VLP"),
+		MTK_FUNCTION(5, "O:SPMI_P_TRIG_FLAG"),
+		MTK_FUNCTION(6, "I1:MD32_5_RXD"),
+		MTK_FUNCTION(7, "O:DBG_MON_A13"),
+		MTK_FUNCTION(8, "O:URTS4"),
+		MTK_FUNCTION(9, "I0:I2SIN1_BT_DI"),
+		MTK_FUNCTION(10, "B1:PCIE_CLKREQN_5P")),
+	MTK_PIN(41, "GPIO41", MTK_EINT_FUNCTION(0, 41), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO41"),
+		MTK_FUNCTION(1, "B0:TP_GPIO15_AO"),
+		MTK_FUNCTION(2, "I0:VBUSVALID_0P"),
+		MTK_FUNCTION(3, "I1:UCTS2"),
+		MTK_FUNCTION(4, "I1:TP_UCTS2_VLP"),
+		MTK_FUNCTION(5, "O:SPMI_S_TRIG_FLAG"),
+		MTK_FUNCTION(6, "O:MD32_5_TXD"),
+		MTK_FUNCTION(7, "O:DBG_MON_A12"),
+		MTK_FUNCTION(8, "I1:UCTS4"),
+		MTK_FUNCTION(9, "O:I2SOUT1_BT_DO"),
+		MTK_FUNCTION(10, "B1:PCIE_CLKREQN_6P")),
+	MTK_PIN(42, "GPIO42", MTK_EINT_FUNCTION(0, 42), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO42"),
+		MTK_FUNCTION(1, "B0:TP_GPIO16_AO"),
+		MTK_FUNCTION(3, "O:UTXD2"),
+		MTK_FUNCTION(4, "O:TP_UTXD2_VLP"),
+		MTK_FUNCTION(5, "O:SPMI_M_TRIG_FLAG"),
+		MTK_FUNCTION(6, "I0:SROOT_NTRST"),
+		MTK_FUNCTION(7, "I0:OSROOT_NTRST"),
+		MTK_FUNCTION(9, "B0:I2SIN2_BT_BCK")),
+	MTK_PIN(43, "GPIO43", MTK_EINT_FUNCTION(0, 43), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO43"),
+		MTK_FUNCTION(1, "B0:TP_GPIO17_AO"),
+		MTK_FUNCTION(3, "I1:URXD2"),
+		MTK_FUNCTION(4, "I1:TP_URXD2_VLP"),
+		MTK_FUNCTION(5, "O:MD32_4_TXD"),
+		MTK_FUNCTION(6, "O:MD32PCM_UTXD_AO_VLP"),
+		MTK_FUNCTION(9, "B0:I2SIN2_BT_LRCK")),
+	MTK_PIN(44, "GPIO44", MTK_EINT_FUNCTION(0, 44), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO44"),
+		MTK_FUNCTION(1, "B0:TP_GPIO18_AO"),
+		MTK_FUNCTION(2, "I1:TP_UCTS2_VLP"),
+		MTK_FUNCTION(3, "I1:UCTS2"),
+		MTK_FUNCTION(5, "I1:MD32_4_RXD"),
+		MTK_FUNCTION(6, "I1:MD32PCM_URXD_AO_VLP"),
+		MTK_FUNCTION(9, "I0:I2SIN2_BT_DI")),
+	MTK_PIN(45, "GPIO45", MTK_EINT_FUNCTION(0, 45), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO45"),
+		MTK_FUNCTION(1, "B0:TP_GPIO19_AO"),
+		MTK_FUNCTION(2, "O:TP_URTS2_VLP"),
+		MTK_FUNCTION(3, "O:URTS2"),
+		MTK_FUNCTION(5, "O:MD32_4_GPIO0"),
+		MTK_FUNCTION(9, "O:I2SOUT2_BT_DO")),
+	MTK_PIN(46, "GPIO46", MTK_EINT_FUNCTION(0, 46), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO46"),
+		MTK_FUNCTION(1, "B0:TP_GPIO20_AO"),
+		MTK_FUNCTION(2, "I0:VBUSVALID_2P"),
+		MTK_FUNCTION(3, "O:SCP_VREQ_VAO"),
+		MTK_FUNCTION(4, "O:SCP_PWM_1_VLP"),
+		MTK_FUNCTION(5, "O:SROOT_GPIO_O"),
+		MTK_FUNCTION(6, "O:OSROOT_GPIO_O"),
+		MTK_FUNCTION(8, "B0:DISP_GPIO_N18")),
+	MTK_PIN(47, "GPIO47", MTK_EINT_FUNCTION(0, 47), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO47"),
+		MTK_FUNCTION(1, "B0:TP_GPIO21_AO"),
+		MTK_FUNCTION(5, "I0:SROOT_GPIO_I"),
+		MTK_FUNCTION(6, "I0:OSROOT_GPIO_I"),
+		MTK_FUNCTION(7, "O:DBG_MON_A2"),
+		MTK_FUNCTION(8, "O:UTXD4"),
+		MTK_FUNCTION(9, "B0:I2SIN1_BT_BCK"),
+		MTK_FUNCTION(10, "O:PCIE_PERSTN_5P")),
+	MTK_PIN(48, "GPIO48", MTK_EINT_FUNCTION(0, 48), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO48"),
+		MTK_FUNCTION(1, "O:UTXD0"),
+		MTK_FUNCTION(2, "O:TP_UTXD1_VLP"),
+		MTK_FUNCTION(6, "O:ADSP_UTXD0"),
+		MTK_FUNCTION(7, "O:DBG_MON_A19")),
+	MTK_PIN(49, "GPIO49", MTK_EINT_FUNCTION(0, 49), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO49"),
+		MTK_FUNCTION(1, "I1:URXD0"),
+		MTK_FUNCTION(2, "I1:TP_URXD1_VLP"),
+		MTK_FUNCTION(6, "I1:ADSP_URXD0"),
+		MTK_FUNCTION(7, "O:DBG_MON_A20")),
+	MTK_PIN(50, "GPIO50", MTK_EINT_FUNCTION(0, 50), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO50"),
+		MTK_FUNCTION(1, "O:TP_UTXD2_VLP"),
+		MTK_FUNCTION(2, "O:UTXD2"),
+		MTK_FUNCTION(4, "B0:TP_GPIO26_AO"),
+		MTK_FUNCTION(5, "O:TP_UTXD1_VLP"),
+		MTK_FUNCTION(7, "O:SROOT_UTX")),
+	MTK_PIN(51, "GPIO51", MTK_EINT_FUNCTION(0, 51), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO51"),
+		MTK_FUNCTION(1, "I1:TP_URXD2_VLP"),
+		MTK_FUNCTION(2, "I1:URXD2"),
+		MTK_FUNCTION(4, "B0:TP_GPIO27_AO"),
+		MTK_FUNCTION(5, "I1:TP_URXD1_VLP"),
+		MTK_FUNCTION(7, "I1:SROOT_URX")),
+	MTK_PIN(52, "GPIO52", MTK_EINT_FUNCTION(0, 52), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO52"),
+		MTK_FUNCTION(1, "B1:USB4_L_PD_SCL"),
+		MTK_FUNCTION(7, "O:ADSP_UTXD0"),
+		MTK_FUNCTION(8, "B1:DISP_SCL7"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N16")),
+	MTK_PIN(53, "GPIO53", MTK_EINT_FUNCTION(0, 53), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO53"),
+		MTK_FUNCTION(1, "B1:USB4_L_PD_SDA"),
+		MTK_FUNCTION(5, "O:MD32_7_TXD"),
+		MTK_FUNCTION(6, "O:MD32_6_TXD"),
+		MTK_FUNCTION(7, "I1:ADSP_URXD0"),
+		MTK_FUNCTION(8, "B1:DISP_SDA7"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N17")),
+	MTK_PIN(54, "GPIO54", MTK_EINT_FUNCTION(0, 54), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO54"),
+		MTK_FUNCTION(1, "B1:USB4_R_PD_SCL"),
+		MTK_FUNCTION(5, "I1:MD32_7_RXD"),
+		MTK_FUNCTION(6, "I1:USB4_L_PAR_SCL"),
+		MTK_FUNCTION(7, "O:SPBM_UTXD_AO_VLP"),
+		MTK_FUNCTION(8, "B1:CSIDES_4VC_SCL13")),
+	MTK_PIN(55, "GPIO55", MTK_EINT_FUNCTION(0, 55), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO55"),
+		MTK_FUNCTION(1, "B1:USB4_R_PD_SDA"),
+		MTK_FUNCTION(5, "O:MD32_7_GPIO0"),
+		MTK_FUNCTION(6, "B1:USB4_L_PAR_SDA"),
+		MTK_FUNCTION(7, "I1:SPBM_URXD_AO_VLP"),
+		MTK_FUNCTION(8, "B1:CSIDES_4VC_SDA13")),
+	MTK_PIN(56, "GPIO56", MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO56"),
+		MTK_FUNCTION(1, "B0:SPMI_S_SCL")),
+	MTK_PIN(57, "GPIO57", MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO57"),
+		MTK_FUNCTION(1, "B0:SPMI_S_SDA")),
+	MTK_PIN(58, "GPIO58", MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO58"),
+		MTK_FUNCTION(1, "O:WATCHDOG")),
+	MTK_PIN(59, "GPIO59", MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO59"),
+		MTK_FUNCTION(1, "B0:PAD_RESET_DRAM_0")),
+	MTK_PIN(60, "GPIO60", MTK_EINT_FUNCTION(0, 60), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO60"),
+		MTK_FUNCTION(1, "B1:I2C_SCL0"),
+		MTK_FUNCTION(5, "O:MD32_2_TXD"),
+		MTK_FUNCTION(6, "O:MD32_3_TXD")),
+	MTK_PIN(61, "GPIO61", MTK_EINT_FUNCTION(0, 61), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO61"),
+		MTK_FUNCTION(1, "B1:I2C_SDA0"),
+		MTK_FUNCTION(5, "I1:MD32_2_RXD"),
+		MTK_FUNCTION(6, "I1:MD32_3_RXD")),
+	MTK_PIN(62, "GPIO62", MTK_EINT_FUNCTION(0, 62), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO62"),
+		MTK_FUNCTION(1, "I0:DMIC0_DAT"),
+		MTK_FUNCTION(2, "B1:I2C_SCL6"),
+		MTK_FUNCTION(6, "O:TP_UTXD1_VLP"),
+		MTK_FUNCTION(7, "O:DBG_MON_B0"),
+		MTK_FUNCTION(8, "B0:I2SIN4_BT_BCK"),
+		MTK_FUNCTION(9, "O:SPI4_CLK")),
+	MTK_PIN(63, "GPIO63", MTK_EINT_FUNCTION(0, 63), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO63"),
+		MTK_FUNCTION(1, "O:DMIC0_CLK"),
+		MTK_FUNCTION(2, "B1:I2C_SDA6"),
+		MTK_FUNCTION(6, "I1:TP_URXD1_VLP"),
+		MTK_FUNCTION(7, "O:DBG_MON_B1"),
+		MTK_FUNCTION(8, "B0:I2SIN4_BT_LRCK"),
+		MTK_FUNCTION(9, "B0:SPI4_MI")),
+	MTK_PIN(64, "GPIO64", MTK_EINT_FUNCTION(0, 64), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO64"),
+		MTK_FUNCTION(1, "I0:DMIC1_DAT"),
+		MTK_FUNCTION(2, "B1:I2C_SCL7"),
+		MTK_FUNCTION(5, "O:MD32_2_GPIO0"),
+		MTK_FUNCTION(6, "O:MD32_3_GPIO0"),
+		MTK_FUNCTION(7, "O:DBG_MON_B2"),
+		MTK_FUNCTION(8, "I0:I2SIN4_BT_DI"),
+		MTK_FUNCTION(9, "B0:SPI4_MO")),
+	MTK_PIN(65, "GPIO65", MTK_EINT_FUNCTION(0, 65), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO65"),
+		MTK_FUNCTION(1, "O:DMIC1_CLK"),
+		MTK_FUNCTION(2, "B1:I2C_SDA7"),
+		MTK_FUNCTION(7, "O:DBG_MON_B3"),
+		MTK_FUNCTION(8, "O:I2SOUT4_BT_DO"),
+		MTK_FUNCTION(9, "O:SPI4_CSB0")),
+	MTK_PIN(66, "GPIO66", MTK_EINT_FUNCTION(0, 66), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO66"),
+		MTK_FUNCTION(1, "O:SOUNDWIRE0_CK"),
+		MTK_FUNCTION(2, "O:I2SIN1_MCK"),
+		MTK_FUNCTION(3, "I1:TP_UCTS0_VLP"),
+		MTK_FUNCTION(4, "O:SPI_HID_IRQ_S_MON0"),
+		MTK_FUNCTION(7, "O:VADSP_UTXD0"),
+		MTK_FUNCTION(8, "O:I2SIN_DIR2_MCK"),
+		MTK_FUNCTION(9, "I0:I2SIN_DIR2_DI1"),
+		MTK_FUNCTION(10, "B0:DISP_GPIO_N23")),
+	MTK_PIN(67, "GPIO67", MTK_EINT_FUNCTION(0, 67), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO67"),
+		MTK_FUNCTION(1, "B0:SOUNDWIRE0_D0"),
+		MTK_FUNCTION(2, "B0:I2SIN1_LRCK"),
+		MTK_FUNCTION(3, "O:TP_URTS0_VLP"),
+		MTK_FUNCTION(7, "I1:VADSP_URXD0"),
+		MTK_FUNCTION(8, "O:I2SIN_DIR2_LRCK")),
+	MTK_PIN(68, "GPIO68", MTK_EINT_FUNCTION(0, 68), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO68"),
+		MTK_FUNCTION(1, "O:SCP_PWM_0_VLP"),
+		MTK_FUNCTION(2, "O:PWM_VLP"),
+		MTK_FUNCTION(3, "B0:TP_GPIO28_AO"),
+		MTK_FUNCTION(8, "I0:VBUSVALID_1P"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N16")),
+	MTK_PIN(69, "GPIO69", MTK_EINT_FUNCTION(0, 69), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO69"),
+		MTK_FUNCTION(2, "O:DISP_VSYNC4"),
+		MTK_FUNCTION(3, "O:DISP_VSYNC5"),
+		MTK_FUNCTION(6, "O:FRSYNC3")),
+	MTK_PIN(70, "GPIO70", MTK_EINT_FUNCTION(0, 70), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO70"),
+		MTK_FUNCTION(1, "B1:SCP_SCL0"),
+		MTK_FUNCTION(4, "I0:VADSP_JTAG0_TCK"),
+		MTK_FUNCTION(5, "I1:PCIE4_USB3_PAR_SCL"),
+		MTK_FUNCTION(6, "I1:SCP_JTAG0_TCK_VLP"),
+		MTK_FUNCTION(7, "B1:SROOT_SCL"),
+		MTK_FUNCTION(8, "B1:DISP_SCL3"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N24")),
+	MTK_PIN(71, "GPIO71", MTK_EINT_FUNCTION(0, 71), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO71"),
+		MTK_FUNCTION(1, "B1:SCP_SDA0"),
+		MTK_FUNCTION(4, "I1:VADSP_JTAG0_TMS"),
+		MTK_FUNCTION(5, "B1:PCIE4_USB3_PAR_SDA"),
+		MTK_FUNCTION(6, "B1:SCP_JTAG0_TMS_VLP"),
+		MTK_FUNCTION(7, "B1:SROOT_SDA"),
+		MTK_FUNCTION(8, "B1:DISP_SDA3"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N25")),
+	MTK_PIN(72, "GPIO72", MTK_EINT_FUNCTION(0, 72), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO72"),
+		MTK_FUNCTION(1, "B1:SCP_SCL2"),
+		MTK_FUNCTION(2, "B1:I3C_HCI_AO_SCL"),
+		MTK_FUNCTION(4, "I1:VADSP_JTAG0_TDI"),
+		MTK_FUNCTION(5, "I1:PCIE5_PAR_SCL"),
+		MTK_FUNCTION(6, "I1:SCP_JTAG0_TDI_VLP"),
+		MTK_FUNCTION(7, "O:OSROOT_UTX"),
+		MTK_FUNCTION(8, "B1:CSIDES_4VC_SCL10")),
+	MTK_PIN(73, "GPIO73", MTK_EINT_FUNCTION(0, 73), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO73"),
+		MTK_FUNCTION(1, "B1:SCP_SDA2"),
+		MTK_FUNCTION(2, "B1:I3C_HCI_AO_SDA"),
+		MTK_FUNCTION(4, "O:VADSP_JTAG0_TDO"),
+		MTK_FUNCTION(5, "B1:PCIE5_PAR_SDA"),
+		MTK_FUNCTION(6, "O:SCP_JTAG0_TDO_VLP"),
+		MTK_FUNCTION(7, "I1:OSROOT_URX"),
+		MTK_FUNCTION(8, "B1:CSIDES_4VC_SDA10")),
+	MTK_PIN(74, "GPIO74", MTK_EINT_FUNCTION(0, 74), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO74"),
+		MTK_FUNCTION(1, "I0:SCP_SPIS0_SCK"),
+		MTK_FUNCTION(2, "O:SPI2_A_CLK"),
+		MTK_FUNCTION(3, "O:SCP_SPIM0_CK"),
+		MTK_FUNCTION(4, "I1:SPM_JTAG_TCK_VLP"),
+		MTK_FUNCTION(5, "I1:SSPM_JTAG_TCK_VLP"),
+		MTK_FUNCTION(6, "I1:SPBM_JTAG_TCK_VLP"),
+		MTK_FUNCTION(7, "I0:OSROOT_TCK"),
+		MTK_FUNCTION(8, "O:TP_UTXD0_VLP")),
+	MTK_PIN(75, "GPIO75", MTK_EINT_FUNCTION(0, 75), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO75"),
+		MTK_FUNCTION(1, "B0:SCP_SPIS0_SIO0"),
+		MTK_FUNCTION(2, "B0:SPI2_A_MO"),
+		MTK_FUNCTION(3, "B0:SCP_SPIM0_SIO0"),
+		MTK_FUNCTION(4, "I1:SPM_JTAG_TDI_VLP"),
+		MTK_FUNCTION(5, "I1:SSPM_JTAG_TDI_VLP"),
+		MTK_FUNCTION(6, "I1:SPBM_JTAG_TDI_VLP"),
+		MTK_FUNCTION(7, "I0:OSROOT_TDI"),
+		MTK_FUNCTION(8, "I1:TP_URXD0_VLP")),
+	MTK_PIN(76, "GPIO76", MTK_EINT_FUNCTION(0, 76), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO76"),
+		MTK_FUNCTION(1, "B0:SCP_SPIS0_SIO1"),
+		MTK_FUNCTION(2, "B0:SPI2_A_MI"),
+		MTK_FUNCTION(3, "B0:SCP_SPIM0_SIO1"),
+		MTK_FUNCTION(4, "B1:SPM_JTAG_TDO_VLP"),
+		MTK_FUNCTION(5, "O:SSPM_JTAG_TDO_VLP"),
+		MTK_FUNCTION(6, "O:SPBM_JTAG_TDO_VLP"),
+		MTK_FUNCTION(7, "O:OSROOT_TDO"),
+		MTK_FUNCTION(8, "O:TP_URTS0_VLP")),
+	MTK_PIN(77, "GPIO77", MTK_EINT_FUNCTION(0, 77), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO77"),
+		MTK_FUNCTION(1, "B0:SCP_SPIS0_SIO2"),
+		MTK_FUNCTION(2, "B0:SPI2_A_WP"),
+		MTK_FUNCTION(3, "B0:SCP_SPIM0_SIO2"),
+		MTK_FUNCTION(4, "I1:SPM_JTAG_TMS_VLP"),
+		MTK_FUNCTION(5, "I1:SSPM_JTAG_TMS_VLP"),
+		MTK_FUNCTION(6, "I1:SPBM_JTAG_TMS_VLP"),
+		MTK_FUNCTION(7, "I0:OSROOT_TMS")),
+	MTK_PIN(78, "GPIO78", MTK_EINT_FUNCTION(0, 78), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO78"),
+		MTK_FUNCTION(1, "B0:SCP_SPIS0_SIO3"),
+		MTK_FUNCTION(2, "B0:SPI2_A_HOLD"),
+		MTK_FUNCTION(3, "B0:SCP_SPIM0_SIO3"),
+		MTK_FUNCTION(4, "I0:SPM_JTAG_TRSTN_VLP"),
+		MTK_FUNCTION(5, "I0:SSPM_JTAG_TRSTN_VLP"),
+		MTK_FUNCTION(6, "I0:SPBM_JTAG_TRSTN_VLP"),
+		MTK_FUNCTION(7, "I0:OSROOT_NTRST")),
+	MTK_PIN(79, "GPIO79", MTK_EINT_FUNCTION(0, 79), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO79"),
+		MTK_FUNCTION(1, "I1:SCP_SPIS0_CS"),
+		MTK_FUNCTION(2, "O:SPI2_A_CSB"),
+		MTK_FUNCTION(3, "O:SCP_SPIM0_CS"),
+		MTK_FUNCTION(4, "I1:VADSP_JTAG0_TRSTN"),
+		MTK_FUNCTION(6, "I0:SCP_JTAG0_TRSTN_VLP"),
+		MTK_FUNCTION(8, "I1:TP_UCTS0_VLP")),
+	MTK_PIN(80, "GPIO80", MTK_EINT_FUNCTION(0, 80), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO80"),
+		MTK_FUNCTION(1, "O:SPI0_CLK"),
+		MTK_FUNCTION(4, "I1:SSPM_JTAG_TCK_VLP"),
+		MTK_FUNCTION(5, "I0:VADSP_JTAG0_TCK"),
+		MTK_FUNCTION(6, "I1:SPM_JTAG_TCK_VLP"),
+		MTK_FUNCTION(7, "I1:SCP_JTAG0_TCK_VLP"),
+		MTK_FUNCTION(8, "I0:AP_SPIS0_SCK"),
+		MTK_FUNCTION(9, "I1:UCTS2")),
+	MTK_PIN(81, "GPIO81", MTK_EINT_FUNCTION(0, 81), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO81"),
+		MTK_FUNCTION(1, "B0:SPI0_MI"),
+		MTK_FUNCTION(4, "I1:SSPM_JTAG_TDI_VLP"),
+		MTK_FUNCTION(5, "I1:VADSP_JTAG0_TDI"),
+		MTK_FUNCTION(6, "I1:SPM_JTAG_TDI_VLP"),
+		MTK_FUNCTION(7, "I1:SCP_JTAG0_TDI_VLP"),
+		MTK_FUNCTION(8, "B0:AP_SPIS0_MISO"),
+		MTK_FUNCTION(9, "O:URTS2")),
+	MTK_PIN(82, "GPIO82", MTK_EINT_FUNCTION(0, 82), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO82"),
+		MTK_FUNCTION(1, "B0:SPI0_MO"),
+		MTK_FUNCTION(4, "O:SSPM_JTAG_TDO_VLP"),
+		MTK_FUNCTION(5, "O:VADSP_JTAG0_TDO"),
+		MTK_FUNCTION(6, "B1:SPM_JTAG_TDO_VLP"),
+		MTK_FUNCTION(7, "O:SCP_JTAG0_TDO_VLP"),
+		MTK_FUNCTION(8, "B0:AP_SPIS0_MOSI"),
+		MTK_FUNCTION(9, "O:UTXD2")),
+	MTK_PIN(83, "GPIO83", MTK_EINT_FUNCTION(0, 83), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO83"),
+		MTK_FUNCTION(1, "O:SPI0_CSB0"),
+		MTK_FUNCTION(4, "I1:SSPM_JTAG_TMS_VLP"),
+		MTK_FUNCTION(5, "I1:VADSP_JTAG0_TMS"),
+		MTK_FUNCTION(6, "I1:SPM_JTAG_TMS_VLP"),
+		MTK_FUNCTION(7, "B1:SCP_JTAG0_TMS_VLP"),
+		MTK_FUNCTION(8, "I1:AP_SPIS0_CS"),
+		MTK_FUNCTION(9, "I1:URXD2")),
+	MTK_PIN(84, "GPIO84", MTK_EINT_FUNCTION(0, 84), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO84"),
+		MTK_FUNCTION(1, "O:SPI0_CSB1"),
+		MTK_FUNCTION(4, "I0:SSPM_JTAG_TRSTN_VLP"),
+		MTK_FUNCTION(5, "I1:VADSP_JTAG0_TRSTN"),
+		MTK_FUNCTION(6, "I0:SPM_JTAG_TRSTN_VLP"),
+		MTK_FUNCTION(7, "I0:SCP_JTAG0_TRSTN_VLP"),
+		MTK_FUNCTION(8, "B0:DISP_GPIO_N17"),
+		MTK_FUNCTION(9, "O:SOC_ERR_inv")),
+	MTK_PIN(85, "GPIO85", MTK_EINT_FUNCTION(0, 85), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO85"),
+		MTK_FUNCTION(1, "O:DISP_PWM"),
+		MTK_FUNCTION(2, "O:DISP_HSYNC5"),
+		MTK_FUNCTION(3, "O:DISP_HSYNC4"),
+		MTK_FUNCTION(4, "B1:U4CP_JTAG_TMS"),
+		MTK_FUNCTION(5, "I0:CLUSTER0_UDI_TDI_1"),
+		MTK_FUNCTION(6, "O:FRSYNC1"),
+		MTK_FUNCTION(7, "O:DBG_MON_A21")),
+	MTK_PIN(86, "GPIO86", MTK_EINT_FUNCTION(0, 86), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO86"),
+		MTK_FUNCTION(1, "O:DISP_BL_EN"),
+		MTK_FUNCTION(2, "O:DISP_VSYNC5"),
+		MTK_FUNCTION(3, "O:DISP_VSYNC4"),
+		MTK_FUNCTION(4, "I1:U4CP_JTAG_TDI"),
+		MTK_FUNCTION(5, "O:CLUSTER0_UDI_TDO_1"),
+		MTK_FUNCTION(6, "O:FRSYNC2"),
+		MTK_FUNCTION(7, "O:DBG_MON_A22")),
+	MTK_PIN(87, "GPIO87", MTK_EINT_FUNCTION(0, 87), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO87"),
+		MTK_FUNCTION(1, "B0:DISP_GPIO_N1"),
+		MTK_FUNCTION(4, "O:U4CP_JTAG_TDO"),
+		MTK_FUNCTION(5, "I0:CLUSTER0_UDI_TDI_2"),
+		MTK_FUNCTION(7, "O:DBG_MON_A23")),
+	MTK_PIN(88, "GPIO88", MTK_EINT_FUNCTION(0, 88), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO88"),
+		MTK_FUNCTION(1, "B1:DISP_SCL1"),
+		MTK_FUNCTION(4, "I1:U4CP_JTAG_TCK"),
+		MTK_FUNCTION(5, "I1:EDP0_SCL"),
+		MTK_FUNCTION(6, "I1:HDMITX_DBG_I2C_SCL"),
+		MTK_FUNCTION(8, "B1:I2C_SCL15")),
+	MTK_PIN(89, "GPIO89", MTK_EINT_FUNCTION(0, 89), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO89"),
+		MTK_FUNCTION(1, "B1:DISP_SDA1"),
+		MTK_FUNCTION(4, "I0:U4CP_JTAG_TRSTN"),
+		MTK_FUNCTION(5, "B1:EDP0_SDA"),
+		MTK_FUNCTION(6, "B1:HDMITX_DBG_I2C_SDA"),
+		MTK_FUNCTION(8, "B1:I2C_SDA15")),
+	MTK_PIN(90, "GPIO90", MTK_EINT_FUNCTION(0, 90), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO90"),
+		MTK_FUNCTION(1, "B0:DISP_GPIO_N2"),
+		MTK_FUNCTION(4, "O:CLKM0_C"),
+		MTK_FUNCTION(5, "O:CLUSTER0_UDI_TDO_2"),
+		MTK_FUNCTION(6, "O:FRSYNC5"),
+		MTK_FUNCTION(7, "O:DBG_MON_A24"),
+		MTK_FUNCTION(8, "B0:SPI6_IO2"),
+		MTK_FUNCTION(9, "O:PCIE_PERSTN_5P")),
+	MTK_PIN(91, "GPIO91", MTK_EINT_FUNCTION(0, 91), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO91"),
+		MTK_FUNCTION(4, "O:CLKM1_C"),
+		MTK_FUNCTION(5, "I0:CLUSTER0_UDI_TDI_3"),
+		MTK_FUNCTION(6, "O:FRSYNC6"),
+		MTK_FUNCTION(7, "O:DBG_MON_A25"),
+		MTK_FUNCTION(8, "B0:SPI6_IO3"),
+		MTK_FUNCTION(9, "O:PCIE_PERSTN_6P"),
+		MTK_FUNCTION(10, "B0:DISP_GPIO_N24")),
+	MTK_PIN(92, "GPIO92", MTK_EINT_FUNCTION(0, 92), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO92"),
+		MTK_FUNCTION(1, "B1:PMIF_I2C_SCL"),
+		MTK_FUNCTION(2, "O:TP_UTXD0_VLP"),
+		MTK_FUNCTION(3, "O:SSPM_UTXD_AO_VLP"),
+		MTK_FUNCTION(4, "O:TSFDC_FOUT"),
+		MTK_FUNCTION(5, "O:CLUSTER0_UDI_TDO_3"),
+		MTK_FUNCTION(7, "O:DBG_MON_A26"),
+		MTK_FUNCTION(8, "B1:I2C_SCL5")),
+	MTK_PIN(93, "GPIO93", MTK_EINT_FUNCTION(0, 93), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO93"),
+		MTK_FUNCTION(1, "B1:PMIF_I2C_SDA"),
+		MTK_FUNCTION(2, "I1:TP_URXD0_VLP"),
+		MTK_FUNCTION(3, "I1:SSPM_URXD_AO_VLP"),
+		MTK_FUNCTION(4, "O:TSFDC_SDO"),
+		MTK_FUNCTION(5, "I0:CLUSTER0_UDI_TDI_4"),
+		MTK_FUNCTION(7, "O:DBG_MON_A27"),
+		MTK_FUNCTION(8, "B1:I2C_SDA5")),
+	MTK_PIN(94, "GPIO94", MTK_EINT_FUNCTION(0, 94), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO94"),
+		MTK_FUNCTION(1, "O:CMFLASH0"),
+		MTK_FUNCTION(2, "B0:I2SOUT6_BCK"),
+		MTK_FUNCTION(4, "I0:TSFDC_26M"),
+		MTK_FUNCTION(5, "O:CLUSTER0_UDI_TDO_4"),
+		MTK_FUNCTION(6, "I1:HFRP_UCTS0"),
+		MTK_FUNCTION(7, "O:DBG_MON_A28"),
+		MTK_FUNCTION(8, "I1:UCTS5"),
+		MTK_FUNCTION(9, "O:SPI2_B_CLK"),
+		MTK_FUNCTION(10, "B0:I2SIN6_BCK")),
+	MTK_PIN(95, "GPIO95", MTK_EINT_FUNCTION(0, 95), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO95"),
+		MTK_FUNCTION(1, "O:CMFLASH1"),
+		MTK_FUNCTION(2, "B0:I2SOUT6_LRCK"),
+		MTK_FUNCTION(4, "I0:TSFDC_SCF"),
+		MTK_FUNCTION(5, "I0:CLUSTER0_UDI_TDI_5"),
+		MTK_FUNCTION(6, "O:HFRP_URTS0"),
+		MTK_FUNCTION(7, "O:DBG_MON_A29"),
+		MTK_FUNCTION(8, "O:URTS5"),
+		MTK_FUNCTION(9, "B0:SPI2_B_MI"),
+		MTK_FUNCTION(10, "B0:I2SIN6_LRCK")),
+	MTK_PIN(96, "GPIO96", MTK_EINT_FUNCTION(0, 96), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO96"),
+		MTK_FUNCTION(1, "O:FRSYNC1"),
+		MTK_FUNCTION(2, "O:CMFLASH1"),
+		MTK_FUNCTION(4, "I0:TSFDC_SCK"),
+		MTK_FUNCTION(5, "O:CLUSTER0_UDI_TDO_5"),
+		MTK_FUNCTION(6, "O:HFRP_UTXD0"),
+		MTK_FUNCTION(7, "O:DBG_MON_A30"),
+		MTK_FUNCTION(8, "O:UTXD5"),
+		MTK_FUNCTION(9, "B0:SPI2_B_MO"),
+		MTK_FUNCTION(10, "I0:I2SIN6_DI")),
+	MTK_PIN(97, "GPIO97", MTK_EINT_FUNCTION(0, 97), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO97"),
+		MTK_FUNCTION(1, "O:FRSYNC2"),
+		MTK_FUNCTION(2, "O:CMFLASH0"),
+		MTK_FUNCTION(4, "I0:TSFDC_SDI"),
+		MTK_FUNCTION(5, "I0:CLUSTER0_UDI_TDI_6"),
+		MTK_FUNCTION(6, "I1:HFRP_URXD0"),
+		MTK_FUNCTION(7, "O:U4CP_UTXD"),
+		MTK_FUNCTION(8, "I1:URXD5"),
+		MTK_FUNCTION(9, "O:SPI2_B_CSB0"),
+		MTK_FUNCTION(10, "O:I2SOUT6_DO0")),
+	MTK_PIN(98, "GPIO98", MTK_EINT_FUNCTION(0, 98), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO98"),
+		MTK_FUNCTION(2, "O:CMFLASH2"),
+		MTK_FUNCTION(4, "I0:RG_TSFDC_LDO_EN"),
+		MTK_FUNCTION(5, "O:CLUSTER0_UDI_TDO_6"),
+		MTK_FUNCTION(6, "O:I2SOUT_DIR2_DO"),
+		MTK_FUNCTION(7, "I1:U4CP_URXD"),
+		MTK_FUNCTION(8, "B0:I2SIN1_BT_BCK"),
+		MTK_FUNCTION(10, "O:I2SOUT6_DO1")),
+	MTK_PIN(99, "GPIO99", MTK_EINT_FUNCTION(0, 99), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO99"),
+		MTK_FUNCTION(4, "I0:DA_TSFDC_LDO_MODE"),
+		MTK_FUNCTION(5, "I0:CLUSTER0_UDI_TDI_7"),
+		MTK_FUNCTION(6, "I0:I2SIN_DIR2_DI"),
+		MTK_FUNCTION(7, "O:U4CP_URTS"),
+		MTK_FUNCTION(8, "B0:I2SIN1_BT_LRCK"),
+		MTK_FUNCTION(9, "I0:I2SIN6_DI1"),
+		MTK_FUNCTION(10, "O:I2SOUT6_DO2")),
+	MTK_PIN(100, "GPIO100", MTK_EINT_FUNCTION(0, 100), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO100"),
+		MTK_FUNCTION(1, "I0:MCU_B_PMIC_POC_I"),
+		MTK_FUNCTION(4, "I0:RG_TSFDC_LDO_REFSEL1"),
+		MTK_FUNCTION(5, "O:CLUSTER0_UDI_TDO_7"),
+		MTK_FUNCTION(6, "O:I2SIN_DIR2_BCK"),
+		MTK_FUNCTION(7, "I1:U4CP_UCTS"),
+		MTK_FUNCTION(8, "I0:I2SIN1_BT_DI"),
+		MTK_FUNCTION(9, "B0:I2SOUT6_BCK"),
+		MTK_FUNCTION(10, "O:I2SOUT6_DO3")),
+	MTK_PIN(101, "GPIO101", MTK_EINT_FUNCTION(0, 101), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO101"),
+		MTK_FUNCTION(1, "O:CMFLASH2"),
+		MTK_FUNCTION(2, "O:FRSYNC2"),
+		MTK_FUNCTION(3, "I1:UCTS0"),
+		MTK_FUNCTION(4, "I0:RG_TSFDC_LDO_REFSEL0"),
+		MTK_FUNCTION(5, "I1:U4CP_JTAG_TCK"),
+		MTK_FUNCTION(6, "O:I2SIN_DIR2_LRCK"),
+		MTK_FUNCTION(7, "O:CLKM0_A"),
+		MTK_FUNCTION(8, "O:I2SOUT1_BT_DO"),
+		MTK_FUNCTION(9, "B0:I2SOUT6_LRCK"),
+		MTK_FUNCTION(10, "O:I2SIN6_MCK")),
+	MTK_PIN(102, "GPIO102", MTK_EINT_FUNCTION(0, 102), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO102"),
+		MTK_FUNCTION(1, "O:CMFLASH3"),
+		MTK_FUNCTION(2, "O:FRSYNC1"),
+		MTK_FUNCTION(3, "O:URTS0"),
+		MTK_FUNCTION(4, "O:TSFDC_BG_COMP"),
+		MTK_FUNCTION(5, "B1:U4CP_JTAG_TMS"),
+		MTK_FUNCTION(6, "I0:I2SIN_DMA1_BCK"),
+		MTK_FUNCTION(7, "O:CLKM1_A"),
+		MTK_FUNCTION(8, "B0:I2SIN2_BT_BCK"),
+		MTK_FUNCTION(9, "I1:UCTS4"),
+		MTK_FUNCTION(10, "O:I2SIN_DIR1_BCK")),
+	MTK_PIN(103, "GPIO103", MTK_EINT_FUNCTION(0, 103), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO103"),
+		MTK_FUNCTION(1, "O:FRSYNC3"),
+		MTK_FUNCTION(2, "O:UTXD0"),
+		MTK_FUNCTION(4, "O:CLKM2_B"),
+		MTK_FUNCTION(5, "I1:U4CP_JTAG_TDI"),
+		MTK_FUNCTION(6, "I0:I2SIN_DMA1_LRCK"),
+		MTK_FUNCTION(7, "O:CLKM2_A"),
+		MTK_FUNCTION(8, "B0:I2SIN2_BT_LRCK"),
+		MTK_FUNCTION(9, "O:URTS4"),
+		MTK_FUNCTION(10, "O:I2SIN_DIR1_LRCK")),
+	MTK_PIN(104, "GPIO104", MTK_EINT_FUNCTION(0, 104), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO104"),
+		MTK_FUNCTION(1, "O:FRSYNC4"),
+		MTK_FUNCTION(2, "I1:URXD0"),
+		MTK_FUNCTION(4, "O:CLKM3_B"),
+		MTK_FUNCTION(5, "O:U4CP_JTAG_TDO"),
+		MTK_FUNCTION(7, "O:CLKM3_A"),
+		MTK_FUNCTION(8, "I0:I2SIN2_BT_DI"),
+		MTK_FUNCTION(9, "O:UTXD4"),
+		MTK_FUNCTION(10, "I0:I2SIN_DIR1_DI0")),
+	MTK_PIN(105, "GPIO105", MTK_EINT_FUNCTION(0, 105), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO105"),
+		MTK_FUNCTION(2, "O:CMFLASH3"),
+		MTK_FUNCTION(4, "O:CLKM0_B"),
+		MTK_FUNCTION(5, "I0:U4CP_JTAG_TRSTN"),
+		MTK_FUNCTION(7, "O:PMSR_SMAP"),
+		MTK_FUNCTION(8, "O:I2SOUT2_BT_DO"),
+		MTK_FUNCTION(9, "I1:URXD4"),
+		MTK_FUNCTION(10, "I0:I2SIN_DIR1_DI1")),
+	MTK_PIN(106, "GPIO106", MTK_EINT_FUNCTION(0, 106), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO106"),
+		MTK_FUNCTION(1, "B0:SPINOR_CK")),
+	MTK_PIN(107, "GPIO107", MTK_EINT_FUNCTION(0, 107), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO107"),
+		MTK_FUNCTION(1, "B0:SPINOR_IO0")),
+	MTK_PIN(108, "GPIO108", MTK_EINT_FUNCTION(0, 108), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO108"),
+		MTK_FUNCTION(1, "B0:SPINOR_IO1")),
+	MTK_PIN(109, "GPIO109", MTK_EINT_FUNCTION(0, 109), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO109"),
+		MTK_FUNCTION(1, "B0:SPINOR_IO2")),
+	MTK_PIN(110, "GPIO110", MTK_EINT_FUNCTION(0, 110), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO110"),
+		MTK_FUNCTION(1, "B0:SPINOR_IO3")),
+	MTK_PIN(111, "GPIO111", MTK_EINT_FUNCTION(0, 111), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO111"),
+		MTK_FUNCTION(1, "B1:SPINOR_CS")),
+	MTK_PIN(112, "GPIO112", MTK_EINT_FUNCTION(0, 112), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO112"),
+		MTK_FUNCTION(1, "O:SPI1_CLK"),
+		MTK_FUNCTION(2, "O:HFRP_UTXD0"),
+		MTK_FUNCTION(3, "I0:ADSP_JTAG0_TCK"),
+		MTK_FUNCTION(4, "I0:ADSP_JTAG1_TCK"),
+		MTK_FUNCTION(5, "I1:HFRP_JTAG1_TCK"),
+		MTK_FUNCTION(6, "I0:VADSP_JTAG1_TCK"),
+		MTK_FUNCTION(8, "O:UTXD5"),
+		MTK_FUNCTION(9, "I0:I2SIN6_DI1")),
+	MTK_PIN(113, "GPIO113", MTK_EINT_FUNCTION(0, 113), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO113"),
+		MTK_FUNCTION(1, "B0:SPI1_MI"),
+		MTK_FUNCTION(2, "I1:HFRP_URXD0"),
+		MTK_FUNCTION(3, "I1:ADSP_JTAG0_TMS"),
+		MTK_FUNCTION(4, "I1:ADSP_JTAG1_TMS"),
+		MTK_FUNCTION(5, "I1:HFRP_JTAG1_TMS"),
+		MTK_FUNCTION(6, "I1:VADSP_JTAG1_TMS"),
+		MTK_FUNCTION(8, "I1:URXD5"),
+		MTK_FUNCTION(9, "O:I2SOUT6_DO1")),
+	MTK_PIN(114, "GPIO114", MTK_EINT_FUNCTION(0, 114), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO114"),
+		MTK_FUNCTION(1, "B0:SPI1_MO"),
+		MTK_FUNCTION(2, "I1:HFRP_UCTS0"),
+		MTK_FUNCTION(3, "I1:ADSP_JTAG0_TDI"),
+		MTK_FUNCTION(4, "I1:ADSP_JTAG1_TDI"),
+		MTK_FUNCTION(5, "I1:HFRP_JTAG1_TDI"),
+		MTK_FUNCTION(6, "I1:VADSP_JTAG1_TDI"),
+		MTK_FUNCTION(8, "I1:UCTS5"),
+		MTK_FUNCTION(9, "B0:I2SOUT6_BCK")),
+	MTK_PIN(115, "GPIO115", MTK_EINT_FUNCTION(0, 115), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO115"),
+		MTK_FUNCTION(1, "O:SPI1_CSB0"),
+		MTK_FUNCTION(2, "O:HFRP_URTS0"),
+		MTK_FUNCTION(3, "O:ADSP_JTAG0_TDO"),
+		MTK_FUNCTION(4, "O:ADSP_JTAG1_TDO"),
+		MTK_FUNCTION(5, "O:HFRP_JTAG1_TDO"),
+		MTK_FUNCTION(6, "O:VADSP_JTAG1_TDO"),
+		MTK_FUNCTION(8, "O:URTS5"),
+		MTK_FUNCTION(9, "B0:I2SOUT6_LRCK")),
+	MTK_PIN(116, "GPIO116", MTK_EINT_FUNCTION(0, 116), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO116"),
+		MTK_FUNCTION(1, "O:SPI1_CSB1"),
+		MTK_FUNCTION(3, "I1:ADSP_JTAG0_TRSTN"),
+		MTK_FUNCTION(4, "I1:ADSP_JTAG1_TRSTN"),
+		MTK_FUNCTION(5, "I0:HFRP_JTAG1_TRSTN"),
+		MTK_FUNCTION(6, "I1:VADSP_JTAG1_TRSTN"),
+		MTK_FUNCTION(8, "B0:DISP_GPIO_N21")),
+	MTK_PIN(117, "GPIO117", MTK_EINT_FUNCTION(0, 117), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO117"),
+		MTK_FUNCTION(1, "B1:I2C_SCL1"),
+		MTK_FUNCTION(2, "B1:OSROOT_SCL"),
+		MTK_FUNCTION(4, "O:SPI_CS_S_MON0"),
+		MTK_FUNCTION(5, "I1:USB4_L_PAR_SCL"),
+		MTK_FUNCTION(7, "I1:USB4_R_PAR_SCL"),
+		MTK_FUNCTION(8, "B1:DISP_SCL6"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N30")),
+	MTK_PIN(118, "GPIO118", MTK_EINT_FUNCTION(0, 118), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO118"),
+		MTK_FUNCTION(1, "B1:I2C_SDA1"),
+		MTK_FUNCTION(2, "B1:OSROOT_SDA"),
+		MTK_FUNCTION(4, "O:SPI_SCL_S_MON0"),
+		MTK_FUNCTION(5, "B1:USB4_L_PAR_SDA"),
+		MTK_FUNCTION(7, "B1:USB4_R_PAR_SDA"),
+		MTK_FUNCTION(8, "B1:DISP_SDA6"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N31")),
+	MTK_PIN(119, "GPIO119", MTK_EINT_FUNCTION(0, 119), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO119"),
+		MTK_FUNCTION(1, "B1:I2C_SCL2"),
+		MTK_FUNCTION(4, "I1:HDMITX_DBG_I2C_SCL"),
+		MTK_FUNCTION(5, "O:CLUSTER0_MBISTREADEN_TRIGGER"),
+		MTK_FUNCTION(7, "O:PMSR_SMAP_MAX"),
+		MTK_FUNCTION(8, "B1:DISP_SCL1"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N22")),
+	MTK_PIN(120, "GPIO120", MTK_EINT_FUNCTION(0, 120), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO120"),
+		MTK_FUNCTION(1, "B1:I2C_SDA2"),
+		MTK_FUNCTION(4, "B1:HDMITX_DBG_I2C_SDA"),
+		MTK_FUNCTION(5, "O:CLUSTER0_MBISTWRITEEN_TRIGGER"),
+		MTK_FUNCTION(7, "O:PMSR_SMAP_MAX_W"),
+		MTK_FUNCTION(8, "B1:DISP_SDA1"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N23")),
+	MTK_PIN(121, "GPIO121", MTK_EINT_FUNCTION(0, 121), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO121"),
+		MTK_FUNCTION(1, "B1:I3C_SCL0"),
+		MTK_FUNCTION(2, "B1:I3C_HCI_0_AO_SCL"),
+		MTK_FUNCTION(4, "I1:PCIE5_PAR_SCL"),
+		MTK_FUNCTION(5, "O:CLUSTER0_AD_ILDO_DTEST0"),
+		MTK_FUNCTION(7, "I1:USB4_R_PAR_SCL"),
+		MTK_FUNCTION(8, "B1:CSIDES_8VC_SCL11")),
+	MTK_PIN(122, "GPIO122", MTK_EINT_FUNCTION(0, 122), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO122"),
+		MTK_FUNCTION(1, "B1:I3C_SDA0"),
+		MTK_FUNCTION(2, "B1:I3C_HCI_0_AO_SDA"),
+		MTK_FUNCTION(4, "B1:PCIE5_PAR_SDA"),
+		MTK_FUNCTION(5, "O:CLUSTER0_AD_ILDO_DTEST1"),
+		MTK_FUNCTION(7, "B1:USB4_R_PAR_SDA"),
+		MTK_FUNCTION(8, "B1:CSIDES_8VC_SDA11")),
+	MTK_PIN(123, "GPIO123", MTK_EINT_FUNCTION(0, 123), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO123"),
+		MTK_FUNCTION(1, "B1:I3C_SCL1"),
+		MTK_FUNCTION(2, "B1:I3C_HCI_1_AO_SCL"),
+		MTK_FUNCTION(4, "I1:PCIE4_USB3_PAR_SCL"),
+		MTK_FUNCTION(5, "O:CLUSTER0_AD_ILDO_DTEST2"),
+		MTK_FUNCTION(7, "O:VADSP_UTXD0"),
+		MTK_FUNCTION(8, "B1:CSIDES_8VC_SCL12")),
+	MTK_PIN(124, "GPIO124", MTK_EINT_FUNCTION(0, 124), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO124"),
+		MTK_FUNCTION(1, "B1:I3C_SDA1"),
+		MTK_FUNCTION(2, "B1:I3C_HCI_1_AO_SDA"),
+		MTK_FUNCTION(4, "B1:PCIE4_USB3_PAR_SDA"),
+		MTK_FUNCTION(5, "O:CLUSTER0_AD_ILDO_DTEST3"),
+		MTK_FUNCTION(7, "I1:VADSP_URXD0"),
+		MTK_FUNCTION(8, "B1:CSIDES_8VC_SDA12")),
+	MTK_PIN(125, "GPIO125", MTK_EINT_FUNCTION(0, 125), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO125"),
+		MTK_FUNCTION(1, "O:I2SIN1_MCK"),
+		MTK_FUNCTION(2, "O:I2SIN0_MCK"),
+		MTK_FUNCTION(4, "I0:TSFDC_SCK"),
+		MTK_FUNCTION(6, "O:CLKM2_C"),
+		MTK_FUNCTION(8, "O:I2SIN6_MCK"),
+		MTK_FUNCTION(9, "O:I2SOUT_DIR2_DO1"),
+		MTK_FUNCTION(10, "B0:DISP_GPIO_N20")),
+	MTK_PIN(126, "GPIO126", MTK_EINT_FUNCTION(0, 126), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO126"),
+		MTK_FUNCTION(1, "O:SOUNDWIRE1_CK"),
+		MTK_FUNCTION(2, "B0:I2SIN1_BCK"),
+		MTK_FUNCTION(4, "O:CLUSTER0_AD_ILDO_DTEST4"),
+		MTK_FUNCTION(6, "I0:ADSP_JTAG0_TCK"),
+		MTK_FUNCTION(7, "I1:HFRP_JTAG0_TCK"),
+		MTK_FUNCTION(8, "O:I2SIN_DIR2_BCK")),
+	MTK_PIN(127, "GPIO127", MTK_EINT_FUNCTION(0, 127), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO127"),
+		MTK_FUNCTION(1, "B0:SOUNDWIRE1_D0"),
+		MTK_FUNCTION(2, "O:I2SOUT1_DO"),
+		MTK_FUNCTION(4, "O:CLUSTER0_AD_ILDO_DTEST5"),
+		MTK_FUNCTION(6, "I1:ADSP_JTAG0_TMS"),
+		MTK_FUNCTION(7, "I1:HFRP_JTAG0_TMS"),
+		MTK_FUNCTION(8, "O:I2SOUT_DIR2_DO")),
+	MTK_PIN(128, "GPIO128", MTK_EINT_FUNCTION(0, 128), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO128"),
+		MTK_FUNCTION(1, "B0:SOUNDWIRE1_D1"),
+		MTK_FUNCTION(2, "I0:I2SIN1_DI"),
+		MTK_FUNCTION(4, "O:CLUSTER0_AD_ILDO_DTEST6"),
+		MTK_FUNCTION(6, "I1:ADSP_JTAG0_TDI"),
+		MTK_FUNCTION(7, "I1:HFRP_JTAG0_TDI"),
+		MTK_FUNCTION(8, "I0:I2SIN_DIR2_DI")),
+	MTK_PIN(129, "GPIO129", MTK_EINT_FUNCTION(0, 129), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO129"),
+		MTK_FUNCTION(1, "B0:SOUNDWIRE1_D2"),
+		MTK_FUNCTION(2, "B0:I2SIN1_LRCK"),
+		MTK_FUNCTION(4, "O:CLUSTER0_AD_ILDO_DTEST7"),
+		MTK_FUNCTION(6, "O:ADSP_JTAG0_TDO"),
+		MTK_FUNCTION(7, "O:HFRP_JTAG0_TDO")),
+	MTK_PIN(130, "GPIO130", MTK_EINT_FUNCTION(0, 130), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO130"),
+		MTK_FUNCTION(1, "B0:I2SIN0_BCK"),
+		MTK_FUNCTION(3, "O:DISP_CLKM0"),
+		MTK_FUNCTION(4, "I0:TSFDC_26M"),
+		MTK_FUNCTION(5, "I0:RG_TSFDC_LDO_EN"),
+		MTK_FUNCTION(6, "O:CCU0_URTS"),
+		MTK_FUNCTION(7, "O:DBG_MON_B4"),
+		MTK_FUNCTION(8, "B0:I2SIN6_BCK")),
+	MTK_PIN(131, "GPIO131", MTK_EINT_FUNCTION(0, 131), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO131"),
+		MTK_FUNCTION(1, "I0:I2SIN0_DI"),
+		MTK_FUNCTION(3, "O:DISP_CLKM1"),
+		MTK_FUNCTION(4, "O:TSFDC_FOUT"),
+		MTK_FUNCTION(5, "I0:DA_TSFDC_LDO_MODE"),
+		MTK_FUNCTION(6, "I1:CCU0_UCTS"),
+		MTK_FUNCTION(7, "O:DBG_MON_B5"),
+		MTK_FUNCTION(8, "I0:I2SIN6_DI")),
+	MTK_PIN(132, "GPIO132", MTK_EINT_FUNCTION(0, 132), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO132"),
+		MTK_FUNCTION(1, "O:I2SOUT0_DO"),
+		MTK_FUNCTION(3, "O:DISP_CLKM2"),
+		MTK_FUNCTION(4, "O:TSFDC_SDO"),
+		MTK_FUNCTION(5, "I0:RG_TSFDC_LDO_REFSEL1"),
+		MTK_FUNCTION(6, "O:CCU1_URTS"),
+		MTK_FUNCTION(7, "O:DBG_MON_B6"),
+		MTK_FUNCTION(8, "O:I2SOUT6_DO0")),
+	MTK_PIN(133, "GPIO133", MTK_EINT_FUNCTION(0, 133), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO133"),
+		MTK_FUNCTION(1, "B0:I2SIN0_LRCK"),
+		MTK_FUNCTION(3, "O:DISP_CLKM3"),
+		MTK_FUNCTION(4, "I0:TSFDC_SCF"),
+		MTK_FUNCTION(5, "I0:RG_TSFDC_LDO_REFSEL0"),
+		MTK_FUNCTION(6, "I1:CCU1_UCTS"),
+		MTK_FUNCTION(7, "O:DBG_MON_B7"),
+		MTK_FUNCTION(8, "B0:I2SIN6_LRCK")),
+	MTK_PIN(134, "GPIO134", MTK_EINT_FUNCTION(0, 134), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO134"),
+		MTK_FUNCTION(1, "B1:SCP_SCL1"),
+		MTK_FUNCTION(2, "B1:VADSP_SCL0"),
+		MTK_FUNCTION(3, "B1:SROOT_SCL"),
+		MTK_FUNCTION(4, "O:SSPM_UTXD_AO_VLP"),
+		MTK_FUNCTION(5, "O:SPI_HID_IRQ_S_MON0"),
+		MTK_FUNCTION(6, "I1:ADSP_JTAG0_TRSTN"),
+		MTK_FUNCTION(7, "O:DBG_MON_B8"),
+		MTK_FUNCTION(8, "B1:DISP_SCL4"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N26"),
+		MTK_FUNCTION(10, "I1:UFS_MPHY_SCL")),
+	MTK_PIN(135, "GPIO135", MTK_EINT_FUNCTION(0, 135), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO135"),
+		MTK_FUNCTION(1, "B1:SCP_SDA1"),
+		MTK_FUNCTION(2, "B1:VADSP_SDA0"),
+		MTK_FUNCTION(3, "B1:SROOT_SDA"),
+		MTK_FUNCTION(4, "I1:SSPM_URXD_AO_VLP"),
+		MTK_FUNCTION(7, "O:DBG_MON_B9"),
+		MTK_FUNCTION(8, "B1:DISP_SDA4"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N27"),
+		MTK_FUNCTION(10, "B1:UFS_MPHY_SDA")),
+	MTK_PIN(136, "GPIO136", MTK_EINT_FUNCTION(0, 136), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO136"),
+		MTK_FUNCTION(1, "O:FRSYNC3"),
+		MTK_FUNCTION(2, "B1:SCP_SCL3"),
+		MTK_FUNCTION(3, "B1:VADSP_SCL0"),
+		MTK_FUNCTION(4, "B1:SCP_SCL1"),
+		MTK_FUNCTION(7, "O:DBG_MON_B10"),
+		MTK_FUNCTION(8, "B1:DISP_SCL5"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N28"),
+		MTK_FUNCTION(10, "B1:CSIDES_1VC_SCL14")),
+	MTK_PIN(137, "GPIO137", MTK_EINT_FUNCTION(0, 137), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO137"),
+		MTK_FUNCTION(1, "O:FRSYNC4"),
+		MTK_FUNCTION(2, "B1:SCP_SDA3"),
+		MTK_FUNCTION(3, "B1:VADSP_SDA0"),
+		MTK_FUNCTION(4, "B1:SCP_SDA1"),
+		MTK_FUNCTION(7, "O:DBG_MON_B11"),
+		MTK_FUNCTION(8, "B1:DISP_SDA5"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N29"),
+		MTK_FUNCTION(10, "B1:CSIDES_1VC_SDA14")),
+	MTK_PIN(138, "GPIO138", MTK_EINT_FUNCTION(0, 138), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO138"),
+		MTK_FUNCTION(1, "B0:DISP_GPIO_N3"),
+		MTK_FUNCTION(2, "I0:DCA_LSPII_IN"),
+		MTK_FUNCTION(4, "O:CLKM1_B"),
+		MTK_FUNCTION(7, "O:DBG_MON_B12"),
+		MTK_FUNCTION(8, "B0:I2SIN3_BT_BCK"),
+		MTK_FUNCTION(9, "O:UTXD6"),
+		MTK_FUNCTION(10, "I0:I2SIN_DIR1_DI2")),
+	MTK_PIN(139, "GPIO139", MTK_EINT_FUNCTION(0, 139), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO139"),
+		MTK_FUNCTION(1, "B0:DISP_GPIO_N4"),
+		MTK_FUNCTION(2, "O:DISP_HSYNC0"),
+		MTK_FUNCTION(3, "O:DISP_HSYNC1"),
+		MTK_FUNCTION(4, "O:CLKM0_A"),
+		MTK_FUNCTION(5, "O:CLKM0_B"),
+		MTK_FUNCTION(6, "O:CLKM0_C"),
+		MTK_FUNCTION(7, "O:DBG_MON_B13"),
+		MTK_FUNCTION(8, "B0:I2SIN3_BT_LRCK"),
+		MTK_FUNCTION(9, "I1:URXD6"),
+		MTK_FUNCTION(10, "I0:I2SIN_DIR1_DI3")),
+	MTK_PIN(140, "GPIO140", MTK_EINT_FUNCTION(0, 140), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO140"),
+		MTK_FUNCTION(1, "B0:DISP_GPIO_N5"),
+		MTK_FUNCTION(2, "O:DISP_VSYNC0"),
+		MTK_FUNCTION(3, "O:DISP_VSYNC1"),
+		MTK_FUNCTION(4, "O:CLKM1_A"),
+		MTK_FUNCTION(5, "O:CLKM1_B"),
+		MTK_FUNCTION(6, "O:CLKM1_C"),
+		MTK_FUNCTION(7, "O:DBG_MON_A14"),
+		MTK_FUNCTION(8, "I0:I2SIN3_BT_DI"),
+		MTK_FUNCTION(9, "I1:UCTS6")),
+	MTK_PIN(141, "GPIO141", MTK_EINT_FUNCTION(0, 141), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO141"),
+		MTK_FUNCTION(1, "B0:DISP_GPIO_N6"),
+		MTK_FUNCTION(2, "O:DISP_HSYNC2"),
+		MTK_FUNCTION(3, "O:DISP_HSYNC3"),
+		MTK_FUNCTION(4, "O:CLKM2_A"),
+		MTK_FUNCTION(5, "O:CLKM2_B"),
+		MTK_FUNCTION(6, "O:CLKM2_C"),
+		MTK_FUNCTION(7, "O:DBG_MON_A15"),
+		MTK_FUNCTION(8, "O:I2SOUT3_BT_DO"),
+		MTK_FUNCTION(9, "O:URTS6")),
+	MTK_PIN(142, "GPIO142", MTK_EINT_FUNCTION(0, 142), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO142"),
+		MTK_FUNCTION(1, "B0:DISP_GPIO_N7"),
+		MTK_FUNCTION(2, "O:DISP_VSYNC2"),
+		MTK_FUNCTION(3, "O:DISP_VSYNC3"),
+		MTK_FUNCTION(4, "O:CLKM3_A"),
+		MTK_FUNCTION(5, "O:CLKM3_B"),
+		MTK_FUNCTION(6, "O:CLKM3_C"),
+		MTK_FUNCTION(7, "O:DBG_MON_A16"),
+		MTK_FUNCTION(8, "I0:I2SIN_DIR0_DI0"),
+		MTK_FUNCTION(9, "I0:I2SIN_DIR1_DI3"),
+		MTK_FUNCTION(10, "O:FRSYNC1")),
+	MTK_PIN(143, "GPIO143", MTK_EINT_FUNCTION(0, 143), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO143"),
+		MTK_FUNCTION(3, "I0:I2SIN_DMA0_LRCK"),
+		MTK_FUNCTION(4, "I0:ADSP_JTAG1_TCK"),
+		MTK_FUNCTION(5, "I0:ADSP_JTAG0_TCK"),
+		MTK_FUNCTION(6, "I0:CLUSTER0_UDI_TCK"),
+		MTK_FUNCTION(8, "B0:I2SIN_DIR0_LRCK"),
+		MTK_FUNCTION(9, "I0:I2SIN_DIR1_DI2"),
+		MTK_FUNCTION(10, "O:FRSYNC2")),
+	MTK_PIN(144, "GPIO144", MTK_EINT_FUNCTION(0, 144), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO144"),
+		MTK_FUNCTION(1, "I0:MCU_B_PMIC_POC_I"),
+		MTK_FUNCTION(3, "I0:I2SIN_DMA0_BCK"),
+		MTK_FUNCTION(4, "I1:ADSP_JTAG1_TMS"),
+		MTK_FUNCTION(5, "I1:ADSP_JTAG0_TMS"),
+		MTK_FUNCTION(6, "I0:CLUSTER0_UDI_TMS"),
+		MTK_FUNCTION(8, "B0:I2SIN_DIR0_BCK"),
+		MTK_FUNCTION(9, "I0:I2SIN_DIR1_DI1"),
+		MTK_FUNCTION(10, "O:FRSYNC3")),
+	MTK_PIN(145, "GPIO145", MTK_EINT_FUNCTION(0, 145), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO145"),
+		MTK_FUNCTION(1, "I1:UCTS0"),
+		MTK_FUNCTION(4, "I1:ADSP_JTAG1_TDI"),
+		MTK_FUNCTION(5, "I1:ADSP_JTAG0_TDI"),
+		MTK_FUNCTION(6, "I0:CLUSTER0_UDI_TDI_0"),
+		MTK_FUNCTION(8, "I0:I2SIN_DIR0_DI1"),
+		MTK_FUNCTION(9, "I0:I2SIN_DIR1_DI0"),
+		MTK_FUNCTION(10, "O:FRSYNC4")),
+	MTK_PIN(146, "GPIO146", MTK_EINT_FUNCTION(0, 146), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO146"),
+		MTK_FUNCTION(1, "O:URTS0"),
+		MTK_FUNCTION(3, "I0:I2SIN_DMA1_LRCK"),
+		MTK_FUNCTION(4, "O:ADSP_JTAG1_TDO"),
+		MTK_FUNCTION(5, "O:ADSP_JTAG0_TDO"),
+		MTK_FUNCTION(6, "O:CLUSTER0_UDI_TDO_0"),
+		MTK_FUNCTION(8, "I0:I2SIN_DIR0_DI2"),
+		MTK_FUNCTION(9, "O:I2SIN_DIR1_LRCK"),
+		MTK_FUNCTION(10, "O:FRSYNC5")),
+	MTK_PIN(147, "GPIO147", MTK_EINT_FUNCTION(0, 147), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO147"),
+		MTK_FUNCTION(3, "I0:I2SIN_DMA1_BCK"),
+		MTK_FUNCTION(4, "I1:ADSP_JTAG1_TRSTN"),
+		MTK_FUNCTION(5, "I1:ADSP_JTAG0_TRSTN"),
+		MTK_FUNCTION(6, "I0:CLUSTER0_UDI_NTRST"),
+		MTK_FUNCTION(8, "I0:I2SIN_DIR0_DI3"),
+		MTK_FUNCTION(9, "O:I2SIN_DIR1_BCK"),
+		MTK_FUNCTION(10, "O:FRSYNC6")),
+	MTK_PIN(148, "GPIO148", MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO148"),
+		MTK_FUNCTION(1, "O:SRCLKENA0")),
+	MTK_PIN(149, "GPIO149", MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO149"),
+		MTK_FUNCTION(1, "O:SRCLKENA1")),
+	MTK_PIN(150, "GPIO150", MTK_EINT_FUNCTION(0, 150), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO150"),
+		MTK_FUNCTION(2, "O:NVJTAG_SEL"),
+		MTK_FUNCTION(4, "I0:TSFDC_SDI"),
+		MTK_FUNCTION(5, "O:TSFDC_BG_COMP"),
+		MTK_FUNCTION(6, "O:CLKM3_C"),
+		MTK_FUNCTION(7, "I0:HFRP_JTAG0_TRSTN"),
+		MTK_FUNCTION(9, "B0:DISP_GPIO_N19")),
+	MTK_PIN(151, "GPIO151", MTK_EINT_FUNCTION(0, 151), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO151"),
+		MTK_FUNCTION(1, "I1:JTRSTn_SEL1"),
+		MTK_FUNCTION(2, "O:JTAGAP_JTRSTn"),
+		MTK_FUNCTION(3, "I1:ADSP_JTAG0_TRSTN"),
+		MTK_FUNCTION(4, "I0:U4CP_JTAG_TRSTN"),
+		MTK_FUNCTION(5, "I0:CLUSTER0_UDI_NTRST"),
+		MTK_FUNCTION(6, "I0:HFRP_JTAG1_TRSTN"),
+		MTK_FUNCTION(7, "I1:ADSP_JTAG1_TRSTN")),
+	MTK_PIN(152, "GPIO152", MTK_EINT_FUNCTION(0, 152), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO152"),
+		MTK_FUNCTION(1, "B1:JTMS_SEL1"),
+		MTK_FUNCTION(2, "O:JTAGAP_JTMS"),
+		MTK_FUNCTION(3, "I1:ADSP_JTAG0_TMS"),
+		MTK_FUNCTION(4, "B1:U4CP_JTAG_TMS"),
+		MTK_FUNCTION(5, "I0:CLUSTER0_UDI_TMS"),
+		MTK_FUNCTION(6, "I1:HFRP_JTAG1_TMS"),
+		MTK_FUNCTION(7, "I1:ADSP_JTAG1_TMS")),
+	MTK_PIN(153, "GPIO153", MTK_EINT_FUNCTION(0, 153), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO153"),
+		MTK_FUNCTION(1, "O:JTDO_SEL1"),
+		MTK_FUNCTION(2, "I0:JTAGAP_JTDO"),
+		MTK_FUNCTION(3, "O:ADSP_JTAG0_TDO"),
+		MTK_FUNCTION(4, "O:U4CP_JTAG_TDO"),
+		MTK_FUNCTION(5, "O:CLUSTER0_UDI_TDO_0"),
+		MTK_FUNCTION(6, "O:HFRP_JTAG1_TDO"),
+		MTK_FUNCTION(7, "O:ADSP_JTAG1_TDO")),
+	MTK_PIN(154, "GPIO154", MTK_EINT_FUNCTION(0, 154), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO154"),
+		MTK_FUNCTION(1, "I0:JTCK_SEL1"),
+		MTK_FUNCTION(2, "O:JTAGAP_JTCK"),
+		MTK_FUNCTION(3, "I0:ADSP_JTAG0_TCK"),
+		MTK_FUNCTION(4, "I1:U4CP_JTAG_TCK"),
+		MTK_FUNCTION(5, "I0:CLUSTER0_UDI_TCK"),
+		MTK_FUNCTION(6, "I1:HFRP_JTAG1_TCK"),
+		MTK_FUNCTION(7, "I0:ADSP_JTAG1_TCK")),
+	MTK_PIN(155, "GPIO155", MTK_EINT_FUNCTION(0, 155), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO155"),
+		MTK_FUNCTION(1, "I1:JTDI_SEL1"),
+		MTK_FUNCTION(2, "O:JTAGAP_JTDI"),
+		MTK_FUNCTION(3, "I1:ADSP_JTAG0_TDI"),
+		MTK_FUNCTION(4, "I1:U4CP_JTAG_TDI"),
+		MTK_FUNCTION(5, "I0:CLUSTER0_UDI_TDI_0"),
+		MTK_FUNCTION(6, "I1:HFRP_JTAG1_TDI"),
+		MTK_FUNCTION(7, "I1:ADSP_JTAG1_TDI")),
+	MTK_PIN(156, "GPIO156", MTK_EINT_FUNCTION(0, 156), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO156"),
+		MTK_FUNCTION(1, "O:TP_UTXD0_VLP"),
+		MTK_FUNCTION(2, "O:UTXD3"),
+		MTK_FUNCTION(3, "O:VADSP_UTXD1"),
+		MTK_FUNCTION(4, "O:SPI_SIO0_S_MON0"),
+		MTK_FUNCTION(5, "O:ADSP_UTXD1"),
+		MTK_FUNCTION(6, "I0:SROOT_TCK"),
+		MTK_FUNCTION(7, "O:OSROOT_UTX")),
+	MTK_PIN(157, "GPIO157", MTK_EINT_FUNCTION(0, 157), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO157"),
+		MTK_FUNCTION(1, "I1:TP_URXD0_VLP"),
+		MTK_FUNCTION(2, "I1:URXD3"),
+		MTK_FUNCTION(3, "I1:VADSP_URXD1"),
+		MTK_FUNCTION(4, "O:SPI_SIO1_S_MON0"),
+		MTK_FUNCTION(5, "I1:ADSP_URXD1"),
+		MTK_FUNCTION(6, "I0:SROOT_TDI"),
+		MTK_FUNCTION(7, "I1:OSROOT_URX")),
+	MTK_PIN(158, "GPIO158", MTK_EINT_FUNCTION(0, 158), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO158"),
+		MTK_FUNCTION(1, "O:TP_URTS0_VLP"),
+		MTK_FUNCTION(2, "O:URTS3"),
+		MTK_FUNCTION(3, "O:VADSP_URTS1"),
+		MTK_FUNCTION(4, "O:SPI_SIO2_S_MON0"),
+		MTK_FUNCTION(5, "O:ADSP_URTX1"),
+		MTK_FUNCTION(6, "O:SROOT_TDO"),
+		MTK_FUNCTION(7, "O:SPBM_UTXD_AO_VLP")),
+	MTK_PIN(159, "GPIO159", MTK_EINT_FUNCTION(0, 159), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO159"),
+		MTK_FUNCTION(1, "I1:TP_UCTS0_VLP"),
+		MTK_FUNCTION(2, "I1:UCTS3"),
+		MTK_FUNCTION(3, "I1:VADSP_UCTS1"),
+		MTK_FUNCTION(4, "O:SPI_SIO3_S_MON0"),
+		MTK_FUNCTION(5, "I1:ADSP_UCTS1"),
+		MTK_FUNCTION(6, "I0:SROOT_TMS"),
+		MTK_FUNCTION(7, "I1:SPBM_URXD_AO_VLP")),
+	MTK_PIN(160, "GPIO160", MTK_EINT_FUNCTION(0, 160), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO160"),
+		MTK_FUNCTION(1, "O:UTXD1"),
+		MTK_FUNCTION(2, "O:ADSP_UTXD1"),
+		MTK_FUNCTION(3, "O:HFRP_UTXD1"),
+		MTK_FUNCTION(4, "O:CCU1_UTXD"),
+		MTK_FUNCTION(5, "B0:I2SOUT1_LRCK"),
+		MTK_FUNCTION(6, "O:U4CP_UTXD"),
+		MTK_FUNCTION(7, "O:DBG_MON_B14"),
+		MTK_FUNCTION(8, "O:SPI5_A_CLK"),
+		MTK_FUNCTION(9, "O:I2SOUT_DIR2_BCK")),
+	MTK_PIN(161, "GPIO161", MTK_EINT_FUNCTION(0, 161), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO161"),
+		MTK_FUNCTION(1, "I1:URXD1"),
+		MTK_FUNCTION(2, "I1:ADSP_URXD1"),
+		MTK_FUNCTION(3, "I1:HFRP_URXD1"),
+		MTK_FUNCTION(4, "I1:CCU1_URXD"),
+		MTK_FUNCTION(5, "B0:I2SOUT1_BCK"),
+		MTK_FUNCTION(6, "I1:U4CP_URXD"),
+		MTK_FUNCTION(7, "O:DBG_MON_B15"),
+		MTK_FUNCTION(8, "B0:SPI5_A_MI"),
+		MTK_FUNCTION(9, "O:I2SOUT_DIR2_LRCK")),
+	MTK_PIN(162, "GPIO162", MTK_EINT_FUNCTION(0, 162), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO162"),
+		MTK_FUNCTION(1, "O:URTS1"),
+		MTK_FUNCTION(2, "O:ADSP_URTX1"),
+		MTK_FUNCTION(3, "O:HFRP_URTS1"),
+		MTK_FUNCTION(4, "O:CCU0_UTXD"),
+		MTK_FUNCTION(5, "B0:I2SOUT0_BCK"),
+		MTK_FUNCTION(6, "O:U4CP_URTS"),
+		MTK_FUNCTION(7, "O:DBG_MON_B16"),
+		MTK_FUNCTION(8, "B0:SPI5_A_MO")),
+	MTK_PIN(163, "GPIO163", MTK_EINT_FUNCTION(0, 163), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO163"),
+		MTK_FUNCTION(1, "I1:UCTS1"),
+		MTK_FUNCTION(2, "I1:ADSP_UCTS1"),
+		MTK_FUNCTION(3, "I1:HFRP_UCTS1"),
+		MTK_FUNCTION(4, "I1:CCU0_URXD"),
+		MTK_FUNCTION(5, "B0:I2SOUT0_LRCK"),
+		MTK_FUNCTION(6, "I1:U4CP_UCTS"),
+		MTK_FUNCTION(7, "O:DBG_MON_B17"),
+		MTK_FUNCTION(8, "O:SPI5_A_CSB0")),
+	MTK_PIN(164, "GPIO164", MTK_EINT_FUNCTION(0, 164), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO164"),
+		MTK_FUNCTION(1, "O:HDMITX_DC_CTRL"),
+		MTK_FUNCTION(2, "I0:VBUSVALID_2P"),
+		MTK_FUNCTION(6, "I0:SROOT_NTRST"),
+		MTK_FUNCTION(7, "O:DBG_MON_B18"),
+		MTK_FUNCTION(8, "I1:URXD4"),
+		MTK_FUNCTION(9, "B0:I2SIN1_BT_LRCK"),
+		MTK_FUNCTION(10, "O:PCIE_PERSTN_6P")),
+	MTK_PIN(165, "GPIO165", MTK_EINT_FUNCTION(0, 165), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO165"),
+		MTK_FUNCTION(1, "B1:DISP_SCL0"),
+		MTK_FUNCTION(4, "I1:EDP0_SCL"),
+		MTK_FUNCTION(5, "O:CCU0_URTS"),
+		MTK_FUNCTION(6, "O:CCU1_URTS"),
+		MTK_FUNCTION(7, "I1:MD32_6_RXD"),
+		MTK_FUNCTION(8, "B1:IOE_8VC_SCL16")),
+	MTK_PIN(166, "GPIO166", MTK_EINT_FUNCTION(0, 166), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO166"),
+		MTK_FUNCTION(1, "B1:DISP_SDA0"),
+		MTK_FUNCTION(4, "B1:EDP0_SDA"),
+		MTK_FUNCTION(5, "I1:CCU0_UCTS"),
+		MTK_FUNCTION(6, "I1:CCU1_UCTS"),
+		MTK_FUNCTION(7, "O:MD32_6_GPIO0"),
+		MTK_FUNCTION(8, "B1:IOE_8VC_SDA16")),
+	MTK_PIN(167, "GPIO167", MTK_EINT_FUNCTION(0, 167), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO167"),
+		MTK_FUNCTION(1, "B0:DISP_GPIO_N0"),
+		MTK_FUNCTION(5, "O:CLUSTER0_AD_ILDO_DTEST0"),
+		MTK_FUNCTION(7, "O:DBG_MON_B19")),
+	MTK_PIN(168, "GPIO168", MTK_EINT_FUNCTION(0, 168), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO168"),
+		MTK_FUNCTION(1, "I0:DPAUX_HPD_IN_0"),
+		MTK_FUNCTION(5, "O:CLUSTER0_AD_ILDO_DTEST1"),
+		MTK_FUNCTION(7, "O:DBG_MON_B20"),
+		MTK_FUNCTION(8, "B0:DISP_GPIO_N0")),
+	MTK_PIN(169, "GPIO169", MTK_EINT_FUNCTION(0, 169), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO169"),
+		MTK_FUNCTION(1, "I0:DPAUX_HPD_IN_1"),
+		MTK_FUNCTION(5, "O:CLUSTER0_AD_ILDO_DTEST3"),
+		MTK_FUNCTION(7, "O:DBG_MON_B21"),
+		MTK_FUNCTION(8, "B0:DISP_GPIO_N1")),
+	MTK_PIN(170, "GPIO170", MTK_EINT_FUNCTION(0, 170), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO170"),
+		MTK_FUNCTION(1, "O:USB4_R_TCPC_RESET"),
+		MTK_FUNCTION(2, "O:DISP_HSYNC4"),
+		MTK_FUNCTION(3, "O:DISP_HSYNC5"),
+		MTK_FUNCTION(5, "O:CLUSTER0_AD_ILDO_DTEST2"),
+		MTK_FUNCTION(6, "O:FRSYNC4"),
+		MTK_FUNCTION(7, "O:DBG_MON_A17")),
+	MTK_PIN(171, "GPIO171", MTK_EINT_FUNCTION(0, 171), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO171"),
+		MTK_FUNCTION(1, "O:PCIE_PERSTN"),
+		MTK_FUNCTION(7, "O:DBG_MON_B22")),
+	MTK_PIN(172, "GPIO172", MTK_EINT_FUNCTION(0, 172), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO172"),
+		MTK_FUNCTION(1, "B1:PCIE_CLKREQN_0P"),
+		MTK_FUNCTION(2, "I1:PCIE_PRSNT_0P"),
+		MTK_FUNCTION(5, "O:HFRP_UTXD1"),
+		MTK_FUNCTION(6, "O:CCU0_UTXD"),
+		MTK_FUNCTION(7, "O:DBG_MON_B23")),
+	MTK_PIN(173, "GPIO173", MTK_EINT_FUNCTION(0, 173), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO173"),
+		MTK_FUNCTION(1, "B1:PCIE_CLKREQN_1P"),
+		MTK_FUNCTION(2, "I1:PCIE_PRSNT_1P"),
+		MTK_FUNCTION(5, "I1:HFRP_URXD1"),
+		MTK_FUNCTION(6, "I1:CCU0_URXD"),
+		MTK_FUNCTION(7, "O:DBG_MON_B24")),
+	MTK_PIN(174, "GPIO174", MTK_EINT_FUNCTION(0, 174), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO174"),
+		MTK_FUNCTION(1, "B1:PCIE_CLKREQN_2P"),
+		MTK_FUNCTION(2, "I1:PCIE_PRSNT_2P"),
+		MTK_FUNCTION(4, "O:MD32PCM_UTXD_AO_VLP"),
+		MTK_FUNCTION(5, "O:HFRP_URTS1"),
+		MTK_FUNCTION(6, "O:CCU1_UTXD"),
+		MTK_FUNCTION(7, "O:DBG_MON_B25")),
+	MTK_PIN(175, "GPIO175", MTK_EINT_FUNCTION(0, 175), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO175"),
+		MTK_FUNCTION(1, "B1:PCIE_CLKREQN_3P"),
+		MTK_FUNCTION(2, "I1:PCIE_PRSNT_3P"),
+		MTK_FUNCTION(4, "I1:MD32PCM_URXD_AO_VLP"),
+		MTK_FUNCTION(5, "I1:HFRP_UCTS1"),
+		MTK_FUNCTION(6, "I1:CCU1_URXD"),
+		MTK_FUNCTION(7, "O:DBG_MON_B26")),
+	MTK_PIN(176, "GPIO176", MTK_EINT_FUNCTION(0, 176), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO176"),
+		MTK_FUNCTION(1, "B1:PCIE_CLKREQN_4P"),
+		MTK_FUNCTION(2, "I1:PCIE_PRSNT_4P"),
+		MTK_FUNCTION(7, "O:DBG_MON_B27")),
+	MTK_PIN(177, "GPIO177", MTK_EINT_FUNCTION(0, 177), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO177"),
+		MTK_FUNCTION(1, "B1:PCIE_CLKREQN_5P"),
+		MTK_FUNCTION(2, "I1:PCIE_PRSNT_5P"),
+		MTK_FUNCTION(7, "O:DBG_MON_B28"),
+		MTK_FUNCTION(8, "O:PCIE_PERSTN_1P")),
+	MTK_PIN(178, "GPIO178", MTK_EINT_FUNCTION(0, 178), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO178"),
+		MTK_FUNCTION(1, "B1:PCIE_CLKREQN_6P"),
+		MTK_FUNCTION(2, "I1:PCIE_PRSNT_6P"),
+		MTK_FUNCTION(7, "O:DBG_MON_B29"),
+		MTK_FUNCTION(8, "O:PCIE_PERSTN_2P")),
+	MTK_PIN(179, "GPIO179", MTK_EINT_FUNCTION(0, 179), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO179"),
+		MTK_FUNCTION(7, "O:DBG_MON_B30"),
+		MTK_FUNCTION(8, "O:PCIE_PERSTN_3P")),
+	MTK_PIN(180, "GPIO180", MTK_EINT_FUNCTION(0, 180), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO180"),
+		MTK_FUNCTION(1, "I1:PCIE_WAKEN"),
+		MTK_FUNCTION(7, "O:DBG_MON_B31")),
+	MTK_PIN(181, "GPIO181", MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT), DRV_GRP4,
+		MTK_FUNCTION(0, "B:GPIO181"),
+		MTK_FUNCTION(1, "O:GPU_PWRGOOD")),
+	/*
+	 * Virtual GPIO: no ball, but backed by EINT hardware. funcs[0] has
+	 * no name so that mtk_is_virt_gpio() treats it as virtual.
+	 */
+	MTK_PIN(182, "GPIO182", MTK_EINT_FUNCTION(0, 182), DRV_GRP4,
+		MTK_FUNCTION(0, NULL)),
+	MTK_PIN(183, "GPIO183", MTK_EINT_FUNCTION(0, 183), DRV_GRP4,
+		MTK_FUNCTION(0, NULL)),
+	MTK_PIN(184, "GPIO184", MTK_EINT_FUNCTION(0, 184), DRV_GRP4,
+		MTK_FUNCTION(0, NULL)),
+	MTK_PIN(185, "GPIO185", MTK_EINT_FUNCTION(0, 185), DRV_GRP4,
+		MTK_FUNCTION(0, NULL)),
+	MTK_PIN(186, "GPIO186", MTK_EINT_FUNCTION(0, 186), DRV_GRP4,
+		MTK_FUNCTION(0, NULL)),
+};
+
+#endif /* __PINCTRL_MTK_MT8971_H */
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 09098b68f725..a827ae618eff 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -3,7 +3,7 @@
  * MediaTek Pinctrl Paris Driver, which implement the vendor per-pin
  * bindings for MediaTek SoC.
  *
- * Copyright (C) 2018 MediaTek Inc.
+ * Copyright (C) 2018-2026 MediaTek Inc.
  * Author: Sean Wang <sean.wang@mediatek.com>
  *	   Zhiyong Tao <zhiyong.tao@mediatek.com>
  *	   Hongzhou.Yang <hongzhou.yang@mediatek.com>
@@ -107,6 +107,10 @@ static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	const struct mtk_pin_desc *desc;
 
+	/* Virtual GPIOs have no pad to mux. */
+	if (mtk_is_virt_gpio(hw, pin))
+		return 0;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
 	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_MODE,
@@ -120,6 +124,10 @@ static int mtk_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	const struct mtk_pin_desc *desc;
 
+	/* Virtual GPIOs are only used for interrupts, so they are always inputs. */
+	if (mtk_is_virt_gpio(hw, pin))
+		return input ? 0 : -EINVAL;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
 	/* hardware would take 0 as input direction */
@@ -137,12 +145,17 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 	if (pin >= hw->soc->npins)
 		return -EINVAL;
 
+	/* Virtual GPIOs have no pad to configure. */
+	if (mtk_is_virt_gpio(hw, pin))
+		return err;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
 	case PIN_CONFIG_BIAS_PULL_UP:
 	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_BUS_HOLD:
 		if (!hw->soc->bias_get_combo)
 			break;
 		err = hw->soc->bias_get_combo(hw, desc, &pullup, &ret);
@@ -154,10 +167,13 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 			if (ret != MTK_DISABLE)
 				err = -EINVAL;
 		} else if (param == PIN_CONFIG_BIAS_PULL_UP) {
-			if (!pullup || ret == MTK_DISABLE)
+			if (pullup != 1 || ret == MTK_DISABLE)
 				err = -EINVAL;
 		} else if (param == PIN_CONFIG_BIAS_PULL_DOWN) {
-			if (pullup || ret == MTK_DISABLE)
+			if (pullup != 0 || ret == MTK_DISABLE)
+				err = -EINVAL;
+		} else if (param == PIN_CONFIG_BIAS_BUS_HOLD) {
+			if (pullup != MTK_BUS_HOLD || ret == MTK_DISABLE)
 				err = -EINVAL;
 		}
 		break;
@@ -266,6 +282,10 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 	if (pin >= hw->soc->npins)
 		return -EINVAL;
 
+	/* Virtual GPIOs have no pad to configure. */
+	if (mtk_is_virt_gpio(hw, pin))
+		return err;
+
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[pin];
 
 	switch ((u32)param) {
@@ -284,6 +304,13 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 			break;
 		err = hw->soc->bias_set_combo(hw, desc, 0, arg);
 		break;
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+		if (!hw->soc->bias_set_combo)
+			break;
+		/* bias-bus-hold takes no argument; its presence means enable. */
+		err = hw->soc->bias_set_combo(hw, desc, MTK_BUS_HOLD,
+					      MTK_ENABLE);
+		break;
 	case PIN_CONFIG_INPUT_ENABLE:
 		/* regard all non-zero value as enable */
 		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_IES, !!arg);
@@ -771,6 +798,7 @@ static const struct pinmux_ops mtk_pmxops = {
 	.get_function_name	= mtk_pmx_get_func_name,
 	.get_function_groups	= mtk_pmx_get_func_groups,
 	.set_mux		= mtk_pmx_set_mux,
+	.gpio_set_direction	= mtk_pinmux_gpio_set_direction,
 	.gpio_request_enable	= mtk_pinmux_gpio_request_enable,
 };
 
@@ -928,9 +956,15 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[offset];
 
+	/*
+	 * Not every EINT has debounce hardware, the virtual GPIOs among them.
+	 * Report that as unsupported so gpiolib treats the request as optional
+	 * rather than warning about an -EINVAL from the EINT driver.
+	 */
 	if (!hw->eint ||
 	    pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE ||
-	    desc->eint.eint_n == EINT_NA)
+	    desc->eint.eint_n == EINT_NA ||
+	    !hw->eint->pins[desc->eint.eint_n].debounce)
 		return -ENOTSUPP;
 
 	debounce = pinconf_to_config_argument(config);
@@ -938,6 +972,16 @@ static int mtk_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 	return mtk_eint_set_debounce(hw->eint, desc->eint.eint_n, debounce);
 }
 
+static void mtk_pinctrl_gpio_range_init(struct mtk_pinctrl *hw,
+					struct gpio_chip *chip)
+{
+	hw->range.name = "mtk_pinctrl_gpio_range";
+	hw->range.id = 0;
+	hw->range.pin_base = 0;
+	hw->range.base = chip->base;
+	hw->range.npins = hw->soc->npins;
+}
+
 static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 {
 	struct gpio_chip *chip = &hw->chip;
@@ -961,9 +1005,18 @@ static int mtk_build_gpiochip(struct mtk_pinctrl *hw)
 	if (ret < 0)
 		return ret;
 
+	mtk_pinctrl_gpio_range_init(hw, chip);
+
 	return 0;
 }
 
+#ifdef CONFIG_GPIO_ACPI
+static void mtk_pinctrl_acpi_free_interrupts(void *data)
+{
+	acpi_gpiochip_free_interrupts(data);
+}
+#endif
+
 static int mtk_pctrl_build_state(struct platform_device *pdev)
 {
 	struct mtk_pinctrl *hw = platform_get_drvdata(pdev);
@@ -994,11 +1047,22 @@ static int mtk_pctrl_build_state(struct platform_device *pdev)
 	return 0;
 }
 
-int mtk_paris_pinctrl_probe(struct platform_device *pdev)
+static void mtk_paris_unregister_instance(void *data)
+{
+	mtk_pinctrl_unregister_instance(data);
+}
+
+/*
+ * Like mtk_paris_pinctrl_probe(), but the caller passes in the SoC data.
+ * Used by drivers that select the SoC at runtime.
+ */
+int mtk_paris_pinctrl_probe_soc(struct platform_device *pdev,
+				const struct mtk_pin_soc *soc)
 {
 	struct device *dev = &pdev->dev;
 	struct pinctrl_pin_desc *pins;
 	struct mtk_pinctrl *hw;
+	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
 	int err, i;
 
 	hw = devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
@@ -1007,7 +1071,7 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, hw);
 
-	hw->soc = device_get_match_data(dev);
+	hw->soc = soc;
 	if (!hw->soc)
 		return -ENOENT;
 
@@ -1023,8 +1087,9 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < hw->soc->nbase_names; i++) {
-		hw->base[i] = devm_platform_ioremap_resource_byname(pdev,
-					hw->soc->base_names[i]);
+		hw->base[i] = is_of_node(fwnode)
+			? devm_platform_ioremap_resource_byname(pdev, hw->soc->base_names[i])
+			: devm_platform_get_and_ioremap_resource(pdev, i, NULL);
 		if (IS_ERR(hw->base[i]))
 			return PTR_ERR(hw->base[i]);
 	}
@@ -1036,6 +1101,9 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev)
 
 	spin_lock_init(&hw->lock);
 
+	dev_info(dev, "PROBE: building pinctrl state (%u pins)\n",
+		 hw->soc->npins);
+
 	err = mtk_pctrl_build_state(pdev);
 	if (err)
 		return dev_err_probe(dev, err, "build state failed\n");
@@ -1060,6 +1128,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev)
 	mtk_desc.custom_conf_items = mtk_conf_items;
 #endif
 
+	dev_info(dev, "PROBE: registering pinctrl core\n");
+
 	err = devm_pinctrl_register_and_init(&pdev->dev, &mtk_desc, hw,
 					     &hw->pctrl);
 	if (err)
@@ -1069,26 +1139,79 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	dev_info(dev, "PROBE: pinctrl enabled, building EINT\n");
+
 	err = mtk_build_eint(hw, pdev);
 	if (err)
 		dev_warn(&pdev->dev,
-			 "Failed to add EINT, but pinctrl still can work\n");
+			 "Failed to add EINT (err=%d), but pinctrl still can work\n",
+			 err);
+	else
+		dev_info(dev, "PROBE: EINT built successfully (eint=%p)\n",
+			 hw->eint);
+
+	dev_info(dev, "PROBE: building gpiochip\n");
 
 	/* Build gpiochip should be after pinctrl_enable is done */
 	err = mtk_build_gpiochip(hw);
 	if (err)
 		return dev_err_probe(dev, err, "Failed to add gpio_chip\n");
 
+	dev_info(dev, "PROBE: gpiochip registered, adding GPIO range\n");
+
+	pinctrl_add_gpio_range(hw->pctrl, &hw->range);
+#ifdef CONFIG_GPIO_ACPI
+	if (hw->eint) {
+		dev_info(dev, "PROBE: requesting ACPI GPIO interrupts\n");
+		acpi_gpiochip_request_interrupts(&hw->chip);
+		dev_info(dev, "PROBE: ACPI GPIO interrupts requested\n");
+
+		err = devm_add_action_or_reset(dev,
+					       mtk_pinctrl_acpi_free_interrupts,
+					       &hw->chip);
+		if (err) {
+			pinctrl_remove_gpio_range(hw->pctrl, &hw->range);
+			return dev_err_probe(dev, err,
+					     "Failed to add ACPI GPIO cleanup\n");
+		}
+	} else {
+		dev_info(dev, "PROBE: no EINT, skipping ACPI GPIO interrupts\n");
+	}
+#endif
+
 	platform_set_drvdata(pdev, hw);
 
+	/*
+	 * Register so mtk_pinctrl_program_bias_by_gpio() can find this
+	 * controller. The devm action unregisters it before hw is freed.
+	 */
+	mtk_pinctrl_register_instance(hw);
+
+	err = devm_add_action_or_reset(&pdev->dev,
+				       mtk_paris_unregister_instance, hw);
+	if (err)
+		return err;
+
+	dev_info(dev, "PROBE: complete\n");
+
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_paris_pinctrl_probe_soc);
+
+int mtk_paris_pinctrl_probe(struct platform_device *pdev)
+{
+	return mtk_paris_pinctrl_probe_soc(pdev,
+					   device_get_match_data(&pdev->dev));
+}
 EXPORT_SYMBOL_GPL(mtk_paris_pinctrl_probe);
 
 static int mtk_paris_pinctrl_suspend(struct device *device)
 {
 	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
 
+	if (!pctl->eint)
+		return 0;
+
 	return mtk_eint_do_suspend(pctl->eint);
 }
 
@@ -1096,6 +1219,9 @@ static int mtk_paris_pinctrl_resume(struct device *device)
 {
 	struct mtk_pinctrl *pctl = dev_get_drvdata(device);
 
+	if (!pctl->eint)
+		return 0;
+
 	return mtk_eint_do_resume(pctl->eint);
 }
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h b/drivers/pinctrl/mediatek/pinctrl-paris.h
index d8c1822662fc..e5d6f16f8ae2 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.h
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
@@ -63,10 +63,16 @@
 	}
 
 int mtk_paris_pinctrl_probe(struct platform_device *pdev);
+int mtk_paris_pinctrl_probe_soc(struct platform_device *pdev,
+				const struct mtk_pin_soc *soc);
 
 ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	unsigned int gpio, char *buf, unsigned int bufLen);
 
 extern const struct dev_pm_ops mtk_paris_pinctrl_pm_ops;
 
+/* SoC tables selected at runtime by pinctrl-mt89xx.c */
+extern const struct mtk_pin_soc mt8901_data;
+extern const struct mtk_pin_soc mt8971_data;
+
 #endif /* __PINCTRL_PARIS_H */
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 4077dc678cae..abb3f7fa37ff 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -637,6 +637,11 @@ int devm_gpiochip_add_data_with_key(struct device *dev, struct gpio_chip *gc,
 				    void *data, struct lock_class_key *lock_key,
 				    struct lock_class_key *request_key);
 
+#ifdef CONFIG_GPIO_ACPI
+void acpi_gpiochip_request_interrupts(struct gpio_chip *chip);
+void acpi_gpiochip_free_interrupts(struct gpio_chip *chip);
+#endif
+
 struct gpio_device *gpio_device_find(const void *data,
 				int (*match)(struct gpio_chip *gc,
 					     const void *data));
diff --git a/include/linux/soc/mediatek/mtk-pinctrl.h b/include/linux/soc/mediatek/mtk-pinctrl.h
new file mode 100644
index 000000000000..cee725630cdf
--- /dev/null
+++ b/include/linux/soc/mediatek/mtk-pinctrl.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ *
+ * Cross-driver interface into MediaTek pinctrl for programming pad
+ * bias by absolute SoC GPIO number.
+ *
+ * Intended for client drivers (for example mtk-soundwire) that consume
+ * ACPI PinFunction() vendor encodings from their own _CRS and need to
+ * apply the resulting pad bias without going through the pinctrl-state
+ * machinery.
+ */
+#ifndef __LINUX_SOC_MEDIATEK_MTK_PINCTRL_H
+#define __LINUX_SOC_MEDIATEK_MTK_PINCTRL_H
+
+#include <linux/types.h>
+
+/* Vendor pin configuration values in ACPI PinFunction() descriptors */
+#define MTK_SDW_PIN_CFG_PD		0x90	/* PD=1, PU=0 */
+#define MTK_SDW_PIN_CFG_BUS_HOLD	0xF0	/* PD=1, PU=1, bus keeper */
+
+/* Pull-mode values accepted by mtk_pinctrl_program_bias_by_gpio(). */
+#define MTK_PIN_PULLDOWN	0
+#define MTK_PIN_PULLUP		1
+#define MTK_PIN_BUS_HOLD	2
+
+/* Enable/disable values accepted by mtk_pinctrl_program_bias_by_gpio(). */
+#define MTK_PIN_DISABLE		0
+#define MTK_PIN_ENABLE		1
+
+/**
+ * mtk_pinctrl_program_bias_by_gpio - program pad bias by absolute GPIO
+ * @gpio:   absolute SoC pin number (matches the ACPI PinFunction
+ *          pin_table entry).
+ * @pullup: one of MTK_PIN_PULLDOWN, MTK_PIN_PULLUP, MTK_PIN_BUS_HOLD.
+ * @arg:    MTK_PIN_ENABLE to apply, MTK_PIN_DISABLE to release.
+ *
+ * Returns 0 on success, -ENODEV if no registered mtk_pinctrl owns @gpio,
+ * or a negative error code from the underlying bias operation.
+ */
+int mtk_pinctrl_program_bias_by_gpio(unsigned int gpio, u32 pullup, u32 arg);
+
+#endif /* __LINUX_SOC_MEDIATEK_MTK_PINCTRL_H */
-- 
2.45.2

