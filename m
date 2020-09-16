Return-Path: <SRS0=j2kj=CZ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D57C43461
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Sep 2020 20:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D81920872
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Sep 2020 20:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600288598;
	bh=fNcuVWkN1TjhyVwmEX+PcPTSMs1C1wjtAwGI/ZRYd+M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=W0D1WiZ+J+64iLSvHzDNCMTM+cd2RjY1pzwNpiK7QEd77U9UToyAc2E8TTDWbSzqh
	 r8gPhCe36zdv3UuJzIFZXR7RQ6JS616NFZ6dcCs9yIMGxWKyMwvgz8BlMMgQt2AhHi
	 WQsqRHOx90mQzV+14/Z3Lc0emkJlqeFDnTwELq1E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbgIPUgJ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 16 Sep 2020 16:36:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:60436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726854AbgIPRKb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 13:10:31 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9600A22A84;
        Wed, 16 Sep 2020 16:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600273422;
        bh=fNcuVWkN1TjhyVwmEX+PcPTSMs1C1wjtAwGI/ZRYd+M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2eFT/IHdk8kMc/sJr3aSUS93e7LsG7FvG1/lyhD03N9x4hHEjJcen2uN41Pr0BUUJ
         cIoCliYuD46rWdiSiZ/MsWqo9yW/KgSCOUEdnQXn6GrR3/XLHts9Anzhk3/2cZ5gie
         G8SYT29d6WLaOA2cDY0mZLuXoIdliyUA6me1lePs=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Anson Huang <Anson.Huang@nxp.com>,
        Sungbo Eo <mans0n@gorani.run>, Stefan Agner <stefan@agner.ch>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yash Shah <yash.shah@sifive.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-unisoc@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-riscv@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 4/8] dt-bindings: gpio: fsl-imx-gpio: add i.MX ARMv6 and ARMv7 compatibles
Date:   Wed, 16 Sep 2020 18:22:46 +0200
Message-Id: <20200916162250.16098-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916162250.16098-1-krzk@kernel.org>
References: <20200916162250.16098-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
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
 .../devicetree/bindings/gpio/fsl-imx-gpio.yaml       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
index 737756e081fb..ad761e2f380a 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -21,8 +21,20 @@ properties:
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

