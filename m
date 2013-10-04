From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 2/2] gpiolib: let gpiod_request() return -EPROBE_DEFER
Date: Fri, 4 Oct 2013 10:59:58 -0700
Message-ID: <1380909598-6382-2-git-send-email-acourbot@nvidia.com>
References: <1380909598-6382-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1380909598-6382-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

Patch be1a4b brought some improvements to the GPIO error handling code,
but also changed the return value of gpiod_request() when called on a
not yet initialized GPIO descriptor: it now returns -EINVAL instead of
-EPROBE_DEFER, and this affects some drivers.

This patch restores the original behavior for gpiod_request(). It is
safe to do so now that desc_to_gpio() does not rely on the GPIO
descriptor to be initialized. Other functions changed by patch be1a4b
do not see their return value affected, so these are not reverted.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reported-by: Dr. H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpio/gpiolib.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f330631..0dee0e0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1398,7 +1398,7 @@ static int gpiod_request(struct gpio_desc *desc, const char *label)
 	int			status = -EPROBE_DEFER;
 	unsigned long		flags;
 
-	if (!desc || !desc->chip) {
+	if (!desc) {
 		pr_warn("%s: invalid GPIO\n", __func__);
 		return -EINVAL;
 	}
@@ -1406,6 +1406,8 @@ static int gpiod_request(struct gpio_desc *desc, const char *label)
 	spin_lock_irqsave(&gpio_lock, flags);
 
 	chip = desc->chip;
+	if (chip == NULL)
+		goto done;
 
 	if (!try_module_get(chip->owner))
 		goto done;
-- 
1.8.4
