Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BCDC77B78
	for <linux-gpio@archiver.kernel.org>; Wed, 26 Apr 2023 10:08:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240033AbjDZKIV (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 26 Apr 2023 06:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240419AbjDZKIP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Apr 2023 06:08:15 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4989346B9;
        Wed, 26 Apr 2023 03:08:11 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,227,1677510000"; 
   d="scan'208";a="160827216"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Apr 2023 19:08:10 +0900
Received: from renesas-ubuntu18.ree.adwin.renesas.com (unknown [10.226.93.103])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3490D4001DC5;
        Wed, 26 Apr 2023 19:08:06 +0900 (JST)
From:   Chris Paterson <chris.paterson2@renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>
Subject: [PATCH] dt-bindings: pinctrl: renesas,rzn1: Change maintainer to Fabrizio Castro
Date:   Wed, 26 Apr 2023 11:08:02 +0100
Message-Id: <20230426100802.11860-1-chris.paterson2@renesas.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Gareth no longer works for Renesas.

Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
---
 .../devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.yaml
index f3b85b7eae31..19d4d2facfb4 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Renesas RZ/N1 Pin Controller
 
 maintainers:
-  - Gareth Williams <gareth.williams.jx@renesas.com>
+  - Fabrizio Castro <fabrizio.castro.jz@renesas.com>
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
 properties:
-- 
2.40.0

