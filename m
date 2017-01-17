From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] pinctrl: ti-iodelay: Fix return value check in ti_iodelay_probe()
Date: Tue, 17 Jan 2017 14:41:47 +0000
Message-ID: <20170117144147.18540-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:32955 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751081AbdAQOl4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2017 09:41:56 -0500
Received: by mail-pg0-f66.google.com with SMTP id 194so8200017pgd.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2017 06:41:56 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Nishanth Menon <nm@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>, Tony Lindgren <tony@atomide.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

In case of error, the function pinctrl_register() returns
NULL not ERR_PTR(). The IS_ERR() test in the return value
check should be replaced with NULL test.

Fixes: 003910ebc83b ("pinctrl: Introduce TI IOdelay configuration driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/pinctrl/ti/pinctrl-ti-iodelay.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
index 3b86d3d..8899f5e 100644
--- a/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
+++ b/drivers/pinctrl/ti/pinctrl-ti-iodelay.c
@@ -892,9 +892,9 @@ static int ti_iodelay_probe(struct platform_device *pdev)
 	iod->desc.owner = THIS_MODULE;
 
 	iod->pctl = pinctrl_register(&iod->desc, dev, iod);
-	if (!iod->pctl) {
+	if (IS_ERR(iod->pctl)) {
 		dev_err(dev, "Failed to register pinctrl\n");
-		ret = -ENODEV;
+		ret = PTR_ERR(iod->pctl);
 		goto exit_out;
 	}

