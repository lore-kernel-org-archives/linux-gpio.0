Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422934611CF;
	Thu,  3 Sep 2026 11:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435227; cv=none; b=k2Ue46wFexvRPIN1Z4lCxXuKGQQJYHXDyQ/3r35Ah1K1D9zMRXnR/DgwwsNECcwhAkcFPbXSMZSUbrHlxUuD8Xt9a76qO9Dht38WugKTMlZffZG+oLu3AOueI75sbQ1p18rtr2tMqRg4NTxTFm2HC0VdEFcav2W/cowyBuSXnNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435227; c=relaxed/simple;
	bh=+dqqWNK/ctfR7wxP45OztLBbfHyS5mhC+I+zlmOJtAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aeIBHGQ19uCLMXg5O5ceDjttETibTZoEUuWpJo9Q89+8v4SwRL7zz6G4CCLVUvNvVwtx+cCNwCH39Muqh1NV2vhN4HNxKwDIHKWQWTA9tiYGIwmTxy2+0fRzI5IGYLK42bfRL4g8edHGO+kMsxQ75NdXGt9zcdjBpggjG4CmcF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E4161F00A3A;
	Thu,  3 Sep 2026 11:33:39 +0000 (UTC)
From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 3/5] pinctrl: renesas: rzg2l: Unify the power source handling
Date: Thu,  3 Sep 2026 14:33:25 +0300
Message-ID: <20260903113327.1217457-4-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903113327.1217457-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260903113327.1217457-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The previous code handled power sources using a mixture of power
source specific definitions and lookups in the available_ps[] array.
Unify the power source handling by introducing
struct rzg2l_pinctrl_ps_desc, whose purpose is to describe a power
source through its power source value, associated register value,
associated capabilities (e.g. Ethernet), and associated IOLH index.

Introduce two new functions, rzg2l_ps_to_desc() and
rzg2l_pwr_reg_val_to_desc(), using the
RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC() macro, as their
implementations are similar.

These functions retrieve a power source descriptor based on either a
power source value or a power source register value. Other functions
that need to perform power source specific operations can call them to
retrieve the corresponding power source descriptor.

The register values for the soft power sources were kept to zero since
they are not used across the driver's code.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- described all the available power sources in the available_ps[]
  array and dropped to wildcard approach to avoid letting the user
  selecting unavailable power source for pins
- simplified RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC()
- for these two points ^ didn't collect the Wolfram's Tb tag
- dropped rzg2l_ps_is_supported()
- used conditional operator in rzg2l_ps_to_iolh_idx()
- adjusted the patch description

Changes in v5:
- none, this patch is new

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 165 ++++++++++++++++--------
 1 file changed, 111 insertions(+), 54 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index c17983aafcf5..18656f6d2891 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -182,9 +182,6 @@
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
 
-#define PVDD_2500		2	/* I/O domain voltage 2.5V */
-#define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
-#define PVDD_3300		0	/* I/O domain voltage >= 3.3V */
 #define PVDD_MASK		0x3
 
 #define PWPR_B0WI		BIT(7)	/* Bit Write Disable */
