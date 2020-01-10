Return-Path: <SRS0=PklQ=27=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F2DC33CA3
	for <linux-gpio@archiver.kernel.org>; Fri, 10 Jan 2020 13:19:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98D582072E
	for <linux-gpio@archiver.kernel.org>; Fri, 10 Jan 2020 13:19:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgAJNTb (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 10 Jan 2020 08:19:31 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:40250 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727745AbgAJNTa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jan 2020 08:19:30 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id odKU2100D5USYZQ01dKUam; Fri, 10 Jan 2020 14:19:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0007X4-DF; Fri, 10 Jan 2020 14:19:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0000IL-CG; Fri, 10 Jan 2020 14:19:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 07/13] pinctrl: sh-pfc: checker: Improve pin function checks
Date:   Fri, 10 Jan 2020 14:19:21 +0100
Message-Id: <20200110131927.1029-8-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110131927.1029-1-geert+renesas@glider.be>
References: <20200110131927.1029-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Improve the checks for pin function descriptors:
  1. Merge declaration and assignment of the local variable for the
     current pin function,
  2. Pin function names must be unique.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/core.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 6ff0f19403dc7813..54e433149e9bf715 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -849,7 +849,6 @@ static void __init sh_pfc_check_cfg_reg(const char *drvname,
 
 static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 {
-	const struct sh_pfc_function *func;
 	const char *drvname = info->name;
 	unsigned int *refcnts;
 	unsigned int i, j, k;
@@ -890,11 +889,17 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 		return;
 
 	for (i = 0; i < info->nr_functions; i++) {
-		func = &info->functions[i];
+		const struct sh_pfc_function *func = &info->functions[i];
+
 		if (!func->name) {
 			sh_pfc_err("empty function %u\n", i);
 			continue;
 		}
+		for (j = 0; j < i; j++) {
+			if (same_name(func->name, info->functions[j].name))
+				sh_pfc_err("function %s: name conflict\n",
+					   func->name);
+		}
 		for (j = 0; j < func->nr_groups; j++) {
 			for (k = 0; k < info->nr_groups; k++) {
 				if (same_name(func->groups[j],
-- 
2.17.1

