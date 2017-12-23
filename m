From: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Subject: [PATCH 1/3] pinctrl: rockchip: Delete error messages for a failed
 memory allocation in two functions
Date: Sat, 23 Dec 2017 22:38:50 +0100
Message-ID: <7a067193-e0c3-c2b9-b85a-e05c8ff8860e@users.sourceforge.net>
References: <323697d0-e1e8-8d3b-1070-f481cfa30b9a@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <323697d0-e1e8-8d3b-1070-f481cfa30b9a-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Date: Sat, 23 Dec 2017 22:02:47 +0100

Omit extra messages for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 2ba17548ad5b..285169170eb2 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2400,18 +2400,14 @@ static int rockchip_pinctrl_parse_dt(struct platform_device *pdev,
 	info->functions = devm_kzalloc(dev, info->nfunctions *
 					      sizeof(struct rockchip_pmx_func),
 					      GFP_KERNEL);
-	if (!info->functions) {
-		dev_err(dev, "failed to allocate memory for function list\n");
+	if (!info->functions)
 		return -EINVAL;
-	}
 
 	info->groups = devm_kzalloc(dev, info->ngroups *
 					    sizeof(struct rockchip_pin_group),
 					    GFP_KERNEL);
-	if (!info->groups) {
-		dev_err(dev, "failed allocate memory for ping group list\n");
+	if (!info->groups)
 		return -EINVAL;
-	}
 
 	i = 0;
 
@@ -2447,10 +2443,9 @@ static int rockchip_pinctrl_register(struct platform_device *pdev,
 
 	pindesc = devm_kzalloc(&pdev->dev, sizeof(*pindesc) *
 			info->ctrl->nr_pins, GFP_KERNEL);
-	if (!pindesc) {
-		dev_err(&pdev->dev, "mem alloc for pin descriptors failed\n");
+	if (!pindesc)
 		return -ENOMEM;
-	}
+
 	ctrldesc->pins = pindesc;
 	ctrldesc->npins = info->ctrl->nr_pins;
 
-- 
2.15.1
