From: Cristina Ciocan <cristina.ciocan@intel.com>
Subject: [PATCH] pinctrl: baytrail: Fix mingled clock pins
Date: Wed, 22 Jun 2016 14:17:19 +0300
Message-ID: <1466594239-10988-1-git-send-email-cristina.ciocan@intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:17926 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751077AbcFVLN0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 22 Jun 2016 07:13:26 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, irina.tirdea@intel.com, Cristina Ciocan <cristina.ciocan@intel.com>

Fix plt clock 3, 4 and 5 pins, which were not in the proper order.

Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 677a811..7abfd42 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -401,9 +401,9 @@ static const struct byt_simple_func_mux byt_score_sata_mux[] = {
 static const unsigned int byt_score_plt_clk0_pins[] = { 96 };
 static const unsigned int byt_score_plt_clk1_pins[] = { 97 };
 static const unsigned int byt_score_plt_clk2_pins[] = { 98 };
-static const unsigned int byt_score_plt_clk4_pins[] = { 99 };
-static const unsigned int byt_score_plt_clk5_pins[] = { 100 };
-static const unsigned int byt_score_plt_clk3_pins[] = { 101 };
+static const unsigned int byt_score_plt_clk3_pins[] = { 99 };
+static const unsigned int byt_score_plt_clk4_pins[] = { 100 };
+static const unsigned int byt_score_plt_clk5_pins[] = { 101 };
 static const struct byt_simple_func_mux byt_score_plt_clk_mux[] = {
 	SIMPLE_FUNC("plt_clk", 1),
 };
-- 
1.9.1

