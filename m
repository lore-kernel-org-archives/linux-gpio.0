Return-Path: <SRS0=j2kj=CZ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F125C43461
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Sep 2020 18:17:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39592221E3
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Sep 2020 18:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600280250;
	bh=HczLzPQr6OtHbam5qOdkdD+vA7dPuNPd8y9fq4tyixw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=qAikOVI3Uc9oWfB+JcowUcxHUfEOeC//uRNx4kLy/Z9JBhJnSzdQyY4/Tn/PuNAJB
	 wmeD6/OgQvyELFLhGKig6UHmzGyGv+ddQe4AhRX0RR5BNXFfniefGSzQU78h5fyLA1
	 Z2BHLx+5dE2DAD6daLn23JTzWDx1bgq2DT1FEzXE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbgIPSR2 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 16 Sep 2020 14:17:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:53840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727837AbgIPSPa (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Sep 2020 14:15:30 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 89C7F229F0;
        Wed, 16 Sep 2020 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600273429;
        bh=HczLzPQr6OtHbam5qOdkdD+vA7dPuNPd8y9fq4tyixw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=udRBoC741hVrAMNNNgaMrrgAMaa2x0h0rLyJ19wsz9BTWuGAY+fz1GaGf8wzU4N+p
         vE8WwSvPC/DYFmmrpVqqePxWIRzeRk1iEre7HFHqbFFbvdTWc963Xh+nPzsDkRyO/V
         meT4S4yafrXyYms7rq+eoCCb9/Iw5Vrn5p4fi35s=
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
Subject: [PATCH 5/8] dt-bindings: gpio: fsl-imx-gpio: add gpio-line-names
Date:   Wed, 16 Sep 2020 18:22:47 +0200
Message-Id: <20200916162250.16098-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916162250.16098-1-krzk@kernel.org>
References: <20200916162250.16098-1-krzk@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Describe common "gpio-line-names" property to fix dtbs_check warnings
like:

  arch/arm/boot/dts/imx53-m53menlo.dt.yaml: gpio@53f84000:
    'gpio-line-names' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
index ad761e2f380a..347f059d347a 100644
--- a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml
@@ -65,7 +65,7 @@ properties:
     const: 2
 
   gpio-controller: true
-
+  gpio-line-names: true
   gpio-ranges: true
 
   power-domains:
-- 
2.17.1

