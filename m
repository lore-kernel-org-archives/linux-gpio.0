Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFE748D89C
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 13:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331832; cv=none; b=BzCTdOPQ19e5B/8WX+OR0ptfBPy7QLk/7KGbtzFle9rrPNAT659KB68M/tEpY5YF5yPYDEKM6tOBPN6xjcTgHs9bfni/PXFqzu3N304VsVz46HaiaLRXAet+N0W9ydPY5KDMTyZ9D/Vj5PnKM68NfbRbvGSeXue94/U6kOPiPWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331832; c=relaxed/simple;
	bh=oueusPkMTr2doN92hQqXYGW5MFvViZBL/xUb/Vo1yeE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJ2nBbgr2VT7sj1H9eVHDPAnqkS5MnWL8JKflpZpr2djjo9q1FZWWkhrEe9TgUiJ6hOmgt0TA1bcrp0h/ihytnOjYR79u7UO1SimySRi+hSFIL+0FX6VHG2coC9Vk1+ww5g7aGjRPgN1ybUKoqBDKxuL/BfiZ7NkpQM4pBQXqZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LrITWAIw; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LrITWAIw"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4a483a552efso353888b6e.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 06:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785331825; x=1785936625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BUxFHoBHdn28B47c4spoxc42rP6ch6/zwTGsysh3p5I=;
        b=LrITWAIwCP24RGkrE26Azek1v5HsFHUgUQR7V85PMqBSnvG/2KDJHYRnQeofg3OS5z
         liXzeDPw7jlI83ZMEegWyI2RnVUyqs9rVpg9B9CFo5S9NJxPURljzq8I3w5rbXfo2pIg
         2z0/ze87OkhOaUbLa/M5rPMpGLARsKXfgUxh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331825; x=1785936625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BUxFHoBHdn28B47c4spoxc42rP6ch6/zwTGsysh3p5I=;
        b=JhkUmnZ1x5YIwkDkupVmNuOpatKYq8jN1VpwugaS6qq9Jf1dPc2XWB855U5iwLrwmF
         eXP23DQU92cWXwZ7cILGRyqiXYGqNYtSanmuSVJ0oncaH9dWA1yUrABspzUrf2FiOgzL
         VKj4F09UYDh+Un+PGRCYmQFhddqU3RyfXGImiKGuJsL6kKelnjlIUX27M2o7MK/ZK1R7
         cpd2Hvb5WbuWxJNrjznei+q+53yO+8C3z8Z1tOFP3xw5fChy3YQpIyWXk5NBsMfT9ksf
         KNaf1DIGXTxxFfXAtWCs0ZM80GgGbrjcsLpjOhN6QiY7kQMZDJ9yATuHjF9RlOk4qaJo
         Z2lg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/GaQtbJAJnigCeAueMlpkNI2CHsBaP/t9lD0yU4kb+PMbtXCnzKTyOxYxBdjYRLeG2nhhvKC/3Zn5@vger.kernel.org
X-Gm-Message-State: AOJu0YxiWcJy7tY9WCDluigJqqlFysOjnXkAINE5NEMcWqsv+bV/pKdp
	pMAVI2QoCIHiI3QZsoSXwEyU1HSC739YmvegO4CMDZ1oGcSLgb/ayXqaIVxUilvJRg==
X-Gm-Gg: AR+sD13himB2kzGPB/MoDw//ecPxlsFLFpn5rOYS5fo6iR4qrkBwNpPAgUosBzaentd
	PNGlXAgtMbicqbXb/IuhOecYoei7f89jTy19TrbqbaME9Hm4W5fdZP/OUCK1IOrOc9JHShJ0GsV
	yHHSRA0k4oRcySKqdeOoDiU3M1Lcu0vuRMlw1+l3QGivyhjkTZM3Pt+2W5k9vzlpuU5rhtUfRoh
	zuOr80FyCdSM1ZAw1Zt/mvhd6/dSSl0jwfHUwsYtW7mv4Trl2B6c36cdEYcs0cZP7XNEz2tNgJs
	TFvGO9zGpyV1YvNUgrTqd1C2Iyat4xjOOV11mc+Tj3mkJptlumtQfc5eYkewtA2OifSpoy05DPa
	vB3dq2rqGubvnbB7FEk41XprFiMbsiZZI03uchKouCjzORIUbARuy7mIIE4tBTOKjFiqCSmfgqo
	UT02xTU5adxwyDwqdffun3HdpcAGGzHy421IxKE1EdI9piG+JrtpyKRU4=
