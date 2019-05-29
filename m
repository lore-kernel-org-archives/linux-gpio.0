From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] x86: apuv2: Make two symbols static
Date: Wed, 29 May 2019 22:38:44 +0800
Message-ID: <20190529143844.23084-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: info@metux.net, dvhart@infradead.org, andy@infradead.org, linus.walleij@linaro.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: linux-gpio@vger.kernel.org

Fix sparse warnings:

drivers/platform/x86/pcengines-apuv2.c:80:27: warning: symbol 'gpios_led_table' was not declared. Should it be static?
drivers/platform/x86/pcengines-apuv2.c:113:27: warning: symbol 'gpios_key_table' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/platform/x86/pcengines-apuv2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index c1ca931e1fab..b0d3110ae378 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -77,7 +77,7 @@ static const struct gpio_led_platform_data apu2_leds_pdata = {
 	.leds		= apu2_leds,
 };
 
-struct gpiod_lookup_table gpios_led_table = {
+static struct gpiod_lookup_table gpios_led_table = {
 	.dev_id = "leds-gpio",
 	.table = {
 		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_LED1,
@@ -110,7 +110,7 @@ static const struct gpio_keys_platform_data apu2_keys_pdata = {
 	.name		= "apu2-keys",
 };
 
-struct gpiod_lookup_table gpios_key_table = {
+static struct gpiod_lookup_table gpios_key_table = {
 	.dev_id = "gpio-keys-polled",
 	.table = {
 		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_MODESW,
-- 
2.17.1
