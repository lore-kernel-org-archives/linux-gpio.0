From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] pinctrl/rockchip: Don't call pinctrl_force_* for nothing
Date: Sat, 24 Feb 2018 20:07:31 +0000
Message-ID: <20180224200732.6116-1-marc.zyngier@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

The rockchip pinctl driver calls pinctrl_force_default and
pinctrl_force_sleep on suspend resume, but seems to expect
that the outcome of these calls will be that nothing happens,
as the core code checks whether we're already in the right
state or not.

Or at least, that was what the core code was doing until
981ed1bfbc ("pinctrl: Really force states during suspend/resume"),
which gives the "force" qualifier its actual meaning.

In turn, this breaks suspend/resume on the rk3399. So let's
change the rockchip code to do what it should have done from
the very begining, which is exactly *nothing*.

We take this opportunity to tidy-up the RK3288 GPIO6_C6 mux
resume workaround, making it symetrical to the suspend path.

Tested on a rk3399-based kevin Chromebook.

Fixes: 9198f509c888 ("pinctrl: rockchip: add suspend/resume functions")
Signed-off-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 3924779f5578..a3a503e684dc 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3114,22 +3114,18 @@ static u32 rk3288_grf_gpio6c_iomux;
 static int __maybe_unused rockchip_pinctrl_suspend(struct device *dev)
 {
 	struct rockchip_pinctrl *info = dev_get_drvdata(dev);
-	int ret = pinctrl_force_sleep(info->pctl_dev);
-
-	if (ret)
-		return ret;
 
 	/*
 	 * RK3288 GPIO6_C6 mux would be modified by Maskrom when resume, so save
 	 * the setting here, and restore it at resume.
 	 */
 	if (info->ctrl->type == RK3288) {
+		int ret;
+
 		ret = regmap_read(info->regmap_base, RK3288_GRF_GPIO6C_IOMUX,
 				  &rk3288_grf_gpio6c_iomux);
-		if (ret) {
-			pinctrl_force_default(info->pctl_dev);
+		if (ret)
 			return ret;
-		}
 	}
 
 	return 0;
@@ -3138,14 +3134,18 @@ static int __maybe_unused rockchip_pinctrl_suspend(struct device *dev)
 static int __maybe_unused rockchip_pinctrl_resume(struct device *dev)
 {
 	struct rockchip_pinctrl *info = dev_get_drvdata(dev);
-	int ret = regmap_write(info->regmap_base, RK3288_GRF_GPIO6C_IOMUX,
-			       rk3288_grf_gpio6c_iomux |
-			       GPIO6C6_SEL_WRITE_ENABLE);
 
-	if (ret)
-		return ret;
+	if (info->ctrl->type == RK3288) {
+		int ret;
 
-	return pinctrl_force_default(info->pctl_dev);
+		ret = regmap_write(info->regmap_base, RK3288_GRF_GPIO6C_IOMUX,
+				   rk3288_grf_gpio6c_iomux |
+				   GPIO6C6_SEL_WRITE_ENABLE);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 static SIMPLE_DEV_PM_OPS(rockchip_pinctrl_dev_pm_ops, rockchip_pinctrl_suspend,
-- 
2.14.2
