From: Laurent Navet <laurent.navet@gmail.com>
Subject: [PATCH] gpiolib: remove unneeded assignation
Date: Tue,  7 Jul 2015 22:22:15 +0200
Message-ID: <1436300535-1230-1-git-send-email-laurent.navet@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:33391 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932603AbbGGUOn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jul 2015 16:14:43 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Laurent Navet <laurent.navet@gmail.com>

ret is assigned value from of_property_read_string_index but is
overwritten before being used so remove it.
Also fix coverity CID 1309759

Signed-off-by: Laurent Navet <laurent.navet@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index a6c67c6..346da01 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -365,7 +365,7 @@ static void of_gpiochip_add_pin_range(struct gpio_chip *chip)
 
 		if (pinspec.args[2]) {
 			if (group_names) {
-				ret = of_property_read_string_index(np,
+				of_property_read_string_index(np,
 						group_names_propname,
 						index, &name);
 				if (strlen(name)) {
-- 
2.1.4