X-Received: by 2002:a05:6808:220f:b0:496:2b3:ae71 with SMTP id 5614622812f47-4ad5b9cb9dfmr4064130b6e.18.1785331825191;
        Wed, 29 Jul 2026 06:30:25 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ef5d650sm1712932b6e.9.2026.07.29.06.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:30:24 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] pinctrl: rockchip: Add RV1106 pinctrl support
Date: Wed, 29 Jul 2026 07:27:28 -0600
Message-ID: <20260729072727.v3.4.0af20e702c540f54a3d1694654b158a9b783d68e@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729132736.3807082-1-sjg@chromium.org>
References: <20260729132736.3807082-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pinctrl support for the Rockchip RV1106, based on the vendor
kernel in the Luckfox Pico SDK [1] at commit 824b817f8 (a Linux
5.10.160 kernel tree). Each GPIO bank has its own IO control (IOC)
register block, referenced by the rockchip,grf phandle of the bank
node; the register offsets are relative to the bank's own block. The
drive strength uses the RK3568-style exponential encoding and only
pins 0-6 of GPIO0 have drive-strength registers.

The RV1103 is a package variant of the RV1106 with fewer pins and uses
the same pin controller.

[1] https://github.com/LuckfoxTECH/luckfox-pico

Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v3:
- Declare the 8-bit level drive type on the banks so that reads decode
  correctly
- Return an error from the iomux functions when a bank has no IOC
  regmap, rather than falling back to the shared regmap

Changes in v2:
- Use a separate IOC regmap per bank, taken from the rockchip,grf
  phandle of each bank node and identified by the gpio alias, with
  block-relative register offsets
- Reject drive-strength requests for GPIO0 pins above 6, which have no
  drive-strength registers
- Specify only the first iomux offset for each bank, letting the driver
  calculate the increments

 drivers/pinctrl/pinctrl-rockchip.c | 192 +++++++++++++++++++++++++++++
 drivers/pinctrl/pinctrl-rockchip.h |   4 +
 2 files changed, 196 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 08a46a04a815..4e5e4434ba4e 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1188,6 +1188,12 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 	else
 		regmap = info->regmap_base;
 
+	/* Banks with their own IOC block use its regmap for the iomux */
+	if (bank->regmap_ioc)
+		regmap = bank->regmap_ioc;
+	else if (ctrl->type == RV1106)
+		return -EINVAL;
+
 	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin >= 12)
 		return 0;
 
@@ -1317,6 +1323,12 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	else
 		regmap = info->regmap_base;
 
+	/* Banks with their own IOC block use its regmap for the iomux */
+	if (bank->regmap_ioc)
+		regmap = bank->regmap_ioc;
+	else if (ctrl->type == RV1106)
+		return -EINVAL;
+
 	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin >= 12)
 		return 0;
 
@@ -1725,6 +1737,78 @@ static int rv1103b_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 	return 0;
 }
 
