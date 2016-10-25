From: Deepak Das <deepak_das@mentor.com>
Subject: [PATCH v2] gpio: mxc: Shift generic request/free after gpiochip registration
Date: Tue, 25 Oct 2016 23:32:47 +0530
Message-ID: <1477418567-28347-1-git-send-email-deepak_das@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:46367 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754536AbcJYSEq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2016 14:04:46 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, shawnguo@kernel.org
Cc: linux-gpio@vger.kernel.org, fabio.estevam@nxp.com, kernel@pengutronix.de, p.zabel@pengutronix.de, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>

generic gpio request/free should be added after gpiocip registration
to validate mapping of gpiochip with pinctrl subsystem.

gpiochip->pin_ranges list contains the information used by pinctrl
subsystem to configure corresponding pins for gpio usage.
This list will be empty if gpiochip fails to map with
pinctrl subsystem for any reason.
For Ex.:-
generic gpio request/free should not be used if IOMUX pin controller
device node is disabled in device tree.

This commit checks above list and skips adding generic gpio request/free
if list is found empty.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
Changes from v1 to v2:
* Rebased on top of lwalleij/gpio/fixes.

 drivers/gpio/gpio-mxc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index c1a1e00..9f79a9f 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -458,11 +458,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (err)
 		goto out_bgio;
 
-	if (of_property_read_bool(np, "gpio-ranges")) {
-		port->gc.request = gpiochip_generic_request;
-		port->gc.free = gpiochip_generic_free;
-	}
-
 	port->gc.to_irq = mxc_gpio_to_irq;
 	port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
 					     pdev->id * 32;
@@ -471,6 +466,11 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (err)
 		goto out_bgio;
 
+	if (!list_empty(&port->gc.pin_ranges)) {
+		port->gc.request = gpiochip_generic_request;
+		port->gc.free = gpiochip_generic_free;
+	}
+
 	irq_base = irq_alloc_descs(-1, 0, 32, numa_node_id());
 	if (irq_base < 0) {
 		err = irq_base;
-- 
1.9.1

