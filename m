From: Michael Brunner <mibru@gmx.de>
Subject: [PATCH] gpio: Fix platform driver name in Kontron PLD GPIO driver
Date: Fri, 9 Aug 2013 17:33:06 +0200
Message-ID: <20130809173306.1ba24b59@mail.gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Kevin Strasser <strassek@engr.orst.edu>, Darren Hart <dvhart@linux.intel.com>, Samuel Ortiz <sameo@linux.intel.com>, Chris Healy <chealy@imsco-us.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This patch changes the driver name to be consistent with the name that
is registered as cell name in the MFD driver. Otherwise the driver won't
load.

Signed-off-by: Michael Brunner <michael.brunner@kontron.com>
---
 drivers/gpio/gpio-kempld.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-kempld.c b/drivers/gpio/gpio-kempld.c
index 1bdc3a2..d3ed563 100644
--- a/drivers/gpio/gpio-kempld.c
+++ b/drivers/gpio/gpio-kempld.c
@@ -210,7 +210,7 @@ static int kempld_gpio_remove(struct
platform_device *pdev) 
 static struct platform_driver kempld_gpio_driver = {
        .driver = {
-               .name = "gpio-kempld",
+               .name = "kempld-gpio",
                .owner = THIS_MODULE,
        },
        .probe          = kempld_gpio_probe,
