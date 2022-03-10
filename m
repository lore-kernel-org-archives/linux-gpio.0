Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A664DC433FE
	for <linux-gpio@archiver.kernel.org>; Thu, 10 Mar 2022 14:24:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242172AbiCJOZC (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 10 Mar 2022 09:25:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243442AbiCJOXz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Mar 2022 09:23:55 -0500
X-Greylist: delayed 915 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Mar 2022 06:21:25 PST
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44976159EB7
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2022 06:21:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646921160; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=JAWbezDEwOiY18A70xuWktJ5oYZN5dHlfmlKuHDC+Excdmh9ApbupSqyua7U4+AK3pWgBfrkMZmBcSVUGMyNeFdPU83ds+NVwrj07vVkBzySgHtI2lEv2SUZZhdEOx+UAqgM9SWpU6mpDIFzug/nkMGQybW+Bo6j7WEfPB37QOs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1646921160; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=u3swPpqysGWFNENEPF0Wdt6WWV6wIShJl5mLUP72Uas=; 
        b=DXxEnTM/aheLQOosxZa/jNFpwQBJDBnNL3BW6Muw+mtTePXrlzio3ebLFPO9Ykbqt6P6p5RSOAJDyuj/kl05nrYhUudoI7SE6b8D7CWiDOM63ZTMQhsvPMjtpua9ZVvNjpx6XXBXmZ670FX8YQRFnGMnZA0edpik4YJjyAqOgX8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=arinc9.com;
        spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
        dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1646921160;
        s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding;
        bh=u3swPpqysGWFNENEPF0Wdt6WWV6wIShJl5mLUP72Uas=;
        b=XmLzZR1ESvJuCwxCPMZX7OGpG2pJP/TZEwaj8I5rUBP8s5MVFysXEmVdQE33Rebv
        Sxc8/m62X3DZCKeUoosBPeR7cGoJgO/jr/bBdqAyEwOzhXrQHAIT2ifcGuIYIt3FRhn
        NwOQQRZXHID3fw/mvOt3XlEi/NTC65cmwWeCibTg=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
        with SMTPS id 1646921158148319.4132184940761; Thu, 10 Mar 2022 06:05:58 -0800 (PST)
From:   =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, erkin.bozoglu@xeront.com
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH] dt-bindings: pinctrl: rt2880: add missing pin groups and functions
Date:   Thu, 10 Mar 2022 17:05:42 +0300
Message-Id: <20220310140542.7483-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the missing pin groups:
jtag, wdt

Add the missing functions:
i2s, jtag, pcie refclk, pcie rst, pcm, spdif2, spdif3, wdt refclk, wdt rst

Sort pin groups and functions in alphabetical order. Fix a typo.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
I didn't know the order to put the missing groups and functions so I sorted
them in alphabetical order, let me know if it's not ok.

Arınç

---
 .../bindings/pinctrl/ralink,rt2880-pinmux.yaml        | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
index f0c52feb24d7..9de8b0c075e2 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Sergio Paracuellos <sergio.paracuellos@gmail.com>
 
 description:
-  The rt2880 pinmux can only set the muxing of pin groups. muxing indiviual pins
+  The rt2880 pinmux can only set the muxing of pin groups. Muxing indiviual pins
   is not supported. There is no pinconf support.
 
 properties:
@@ -29,12 +29,13 @@ patternProperties:
         properties:
           groups:
             description: Name of the pin group to use for the functions.
-            enum: [i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2, mdio,
-                   pcie, sdhci]
+            enum: [i2c, jtag, mdio, pcie, rgmii1, rgmii2, sdhci, spi,
+                   uart1, uart2, uart3, wdt]
           function:
             description: The mux function to select
-            enum: [gpio, i2c, spi, uart1, uart2, uart3, rgmii1, rgmii2,
-                   mdio, nand1, nand2, sdhci]
+            enum: [gpio, i2c, i2s, jtag, mdio, nand1, nand2, pcie refclk,
+                   pcie rst, pcm, rgmii1, rgmii2, sdhci, spdif2, spdif3,
+                   spi, uart1, uart2, uart3, wdt refclk, wdt rst]
 
         required:
           - groups
-- 
2.25.1

