From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH 1/2] gpio: pca953x: add onsemi,pca9654 id
Date: Tue,  8 Dec 2015 10:19:25 +0000
Message-ID: <1449569966-16816-2-git-send-email-ben.dooks@codethink.co.uk>
References: <1449569966-16816-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ducie-dc1.codethink.co.uk ([185.25.241.215]:59178 "EHLO
	ducie-dc1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933078AbbLHKTf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2015 05:19:35 -0500
In-Reply-To: <1449569966-16816-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: ben.dooks@codethink.co.uk, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org

Add onsemi,pca9654 which is also compatible with the nxp,pca9524 as it
is an 8bit expander with an interrupt output.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 Documentation/devicetree/bindings/gpio/gpio-pca953x.txt | 1 +
 drivers/gpio/gpio-pca953x.c                             | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
index 13df993..6b4a98f 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca953x.txt
@@ -25,6 +25,7 @@ Required properties:
 	ti,tca6416
 	ti,tca6424
 	ti,tca9539
+	onsemi,pca9654
 	exar,xra1202
 
 Example:
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 2d4892c..9847931 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -781,6 +781,8 @@ static const struct of_device_id pca953x_dt_ids[] = {
 	{ .compatible = "ti,tca6416", },
 	{ .compatible = "ti,tca6424", },
 
+	{ .compatible = "onsemi,pca9654" },
+
 	{ .compatible = "exar,xra1202", },
 	{ }
 };
-- 
2.6.2

