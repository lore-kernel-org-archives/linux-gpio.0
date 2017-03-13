From: John Keeping <john@metanate.com>
Subject: [RFC PATCH 1/4] pinctrl: rockchip: remove unnecessary locking
Date: Mon, 13 Mar 2017 18:38:10 +0000
Message-ID: <20170313183813.3582-2-john@metanate.com>
References: <20170313183813.3582-1-john@metanate.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from dougal.metanate.com ([90.155.101.14]:25489 "EHLO metanate.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753728AbdCMSij (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 13 Mar 2017 14:38:39 -0400
In-Reply-To: <20170313183813.3582-1-john@metanate.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, John Keeping <john@metanate.com>

regmap_update_bits does its own locking and everything else accessed
here is a local variable so there is no need to lock around it.

I originally wrote this on to of v4.4 which doesn't have the split
registers for drive strength, where some additional locking might be
necessary.  But I don't think it can be "slock" given that the following
patches will convert that to a raw spinlock and regmap uses a normal
spinlock internally.

Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/pinctrl/pinctrl-rockchip.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index a838c8bb3129..1defe83a5c4d 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -649,7 +649,6 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	int iomux_num = (pin / 8);
 	struct regmap *regmap;
 	int reg, ret, mask, mux_type;
-	unsigned long flags;
 	u8 bit;
 	u32 data, rmask;
 
@@ -698,15 +697,11 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
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
 
@@ -1132,7 +1127,6 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 	struct rockchip_pinctrl *info = bank->drvdata;
 	struct rockchip_pin_ctrl *ctrl = info->ctrl;
 	struct regmap *regmap;
-	unsigned long flags;
 	int reg, ret, i;
 	u32 data, rmask, rmask_bits, temp;
 	u8 bit;
@@ -1160,8 +1154,6 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		return ret;
 	}
 
-	spin_lock_irqsave(&bank->slock, flags);
-
 	switch (drv_type) {
 	case DRV_TYPE_IO_1V8_3V0_AUTO:
 	case DRV_TYPE_IO_3V3_ONLY:
@@ -1182,17 +1174,14 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
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
@@ -1200,7 +1189,6 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 			bit -= 16;
 			break;
 		default:
-			spin_unlock_irqrestore(&bank->slock, flags);
 			dev_err(info->dev, "unsupported bit: %d for pinctrl drive type: %d\n",
 				bit, drv_type);
 			return -EINVAL;
@@ -1212,7 +1200,6 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 		rmask_bits = RK3288_DRV_BITS_PER_PIN;
 		break;
 	default:
-		spin_unlock_irqrestore(&bank->slock, flags);
 		dev_err(info->dev, "unsupported pinctrl drive type: %d\n",
 			drv_type);
 		return -EINVAL;
@@ -1224,7 +1211,6 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 	data |= (ret << bit);
 
 	ret = regmap_update_bits(regmap, reg, rmask, data);
-	spin_unlock_irqrestore(&bank->slock, flags);
 
 	return ret;
 }
@@ -1336,16 +1322,12 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
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
-- 
2.12.0.377.gf910686b23.dirty

