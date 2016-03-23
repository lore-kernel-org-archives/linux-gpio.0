From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 1/2] pinctrl: sh-pfc: Add drive strength support
Date: Wed, 23 Mar 2016 16:06:00 +0200
Message-ID: <1458741961-4039-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1458741961-4039-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:38814 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752432AbcCWOGF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Mar 2016 10:06:05 -0400
In-Reply-To: <1458741961-4039-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Add support for the drive-strengh pin configuration using the generic
pinconf DT bindings.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/pinctrl/renesas,pfc-pinctrl.txt       |   4 +-
 drivers/pinctrl/sh-pfc/core.c                      |  15 +++
 drivers/pinctrl/sh-pfc/core.h                      |   3 +
 drivers/pinctrl/sh-pfc/pinctrl.c                   | 111 +++++++++++++++++++++
 drivers/pinctrl/sh-pfc/sh_pfc.h                    |  17 ++++
 5 files changed, 148 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
index ffadb7a371f6..74e6ec0339d6 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
@@ -72,8 +72,8 @@ Pin Configuration Node Properties:
 
 The pin configuration parameters use the generic pinconf bindings defined in
 pinctrl-bindings.txt in this directory. The supported parameters are
-bias-disable, bias-pull-up, bias-pull-down and power-source. For pins that
-have a configurable I/O voltage, the power-source value should be the
+bias-disable, bias-pull-up, bias-pull-down, drive strength and power-source. For
+pins that have a configurable I/O voltage, the power-source value should be the
 nominal I/O voltage in millivolts.
 
 
diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 181ea98a63b7..73f0b33ee0a1 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -173,6 +173,21 @@ void sh_pfc_write_raw_reg(void __iomem *mapped_reg, unsigned int reg_width,
 	BUG();
 }
 
