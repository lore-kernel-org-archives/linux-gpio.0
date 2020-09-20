Return-Path: <SRS0=gyjB=C5=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED09DC43463
	for <linux-gpio@archiver.kernel.org>; Sun, 20 Sep 2020 19:59:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B441D2145D
	for <linux-gpio@archiver.kernel.org>; Sun, 20 Sep 2020 19:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600631945;
	bh=3E9DPplRRsaj39SnwfkgVCLSZ0+GxS9TwohsVudFF30=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=ZqBjiEt+goppul7EBD0+t6HYMOTtgwWhjkb2vxxsWlpHDJM4JLiG7Jj3+/RNzeS18
	 BFunpEAoFLqQqVxX6Y0cb48sNUFRjHtP72stU/DjpkXffeTrOkWIU058Xvdh9AxZut
	 VGDOtFWYAUAkG6s0SLOvqvhhZlWJervldIHvpCP4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgITT7F (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 20 Sep 2020 15:59:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:45070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgITT7F (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 20 Sep 2020 15:59:05 -0400
Received: from localhost.localdomain (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CC76F20866;
        Sun, 20 Sep 2020 19:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600631944;
        bh=3E9DPplRRsaj39SnwfkgVCLSZ0+GxS9TwohsVudFF30=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g7CVOk1loQwhiK7h7yJQ6mMtSqFGLVIdCptU+YpPAOudkyiPyKkk0GIp5kYKVDSRe
         0pvYNzprS6E5oLQdFp9Ujpnp9u4fiBvYVWjgxvOY/fMINHMbXQTVBd7CS2BrA+hawg
         +BAXLHyyD3SHOl90NGgfbENmV6wAXw9dngWbFD9U=
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
Subject: [PATCH v3 2/4] dt-bindings: gpio: fsl-imx-gpio: add i.MX ARMv6 and ARMv7 compatibles
Date:   Sun, 20 Sep 2020 21:58:46 +0200
Message-Id: <20200920195848.27075-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200920195848.27075-1-krzk@kernel.org>
References: <20200920195848.27075-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Several DTSes with ARMv6 and ARMv7 i.MX SoCs introduce their own
compatibles so add them to fix dtbs_check warnings like:

  arch/arm/boot/dts/imx35-pdk.dt.yaml: gpio@53fa4000:
    compatible: ['fsl,imx35-gpio', 'fsl,imx31-gpio'] is not valid under any of the given schemas

  arch/arm/boot/dts/imx51-babbage.dt.yaml: gpio@73f90000:
    compatible: ['fsl,imx51-gpio', 'fsl,imx35-gpio'] is not valid under any of the given schemas

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. None, split from previous patchset using common GPIO schema
---
 .../devicetree/bindings/gpio/fsl-imx-gpio.yaml       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
index de0b9b5f6a70..281cdd34a829 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -18,8 +18,20 @@ properties:
           - fsl,imx31-gpio
           - fsl,imx35-gpio
           - fsl,imx7d-gpio
+      - items:
+          - const: fsl,imx35-gpio
+          - const: fsl,imx31-gpio
       - items:
           - enum:
+              - fsl,imx50-gpio
+              - fsl,imx51-gpio
+              - fsl,imx53-gpio
+              - fsl,imx6q-gpio
+              - fsl,imx6sl-gpio
+              - fsl,imx6sll-gpio
+              - fsl,imx6sx-gpio
+              - fsl,imx6ul-gpio
+              - fsl,imx7d-gpio
               - fsl,imx8mm-gpio
               - fsl,imx8mn-gpio
               - fsl,imx8mp-gpio
-- 
2.17.1

