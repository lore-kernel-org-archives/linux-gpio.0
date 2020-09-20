Return-Path: <SRS0=gyjB=C5=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03785C43463
	for <linux-gpio@archiver.kernel.org>; Sun, 20 Sep 2020 19:59:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B030F20874
	for <linux-gpio@archiver.kernel.org>; Sun, 20 Sep 2020 19:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600631957;
	bh=TcC5o7oGoxPxKy945MH6L8dlc5AwUItnlYwmPDxOllk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=icknOFJRC4ujxHUZ3tPxnDWl9LDr5CdAboxzfhr98bg2+R+PMfoF67ZXK7WHTEEOF
	 SBC0BVJoNdVtOWF0XMYf+j9fwl7iC+1KRBW3NH5fLD7Wmdlw1VJSjH7jo4Emg2d6O/
	 KLxU6+PL0XphsFlIrSfvwJ5tVSxLo25Ok8ZjKlcg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgITT7R (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 20 Sep 2020 15:59:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:45344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgITT7R (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 20 Sep 2020 15:59:17 -0400
Received: from localhost.localdomain (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C053020866;
        Sun, 20 Sep 2020 19:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600631956;
        bh=TcC5o7oGoxPxKy945MH6L8dlc5AwUItnlYwmPDxOllk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wyT45BFv4hL1QtbJvmfvVADPzg70pl9gioaWiHvEzSf1uM2hWivFSYNmHFGTAIgfO
         2HwsytuIGl94oangcN7+OkHz4JJ2UbiNtD10m9UupjUSOABqLEydyoPKg/xSgFFaVY
         fMWLc+varUXjHd7iVV4xaCd84LXQdNw0QrWVN2vc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Stefan Agner <stefan@agner.ch>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 4/4] dt-bindings: gpio: gpio-vf610: fix iMX 7ULP compatible matching
Date:   Sun, 20 Sep 2020 21:58:48 +0200
Message-Id: <20200920195848.27075-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200920195848.27075-1-krzk@kernel.org>
References: <20200920195848.27075-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The i.MX 7ULP DTSes use two compatibles so update the binding to fix
dtbs_check warnings like:

  arch/arm/boot/dts/imx7ulp-com.dt.yaml: gpio@40ae0000:
    compatible: ['fsl,imx7ulp-gpio', 'fsl,vf610-gpio'] is too long

  arch/arm/boot/dts/imx7ulp-com.dt.yaml: gpio@40ae0000:
    compatible: Additional items are not allowed ('fsl,vf610-gpio' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. None, split from previous patchset using common GPIO schema

Changes since v1:
1. New patch
---
 Documentation/devicetree/bindings/gpio/gpio-vf610.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index 6ac5a78ad3da..19738a457a58 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -19,9 +19,11 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - fsl,vf610-gpio
-      - fsl,imx7ulp-gpio
+    oneOf:
+      - const: fsl,vf610-gpio
+      - items:
+          - const: fsl,imx7ulp-gpio
+          - const: fsl,vf610-gpio
 
   reg:
     description: The first reg tuple represents the PORT module, the second tuple
-- 
2.17.1

