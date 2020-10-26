Return-Path: <SRS0=vyY5=EB=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515CBC388F9
	for <linux-gpio@archiver.kernel.org>; Mon, 26 Oct 2020 16:32:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE5B7205ED
	for <linux-gpio@archiver.kernel.org>; Mon, 26 Oct 2020 16:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1786038AbgJZQcy (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 26 Oct 2020 12:32:54 -0400
Received: from atl4mhfb01.myregisteredsite.com ([209.17.115.55]:36338 "EHLO
        atl4mhfb01.myregisteredsite.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1786037AbgJZQcx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Oct 2020 12:32:53 -0400
Received: from jax4mhob21.registeredsite.com (jax4mhob21.registeredsite.com [64.69.218.109])
        by atl4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id 09QGWpjL029304
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 12:32:52 -0400
Received: from mailpod.hostingplatform.com ([10.30.71.205])
        by jax4mhob21.registeredsite.com (8.14.4/8.14.4) with ESMTP id 09QGWnQZ054057
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2020 12:32:49 -0400
Received: (qmail 4608 invoked by uid 0); 26 Oct 2020 16:32:50 -0000
X-TCPREMOTEIP: 81.173.50.109
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO phenom.domain?not?set.invalid) (mike@milosoftware.com@81.173.50.109)
  by 0 with ESMTPA; 26 Oct 2020 16:32:49 -0000
From:   Mike Looijmans <mike.looijmans@topic.nl>
To:     devicetree@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, krzk@kernel.org,
        Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH v4] dt-bindings: gpio: pca953x: Add support for the NXP PCAL9554B/C
Date:   Mon, 26 Oct 2020 17:32:43 +0100
Message-Id: <20201026163244.21610-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The NXP PCAL9554B is a variant of the PCA953x GPIO expander,
with 8 GPIOs, latched interrupts and some advanced configuration
options. The "C" version only differs in I2C address.

This adds the entry to the devicetree bindings.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v2: Split devicetree and code into separate patches
v3: Devicetree bindings in yaml format
v4: Rebase on v5.10-rc1

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

