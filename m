From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3] pinctrl: nomadik: queue pinctrl_request_gpio()
Date: Sat, 17 Aug 2013 01:54:38 +0200
Message-ID: <1376697278-18839-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:49877 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754440Ab3HQABL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 20:01:11 -0400
Received: by mail-lb0-f174.google.com with SMTP id w20so1793539lbh.33
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2013 17:01:10 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

Instead of deferring if pinctrl_request_gpio() returns
-EPROBE_DEFER, queue the GPIO number and request it later,
when the pinctrl part of the driver probes.

This is because we will otherwise have a circular dependency
between the GPIO and pinctrl parts of the driver: the new
auto-reservation of IRQ pins from the DT code will attempt
to request a GPIO line as soon as the gpiochip is added,
but this calls pinctrl_request_gpio() which count on the
pinctrl backend being present, and the pinctrl backend will
not probe until all the GPIO blocks have probed. So we
get locked up in a circular loop unless we do something
like this.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-nomadik.c | 48 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-nomadik.c b/drivers/pinctrl/pinctrl-nomadik.c
index 4a1cfdc..ee87e73 100644
--- a/drivers/pinctrl/pinctrl-nomadik.c
+++ b/drivers/pinctrl/pinctrl-nomadik.c
@@ -1010,6 +1010,31 @@ static int nmk_gpio_init_irq(struct nmk_gpio_chip *nmk_chip)
 
 /* I/O Functions */
 
+struct nmk_gpio_req {
+        struct list_head node;
+	int gpio;
+};
+
+static LIST_HEAD(nmk_queued_gpio_requests);
+
+static void nmk_pinctrl_process_queued_gpio_requests(void)
+{
+	struct list_head *node, *tmp;
+
+        list_for_each_safe(node, tmp, &nmk_queued_gpio_requests) {
+                struct nmk_gpio_req *req =
+			list_entry(node, struct nmk_gpio_req, node);
+		int ret;
+		ret = pinctrl_request_gpio(req->gpio);
+		if (ret)
+			pr_err("failed to request queued GPIO %d\n", req->gpio);
+		else
+			pr_info("requested queued GPIO %d\n", req->gpio);
+                list_del(node);
+                kfree(req);
+        }
+}
+
 static int nmk_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
 	/*
@@ -1017,8 +1042,28 @@ static int nmk_gpio_request(struct gpio_chip *chip, unsigned offset)
 	 * parameter does not matter for this controller.
 	 */
 	int gpio = chip->base + offset;
+	int ret;
+
+	ret = pinctrl_request_gpio(gpio);
+	if (ret == -EPROBE_DEFER) {
+		/*
+		 * This may happen during system startup: we request a GPIO
+		 * for being used for IRQ when registering the GPIO controller
+		 * for example, but the pin controller is not yet online.
+		 * Store the request on a list to be done when the
+		 * pin controller comes online. In our driver the GPIO
+		 * blocks must always probe before the pin controller.
+		 */
+		struct nmk_gpio_req *req = kzalloc(sizeof(struct nmk_gpio_req), GFP_KERNEL);
 
-	return pinctrl_request_gpio(gpio);
+		if (!req)
+			return -ENOMEM;
+		req->gpio = gpio;
+		list_add_tail(&req->node, &nmk_queued_gpio_requests);
+		pr_info("queueing pinctrl_request_gpio(%d)\n", req->gpio);
+		ret = 0;
+	}
+	return ret;
 }
 
 static void nmk_gpio_free(struct gpio_chip *chip, unsigned offset)
@@ -2224,6 +2269,7 @@ static int nmk_pinctrl_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, npct);
 	dev_info(&pdev->dev, "initialized Nomadik pin control driver\n");
+	nmk_pinctrl_process_queued_gpio_requests();
 
 	return 0;
 }
-- 
1.8.1.4

