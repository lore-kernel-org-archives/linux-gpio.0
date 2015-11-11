From: LABBE Corentin <clabbe.montjoie@gmail.com>
Subject: [PATCH 3/3] gpio: palmas: fix a possible NULL dereference
Date: Wed, 11 Nov 2015 21:27:36 +0100
Message-ID: <1447273657-1668-3-git-send-email-clabbe.montjoie@gmail.com>
References: <1447273657-1668-1-git-send-email-clabbe.montjoie@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:38074 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752109AbbKKU1p (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Nov 2015 15:27:45 -0500
In-Reply-To: <1447273657-1668-1-git-send-email-clabbe.montjoie@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: gnurou@gmail.com, linus.walleij@linaro.org
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

of_match_device could return NULL, and so cause a NULL pointer
dereference later.

Reported-by: coverity (CID 1130700)
Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
---
 drivers/gpio/gpio-palmas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-palmas.c b/drivers/gpio/gpio-palmas.c
index 171a638..52b447c 100644
--- a/drivers/gpio/gpio-palmas.c
+++ b/drivers/gpio/gpio-palmas.c
@@ -167,6 +167,8 @@ static int palmas_gpio_probe(struct platform_device *pdev)
 	const struct palmas_device_data *dev_data;
 
 	match = of_match_device(of_palmas_gpio_match, &pdev->dev);
+	if (!match)
+		return -ENODEV;
 	dev_data = match->data;
 	if (!dev_data)
 		dev_data = &palmas_dev_data;
-- 
2.4.10

