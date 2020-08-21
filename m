Return-Path: <SRS0=NuT+=B7=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17FAC433E3
	for <linux-gpio@archiver.kernel.org>; Fri, 21 Aug 2020 11:11:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2F6B20738
	for <linux-gpio@archiver.kernel.org>; Fri, 21 Aug 2020 11:11:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgHULLj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 21 Aug 2020 07:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727794AbgHULLh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Aug 2020 07:11:37 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E500C061386
        for <linux-gpio@vger.kernel.org>; Fri, 21 Aug 2020 04:11:36 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id JBBV230014C55Sk01BBVNV; Fri, 21 Aug 2020 13:11:29 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k94xE-0002eY-Tz; Fri, 21 Aug 2020 13:11:28 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k94xE-0000za-Ra; Fri, 21 Aug 2020 13:11:28 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: pinctrl: renesas,rza2-pinctrl: Fix pin controller node name
Date:   Fri, 21 Aug 2020 13:11:27 +0200
Message-Id: <20200821111127.3771-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

According to Devicetree Specification v0.2 and later, Section "Generic
Names Recommendation", the node name for a pin controller device node
should be "pinctrl".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc for v5.10.

 .../devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
index b7911a994f3a9f12..ce1f7343788faeff 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml
@@ -84,7 +84,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/pinctrl/r7s9210-pinctrl.h>
-    pinctrl: pin-controller@fcffe000 {
+    pinctrl: pinctrl@fcffe000 {
             compatible = "renesas,r7s9210-pinctrl";
             reg = <0xfcffe000 0x1000>;
 
-- 
2.17.1