+#define RV1106_DRV_BITS_PER_PIN		8
+#define RV1106_DRV_PINS_PER_REG		2
+#define RV1106_PULL_BITS_PER_PIN	2
+#define RV1106_PULL_PINS_PER_REG	8
+#define RV1106_SMT_BITS_PER_PIN		1
+#define RV1106_SMT_PINS_PER_REG		8
+
+/*
+ * Each bank has its own IOC block, referenced by the rockchip,grf
+ * phandle of the bank node. The offsets below are relative to the
+ * bank's own block.
+ */
+static const int rv1106_drv_offsets[] = { 0x10, 0x80, 0xc0, 0x100, 0x20 };
+static const int rv1106_pull_offsets[] = { 0x38, 0x1c0, 0x1d0, 0x1e0, 0x70 };
+static const int rv1106_smt_offsets[] = { 0x40, 0x280, 0x290, 0x2a0, 0xa0 };
+
+static int rv1106_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
+				       int pin_num, struct regmap **regmap,
+				       int *reg, u8 *bit)
+{
+	if (bank->bank_num >= ARRAY_SIZE(rv1106_drv_offsets) ||
+	    !bank->regmap_ioc)
+		return -EINVAL;
+
+	/* Only pins 0-6 of GPIO0 have drive-strength registers */
+	if (bank->bank_num == 0 && pin_num > 6)
+		return -ENOTSUPP;
+
+	*regmap = bank->regmap_ioc;
+	*reg = rv1106_drv_offsets[bank->bank_num];
+	*reg += ((pin_num / RV1106_DRV_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1106_DRV_PINS_PER_REG;
+	*bit *= RV1106_DRV_BITS_PER_PIN;
+
+	return 0;
+}
+
+static int rv1106_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
+					int pin_num, struct regmap **regmap,
+					int *reg, u8 *bit)
+{
+	if (bank->bank_num >= ARRAY_SIZE(rv1106_pull_offsets) ||
+	    !bank->regmap_ioc)
+		return -EINVAL;
+
+	*regmap = bank->regmap_ioc;
+	*reg = rv1106_pull_offsets[bank->bank_num];
+	*reg += ((pin_num / RV1106_PULL_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1106_PULL_PINS_PER_REG;
+	*bit *= RV1106_PULL_BITS_PER_PIN;
+
+	return 0;
+}
+
+static int rv1106_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	if (bank->bank_num >= ARRAY_SIZE(rv1106_smt_offsets) ||
+	    !bank->regmap_ioc)
+		return -EINVAL;
+
+	*regmap = bank->regmap_ioc;
+	*reg = rv1106_smt_offsets[bank->bank_num];
+	*reg += ((pin_num / RV1106_SMT_PINS_PER_REG) * 4);
+	*bit = pin_num % RV1106_SMT_PINS_PER_REG;
+	*bit *= RV1106_SMT_BITS_PER_PIN;
+
+	return 0;
+}
+
 #define RV1108_PULL_PMU_OFFSET		0x10
 #define RV1108_PULL_OFFSET		0x110
 #define RV1108_PULL_PINS_PER_REG	8
@@ -3329,6 +3413,7 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		ret = strength;
 		goto config;
 	} else if (ctrl->type == RV1103B ||
+		   ctrl->type == RV1106 ||
 		   ctrl->type == RK3506 ||
 		   ctrl->type == RK3528 ||
 		   ctrl->type == RK3562 ||
@@ -3482,6 +3567,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
 				: PIN_CONFIG_BIAS_DISABLE;
 	case PX30:
 	case RV1103B:
+	case RV1106:
 	case RV1108:
 	case RK3188:
 	case RK3288:
@@ -3547,6 +3633,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 		break;
 	case PX30:
 	case RV1103B:
+	case RV1106:
 	case RV1108:
 	case RV1126:
 	case RK3188:
@@ -3843,6 +3930,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
 		return pull ? false : true;
 	case PX30:
 	case RV1103B:
+	case RV1106:
 	case RV1108:
 	case RV1126:
 	case RK3188:
@@ -4452,6 +4540,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *base;
 	int ret;
+	int i;
 
 	if (!dev->of_node)
 		return dev_err_probe(dev, -ENODEV, "device tree node not found\n");
@@ -4505,6 +4594,44 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	/* try to find the optional reference to the ioc1 syscon */
 	info->regmap_ioc1 = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,ioc1");
 
+	/*
+	 * On SoCs where each GPIO bank has its own IOC block, the bank nodes
+	 * carry a rockchip,grf phandle pointing at it. The bank number comes
+	 * from the gpio alias, as used by the gpio driver, falling back to
+	 * the node position for devicetrees without aliases. The fallback is
+	 * wrong when an SoC variant omits a bank, so aliases are needed
+	 * there.
+	 */
+	i = 0;
+	for_each_child_of_node_scoped(np, child) {
+		struct rockchip_pin_bank *bank = NULL;
+		int id, j;
+
+		if (!of_match_node(rockchip_bank_match, child))
+			continue;
+
+		id = of_alias_get_id(child, "gpio");
+		if (id < 0)
+			id = i;
+		i++;
+
+		for (j = 0; j < ctrl->nr_banks; j++) {
+			if (ctrl->pin_banks[j].bank_num == id) {
+				bank = &ctrl->pin_banks[j];
+				break;
+			}
+		}
+		if (!bank)
+			continue;
+
+		bank->regmap_ioc = syscon_regmap_lookup_by_phandle_optional(
+							child, "rockchip,grf");
+		if (IS_ERR(bank->regmap_ioc))
+			return dev_err_probe(dev, PTR_ERR(bank->regmap_ioc),
+					     "%pOFn: failed to look up bank ioc\n",
+					     child);
+	}
+
 	ret = rockchip_pinctrl_register(pdev, info);
 	if (ret)
 		return ret;
@@ -4623,6 +4750,69 @@ static struct rockchip_pin_ctrl rv1103b_pin_ctrl __maybe_unused = {
 	.schmitt_calc_reg	= rv1103b_calc_schmitt_reg_and_bit,
 };
 
+static struct rockchip_pin_bank rv1106_pin_banks[] = {
+	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(0, 32, "gpio0",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0, -1, -1, -1,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT),
+	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(1, 32, "gpio1",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0, -1, -1, -1,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT),
+	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(2, 32, "gpio2",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x20, -1, -1, -1,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT),
+	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(3, 32, "gpio3",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0x40, -1, -1, -1,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT),
+	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(4, 24, "gpio4",
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    IOMUX_WIDTH_4BIT,
+				    0,
+				    0, -1, -1, -1,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT,
+				    DRV_TYPE_IO_LEVEL_8_BIT),
+};
+
+static struct rockchip_pin_ctrl rv1106_pin_ctrl __maybe_unused = {
+	.pin_banks		= rv1106_pin_banks,
+	.nr_banks		= ARRAY_SIZE(rv1106_pin_banks),
+	.label			= "RV1106-GPIO",
+	.type			= RV1106,
+	.pull_calc_reg		= rv1106_calc_pull_reg_and_bit,
+	.drv_calc_reg		= rv1106_calc_drv_reg_and_bit,
+	.schmitt_calc_reg	= rv1106_calc_schmitt_reg_and_bit,
+};
+
 static struct rockchip_pin_bank rv1108_pin_banks[] = {
 	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU,
 					     IOMUX_SOURCE_PMU,
@@ -5261,6 +5451,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
 		.data = &px30_pin_ctrl },
 	{ .compatible = "rockchip,rv1103b-pinctrl",
 		.data = &rv1103b_pin_ctrl },
+	{ .compatible = "rockchip,rv1106-pinctrl",
+		.data = &rv1106_pin_ctrl },
 	{ .compatible = "rockchip,rv1108-pinctrl",
 		.data = &rv1108_pin_ctrl },
 	{ .compatible = "rockchip,rv1126-pinctrl",
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index bb0e803e3b8a..f62213d99792 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -186,6 +186,7 @@
 enum rockchip_pinctrl_type {
 	PX30,
 	RV1103B,
+	RV1106,
 	RV1108,
 	RV1126,
 	RK2928,
@@ -295,6 +296,8 @@ struct rockchip_drv {
  * @dev: the pinctrl device bind to the bank
  * @reg_base: register base of the gpio bank
  * @regmap_pull: optional separate register for additional pull settings
+ * @regmap_ioc: optional per-bank IO control regmap, for SoCs where each
+ *	    bank has its own IOC block
  * @clk: clock of the gpio bank
  * @db_clk: clock of the gpio debounce
  * @irq: interrupt of the gpio bank
@@ -323,6 +326,7 @@ struct rockchip_pin_bank {
 	struct device			*dev;
 	void __iomem			*reg_base;
 	struct regmap			*regmap_pull;
+	struct regmap			*regmap_ioc;
 	struct clk			*clk;
 	struct clk			*db_clk;
 	int				irq;
-- 
2.43.0

