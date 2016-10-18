From: Ray Jui <ray.jui@broadcom.com>
Subject: [PATCH] pinctrl: iproc: Fix iProc and NSP GPIO support
Date: Mon, 17 Oct 2016 18:41:41 -0700
Message-ID: <1476754901-3447-1-git-send-email-ray.jui@broadcom.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f178.google.com ([209.85.192.178]:36211 "EHLO
        mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934237AbcJRBl5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2016 21:41:57 -0400
Received: by mail-pf0-f178.google.com with SMTP id e6so85518341pfk.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2016 18:41:57 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Ray Jui <ray.jui@broadcom.com>

Since commit 44a7185c2ae6 ("of/platform: Add common method to populate
default bus"), ARM64 platform devices are populated at the
arch_initcall_sync level; as a result, the platform_driver_probe calls
in both the iProc and NSP GPIO drivers fail with -ENODEV since by that
time the platform device was not yet registered.

Replace platform_driver_probe with platform_driver_register, that allow
the device to be register later

Signed-off-by: Ray Jui <ray.jui@broadcom.com>
---
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 2 +-
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index 7f77007..5d1e505c3 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -844,6 +844,6 @@ static struct platform_driver iproc_gpio_driver = {
 
 static int __init iproc_gpio_init(void)
 {
-	return platform_driver_probe(&iproc_gpio_driver, iproc_gpio_probe);
+	return platform_driver_register(&iproc_gpio_driver);
 }
 arch_initcall_sync(iproc_gpio_init);
diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index 35783db..c8deb8b 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -741,6 +741,6 @@ static struct platform_driver nsp_gpio_driver = {
 
 static int __init nsp_gpio_init(void)
 {
-	return platform_driver_probe(&nsp_gpio_driver, nsp_gpio_probe);
+	return platform_driver_register(&nsp_gpio_driver);
 }
 arch_initcall_sync(nsp_gpio_init);
-- 
2.1.4

