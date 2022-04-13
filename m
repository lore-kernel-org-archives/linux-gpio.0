Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC124C43219
	for <linux-gpio@archiver.kernel.org>; Wed, 13 Apr 2022 06:09:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233069AbiDMGLb (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 13 Apr 2022 02:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233020AbiDMGLS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2022 02:11:18 -0400
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D17F35DD1;
        Tue, 12 Apr 2022 23:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649830126; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=DC3LrbIqvzZaLzQZ+S0ncDASReU7LuznWb/AWkelxCzcBJojRKf2TEReHIhzLb5fHi1e/zziev9InCGoQRplpNOkOWeKGt4h5KaVEwQoSfpI1sJH3TNTq3Ertu56uBGuuvFR1fcihpvX//doTRW7ShAWhXrch/MqB5zQem8k46o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1649830126; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=VZvyACgwn9ASHwL310GjvNe30AHHx9r4ZajXUqN2Lfg=; 
        b=g9YqrwBiXw3xwxNMd9BDe8+MN2oMubHxkUwU7S9YgPvV/yVgldbY+d+X09kH3F2bP8nhLrGhpUQvXER94ARLl9zFpr33EGtlKn/ybs1ZkaaoBtJaO6D8kI1l4qtwclqBtq4ckPze6/c/J1sFw2f/1co51VAlR0fbkTfmbotR9WA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=arinc9.com;
        spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
        dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649830126;
        s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
        h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
        bh=VZvyACgwn9ASHwL310GjvNe30AHHx9r4ZajXUqN2Lfg=;
        b=MOFzrXkHSHkWoqFXsDrjbu7kaTSJJ+lubKZMD6ypwVuWsaMX6i/E1PASO7waJ0mv
        /m2Yb358NrSkCh3dUxjK65xdeTCNBq6+8i88MkSy4XT/f8WbNUSIKiGoxwPiyDF4ly6
        vw3Xc7bSTctdHeUA+0veIwn4+Yh+ncl9l1L1qj1Y=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
        with SMTPS id 1649830123973757.1372863442003; Tue, 12 Apr 2022 23:08:43 -0700 (PDT)
From:   =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     erkin.bozoglu@xeront.com,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 12/14] dt-bindings: pinctrl: add binding for Ralink MT7621 pinctrl
Date:   Wed, 13 Apr 2022 09:07:27 +0300
Message-Id: <20220413060729.27639-13-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413060729.27639-1-arinc.unal@arinc9.com>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add binding for the Ralink MT7621 pin controller for MT7621 SoC.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../pinctrl/ralink,mt7621-pinctrl.yaml        | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
new file mode 100644
index 000000000000..d1e4d1457754
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ralink,mt7621-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ralink MT7621 Pin Controller
+
+maintainers:
+  - Arınç ÜNAL <arinc.unal@arinc9.com>
+  - Sergio Paracuellos <sergio.paracuellos@gmail.com>
+
+description:
+  Ralink MT7621 pin controller for MT7621 SoC.
+  The pin controller can only set the muxing of pin groups. Muxing indiviual pins
+  is not supported. There is no pinconf support.
+
+properties:
+  compatible:
+    const: ralink,mt7621-pinctrl
+
+patternProperties:
+  '-pins$':
+    type: object
+    patternProperties:
+      '^(.*-)?pinmux$':
+        type: object
+        description: node for pinctrl.
+        $ref: pinmux-node.yaml#
+
+        properties:
+          groups:
+            description: The pin group to select.
+            enum: [i2c, jtag, mdio, pcie, rgmii1, rgmii2, sdhci, spi, uart1, uart2, uart3, wdt]
+
+          function:
+            description: The mux function to select.
+            enum: [gpio, i2c, i2s, jtag, mdio, nand1, nand2, pcie refclk, pcie rst, pcm, rgmii1, rgmii2,
+                   sdhci, spdif2, spdif3, spi, uart1, uart2, uart3, wdt refclk, wdt rst]
+
+        required:
+          - groups
+          - function
+
+        additionalProperties: false
+
+    additionalProperties: false
+
+allOf:
+  - $ref: "pinctrl.yaml#"
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  # Pinmux controller node
+  - |
+    pinctrl {
+      compatible = "ralink,mt7621-pinctrl";
+
+      i2c_pins: i2c0-pins {
+        pinmux {
+          groups = "i2c";
+          function = "i2c";
+        };
+      };
+    };
-- 
2.25.1

