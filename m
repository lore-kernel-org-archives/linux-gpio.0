From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] gpio: ge: Fix build warning
Date: Thu,  3 May 2018 14:46:24 +0200
Message-ID: <20180503124624.14461-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Casting a pointer to u16 can produce a compiler warning such as this:

    drivers/gpio/gpio-ge.c: In function 'gef_gpio_probe':
    drivers/gpio/gpio-ge.c:83:14: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
        gc->ngpio = (u16)of_device_get_match_data(&pdev->dev);
                    ^

Cast the pointer through a uintptr_t to avoid the warning.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpio-ge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ge.c b/drivers/gpio/gpio-ge.c
index 4c43562434cf..636952769bc8 100644
--- a/drivers/gpio/gpio-ge.c
+++ b/drivers/gpio/gpio-ge.c
@@ -80,7 +80,7 @@ static int __init gef_gpio_probe(struct platform_device *pdev)
 	}
 
 	gc->base = -1;
-	gc->ngpio = (u16)of_device_get_match_data(&pdev->dev);
+	gc->ngpio = (u16)(uintptr_t)of_device_get_match_data(&pdev->dev);
 	gc->of_gpio_n_cells = 2;
 	gc->of_node = pdev->dev.of_node;
 
-- 
2.17.0
