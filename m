From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] pinctrl: nomadik: fix warnings from unexported functions
Date: Tue,  7 Jun 2016 18:25:02 +0100
Message-ID: <1465320302-5770-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 82-70-136-246.dsl.in-addr.zen.co.uk ([82.70.136.246]:36788 "EHLO
	rainbowdash.ducie.codethink.co.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755428AbcFGRZM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jun 2016 13:25:12 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@lists.codethink.co.uk
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Linus Walleij <linus.walleij@linaro.org>, Alessandro Rubini <rubini@unipv.it>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org

There are five functions in the driver that are defined but
only used locally. Make these static to avoid the following
warnings:

drivers/pinctrl/nomadik/pinctrl-nomadik.c:1036:6: warning: symbol 'nmk_gpio_clocks_enable' was not declared. Should it be static?
drivers/pinctrl/nomadik/pinctrl-nomadik.c:1050:6: warning: symbol 'nmk_gpio_clocks_disable' was not declared. Should it be static?
drivers/pinctrl/nomadik/pinctrl-nomadik.c:1073:6: warning: symbol 'nmk_gpio_wakeups_suspend' was not declared. Should it be static?
drivers/pinctrl/nomadik/pinctrl-nomadik.c:1094:6: warning: symbol 'nmk_gpio_wakeups_resume' was not declared. Should it be static?
drivers/pinctrl/nomadik/pinctrl-nomadik.c:1120:6: warning: symbol 'nmk_gpio_read_pull' was not declared. Should it be static?

Note, this now produces warnings that these functions
are defined but not used.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alessandro Rubini <rubini@unipv.it>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
---
 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 38facef..a7cce0f 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -1033,7 +1033,7 @@ static inline void nmk_gpio_dbg_show_one(struct seq_file *s,
 #define nmk_gpio_dbg_show	NULL
 #endif
 
-void nmk_gpio_clocks_enable(void)
+static void nmk_gpio_clocks_enable(void)
 {
 	int i;
 
@@ -1047,7 +1047,7 @@ void nmk_gpio_clocks_enable(void)
 	}
 }
 
-void nmk_gpio_clocks_disable(void)
+static void nmk_gpio_clocks_disable(void)
 {
 	int i;
 
@@ -1070,7 +1070,7 @@ void nmk_gpio_clocks_disable(void)
  * PM ops are not used since this needs to be done at the end, after all the
  * other drivers are done with their suspend callbacks.
  */
-void nmk_gpio_wakeups_suspend(void)
+static void nmk_gpio_wakeups_suspend(void)
 {
 	int i;
 
@@ -1091,7 +1091,7 @@ void nmk_gpio_wakeups_suspend(void)
 	}
 }
 
-void nmk_gpio_wakeups_resume(void)
+static void nmk_gpio_wakeups_resume(void)
 {
 	int i;
 
@@ -1117,7 +1117,7 @@ void nmk_gpio_wakeups_resume(void)
  * Note: only pull up/down set via this driver can
  * be detected due to HW limitations.
  */
-void nmk_gpio_read_pull(int gpio_bank, u32 *pull_up)
+statoc void nmk_gpio_read_pull(int gpio_bank, u32 *pull_up)
 {
 	if (gpio_bank < NUM_BANKS) {
 		struct nmk_gpio_chip *chip = nmk_gpio_chips[gpio_bank];
-- 
2.8.1

