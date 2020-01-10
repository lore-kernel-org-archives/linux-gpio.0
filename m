Return-Path: <SRS0=PklQ=27=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF049C47409
	for <linux-gpio@archiver.kernel.org>; Fri, 10 Jan 2020 13:19:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A7C2F2077C
	for <linux-gpio@archiver.kernel.org>; Fri, 10 Jan 2020 13:19:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727641AbgAJNTl (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 10 Jan 2020 08:19:41 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:51724 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727718AbgAJNTb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 10 Jan 2020 08:19:31 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id odKU2100A5USYZQ01dKUuT; Fri, 10 Jan 2020 14:19:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0007X1-CU; Fri, 10 Jan 2020 14:19:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ipuCG-0000IA-Ba; Fri, 10 Jan 2020 14:19:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 06/13] pinctrl: sh-pfc: checker: Improve pin checks
Date:   Fri, 10 Jan 2020 14:19:20 +0100
Message-Id: <20200110131927.1029-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110131927.1029-1-geert+renesas@glider.be>
References: <20200110131927.1029-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Improve the checks for pin descriptors:
  1. Introduce local variables for the current pin, to make the checks
     easier to read,
  2. Pins must have a name,
  3. Fix double printing of identical pin names.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/core.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index f82f483b98a25da5..6ff0f19403dc7813 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -860,25 +860,27 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
 
 	/* Check pins */
 	for (i = 0; i < info->nr_pins; i++) {
+		const struct sh_pfc_pin *pin = &info->pins[i];
+
+		if (!pin->name) {
+			sh_pfc_err("empty pin %u\n", i);
+			continue;
+		}
 		for (j = 0; j < i; j++) {
-			if (same_name(info->pins[i].name, info->pins[j].name))
-				sh_pfc_err("pin %s/%s: name conflict\n",
-					   info->pins[i].name,
-					   info->pins[j].name);
+			const struct sh_pfc_pin *pin2 = &info->pins[j];
+
+			if (same_name(pin->name, pin2->name))
+				sh_pfc_err("pin %s: name conflict\n",
+					   pin->name);
 
-			if (info->pins[i].pin != (u16)-1 &&
-			    info->pins[i].pin == info->pins[j].pin)
+			if (pin->pin != (u16)-1 && pin->pin == pin2->pin)
 				sh_pfc_err("pin %s/%s: pin %u conflict\n",
-					   info->pins[i].name,
-					   info->pins[j].name,
-					   info->pins[i].pin);
+					   pin->name, pin2->name, pin->pin);
 
-			if (info->pins[i].enum_id &&
-			    info->pins[i].enum_id == info->pins[j].enum_id)
+			if (pin->enum_id && pin->enum_id == pin2->enum_id)
 				sh_pfc_err("pin %s/%s: enum_id %u conflict\n",
-					   info->pins[i].name,
-					   info->pins[j].name,
-					   info->pins[i].enum_id);
+					   pin->name, pin2->name,
+					   pin->enum_id);
 		}
 	}
 
-- 
2.17.1

