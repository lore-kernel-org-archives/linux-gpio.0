Return-Path: <SRS0=nlfL=6B=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440FCC2D0EF
	for <linux-gpio@archiver.kernel.org>; Fri, 17 Apr 2020 14:15:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25BDF20857
	for <linux-gpio@archiver.kernel.org>; Fri, 17 Apr 2020 14:15:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725906AbgDQOPE (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 17 Apr 2020 10:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbgDQOPE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Apr 2020 10:15:04 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B89C061A0C
        for <linux-gpio@vger.kernel.org>; Fri, 17 Apr 2020 07:15:04 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:fd83:81bb:c1d7:433d])
        by laurent.telenet-ops.be with bizsmtp
        id TqA42200b4dKHqf01qA4J0; Fri, 17 Apr 2020 16:10:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jPRgy-0002EP-Em; Fri, 17 Apr 2020 16:10:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jPRgy-0005xL-CZ; Fri, 17 Apr 2020 16:10:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MAINTAINERS: Add DT Bindings for Renesas Pin Function Controllers
Date:   Fri, 17 Apr 2020 16:10:03 +0200
Message-Id: <20200417141003.22816-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The "PIN CONTROLLER - RENESAS" section lacks the related DT bindings.
Add them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc for v5.8.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d1cbcd80a89eadb4..b5edcd4bdbdf63d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13378,6 +13378,7 @@ M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	linux-renesas-soc@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc
+F:	Documentation/devicetree/bindings/pinctrl/renesas,*
 F:	drivers/pinctrl/pinctrl-rz*
 F:	drivers/pinctrl/sh-pfc/
 
-- 
2.17.1

