From: "Markus Mayer" <markus.mayer@linaro.org>
Subject: [PATCH] gpio: bcm281xx: Don't print addresses of GPIO area in
 probe()
Date: Fri, 18 Oct 2013 11:50:03 -0700
Message-ID: <1382122203-16057-1-git-send-email-markus.mayer@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mms1.broadcom.com ([216.31.210.17]:3607 "EHLO mms1.broadcom.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756643Ab3JRSuY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 18 Oct 2013 14:50:24 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linaro Patches <patches@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, Markus Mayer <markus.mayer@linaro.org>

The physical address of the GPIO memory address is already printed
implicitly by dev_info() as part of the device name. The virtual
address doesn't add any value. In addition, printing a resource_size_t
with %x lead to a compiler warning on some platforms.

Signed-off-by: Markus Mayer <markus.mayer@linaro.org>
---

This patch is dependent on:

- http://patches.linaro.org/19933/

 drivers/gpio/gpio-bcm-kona.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index 58188ba..b3d0f81 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -587,8 +587,7 @@ static int bcm_kona_gpio_probe(struct platform_device *pdev)
 		}
 	}
 
-	dev_info(&pdev->dev, "Setting up Kona GPIO at 0x%p (phys %#x)\n",
-		 kona_gpio->reg_base, res->start);
+	dev_info(&pdev->dev, "Setting up Kona GPIO\n");
 
 	bcm_kona_gpio_reset(kona_gpio);
 
-- 
1.7.9.5


