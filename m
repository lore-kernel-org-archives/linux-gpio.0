From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] pinctrl: u300: make u300_pmx_registers static
Date: Thu,  9 Jun 2016 11:55:00 +0100
Message-ID: <1465469700-9026-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 82-70-136-246.dsl.in-addr.zen.co.uk ([82.70.136.246]:58092 "EHLO
	rainbowdash.ducie.codethink.co.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752246AbcFIKzF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jun 2016 06:55:05 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@lists.codethink.co.uk
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

The array u300_pmx_registers is not declared or used outside
of the driver, so make it static to avoid the following warning:

drivers/pinctrl/pinctrl-u300.c:673:11: warning: symbol 'u300_pmx_registers' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/pinctrl-u300.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-u300.c b/drivers/pinctrl/pinctrl-u300.c
index d1af908..9cc80a5 100644
--- a/drivers/pinctrl/pinctrl-u300.c
+++ b/drivers/pinctrl/pinctrl-u300.c
@@ -670,7 +670,7 @@ struct u300_pmx {
  * u300_pmx_registers - the array of registers read/written for each pinmux
  * shunt setting
  */
-const u32 u300_pmx_registers[] = {
+static const u32 u300_pmx_registers[] = {
 	U300_SYSCON_PMC1LR,
 	U300_SYSCON_PMC1HR,
 	U300_SYSCON_PMC2R,
-- 
2.8.1

