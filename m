From: Deepak Das <deepak_das@mentor.com>
Subject: [PATCH] gpio: mxc: Shift generic request/free after gpiochip
 registration
Date: Mon, 24 Oct 2016 21:48:31 +0530
Message-ID: <580E3457.7030809@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:36701 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938725AbcJXQSl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2016 12:18:41 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, shawnguo@kernel.org
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, vzapolsk <Vladimir_Zapolskiy@mentor.com>, fabio.estevam@nxp.com, kernel@pengutronix.de, p.zabel@pengutronix.de


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
 drivers/gpio/gpio-mxc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index c1a1e00..9f79a9f 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -458,11 +458,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
        if (err)
                goto out_bgio;

-       if (of_property_read_bool(np, "gpio-ranges")) {
-               port->gc.request = gpiochip_generic_request;
-               port->gc.free = gpiochip_generic_free;
-       }
-
        port->gc.to_irq = mxc_gpio_to_irq;
        port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
                                             pdev->id * 32;
@@ -471,6 +466,11 @@ static int mxc_gpio_probe(struct platform_device *pdev)
        if (err)
                goto out_bgio;

+       if (!list_empty(&port->gc.pin_ranges)) {
+               port->gc.request = gpiochip_generic_request;
+               port->gc.free = gpiochip_generic_free;
+       }
+
        irq_base = irq_alloc_descs(-1, 0, 32, numa_node_id());
        if (irq_base < 0) {
                err = irq_base;
-- 
1.9.1
