From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: [PATCH v3 1/1 RESEND] gpio: arizona: add support for WM8998 and WM1814
Date: Tue, 21 Jul 2015 16:47:44 +0100
Message-ID: <1437493664-22812-2-git-send-email-rf@opensource.wolfsonmicro.com>
References: <1437493664-22812-1-git-send-email-rf@opensource.wolfsonmicro.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:43708 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755417AbbGUPrw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 21 Jul 2015 11:47:52 -0400
In-Reply-To: <1437493664-22812-1-git-send-email-rf@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, patches@opensource.wolfsonmicro.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-arizona.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index 052fbc8..ca00273 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -118,6 +118,8 @@ static int arizona_gpio_probe(struct platform_device *pdev)
 	case WM5110:
 	case WM8280:
 	case WM8997:
+	case WM8998:
+	case WM1814:
 		arizona_gpio->gpio_chip.ngpio = 5;
 		break;
 	default:
-- 
1.7.2.5

