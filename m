From: Geliang Tang <geliangtang@gmail.com>
Subject: [PATCH] gpio: intel-mid: use builtin_pci_driver
Date: Mon, 14 Nov 2016 20:52:25 +0800
Message-ID: <1f356ef29486a21e77e00997bcc82b300d0512d6.1479127743.git.geliangtang@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Geliang Tang <geliangtang@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Use builtin_pci_driver() helper to simplify the code.

Signed-off-by: Geliang Tang <geliangtang@gmail.com>
---
 drivers/gpio/gpio-intel-mid.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-intel-mid.c b/drivers/gpio/gpio-intel-mid.c
index 164de64..a1e44c2 100644
--- a/drivers/gpio/gpio-intel-mid.c
+++ b/drivers/gpio/gpio-intel-mid.c
@@ -421,9 +421,4 @@ static struct pci_driver intel_gpio_driver = {
 	},
 };
 
-static int __init intel_gpio_init(void)
-{
-	return pci_register_driver(&intel_gpio_driver);
-}
-
-device_initcall(intel_gpio_init);
+builtin_pci_driver(intel_gpio_driver);
-- 
2.9.3
