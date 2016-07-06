From: weiyj_lk@163.com
Subject: [PATCH -next] pinctrl: ns2: fix return value check in ns2_pinmux_probe()
Date: Wed,  6 Jul 2016 12:17:41 +0000
Message-ID: <1467807461-31096-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from m12-16.163.com ([220.181.12.16]:54734 "EHLO m12-16.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753932AbcGFMSc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 6 Jul 2016 08:18:32 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-gpio@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

In case of error, the function pinctrl_register() returns
NULL not ERR_PTR(). The IS_ERR() test in the return value
check should be replaced with NULL test.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/pinctrl/bcm/pinctrl-ns2-mux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
index 3fefd14..7e5f7b7 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns2-mux.c
@@ -1089,9 +1089,9 @@ static int ns2_pinmux_probe(struct platform_device *pdev)
 
 	pinctrl->pctl = pinctrl_register(&ns2_pinctrl_desc, &pdev->dev,
 			pinctrl);
-	if (!pinctrl->pctl) {
+	if (IS_ERR(pinctrl->pctl)) {
 		dev_err(&pdev->dev, "unable to register IOMUX pinctrl\n");
-		return -EINVAL;
+		return PTR_ERR(pinctrl->pctl);
 	}
 
 	return 0;


