From: Colin King <colin.king@canonical.com>
Subject: [PATCH] gpio: sch311x: clean an indentation issue, remove extraneous space
Date: Tue, 30 Oct 2018 14:07:22 +0000
Message-ID: <20181030140722.2853-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up an indentation issue, remove space

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpio/gpio-sch311x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
index 5497f0a88cf0..4df5335469fd 100644
--- a/drivers/gpio/gpio-sch311x.c
+++ b/drivers/gpio/gpio-sch311x.c
@@ -188,7 +188,7 @@ static void sch311x_gpio_set(struct gpio_chip *chip, unsigned offset,
 	struct sch311x_gpio_block *block = gpiochip_get_data(chip);
 
 	spin_lock(&block->lock);
-	 __sch311x_gpio_set(block, offset, value);
+	__sch311x_gpio_set(block, offset, value);
 	spin_unlock(&block->lock);
 }
 
-- 
2.19.1
