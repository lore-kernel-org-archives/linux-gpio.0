Return-Path: <SRS0=01Zh=7A=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9389C433DF
	for <linux-gpio@archiver.kernel.org>; Mon, 18 May 2020 08:18:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3BA4207D8
	for <linux-gpio@archiver.kernel.org>; Mon, 18 May 2020 08:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgERISj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 18 May 2020 04:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgERISj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2020 04:18:39 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF7FC05BD09
        for <linux-gpio@vger.kernel.org>; Mon, 18 May 2020 01:18:38 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:6c27:925d:6b9c:58b2])
        by michel.telenet-ops.be with bizsmtp
        id g8Jd2200G11gx4G068Jdt7; Mon, 18 May 2020 10:18:37 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jaayr-0003ld-Af; Mon, 18 May 2020 10:18:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jaayr-0006E3-8E; Mon, 18 May 2020 10:18:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] MAINTAINERS: Renesas Pin Controllers are supported
Date:   Mon, 18 May 2020 10:18:36 +0200
Message-Id: <20200518081836.23890-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Change "PIN CONTROLLER - RENESAS" section from Maintained to Supported.
This brings it in line with my other "+renesas" entries.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc for v5.8.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d129b082d2ef3761..40a529f4219e1f01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13411,7 +13411,7 @@ F:	drivers/pinctrl/qcom/
 PIN CONTROLLER - RENESAS
 M:	Geert Uytterhoeven <geert+renesas@glider.be>
 L:	linux-renesas-soc@vger.kernel.org
-S:	Maintained
+S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc
 F:	Documentation/devicetree/bindings/pinctrl/renesas,*
 F:	drivers/pinctrl/pinctrl-rz*
-- 
2.17.1

