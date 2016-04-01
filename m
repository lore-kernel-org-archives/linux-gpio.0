From: Cristina Ciocan <cristina.ciocan@intel.com>
Subject: [PATCH 7/7] pinctrl: baytrail: Add debounce configuration
Date: Fri,  1 Apr 2016 13:56:23 +0300
Message-ID: <1459508183-21843-13-git-send-email-cristina.ciocan@intel.com>
References: <1459508183-21843-1-git-send-email-cristina.ciocan@intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459508183-21843-1-git-send-email-cristina.ciocan@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: mathias.nyman@linux.intel.com, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, irina.tirdea@intel.com, octavian.purdila@intel.com, Cristina Ciocan <cristina.ciocan@intel.com>
List-Id: linux-gpio@vger.kernel.org

Make debounce setting and getting functionality available when
configurating a certain pin.

Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 83 +++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 960db0e..9e6952d 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -38,6 +38,7 @@
 #define BYT_VAL_REG		0x008
 #define BYT_DFT_REG		0x00c
 #define BYT_INT_STAT_REG	0x800
+#define BYT_DEBOUNCE_REG	0x9d0
 
 /* BYT_CONF0_REG register bits */
 #define BYT_IODEN		BIT(31)
@@ -45,6 +46,7 @@
 #define BYT_TRIG_NEG		BIT(26)
 #define BYT_TRIG_POS		BIT(25)
 #define BYT_TRIG_LVL		BIT(24)
+#define BYT_DEBOUNCE_EN		BIT(20)
 #define BYT_PULL_STR_SHIFT	9
 #define BYT_PULL_STR_MASK	(3 << BYT_PULL_STR_SHIFT)
 #define BYT_PULL_STR_2K		(0 << BYT_PULL_STR_SHIFT)
@@ -69,6 +71,16 @@
 				 BYT_PIN_MUX)
 #define BYT_VAL_RESTORE_MASK	(BYT_DIR_MASK | BYT_LEVEL)
 
+/* BYT_DEBOUNCE_REG bits */
+#define BYT_DEBOUNCE_PULSE_MASK		0x7
+#define BYT_DEBOUNCE_PULSE_375US	1
+#define BYT_DEBOUNCE_PULSE_750US	2
+#define BYT_DEBOUNCE_PULSE_1500US	3
+#define BYT_DEBOUNCE_PULSE_3MS		4
+#define BYT_DEBOUNCE_PULSE_6MS		5
+#define BYT_DEBOUNCE_PULSE_12MS		6
+#define BYT_DEBOUNCE_PULSE_24MS		7
+
 #define BYT_NGPIO_SCORE		102
 #define BYT_NGPIO_NCORE		28
 #define BYT_NGPIO_SUS		44
@@ -1078,7 +1090,7 @@ static int byt_pin_config_get(struct pinctrl_dev *pctl_dev, unsigned int offset,
 	void __iomem *conf_reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
 	void __iomem *val_reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
 	unsigned long flags;
-	u32 conf, pull, val;
+	u32 conf, pull, val, debounce;
 	u16 arg = 0;
 
 	raw_spin_lock_irqsave(&vg->lock, flags);
@@ -1108,6 +1120,41 @@ static int byt_pin_config_get(struct pinctrl_dev *pctl_dev, unsigned int offset,
 		byt_get_pull_strength(conf, &arg);
 
 		break;
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		if (!(conf & BYT_DEBOUNCE_EN))
+			return -EINVAL;
+
+		raw_spin_lock_irqsave(&vg->lock, flags);
+		debounce = readl(byt_gpio_reg(vg, offset, BYT_DEBOUNCE_REG));
+		raw_spin_unlock_irqrestore(&vg->lock, flags);
+
+		switch (debounce & BYT_DEBOUNCE_PULSE_MASK) {
+		case BYT_DEBOUNCE_PULSE_375US:
+			arg = 375;
+			break;
+		case BYT_DEBOUNCE_PULSE_750US:
+			arg = 750;
+			break;
+		case BYT_DEBOUNCE_PULSE_1500US:
+			arg = 1500;
+			break;
+		case BYT_DEBOUNCE_PULSE_3MS:
+			arg = 3000;
+			break;
+		case BYT_DEBOUNCE_PULSE_6MS:
+			arg = 6000;
+			break;
+		case BYT_DEBOUNCE_PULSE_12MS:
+			arg = 12000;
+			break;
+		case BYT_DEBOUNCE_PULSE_24MS:
+			arg = 24000;
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		break;
 	default:
 		return -ENOTSUPP;
 	}
@@ -1127,7 +1174,7 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 	void __iomem *conf_reg = byt_gpio_reg(vg, offset, BYT_CONF0_REG);
 	void __iomem *val_reg = byt_gpio_reg(vg, offset, BYT_VAL_REG);
 	unsigned long flags;
-	u32 conf, val;
+	u32 conf, val, debounce;
 	int i, ret = 0;
 
 	raw_spin_lock_irqsave(&vg->lock, flags);
@@ -1187,6 +1234,38 @@ static int byt_pin_config_set(struct pinctrl_dev *pctl_dev,
 			ret = byt_set_pull_strength(&conf, arg);
 
 			break;
+		case PIN_CONFIG_INPUT_DEBOUNCE:
+			debounce = readl(byt_gpio_reg(vg, offset,
+						      BYT_DEBOUNCE_REG));
+			conf &= ~BYT_DEBOUNCE_PULSE_MASK;
+
+			switch (arg) {
+			case 375:
+				conf |= BYT_DEBOUNCE_PULSE_375US;
+				break;
+			case 750:
+				conf |= BYT_DEBOUNCE_PULSE_750US;
+				break;
+			case 1500:
+				conf |= BYT_DEBOUNCE_PULSE_1500US;
+				break;
+			case 3000:
+				conf |= BYT_DEBOUNCE_PULSE_3MS;
+				break;
+			case 6000:
+				conf |= BYT_DEBOUNCE_PULSE_6MS;
+				break;
+			case 12000:
+				conf |= BYT_DEBOUNCE_PULSE_12MS;
+				break;
+			case 24000:
+				conf |= BYT_DEBOUNCE_PULSE_24MS;
+				break;
+			default:
+				ret = -EINVAL;
+			}
+
+			break;
 		default:
 			ret = -ENOTSUPP;
 		}
-- 
1.9.1
