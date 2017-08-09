From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] pinctrl: amd: fix error return code in amd_gpio_probe()
Date: Wed, 9 Aug 2017 11:09:33 -0500
Message-ID: <20170809160933.GA29055@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-gpio@vger.kernel.org

platform_get_irq() returns an error code, but the pinctrl-amd driver
ignores it and always returns -EINVAL. This is not correct and,
prevents -EPROBE_DEFER from being propagated properly.

Print and propagate the return value of platform_get_irq on failure.

This issue was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/pinctrl/pinctrl-amd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index e6779d4..38af1ec 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -760,8 +760,8 @@ static int amd_gpio_probe(struct platform_device *pdev)
 
 	irq_base = platform_get_irq(pdev, 0);
 	if (irq_base < 0) {
-		dev_err(&pdev->dev, "Failed to get gpio IRQ.\n");
-		return -EINVAL;
+		dev_err(&pdev->dev, "Failed to get gpio IRQ: %d\n", irq_base);
+		return irq_base;
 	}
 
 	gpio_dev->pdev = pdev;
-- 
2.5.0
