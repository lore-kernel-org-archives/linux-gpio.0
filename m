From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/3] x86: apuv2: remove unused variable
Date: Mon,  4 Mar 2019 21:19:19 +0100
Message-ID: <20190304201930.1622839-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The driver was newly introduced but the version that got merged
produces a harmless compiler warning:

drivers/platform/x86/pcengines-apuv2.c: In function 'apu_board_init':
drivers/platform/x86/pcengines-apuv2.c:211:6: error: unused variable 'rc' [-Werror=unused-variable]

Remove the evidently useless variable.

Fixes: f8eb0235f659 ("x86: pcengines apuv2 gpio/leds/keys platform driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/platform/x86/pcengines-apuv2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index dcb084f6b892..c1ca931e1fab 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -208,7 +208,6 @@ static struct platform_device * __init apu_create_pdev(
 
 static int __init apu_board_init(void)
 {
-	int rc;
 	const struct dmi_system_id *id;
 
 	id = dmi_first_match(apu_gpio_dmi_table);
-- 
2.20.0
