From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: [PATCH v3 1/1 RESEND] gpio: arizona: add support for WM8998 and WM1814
Date: Thu, 10 Sep 2015 16:59:01 +0100
Message-ID: <1441900741-11302-2-git-send-email-rf@opensource.wolfsonmicro.com>
References: <1441900741-11302-1-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441900741-11302-1-git-send-email-rf@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, patches@opensource.wolfsonmicro.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

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
