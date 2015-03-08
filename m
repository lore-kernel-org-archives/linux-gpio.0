From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH 2/2] pinctrl: remove doc mention of the enable/disable API
Date: Sun,  8 Mar 2015 10:51:46 +0200
Message-ID: <46f7c40cdc176e60aa4735b9cd515942fec1f7f7.1425804706.git.baruch@tkos.co.il>
References: <14c3c3a3ee485c9fdc868b9fab2322bf47963ec0.1425804706.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:45838 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751619AbbCHIv5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 8 Mar 2015 04:51:57 -0400
In-Reply-To: <14c3c3a3ee485c9fdc868b9fab2322bf47963ec0.1425804706.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Stephen Warren <swarren@nvidia.com>

This API has changed in commit 6e5e959dde0 (pinctrl: API changes to support
multiple states per device).

Fixes: 6e5e959dde0 ('pinctrl: API changes to support multiple states per device')
Cc: Stephen Warren <swarren@nvidia.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/pinctrl.txt | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/pinctrl.txt b/Documentation/pinctrl.txt
index 91ea46b89d83..2db41b41225e 100644
--- a/Documentation/pinctrl.txt
+++ b/Documentation/pinctrl.txt
@@ -1265,7 +1265,7 @@ The semantics of the pinctrl APIs are:
 
 Usually the pin control core handled the get/put pair and call out to the
 device drivers bookkeeping operations, like checking available functions and
-the associated pins, whereas the enable/disable pass on to the pin controller
+the associated pins, whereas select_state pass on to the pin controller
 driver which takes care of activating and/or deactivating the mux setting by
 quickly poking some registers.
 
@@ -1362,8 +1362,9 @@ function, but with different named in the mapping as described under
 "Advanced mapping" above. So that for an SPI device, we have two states named
 "pos-A" and "pos-B".
 
-This snippet first muxes the function in the pins defined by group A, enables
-it, disables and releases it, and muxes it in on the pins defined by group B:
+This snippet first initializes a state object for both groups (in foo_probe()),
+then muxes the function in the pins defined by group A, and finally muxes it in
+on the pins defined by group B:
 
 #include <linux/pinctrl/consumer.h>
 
-- 
2.1.4

