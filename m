From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH 1/2] pinctrl: remove enable/disable callbacks from documentation
Date: Sun,  8 Mar 2015 10:51:45 +0200
Message-ID: <14c3c3a3ee485c9fdc868b9fab2322bf47963ec0.1425804706.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:45837 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751594AbbCHIv5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 8 Mar 2015 04:51:57 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>

Commit 03e9f0cac5d (pinctrl: clean up after enable refactoring) updated the
documentation to remove mention of disable(), and rename enable() to set_mux().
One in-text mention was forgotten. Fix this.

Fixes: 03e9f0cac5d ('pinctrl: clean up after enable refactoring')
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Documentation/pinctrl.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/pinctrl.txt b/Documentation/pinctrl.txt
index b8f2147b96dd..91ea46b89d83 100644
--- a/Documentation/pinctrl.txt
+++ b/Documentation/pinctrl.txt
@@ -570,9 +570,8 @@ is possible to perform the requested mux setting, poke the hardware so that
 this happens.
 
 Pinmux drivers are required to supply a few callback functions, some are
-optional. Usually the enable() and disable() functions are implemented,
-writing values into some certain registers to activate a certain mux setting
-for a certain pin.
+optional. Usually the set_mux() function is implemented, writing values into
+some certain registers to activate a certain mux setting for a certain pin.
 
 A simple driver for the above example will work by setting bits 0, 1, 2, 3 or 4
 into some register named MUX to select a certain function with a certain
-- 
2.1.4

