From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 1/3] pinctrl: sh-pfc: refactor voltage setting
Date: Mon,  6 Jun 2016 18:08:25 +0200
Message-ID: <1465229307-1961-2-git-send-email-wsa@the-dreams.de>
References: <1465229307-1961-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1465229307-1961-1-git-send-email-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

All known hardware being able to switch voltages has the same POCCTRL
register. So, factor out the common code to the core and keep only
the pin-to-bit mapping SoC specific. Convert the only user, r8a7790.
In case POCCTRL should ever get more complex (more voltages to select?),
we should probably switch over to a describing array like drive strength
does currently.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c | 58 ++++++++----------------------------
 drivers/pinctrl/sh-pfc/pinctrl.c     | 41 +++++++++++++++----------
 drivers/pinctrl/sh-pfc/sh_pfc.h      |  4 +--
 3 files changed, 40 insertions(+), 63 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
index eed8daa464cc1e..1537a077939977 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
@@ -4696,47 +4696,6 @@ static const char * const vin3_groups[] = {
 	"vin3_clk",
 };
 
-#define IOCTRL6 0x8c
-
-static int r8a7790_get_io_voltage(struct sh_pfc *pfc, unsigned int pin)
-{
-	u32 data, mask;
-
-	if (WARN(pin < RCAR_GP_PIN(3, 0) || pin > RCAR_GP_PIN(3, 31), "invalid pin %#x", pin))
-		return -EINVAL;
-
-	data = ioread32(pfc->windows->virt + IOCTRL6),
-	/* Bits in IOCTRL6 are numbered in opposite order to pins */
-	mask = 0x80000000 >> (pin & 0x1f);
-
-	return (data & mask) ? 3300 : 1800;
-}
-
-static int r8a7790_set_io_voltage(struct sh_pfc *pfc, unsigned int pin, u16 mV)
-{
-	u32 data, mask;
-
-	if (WARN(pin < RCAR_GP_PIN(3, 0) || pin > RCAR_GP_PIN(3, 31), "invalid pin %#x", pin))
-		return -EINVAL;
-
-	if (mV != 1800 && mV != 3300)
-		return -EINVAL;
-
-	data = ioread32(pfc->windows->virt + IOCTRL6);
-	/* Bits in IOCTRL6 are numbered in opposite order to pins */
-	mask = 0x80000000 >> (pin & 0x1f);
-
-	if (mV == 3300)
-		data |= mask;
-	else
-		data &= ~mask;
-
-	iowrite32(~data, pfc->windows->virt); /* unlock reg */
-	iowrite32(data, pfc->windows->virt + IOCTRL6);
-
-	return 0;
-}
-
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(audio_clk),
 	SH_PFC_FUNCTION(avb),
@@ -5736,14 +5695,23 @@ static const struct pinmux_cfg_reg pinmux_config_regs[] = {
 	{ },
 };
 
-static const struct sh_pfc_soc_operations pinmux_ops = {
-	.get_io_voltage = r8a7790_get_io_voltage,
-	.set_io_voltage = r8a7790_set_io_voltage,
+static int r8a7790_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
+{
+	if (pin < RCAR_GP_PIN(3, 0) || pin > RCAR_GP_PIN(3, 31))
+		return -EINVAL;
+
+	*pocctrl = 0xe606008c;
+
+	return 31 - (pin & 0x1f);
+}
+
+static const struct sh_pfc_soc_operations r8a7790_pinmux_ops = {
+	.pin_to_pocctrl = r8a7790_pin_to_pocctrl,
 };
 
 const struct sh_pfc_soc_info r8a7790_pinmux_info = {
 	.name = "r8a77900_pfc",
-	.ops = &pinmux_ops,
+	.ops = &r8a7790_pinmux_ops,
 	.unlock_reg = 0xe6060000, /* PMMR */
 
 	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
diff --git a/drivers/pinctrl/sh-pfc/pinctrl.c b/drivers/pinctrl/sh-pfc/pinctrl.c
index fdb445d68b9a08..d4e65bc7dacd67 100644
--- a/drivers/pinctrl/sh-pfc/pinctrl.c
+++ b/drivers/pinctrl/sh-pfc/pinctrl.c
@@ -632,19 +632,21 @@ static int sh_pfc_pinconf_get(struct pinctrl_dev *pctldev, unsigned _pin,
 	}
 
 	case PIN_CONFIG_POWER_SOURCE: {
-		int ret;
+		u32 pocctrl, val;
+		int bit;
 
-		if (!pfc->info->ops || !pfc->info->ops->get_io_voltage)
+		if (!pfc->info->ops || !pfc->info->ops->pin_to_pocctrl)
 			return -ENOTSUPP;
 
+		bit = pfc->info->ops->pin_to_pocctrl(pfc, _pin, &pocctrl);
+		if (WARN(bit < 0, "invalid pin %#x", _pin))
+			return bit;
+
 		spin_lock_irqsave(&pfc->lock, flags);
-		ret = pfc->info->ops->get_io_voltage(pfc, _pin);
+		val = sh_pfc_read_reg(pfc, pocctrl, 32);
 		spin_unlock_irqrestore(&pfc->lock, flags);
 
-		if (ret < 0)
-			return ret;
-
-		*config = ret;
+		*config = (val & BIT(bit)) ? 3300 : 1800;
 		break;
 	}
 
@@ -696,20 +698,29 @@ static int sh_pfc_pinconf_set(struct pinctrl_dev *pctldev, unsigned _pin,
 		}
 
 		case PIN_CONFIG_POWER_SOURCE: {
-			unsigned int arg =
-				pinconf_to_config_argument(configs[i]);
-			int ret;
+			unsigned int mV = pinconf_to_config_argument(configs[i]);
+			u32 pocctrl, val;
+			int bit;
 
-			if (!pfc->info->ops || !pfc->info->ops->set_io_voltage)
+			if (!pfc->info->ops || !pfc->info->ops->pin_to_pocctrl)
 				return -ENOTSUPP;
 
+			bit = pfc->info->ops->pin_to_pocctrl(pfc, _pin, &pocctrl);
+			if (WARN(bit < 0, "invalid pin %#x", _pin))
+				return bit;
+
+			if (mV != 1800 && mV != 3300)
+				return -EINVAL;
+
 			spin_lock_irqsave(&pfc->lock, flags);
-			ret = pfc->info->ops->set_io_voltage(pfc, _pin, arg);
+			val = sh_pfc_read_reg(pfc, pocctrl, 32);
+			if (mV == 3300)
+				val |= BIT(bit);
+			else
+				val &= ~BIT(bit);
+			sh_pfc_write_reg(pfc, pocctrl, 32, val);
 			spin_unlock_irqrestore(&pfc->lock, flags);
 
-			if (ret)
-				return ret;
-
 			break;
 		}
 
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 656ea32f776c92..ea3a527514558a 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -189,9 +189,7 @@ struct sh_pfc_soc_operations {
 	unsigned int (*get_bias)(struct sh_pfc *pfc, unsigned int pin);
 	void (*set_bias)(struct sh_pfc *pfc, unsigned int pin,
 			 unsigned int bias);
-	int (*get_io_voltage)(struct sh_pfc *pfc, unsigned int pin);
-	int (*set_io_voltage)(struct sh_pfc *pfc, unsigned int pin,
-			      u16 voltage_mV);
+	int (*pin_to_pocctrl)(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl);
 };
 
 struct sh_pfc_soc_info {
-- 
2.8.1
