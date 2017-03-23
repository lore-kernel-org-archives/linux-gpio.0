From: John Keeping <john@metanate.com>
Subject: [PATCH v4 1/4] pinctrl: rockchip: remove unnecessary locking
Date: Thu, 23 Mar 2017 10:59:28 +0000
Message-ID: <20170323105931.10455-2-john@metanate.com>
References: <20170323105931.10455-1-john@metanate.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from dougal.metanate.com ([90.155.101.14]:14850 "EHLO metanate.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932466AbdCWLAe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Mar 2017 07:00:34 -0400
In-Reply-To: <20170323105931.10455-1-john@metanate.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Julia Cartwright <julia@ni.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, John Keeping <john@metanate.com>

regmap_update_bits does its own locking and everything else accessed
here is a local variable so there is no need to lock around it.

Signed-off-by: John Keeping <john@metanate.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
v3: unchanged
v2.1:
- Remove RK2928 locking in rockchip_set_pull()
v2:
- Also remove locking in rockchip_set_schmitt()
---
 drivers/pinctrl/pinctrl-rockchip.c | 33 ++-------------------------------
 1 file changed, 2 insertions(+), 31 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index bd4b63f66220..6568c867bdcd 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -652,7 +652,6 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	int iomux_num = (pin / 8);
 	struct regmap *regmap;
 	int reg, ret, mask, mux_type;
-	unsigned long flags;
 	u8 bit;
 	u32 data, rmask;
 
@@ -701,15 +700,11 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	if (ctrl->iomux_recalc && (mux_type & IOMUX_RECALCED))
 		ctrl->iomux_recalc(bank->bank_num, pin, &reg, &bit, &mask);
 
-	spin_lock_irqsave(&bank->slock, flags);
-
 	data = (mask << (bit + 16));
 	rmask = data | (data >> 16);
 	data |= (mux & mask) << bit;
 	ret = regmap_update_bits(regmap, reg, rmask, data);
 
-	spin_unlock_irqrestore(&bank->slock, flags);
-
 	return ret;
 }
 
@@ -1135,7 +1130,6 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 	struct rockchip_pinctrl *info = bank->drvdata;
 	struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct regmap *regmap;
-	unsigned long flags;
 	int reg, ret, i;
 	u32 data, rmask, rmask_bits, temp;
 	u8 bit;
@@ -1163,8 +1157,6 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		return ret;
 	}
 
-	spin_lock_irqsave(&bank->slock, flags);
-
 	switch (drv_type) {
 	case DRV_TYPE_IO_1V8_3V0_AUTO:
 	case DRV_TYPE_IO_3V3_ONLY:
@@ -1185,17 +1177,14 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 			rmask = BIT(15) | BIT(31);
 			data |= BIT(31);
 			ret = regmap_update_bits(regmap, reg, rmask, data);
-			if (ret) {
-				spin_unlock_irqrestore(&bank->slock, flags);
+			if (ret)
 				return ret;
-			}
 
 			rmask = 0x3 | (0x3 << 16);
 			temp |= (0x3 << 16);
 			reg += 0x4;
 			ret = regmap_update_bits(regmap, reg, rmask, temp);
 
-			spin_unlock_irqrestore(&bank->slock, flags);
 			return ret;
 		case 18 ... 21:
 			/* setting fully enclosed in the second register */
@@ -1203,7 +1192,6 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 			bit -= 16;
 			break;
 		default:
-			spin_unlock_irqrestore(&bank->slock, flags);
 			dev_err(info->dev, "unsupported bit: %d for pinctrl drive type: %d\n",
 				bit, drv_type);
 			return -EINVAL;
@@ -1215,7 +1203,6 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		rmask_bits = RK3288_DRV_BITS_PER_PIN;
 		break;
 	default:
-		spin_unlock_irqrestore(&bank->slock, flags);
 		dev_err(info->dev, "unsupported pinctrl drive type: %d\n",
 			drv_type);
 		return -EINVAL;
@@ -1227,7 +1214,6 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 	data |= (ret << bit);
 
 	ret = regmap_update_bits(regmap, reg, rmask, data);
-	spin_unlock_irqrestore(&bank->slock, flags);
 
 	return ret;
 }
@@ -1294,7 +1280,6 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct regmap *regmap;
 	int reg, ret, i, pull_type;
-	unsigned long flags;
 	u8 bit;
 	u32 data, rmask;
 
@@ -1309,14 +1294,10 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 
 	switch (ctrl->type) {
 	case RK2928:
-		spin_lock_irqsave(&bank->slock, flags);
-
 		data = BIT(bit + 16);
 		if (pull == PIN_CONFIG_BIAS_DISABLE)
 			data |= BIT(bit);
 		ret = regmap_write(regmap, reg, data);
-
-		spin_unlock_irqrestore(&bank->slock, flags);
 		break;
 	case RV1108:
 	case RK3188:
@@ -1339,16 +1320,12 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 			return ret;
 		}
 
-		spin_lock_irqsave(&bank->slock, flags);
-
 		/* enable the write to the equivalent lower bits */
 		data = ((1 << RK3188_PULL_BITS_PER_PIN) - 1) << (bit + 16);
 		rmask = data | (data >> 16);
 		data |= (ret << bit);
 
 		ret = regmap_update_bits(regmap, reg, rmask, data);
-
-		spin_unlock_irqrestore(&bank->slock, flags);
 		break;
 	default:
 		dev_err(info->dev, "unsupported pinctrl type\n");
@@ -1408,7 +1385,6 @@ static int rockchip_set_schmitt(struct rockchip_pin_bank *bank,
 	struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct regmap *regmap;
 	int reg, ret;
-	unsigned long flags;
 	u8 bit;
 	u32 data, rmask;
 
@@ -1419,16 +1395,11 @@ static int rockchip_set_schmitt(struct rockchip_pin_bank *bank,
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&bank->slock, flags);
-
 	/* enable the write to the equivalent lower bits */
 	data = BIT(bit + 16) | (enable << bit);
 	rmask = BIT(bit + 16) | BIT(bit);
 
-	ret = regmap_update_bits(regmap, reg, rmask, data);
-	spin_unlock_irqrestore(&bank->slock, flags);
-
-	return ret;
+	return regmap_update_bits(regmap, reg, rmask, data);
 }
 
 /*
-- 
2.12.0.377.gf910686b23.dirty

