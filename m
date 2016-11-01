From: Deepak Das <deepak_das@mentor.com>
Subject: [PATCH] gpio: mxc: fix build error introduced by pin_ranges
Date: Tue, 1 Nov 2016 12:33:28 +0530
Message-ID: <1477983808-14358-1-git-send-email-deepak_das@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:44847 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1165569AbcKAHEe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Nov 2016 03:04:34 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, shawnguo@kernel.org
Cc: linux-gpio@vger.kernel.org, fabio.estevam@nxp.com, kernel@pengutronix.de, p.zabel@pengutronix.de, Vladimir_Zapolskiy@mentor.com

'commit 964a7e51240df ("gpio: mxc: Shift
generic request/free after gpiochip registration")'
introduced a build error because pin_ranges now moved to
struct gpio_device.

This commit fixes this build error by dereferencing gpio_device
inside struct gpio_chip for pin_ranges.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
---
 drivers/gpio/gpio-mxc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 9f79a9f..3128dad 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -36,6 +36,8 @@
 #include <linux/of_device.h>
 #include <linux/bug.h>
 
+#include "gpiolib.h"
+
 enum mxc_gpio_hwtype {
 	IMX1_GPIO,	/* runs on i.mx1 */
 	IMX21_GPIO,	/* runs on i.mx21 and i.mx27 */
@@ -466,7 +468,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (err)
 		goto out_bgio;
 
-	if (!list_empty(&port->gc.pin_ranges)) {
+	if (!list_empty(&port->gc.gpiodev->pin_ranges)) {
 		port->gc.request = gpiochip_generic_request;
 		port->gc.free = gpiochip_generic_free;
 	}
-- 
1.9.1