+u32 sh_pfc_read_reg(struct sh_pfc *pfc, u32 reg, unsigned int width)
+{
+	return sh_pfc_read_raw_reg(sh_pfc_phys_to_virt(pfc, reg), width);
+}
+
+void sh_pfc_write_reg(struct sh_pfc *pfc, u32 reg, unsigned int width, u32 data)
+{
+	if (pfc->info->unlock_reg)
+		sh_pfc_write_raw_reg(
+			sh_pfc_phys_to_virt(pfc, pfc->info->unlock_reg), 32,
+			~data);
+
+	sh_pfc_write_raw_reg(sh_pfc_phys_to_virt(pfc, reg), width, data);
+}
+
 static void sh_pfc_config_reg_helper(struct sh_pfc *pfc,
 				     const struct pinmux_cfg_reg *crp,
 				     unsigned int in_pos,
diff --git a/drivers/pinctrl/sh-pfc/core.h b/drivers/pinctrl/sh-pfc/core.h
index 62f53b22ae85..fc05d0c516f3 100644
--- a/drivers/pinctrl/sh-pfc/core.h
+++ b/drivers/pinctrl/sh-pfc/core.h
@@ -62,6 +62,9 @@ int sh_pfc_unregister_pinctrl(struct sh_pfc *pfc);
 u32 sh_pfc_read_raw_reg(void __iomem *mapped_reg, unsigned int reg_width);
 void sh_pfc_write_raw_reg(void __iomem *mapped_reg, unsigned int reg_width,
 			  u32 data);
+u32 sh_pfc_read_reg(struct sh_pfc *pfc, u32 reg, unsigned int width);
+void sh_pfc_write_reg(struct sh_pfc *pfc, u32 reg, unsigned int width,
+		      u32 data);
 
 int sh_pfc_get_pin_index(struct sh_pfc *pfc, unsigned int pin);
 int sh_pfc_config_mux(struct sh_pfc *pfc, unsigned mark, int pinmux_type);
diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index 87b0a599afaf..8efaa0631be6 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -476,6 +476,91 @@ static const struct pinmux_ops sh_pfc_pinmux_ops = {
 	.gpio_set_direction	= sh_pfc_gpio_set_direction,
 };
 
+static u32 sh_pfc_pinconf_find_drive_strength_reg(struct sh_pfc *pfc,
+		unsigned int pin, unsigned int *offset, unsigned int *size)
+{
+	const struct pinmux_drive_reg_field *field;
+	const struct pinmux_drive_reg *reg;
+	unsigned int i;
+
+	for (reg = pfc->info->drive_regs; reg->reg; ++reg) {
+		for (i = 0; i < ARRAY_SIZE(reg->fields); ++i) {
+			field = &reg->fields[i];
+
+			if (field->size && field->pin == pin) {
+				*offset = field->offset;
+				*size = field->size;
+
+				return reg->reg;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int sh_pfc_pinconf_get_drive_strength(struct sh_pfc *pfc,
+					     unsigned int pin)
+{
+	unsigned long flags;
+	unsigned int offset;
+	unsigned int size;
+	u32 reg;
+	u32 val;
+
+	reg = sh_pfc_pinconf_find_drive_strength_reg(pfc, pin, &offset, &size);
+	if (!reg)
+		return -EINVAL;
+
+	spin_lock_irqsave(&pfc->lock, flags);
+	val = sh_pfc_read_reg(pfc, reg, 32);
+	spin_unlock_irqrestore(&pfc->lock, flags);
+
+	val = (val >> offset) & GENMASK(size - 1, 0);
+
+	/* Convert the value to mA based on a full drive strength value of 24mA.
+	 * We can make the full value configurable later if needed.
+	 */
+	return (val + 1) * (size == 2 ? 6 : 3);
+}
+
+static int sh_pfc_pinconf_set_drive_strength(struct sh_pfc *pfc,
+					     unsigned int pin, u16 strength)
+{
+	unsigned long flags;
+	unsigned int offset;
+	unsigned int size;
+	unsigned int step;
+	u32 reg;
+	u32 val;
+
+	reg = sh_pfc_pinconf_find_drive_strength_reg(pfc, pin, &offset, &size);
+	if (!reg)
+		return -EINVAL;
+
+	step = size == 2 ? 6 : 3;
+
+	if (strength < step || strength > 24)
+		return -EINVAL;
+
+	/* Convert the value from mA based on a full drive strength value of
+	 * 24mA. We can make the full value configurable later if needed.
+	 */
+	strength = strength / step - 1;
+
+	spin_lock_irqsave(&pfc->lock, flags);
+
+	val = sh_pfc_read_reg(pfc, reg, 32);
+	val &= ~GENMASK(offset + size - 1, offset);
+	val |= strength << offset;
+
+	sh_pfc_write_reg(pfc, reg, 32, val);
+
+	spin_unlock_irqrestore(&pfc->lock, flags);
+
+	return 0;
+}
+
 /* Check whether the requested parameter is supported for a pin. */
 static bool sh_pfc_pinconf_validate(struct sh_pfc *pfc, unsigned int _pin,
 				    enum pin_config_param param)
@@ -493,6 +578,9 @@ static bool sh_pfc_pinconf_validate(struct sh_pfc *pfc, unsigned int _pin,
 	case PIN_CONFIG_BIAS_PULL_DOWN:
 		return pin->configs & SH_PFC_PIN_CFG_PULL_DOWN;
 
+	case PIN_CONFIG_DRIVE_STRENGTH:
+		return pin->configs & SH_PFC_PIN_CFG_DRIVE_STRENGTH;
+
 	case PIN_CONFIG_POWER_SOURCE:
 		return pin->configs & SH_PFC_PIN_CFG_IO_VOLTAGE;
 
@@ -532,6 +620,17 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
 		break;
 	}
 
+	case PIN_CONFIG_DRIVE_STRENGTH: {
+		int ret;
+
+		ret = sh_pfc_pinconf_get_drive_strength(pfc, _pin);
+		if (ret < 0)
+			return ret;
+
+		*config = ret;
+		break;
+	}
+
 	case PIN_CONFIG_POWER_SOURCE: {
 		int ret;
 
@@ -584,6 +683,18 @@ static int sh_pfc_pinconf_set(struct pinctrl_dev *pctldev, unsigned _pin,
 
 			break;
 
+		case PIN_CONFIG_DRIVE_STRENGTH: {
+			unsigned int arg =
+				pinconf_to_config_argument(configs[i]);
+			int ret;
+
+			ret = sh_pfc_pinconf_set_drive_strength(pfc, _pin, arg);
+			if (ret < 0)
+				return ret;
+
+			break;
+		}
+
 		case PIN_CONFIG_POWER_SOURCE: {
 			unsigned int arg =
 				pinconf_to_config_argument(configs[i]);
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 2123ab49d6a5..8d548fb39229 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -28,6 +28,7 @@ enum {
 #define SH_PFC_PIN_CFG_PULL_UP		(1 << 2)
 #define SH_PFC_PIN_CFG_PULL_DOWN	(1 << 3)
 #define SH_PFC_PIN_CFG_IO_VOLTAGE	(1 << 4)
+#define SH_PFC_PIN_CFG_DRIVE_STRENGTH	(1 << 5)
 #define SH_PFC_PIN_CFG_NO_GPIO		(1 << 31)
 
 struct sh_pfc_pin {
@@ -110,6 +111,21 @@ struct pinmux_cfg_reg {
 		{ var_fw0, var_fwn, 0 }, \
 	.enum_ids = (const u16 [])
 
+struct pinmux_drive_reg_field {
+	u16 pin;
+	u8 offset;
+	u8 size;
+};
+
+struct pinmux_drive_reg {
+	u32 reg;
+	const struct pinmux_drive_reg_field fields[8];
+};
+
+#define PINMUX_DRIVE_REG(name, r) \
+	.reg = r, \
+	.fields =
+
 struct pinmux_data_reg {
 	u32 reg;
 	u8 reg_width;
@@ -166,6 +182,7 @@ struct sh_pfc_soc_info {
 #endif
 
 	const struct pinmux_cfg_reg *cfg_regs;
+	const struct pinmux_drive_reg *drive_regs;
 	const struct pinmux_data_reg *data_regs;
 
 	const u16 *pinmux_data;
-- 
2.7.3

