From: Markus Pargmann <mpa@pengutronix.de>
Subject: [PATCH 3/4] gpio: pca953x: Add pca9506 as DT compatible
Date: Tue, 29 Jul 2014 09:24:45 +0200
Message-ID: <1406618686-22385-4-git-send-email-mpa@pengutronix.de>
References: <1406618686-22385-1-git-send-email-mpa@pengutronix.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:33268 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752628AbaG2H0H (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Jul 2014 03:26:07 -0400
In-Reply-To: <1406618686-22385-1-git-send-email-mpa@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Toby Smith <toby@tismith.id.au>, Aaron Sierra <asierra@xes-inc.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de, Markus Pargmann <mpa@pengutronix.de>

This driver can also be used for the nxp,pca9506 device.

Signed-off-by: Markus Pargmann <mpa@pengutronix.de>
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 drivers/gpio/gpio-pca953x.c                             | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index b9a42f294dd0..eb65157d47f6 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -3,6 +3,7 @@
 Required properties:
  - compatible: Has to contain one of the following:
 	nxp,pca9505
+	nxp,pca9506
 	nxp,pca9534
 	nxp,pca9535
 	nxp,pca9536
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index fda3eae835d0..df5eb6e6be1e 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -729,6 +729,7 @@ static int pca953x_remove(struct i2c_client *client)
 
 static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "nxp,pca9505", },
+	{ .compatible = "nxp,pca9506", },
 	{ .compatible = "nxp,pca9534", },
 	{ .compatible = "nxp,pca9535", },
 	{ .compatible = "nxp,pca9536", },
-- 
2.0.1

