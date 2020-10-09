Return-Path: <SRS0=fgCB=DQ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199AAC433E7
	for <linux-gpio@archiver.kernel.org>; Fri,  9 Oct 2020 06:03:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C35E122248
	for <linux-gpio@archiver.kernel.org>; Fri,  9 Oct 2020 06:03:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgJIGDL (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 9 Oct 2020 02:03:11 -0400
Received: from atl4mhfb01.myregisteredsite.com ([209.17.115.55]:45666 "EHLO
        atl4mhfb01.myregisteredsite.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725917AbgJIGDL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Oct 2020 02:03:11 -0400
Received: from jax4mhob08.registeredsite.com (jax4mhob08.myregisteredsite.com [64.69.218.88])
        by atl4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id 099639FM010078
        for <linux-gpio@vger.kernel.org>; Fri, 9 Oct 2020 02:03:09 -0400
Received: from mailpod.hostingplatform.com ([10.30.71.205])
        by jax4mhob08.registeredsite.com (8.14.4/8.14.4) with ESMTP id 0996369r027466
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-gpio@vger.kernel.org>; Fri, 9 Oct 2020 02:03:07 -0400
Received: (qmail 22173 invoked by uid 0); 9 Oct 2020 06:03:06 -0000
X-TCPREMOTEIP: 83.128.90.119
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO phenom.domain?not?set.invalid) (mike@milosoftware.com@83.128.90.119)
  by 0 with ESMTPA; 9 Oct 2020 06:03:06 -0000
From:   Mike Looijmans <mike.looijmans@topic.nl>
To:     linus.walleij@linaro.org
Cc:     bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH v3] dt-bindings: gpio: pca953x: Add support for the NXP PCAL9554B/C
Date:   Fri,  9 Oct 2020 08:03:02 +0200
Message-Id: <20201009060302.6220-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The NXP PCAL9554B is a variant of the PCA953x GPIO expander,
with 8 GPIOs, latched interrupts and some advanced configuration
options. The "C" version only differs in I2C address.

This adds the entry to the devicetree bindings.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
v2: Split devicetree and code into separate patches
v3: Devicetree bindings in yaml format

 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 183ec23eda39..f5ee23c2df60 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -48,6 +48,7 @@ properties:
       - nxp,pcal6416
       - nxp,pcal6524
       - nxp,pcal9535
+      - nxp,pcal9554b
       - nxp,pcal9555a
       - onnn,cat9554
       - onnn,pca9654
-- 
2.17.1

