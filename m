From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [PATCH 09/21] gpio: Probe pinctrl devices on demand
Date: Mon, 25 May 2015 16:53:13 +0200
Message-ID: <1432565608-26036-10-git-send-email-tomeu.vizoso@collabora.com>
References: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?St=C3=A9phane=20Marchesin?= <stephane.marchesin@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Alexander Holler <holler@ahsoftware.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Ensure that the device corresponding to the DT node of the pin
controller has been registered.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpio/gpiolib-of.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 190183d..e26e105 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -362,6 +362,8 @@ static void of_gpiochip_add_pin_range(struct gpio_chip *chip)
 		if (ret)
 			break;
 
+		of_platform_device_ensure(pinspec.np);
+
 		pctldev = of_pinctrl_get(pinspec.np);
 		if (!pctldev)
 			break;
-- 
2.4.1
