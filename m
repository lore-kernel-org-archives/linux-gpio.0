From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] gpio-intel-mid: Delete an error message for a failed memory
 allocation in intel_gpio_probe()
Date: Sun, 11 Feb 2018 22:04:07 +0100
Message-ID: <0ea6dba4-0c52-4c9c-ae7e-d80c2f3d50f3@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, David Cohen <david.a.cohen@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 11 Feb 2018 21:56:42 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpio/gpio-intel-mid.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index 629575ea46a0..028d64c2cb1e 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -361,10 +361,8 @@ static int intel_gpio_probe(struct pci_dev *pdev,
 	pcim_iounmap_regions(pdev, 1 << 1);
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		dev_err(&pdev->dev, "can't allocate chip data\n");
+	if (!priv)
 		return -ENOMEM;
-	}
 
 	priv->reg_base = pcim_iomap_table(pdev)[0];
 	priv->chip.label = dev_name(&pdev->dev);
-- 
2.16.1
