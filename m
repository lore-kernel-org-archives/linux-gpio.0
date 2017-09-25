From: Chris Gorman <chrisjohgorman@gmail.com>
Subject: [PATCH] Drivers: pinctrl: intel fixed typo
Date: Mon, 25 Sep 2017 14:41:56 -0400
Message-ID: <1506364916-21349-1-git-send-email-chrisjohgorman@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:32860 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933306AbdIYSmf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Sep 2017 14:42:35 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Gorman <chrisjohgorman@gmail.com>

fixed typo in comment for north_community

Signed-off-by: Chris Gorman <chrisjohgorman@gmail.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 04e929f..8d50eae 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -491,7 +491,7 @@ static const struct chv_community north_community = {
 	.ngpio_ranges = ARRAY_SIZE(north_gpio_ranges),
 	.ngpios = ARRAY_SIZE(north_pins),
 	/*
-	 * North community can benerate GPIO interrupts only for the first
+	 * North community can generate GPIO interrupts only for the first
 	 * 8 interrupts. The upper half (8-15) can only be used to trigger
 	 * GPEs.
 	 */
-- 
2.7.4