@@ -289,12 +286,14 @@ struct rzg2l_register_masks {
 
 /**
  * enum rzg2l_iolh_index - starting indices in IOLH specific arrays
+ * @RZG2L_IOLH_IDX_NA: index N/A (to be used for error checking)
  * @RZG2L_IOLH_IDX_1V8: starting index for 1V8 power source
  * @RZG2L_IOLH_IDX_2V5: starting index for 2V5 power source
  * @RZG2L_IOLH_IDX_3V3: starting index for 3V3 power source
  * @RZG2L_IOLH_IDX_MAX: maximum index
  */
 enum rzg2l_iolh_index {
+	RZG2L_IOLH_IDX_NA = -1,
 	RZG2L_IOLH_IDX_1V8 = 0,
 	RZG2L_IOLH_IDX_2V5 = 4,
 	RZG2L_IOLH_IDX_3V3 = 8,
@@ -445,7 +444,88 @@ struct rzg2l_pinctrl {
 	u32				clone_offset;
 };
 
-static const u16 available_ps[] = { 1800, 2500, 3300 };
+/**
+ * struct rzg2l_pinctrl_ps_desc - RZ/G2L power source descriptor
+ * @caps: Capabilities that applies to the power source
+ * @iolh_index: IOLH index
+ * @ps: Power source value
+ * @pwr_reg_val: Power source register value
+ */
+struct rzg2l_pinctrl_ps_desc {
+	u32 caps;
+	enum rzg2l_iolh_index iolh_index;
+	u16 ps;
+	u16 pwr_reg_val;
+};
+
+#define RZG2L_PINCTRL_PS_DESC(_ps, _pwr_reg_val, _caps, _iolh_index) \
+	{ \
+		.ps = _ps, \
+		.pwr_reg_val = _pwr_reg_val, \
+		.caps = _caps, \
+		.iolh_index = _iolh_index, \
+	}
+
+static const struct rzg2l_pinctrl_ps_desc available_ps[] = {
+	/* Ethernet I/O voltage domains */
+	RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
+			      RZG2L_IOLH_IDX_1V8),
+	RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
+			      RZG2L_IOLH_IDX_2V5),
+	RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1,
+			      RZG2L_IOLH_IDX_3V3),
+
+	/* SD I/O voltage domains */
+	RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_IO_VMC_SD0 | PIN_CFG_IO_VMC_SD1 |
+			      PIN_CFG_IO_VMC_SD2, RZG2L_IOLH_IDX_1V8),
+	RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_SD0 | PIN_CFG_IO_VMC_SD1 |
+			      PIN_CFG_IO_VMC_SD2, RZG2L_IOLH_IDX_2V5),
+	RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_IO_VMC_SD0 | PIN_CFG_IO_VMC_SD1 |
+			      PIN_CFG_IO_VMC_SD2, RZG2L_IOLH_IDX_3V3),
+
+	/* QSPI I/O voltage domains */
+	RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_IO_VMC_QSPI, RZG2L_IOLH_IDX_1V8),
+	RZG2L_PINCTRL_PS_DESC(2500, 2, PIN_CFG_IO_VMC_QSPI, RZG2L_IOLH_IDX_2V5),
+	RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_IO_VMC_QSPI, RZG2L_IOLH_IDX_3V3),
+
+	/* AWO I/O voltage domains */
+	RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_PVDD1833_OTH_AWO_POC,
+			      RZG2L_IOLH_IDX_1V8),
+	RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_PVDD1833_OTH_AWO_POC,
+			      RZG2L_IOLH_IDX_3V3),
+
+	/* ISO I/O voltage domains */
+	RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_PVDD1833_OTH_ISO_POC,
+			      RZG2L_IOLH_IDX_1V8),
+	RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_PVDD1833_OTH_ISO_POC,
+			      RZG2L_IOLH_IDX_3V3),
+
+	/* WDTOVF I/O voltage domains */
+	RZG2L_PINCTRL_PS_DESC(1800, 1, PIN_CFG_WDTOVF_N_POC, RZG2L_IOLH_IDX_1V8),
+	RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_WDTOVF_N_POC, RZG2L_IOLH_IDX_3V3),
+
+	/* Software voltage domains */
+	RZG2L_PINCTRL_PS_DESC(1800, 0, PIN_CFG_SOFT_PS, RZG2L_IOLH_IDX_1V8),
+	RZG2L_PINCTRL_PS_DESC(2500, 0, PIN_CFG_SOFT_PS, RZG2L_IOLH_IDX_2V5),
+	RZG2L_PINCTRL_PS_DESC(3300, 0, PIN_CFG_SOFT_PS, RZG2L_IOLH_IDX_3V3),
+};
+
+#define RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC(_name, _desc_member, _caps)	\
+static const struct rzg2l_pinctrl_ps_desc *_name(u16 _desc_member, u32 _caps)	\
+{										\
+	for (unsigned int i = 0; i < ARRAY_SIZE(available_ps); i++) {		\
+		if (available_ps[i]._desc_member != _desc_member)		\
+			continue;						\
+										\
+		if (available_ps[i].caps & _caps)				\
+			return &available_ps[i];				\
+	}									\
+										\
+	return NULL;								\
+}
+
+RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC(rzg2l_ps_to_desc, ps, caps)
+RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC(rzg2l_pwr_reg_val_to_desc, pwr_reg_val, caps)
 
 static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
 					      u64 pincfg,
@@ -1126,34 +1206,26 @@ static int rzg2l_caps_to_pwr_reg(const struct rzg2l_register_offsets *regs,
 	return -EINVAL;
 }
 
