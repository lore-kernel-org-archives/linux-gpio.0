From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 3/3] gpio: ts5500: Constify platform_device_id
Date: Sat,  2 May 2015 00:56:49 +0900
Message-ID: <1430495809-32061-3-git-send-email-k.kozlowski.k@gmail.com>
References: <1430495809-32061-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430495809-32061-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
List-Id: linux-gpio@vger.kernel.org

The platform_device_id is not modified by the driver and core uses it as
const.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 drivers/gpio/gpio-ts5500.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ts5500.c b/drivers/gpio/gpio-ts5500.c
index 92fbabd82879..b29a102d136b 100644
--- a/drivers/gpio/gpio-ts5500.c
+++ b/drivers/gpio/gpio-ts5500.c
@@ -440,7 +440,7 @@ static int ts5500_dio_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static struct platform_device_id ts5500_dio_ids[] = {
+static const struct platform_device_id ts5500_dio_ids[] = {
 	{ "ts5500-dio1", TS5500_DIO1 },
 	{ "ts5500-dio2", TS5500_DIO2 },
 	{ "ts5500-dio-lcd", TS5500_LCD },
-- 
2.1.4
