Return-Path: <SRS0=dRYU=DF=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F09C4741F
	for <linux-gpio@archiver.kernel.org>; Mon, 28 Sep 2020 07:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 911A4208FE
	for <linux-gpio@archiver.kernel.org>; Mon, 28 Sep 2020 07:40:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgI1HkE (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 28 Sep 2020 03:40:04 -0400
Received: from atl4mhfb01.myregisteredsite.com ([209.17.115.55]:44524 "EHLO
        atl4mhfb01.myregisteredsite.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726682AbgI1HkD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 03:40:03 -0400
X-Greylist: delayed 387 seconds by postgrey-1.27 at vger.kernel.org; Mon, 28 Sep 2020 03:40:02 EDT
Received: from jax4mhob03.registeredsite.com (jax4mhob03.myregisteredsite.com [64.69.218.83])
        by atl4mhfb01.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id 08S7XZvm017349
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:33:35 -0400
Received: from mailpod.hostingplatform.com ([10.30.71.204])
        by jax4mhob03.registeredsite.com (8.14.4/8.14.4) with ESMTP id 08S7XUHs013192
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 03:33:30 -0400
Received: (qmail 16121 invoked by uid 0); 28 Sep 2020 07:33:30 -0000
X-TCPREMOTEIP: 83.128.90.119
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO phenom.domain?not?set.invalid) (mike@milosoftware.com@83.128.90.119)
  by 0 with ESMTPA; 28 Sep 2020 07:33:30 -0000
From:   Mike Looijmans <mike.looijmans@topic.nl>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-gpio@vger.kernel.org
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] gpio: pca953x: Add support for the NXP PCAL9554B/C
Date:   Mon, 28 Sep 2020 09:33:17 +0200
Message-Id: <20200928073317.7240-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The NXP PCAL9554B is a variant of the PCA953x GPIO expander,
with 8 GPIOs, latched interrupts and some advanced configuration
options. The "C" version only differs in I2C address.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 drivers/gpio/gpio-pca953x.c                             | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index 3126c3817e2a..99dc1936f633 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -20,6 +20,7 @@ Required properties:
 	nxp,pcal6416
 	nxp,pcal6524
 	nxp,pcal9535
+	nxp,pcal9554b
 	nxp,pcal9555a
 	maxim,max7310
 	maxim,max7312
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index bd2e96c34f82..fb946b01512d 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -90,6 +90,7 @@ static const struct i2c_device_id pca953x_id[] = {
 	{ "pcal6416", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
 	{ "pcal6524", 24 | PCA953X_TYPE | PCA_LATCH_INT, },
 	{ "pcal9535", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
+	{ "pcal9554b", 8  | PCA953X_TYPE | PCA_LATCH_INT, },
 	{ "pcal9555a", 16 | PCA953X_TYPE | PCA_LATCH_INT, },
 
 	{ "max7310", 8  | PCA953X_TYPE, },
@@ -1237,6 +1238,7 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "nxp,pcal6416", .data = OF_953X(16, PCA_LATCH_INT), },
 	{ .compatible = "nxp,pcal6524", .data = OF_953X(24, PCA_LATCH_INT), },
 	{ .compatible = "nxp,pcal9535", .data = OF_953X(16, PCA_LATCH_INT), },
+	{ .compatible = "nxp,pcal9554b", .data = OF_953X( 8, PCA_LATCH_INT), },
 	{ .compatible = "nxp,pcal9555a", .data = OF_953X(16, PCA_LATCH_INT), },
 
 	{ .compatible = "maxim,max7310", .data = OF_953X( 8, 0), },
-- 
2.17.1

