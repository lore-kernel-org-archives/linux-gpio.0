From: Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 17/23] gpio: sysfs: clean up edge_store
Date: Mon,  4 May 2015 17:10:42 +0200
Message-ID: <1430752248-15401-18-git-send-email-johan@kernel.org>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430752248-15401-1-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Remove goto from success path.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpio/gpiolib-sysfs.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index d9b3faa01fee..1161a46618dd 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -236,14 +236,16 @@ static ssize_t edge_store(struct device *dev,
 	struct gpio_desc *desc = data->desc;
 	unsigned long flags;
 	ssize_t	status = size;
-	int			i;
+	int i;
 
-	for (i = 0; i < ARRAY_SIZE(trigger_types); i++)
+	for (i = 0; i < ARRAY_SIZE(trigger_types); i++) {
 		if (sysfs_streq(trigger_types[i].name, buf))
-			goto found;
-	return -EINVAL;
+			break;
+	}
+
+	if (i == ARRAY_SIZE(trigger_types))
+		return -EINVAL;
 
-found:
 	flags = trigger_types[i].flags;
 
 	mutex_lock(&sysfs_lock);
-- 
2.0.5