-static int rzg2l_pwr_reg_val_to_ps(u8 val, u32 caps)
+static int rzg2l_pwr_reg_val_to_ps(u16 pwr_reg_val, u32 caps)
 {
-	switch (val) {
-	case PVDD_1800:
-		return 1800;
-	case PVDD_2500:
-		return 2500;
-	case PVDD_3300:
-		return 3300;
-	}
+	const struct rzg2l_pinctrl_ps_desc *desc;
 
-	return -EINVAL;
+	desc = rzg2l_pwr_reg_val_to_desc(pwr_reg_val, caps);
+	if (!desc)
+		return -EINVAL;
+
+	return desc->ps;
 }
 
-static int rzg2l_ps_to_pwr_reg_val(u32 ps, u32 caps)
+static int rzg2l_ps_to_pwr_reg_val(u16 ps, u32 caps)
 {
-	switch (ps) {
-	case 1800:
-		return PVDD_1800;
-	case 2500:
-		if (!(caps & (PIN_CFG_IO_VMC_ETH0 | PIN_CFG_IO_VMC_ETH1)))
-			return -EINVAL;
-		return PVDD_2500;
-	case 3300:
-		return PVDD_3300;
-	}
+	const struct rzg2l_pinctrl_ps_desc *desc;
 
-	return -EINVAL;
+	desc = rzg2l_ps_to_desc(ps, caps);
+	if (!desc)
+		return -EINVAL;
+
+	return desc->pwr_reg_val;
 }
 
 static int rzg2l_get_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps)
@@ -1212,32 +1284,11 @@ static int rzg2l_set_power_source(struct rzg2l_pinctrl *pctrl, u32 pin, u32 caps
 	return 0;
 }
 
-static bool rzg2l_ps_is_supported(u16 ps)
+static enum rzg2l_iolh_index rzg2l_ps_to_iolh_idx(u16 ps, u32 caps)
 {
-	unsigned int i;
+	const struct rzg2l_pinctrl_ps_desc *desc = rzg2l_ps_to_desc(ps, caps);
 
-	for (i = 0; i < ARRAY_SIZE(available_ps); i++) {
-		if (available_ps[i] == ps)
-			return true;
-	}
-
-	return false;
-}
-
-static enum rzg2l_iolh_index rzg2l_ps_to_iolh_idx(u16 ps)
-{
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(available_ps); i++) {
-		if (available_ps[i] == ps)
-			break;
-	}
-
-	/*
-	 * We multiply with RZG2L_IOLH_MAX_DS_ENTRIES as we have
-	 * RZG2L_IOLH_MAX_DS_ENTRIES DS values per power source
-	 */
-	return i * RZG2L_IOLH_MAX_DS_ENTRIES;
+	return desc ? desc->iolh_index : RZG2L_IOLH_IDX_NA;
 }
 
 static u16 rzg2l_iolh_val_to_ua(const struct rzg2l_hwcfg *hwcfg, u32 caps, u8 val)
@@ -1622,7 +1673,11 @@ static int rzg2l_pinctrl_pinconf_get(struct pinctrl_dev *pctldev,
 		ret = rzg2l_get_power_source(pctrl, _pin, cfg);
 		if (ret < 0)
 			return ret;
-		iolh_idx = rzg2l_ps_to_iolh_idx(ret);
+
+		iolh_idx = rzg2l_ps_to_iolh_idx(ret, cfg);
+		if (iolh_idx == RZG2L_IOLH_IDX_NA)
+			return -EINVAL;
+
 		val = rzg2l_read_pin_config(pctrl, IOLH(off), bit, IOLH_MASK);
 		arg = rzg2l_iolh_val_to_ua(hwcfg, cfg, iolh_idx + val);
 		break;
@@ -1818,8 +1873,7 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 
 	/* Apply power source. */
 	if (settings.power_source != pctrl->settings[_pin].power_source) {
-		ret = rzg2l_ps_is_supported(settings.power_source);
-		if (!ret)
+		if (!rzg2l_ps_to_desc(settings.power_source, cfg))
 			return -EINVAL;
 
 		/* Apply power source. */
@@ -1833,7 +1887,10 @@ static int rzg2l_pinctrl_pinconf_set(struct pinctrl_dev *pctldev,
 		enum rzg2l_iolh_index iolh_idx;
 		int val;
 
-		iolh_idx = rzg2l_ps_to_iolh_idx(settings.power_source);
+		iolh_idx = rzg2l_ps_to_iolh_idx(settings.power_source, cfg);
+		if (iolh_idx == RZG2L_IOLH_IDX_NA)
+			return -EINVAL;
+
 		ret = rzg2l_ds_is_supported(pctrl, cfg, iolh_idx,
 					    settings.drive_strength_ua);
 		if (!ret)
-- 
2.43.0

