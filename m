From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] gpio-ml-ioh: Delete an error message for a failed memory
 allocation in ioh_gpio_probe()
Date: Sat, 10 Feb 2018 22:30:46 +0100
Message-ID: <0da1b5a4-ccd6-98f6-3546-e466b3f10524@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Feb 2018 22:27:15 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpio/gpio-ml-ioh.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index 4b80e996d976..b3678bd1c120 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -445,7 +445,6 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 
 	chip_save = kzalloc(sizeof(*chip) * 8, GFP_KERNEL);
 	if (chip_save == NULL) {
-		dev_err(&pdev->dev, "%s : kzalloc failed", __func__);
 		ret = -ENOMEM;
 		goto err_kzalloc;
 	}
-- 
2.16.1
