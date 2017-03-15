From: John Keeping <john@metanate.com>
Subject: [PATCH v2 3/4] pinctrl: rockchip: split out verification of mux
 settings
Date: Wed, 15 Mar 2017 17:46:53 +0000
Message-ID: <20170315174654.15128-4-john@metanate.com>
References: <20170315174654.15128-1-john@metanate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170315174654.15128-1-john@metanate.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Julia Cartwright <julia@ni.com>, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, John Keeping <john@metanate.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

We need to avoid calling regmap functions from irq handlers, so the next
commit is going to move the call to rockchip_set_mux() into an
irq_bus_sync_unlock handler.  But we can't return an error from there so
we still need to check the settings from rockchip_irq_set_type() and we
will use this new rockchip_verify_mux() function from there.

Signed-off-by: John Keeping <john@metanate.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
v2: unchanged
---
 drivers/pinctrl/pinctrl-rockchip.c | 46 +++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 8c1cae6d78d7..426f5ea57b16 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -632,6 +632,31 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 	return ((val >> bit) & mask);
 }
 
+static int rockchip_verify_mux(struct rockchip_pin_bank *bank,
+			       int pin, int mux)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+	int iomux_num = (pin / 8);
+
+	if (iomux_num > 3)
+		return -EINVAL;
+
+	if (bank->iomux[iomux_num].type & IOMUX_UNROUTED) {
+		dev_err(info->dev, "pin %d is unrouted\n", pin);
+		return -EINVAL;
+	}
+
+	if (bank->iomux[iomux_num].type & IOMUX_GPIO_ONLY) {
+		if (mux != RK_FUNC_GPIO) {
+			dev_err(info->dev,
+				"pin %d only supports a gpio mux\n", pin);
+			return -ENOTSUPP;
+		}
+	}
+
+	return 0;
+}
+
 /*
  * Set a new mux function for a pin.
  *
@@ -655,23 +680,12 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	u8 bit;
 	u32 data, rmask;
 
-	if (iomux_num > 3)
-		return -EINVAL;
-
-	if (bank->iomux[iomux_num].type & IOMUX_UNROUTED) {
-		dev_err(info->dev, "pin %d is unrouted\n", pin);
-		return -EINVAL;
-	}
+	ret = rockchip_verify_mux(bank, pin, mux);
+	if (ret < 0)
+		return ret;
 
-	if (bank->iomux[iomux_num].type & IOMUX_GPIO_ONLY) {
-		if (mux != RK_FUNC_GPIO) {
-			dev_err(info->dev,
-				"pin %d only supports a gpio mux\n", pin);
-			return -ENOTSUPP;
-		} else {
-			return 0;
-		}
-	}
+	if (bank->iomux[iomux_num].type & IOMUX_GPIO_ONLY)
+		return 0;
 
 	dev_dbg(info->dev, "setting mux of GPIO%d-%d to %d\n",
 						bank->bank_num, pin, mux);
-- 
2.12.0.377.gf910686b23.dirty
