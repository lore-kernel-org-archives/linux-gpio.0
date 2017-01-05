From: David Lechner <david@lechnology.com>
Subject: [PATCH] pinctrl: da850-pupd: Add to module device table
Date: Thu,  5 Jan 2017 17:43:41 -0600
Message-ID: <1483659821-32296-1-git-send-email-david@lechnology.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vern.gendns.com ([206.190.152.46]:52185 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753381AbdAFAhZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Jan 2017 19:37:25 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Lechner <david@lechnology.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

This adds the pintrol-da850-pupd driver to the module device table so that
udev will automatically bind the driver to the device.

Signed-off-by: David Lechner <david@lechnology.com>
---
 drivers/pinctrl/pinctrl-da850-pupd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-da850-pupd.c b/drivers/pinctrl/pinctrl-da850-pupd.c
index b36a90a..921729b 100644
--- a/drivers/pinctrl/pinctrl-da850-pupd.c
+++ b/drivers/pinctrl/pinctrl-da850-pupd.c
@@ -194,6 +194,7 @@ static const struct of_device_id da850_pupd_of_match[] = {
 	{ .compatible = "ti,da850-pupd" },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, da850_pupd_of_match);
 
 static struct platform_driver da850_pupd_driver = {
 	.driver	= {
-- 
2.7.4

