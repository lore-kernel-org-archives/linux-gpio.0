From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] pinctrl: samsung: checking for IS_ERR() instead of NULL
Date: Wed, 8 Feb 2017 10:23:10 +0300
Message-ID: <20170208072310.GA12877@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:49059 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753418AbdBHHYf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Feb 2017 02:24:35 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

devm_ioremap() returns NULL on error.  It doesn't return error pointers.

Fixes: 8b1bd11c1f8f ("pinctrl: samsung: Add the support the multiple IORESOURCE_MEM for one pin-bank")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index d79eadad6c5f..35b9d400d5c6 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -990,7 +990,7 @@ samsung_pinctrl_get_soc_data(struct samsung_pinctrl_drv_data *d,
 		res = platform_get_resource(pdev, IORESOURCE_MEM, i);
 		virt_base[i] = devm_ioremap(&pdev->dev, res->start,
 						resource_size(res));
-		if (IS_ERR(virt_base[i]))
+		if (!virt_base[i])
 			return ERR_PTR(-EIO);
 	}
 
