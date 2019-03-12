From: Aditya Pakki <pakki001@umn.edu>
Subject: [PATCH] pinctrl: baytrail: Fix potential NULL pointer dereference
Date: Tue, 12 Mar 2019 10:05:52 -0500
Message-ID: <20190312150552.1429-1-pakki001@umn.edu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: pakki001@umn.edu
Cc: kjlu@umn.edu, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

saved-context in byt_gpio_probe is allocated via devm_kcalloc and is
used without checking for NULL in later functions. This patch avoids
such a scenario.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 241384ead4ed..18d9ad504194 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1710,6 +1710,8 @@ static int byt_gpio_probe(struct byt_gpio *vg)
 #ifdef CONFIG_PM_SLEEP
 	vg->saved_context = devm_kcalloc(&vg->pdev->dev, gc->ngpio,
 				       sizeof(*vg->saved_context), GFP_KERNEL);
+	if (!vg->saved_context)
+		return -ENOMEM;
 #endif
 	ret = devm_gpiochip_add_data(&vg->pdev->dev, gc, vg);
 	if (ret) {
-- 
2.17.1
