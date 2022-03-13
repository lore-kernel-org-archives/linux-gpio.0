Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A2BC4332F
	for <linux-gpio@archiver.kernel.org>; Sun, 13 Mar 2022 15:46:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234638AbiCMPr7 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 13 Mar 2022 11:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231454AbiCMPr5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Mar 2022 11:47:57 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477357DA9F;
        Sun, 13 Mar 2022 08:46:49 -0700 (PDT)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 7F4AE223E9;
        Sun, 13 Mar 2022 16:46:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1647186407;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5x75TmbExhw94jkNZQHkErKaRfAu/FBK5o8w3T7qMHQ=;
        b=GVXb1rHzQ18sCfABmStTbELRoCDz2p2gYCAocLM4lVM/2naKeqdEPeC0rO54JZWqWKDPUH
        IpN4686PW6k0hhCh123J3BvFOE+2oWn6DZurJeFGPidMXxq2yJLcT5QCyGmi9U3Yn7mBJR
        rmjl+p059o7omR0Enrc8gXjcwcz50XE=
From:   Michael Walle <michael@walle.cc>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH RFC v1 1/2] dt-bindings: pinctrl: ocelot: add reset property
Date:   Sun, 13 Mar 2022 16:46:39 +0100
Message-Id: <20220313154640.63813-2-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220313154640.63813-1-michael@walle.cc>
References: <20220313154640.63813-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On the LAN966x SoC the GPIO controller will be resetted together with
the SGPIO and the switch core. Add a phandle to register the shared
reset line.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 .../devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml  | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
index 40148aef4ecf..cc9e14a214b1 100644
--- a/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mscc,ocelot-pinctrl.yaml
@@ -42,6 +42,14 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  resets:
+    maxItems: 1
+
+  reset-names:
+    description: Optional shared switch reset.
+    items:
+      - const: switch
+
 required:
   - compatible
   - reg
-- 
2.30.2

