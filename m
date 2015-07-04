From: Dirk Behme <dirk.behme@gmail.com>
Subject: [PATCH] Documentation: gpio: consumer: describe active low property
Date: Sat,  4 Jul 2015 18:19:08 +0200
Message-ID: <1436026748-4452-1-git-send-email-dirk.behme@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:37474 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750978AbbGEIcH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Jul 2015 04:32:07 -0400
Received: by wicgi11 with SMTP id gi11so128917007wic.0
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2015 01:32:05 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Dirk Behme <dirk.behme@gmail.com>

I've been searching for any documentation of 'the active-low property of a GPIO'
already mentioned in this documenation. But couldn't find any. Add it.

Sigend-off-by: Dirk Behme <dirk.behme@gmail.com>
---
 Documentation/gpio/consumer.txt | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/gpio/consumer.txt b/Documentation/gpio/consumer.txt
index 75542b9..f1a6e20 100644
--- a/Documentation/gpio/consumer.txt
+++ b/Documentation/gpio/consumer.txt
@@ -236,6 +236,32 @@ The active-low state of a GPIO can also be queried using the following call:
 Note that these functions should only be used with great moderation ; a driver
 should not have to care about the physical line level.
 
+The active-low property
+-----------------------
+
+As a driver should not have to care about the physical line level, all of the
+gpiod_set_xxx_value_xxx() functions do take the active-low property into account.
+This does mean that they check whether the GPIO is configured to be active-low. And
+if so, they manipulate the passed value before the physical line level is driven.
+
+With this, all the gpiod_set_xxx_value_xxx() functions interpret the parameter
+"value" as "active" ("1") or "inactive" ("0"). The physical line level will be
+driven accordingly.
+
+As an example, if the active-low poperty for a dedicated GPIO is set, and the
+gpiod_set_xxx_value_xxx() passes "active" ("1"), the physical line level will be
+driven low.
+
+To summarize:
+
+Function (example)             active-low proporty  physical line
+gpiod_set_raw_value(desc, 0);      don't care           low
+gpiod_set_raw_value(desc, 1);      don't care           high
+gpiod_set_value(desc, 0);              n/a              low
+gpiod_set_value(desc, 1);              n/a              high
+gpiod_set_value(desc, 0);           active-low          high
+gpiod_set_value(desc, 1);           active-low          low
+
 
 Set multiple GPIO outputs with a single function call
 -----------------------------------------------------
-- 
2.4.5

