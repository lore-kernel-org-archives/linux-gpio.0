From: Colin King <colin.king@canonical.com>
Subject: [PATCH] pinctrl: rza1: make structures rza1_gpiochip_template and rza1_pinmux_ops static
Date: Fri, 30 Jun 2017 11:26:53 +0100
Message-ID: <20170630102653.9546-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

structures rza1_gpiochip_template and rza1_pinmux_ops do not need to be
in global scope, so make them static.

Cleans up sparse warnings:
symbol 'rza1_gpiochip_template' was not declared. Should it be static?
symbol 'rza1_pinmux_ops' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/pinctrl-rza1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 614a043f3038..29ddd624fb98 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -723,7 +723,7 @@ static void rza1_gpio_set(struct gpio_chip *chip, unsigned int gpio,
 	rza1_pin_set(port, gpio, value);
 }
 
-struct gpio_chip rza1_gpiochip_template = {
+static struct gpio_chip rza1_gpiochip_template = {
 	.request		= rza1_gpio_request,
 	.free			= rza1_gpio_free,
 	.get_direction		= rza1_gpio_get_direction,
@@ -1026,7 +1026,7 @@ static int rza1_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
 	return 0;
 }
 
-struct pinmux_ops rza1_pinmux_ops = {
+static struct pinmux_ops rza1_pinmux_ops = {
 	.get_functions_count	= pinmux_generic_get_function_count,
 	.get_function_name	= pinmux_generic_get_function_name,
 	.get_function_groups	= pinmux_generic_get_function_groups,
-- 
2.11.0
