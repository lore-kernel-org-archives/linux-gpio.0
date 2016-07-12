From: weiyj_lk@163.com
Subject: [PATCH -next] pinctrl: ns2: remove redundant dev_err call in ns2_pinmux_probe()
Date: Tue, 12 Jul 2016 14:19:45 +0000
Message-ID: <1468333185-8047-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from m12-14.163.com ([220.181.12.14]:40131 "EHLO m12-14.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754116AbcGLOVW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 12 Jul 2016 10:21:22 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 7e5f7b7..ca81789 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -1044,10 +1044,8 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	pinctrl->base0 = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(pinctrl->base0)) {
-		dev_err(&pdev->dev, "unable to map I/O space\n");
+	if (IS_ERR(pinctrl->base0))
 		return PTR_ERR(pinctrl->base0);
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	pinctrl->base1 = devm_ioremap_nocache(&pdev->dev, res->start,
@@ -1059,10 +1057,8 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
 	pinctrl->pinconf_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(pinctrl->pinconf_base)) {
-		dev_err(&pdev->dev, "unable to map I/O space\n");
+	if (IS_ERR(pinctrl->pinconf_base))
 		return PTR_ERR(pinctrl->pinconf_base);
-	}
 
 	ret = ns2_mux_log_init(pinctrl);
 	if (ret) {




