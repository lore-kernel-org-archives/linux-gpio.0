From: zhong jiang <zhongjiang@huawei.com>
Subject: [PATCH linux-next] gpio: fix meaningless return expression
Date: Tue, 24 Jul 2018 19:57:43 +0800
Message-ID: <1532433463-42508-1-git-send-email-zhongjiang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: albeu@free.fr, linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Fix the following sparse error:

drivers/gpio/gpio-ath79.c:54:16: error: return expression in void function

Signed-off-by: zhong jiang <zhongjiang@huawei.com>
---
 drivers/gpio/gpio-ath79.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 684e9d6..0a553d6 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -51,7 +51,7 @@ static u32 ath79_gpio_read(struct ath79_gpio_ctrl *ctrl, unsigned reg)
 static void ath79_gpio_write(struct ath79_gpio_ctrl *ctrl,
 			unsigned reg, u32 val)
 {
-	return writel(val, ctrl->base + reg);
+	writel(val, ctrl->base + reg);
 }
 
 static bool ath79_gpio_update_bits(
-- 
1.7.12.4
