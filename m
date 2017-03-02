From: David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 2/2] pinctrl: rockchip: Add input schmitt support for rk3328
Date: Thu,  2 Mar 2017 15:11:24 +0800
Message-ID: <1488438684-1801-3-git-send-email-david.wu@rock-chips.com>
References: <1488438684-1801-1-git-send-email-david.wu@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1488438684-1801-1-git-send-email-david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "david.wu" <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

From: "david.wu" <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

Signed-off-by: david.wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Reviewed-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 9b8d516..91b5051 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1358,6 +1358,28 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
 	return ret;
 }
 
+#define RK3328_SCHMITT_BITS_PER_PIN		1
+#define RK3328_SCHMITT_PINS_PER_REG		16
+#define RK3328_SCHMITT_BANK_STRIDE		8
+#define RK3328_SCHMITT_GRF_OFFSET		0x380
+
+static int rk3328_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
+					   int pin_num,
+					   struct regmap **regmap,
+					   int *reg, u8 *bit)
+{
+	struct rockchip_pinctrl *info = bank->drvdata;
+
+	*regmap = info->regmap_base;
+	*reg = RK3328_SCHMITT_GRF_OFFSET;
+
+	*reg += bank->bank_num * RK3328_SCHMITT_BANK_STRIDE;
+	*reg += ((pin_num / RK3328_SCHMITT_PINS_PER_REG) * 4);
+	*bit = pin_num % RK3328_SCHMITT_PINS_PER_REG;
+
+	return 0;
+}
+
 static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
 {
 	struct rockchip_pinctrl *info = bank->drvdata;
@@ -2861,6 +2883,7 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 		.pull_calc_reg		= rk3228_calc_pull_reg_and_bit,
 		.drv_calc_reg		= rk3228_calc_drv_reg_and_bit,
 		.iomux_recalc		= rk3328_recalc_mux,
+		.schmitt_calc_reg	= rk3328_calc_schmitt_reg_and_bit,
 };
 
 static struct rockchip_pin_bank rk3368_pin_banks[] = {
-- 
1.9.1
