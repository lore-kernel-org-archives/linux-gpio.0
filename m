From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: gemini: Fix missing pad descriptions
Date: Mon, 13 Nov 2017 22:39:05 +0100
Message-ID: <20171113213905.8923-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:53603 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751356AbdKMVlK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Nov 2017 16:41:10 -0500
Received: by mail-lf0-f65.google.com with SMTP id 73so5674596lfu.10
        for <linux-gpio@vger.kernel.org>; Mon, 13 Nov 2017 13:41:09 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>

A pretty clever static checker found a bug in my patch: I added more
bits to a bitmask but didn't extend the array indexed to the same
bitmask.

Fixes: 756a024f3983 ("pinctrl: gemini: Fix GMAC groups")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-gemini.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-gemini.c b/drivers/pinctrl/pinctrl-gemini.c
index ecfc9733db7e..e9b83e291edf 100644
--- a/drivers/pinctrl/pinctrl-gemini.c
+++ b/drivers/pinctrl/pinctrl-gemini.c
@@ -136,6 +136,8 @@ static const char * const gemini_padgroups[] = {
 	"PCI CLK",
 	NULL, NULL,
 	"TVC CLK",
+	NULL, NULL, NULL, NULL, NULL,
+	"GMAC1",
 };
 
 static const struct pinctrl_pin_desc gemini_3512_pins[] = {
-- 
2.13.6

