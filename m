From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 34/50] pinctrl: amd: Use devm_pinctrl_register() for pinctrl
 registration
Date: Wed, 24 Feb 2016 18:45:59 +0530
Message-ID: <1456319775-3216-35-git-send-email-ldewangan@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-gpio@vger.kernel.org

Use devm_pinctrl_register() for pin control registration and clean
error path.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/pinctrl-amd.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 5c025f5..59aa2ca 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -783,8 +783,8 @@ static int amd_gpio_probe(struct platform_device *pdev)
 	gpio_dev->ngroups = ARRAY_SIZE(kerncz_groups);
 
 	amd_pinctrl_desc.name = dev_name(&pdev->dev);
-	gpio_dev->pctrl = pinctrl_register(&amd_pinctrl_desc,
-					&pdev->dev, gpio_dev);
+	gpio_dev->pctrl = devm_pinctrl_register(&pdev->dev, &amd_pinctrl_desc,
+						gpio_dev);
 	if (IS_ERR(gpio_dev->pctrl)) {
 		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
 		return PTR_ERR(gpio_dev->pctrl);
@@ -792,7 +792,7 @@ static int amd_gpio_probe(struct platform_device *pdev)
 
 	ret = gpiochip_add_data(&gpio_dev->gc, gpio_dev);
 	if (ret)
-		goto out1;
+		return ret;
 
 	ret = gpiochip_add_pin_range(&gpio_dev->gc, dev_name(&pdev->dev),
 				0, 0, TOTAL_NUMBER_OF_PINS);
@@ -825,8 +825,6 @@ static int amd_gpio_probe(struct platform_device *pdev)
 out2:
 	gpiochip_remove(&gpio_dev->gc);
 
-out1:
-	pinctrl_unregister(gpio_dev->pctrl);
 	return ret;
 }
 
@@ -837,7 +835,6 @@ static int amd_gpio_remove(struct platform_device *pdev)
 	gpio_dev = platform_get_drvdata(pdev);
 
 	gpiochip_remove(&gpio_dev->gc);
-	pinctrl_unregister(gpio_dev->pctrl);
 
 	return 0;
 }
-- 
2.1.4
