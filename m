From: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Subject: [PATCH v3 RESEND] gpio: arizona: Support Cirrus Logic CS47L24 and WM1831
Date: Mon, 7 Dec 2015 09:24:02 +0000
Message-ID: <1449480242-19380-2-git-send-email-rf@opensource.wolfsonmicro.com>
References: <1449480242-19380-1-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449480242-19380-1-git-send-email-rf@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, lee.jones@linaro.org
Cc: patches@opensource.wolfsonmicro.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The CS47L24 and WM1831 codecs only have two GPIO lines, but are
otherwise similar to the WM8280.

Signed-off-by: Richard Fitzgerald <rf@opensource.wolfsonmicro.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-arizona.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index 412d131..bb2a319 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -122,6 +122,10 @@ static int arizona_gpio_probe(struct platform_device *pdev)
 	case WM1814:
 		arizona_gpio->gpio_chip.ngpio = 5;
 		break;
+	case WM1831:
+	case CS47L24:
+		arizona_gpio->gpio_chip.ngpio = 2;
+		break;
 	default:
 		dev_err(&pdev->dev, "Unknown chip variant %d\n",
 			arizona->type);
-- 
1.9.1
