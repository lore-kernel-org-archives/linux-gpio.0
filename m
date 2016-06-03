From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 2/2] gpiolib: Fix unaligned used of reference counters
Date: Fri,  3 Jun 2016 19:10:02 +0200
Message-ID: <1464973802-9286-2-git-send-email-ricardo.ribalda@gmail.com>
References: <1464973802-9286-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464973802-9286-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-gpio@vger.kernel.org

gpiolib relies on the reference counters to clean up the gpio_device
structure.

Although the number of get/put is properly aligned on gpiolib.c
itself, it does not take into consideration how the referece counters
are affected by other external functions such as cdev_add and device_add.

Because of this, after the last call to put_device, the reference counter
has a value of +3, therefore never calling gpiodevice_release.

Due to the fact that some of the device  has already been cleaned on
gpiochip_remove, the library will end up OOPsing the kernel (e.g. a call
to of_gpiochip_find_and_xlate).

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---

We might want to cc: stable on these two patches

drivers/gpio/gpiolib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0626cc96744b..d829f2127524 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -438,7 +438,6 @@ static void gpiodevice_release(struct device *dev)
 {
 	struct gpio_device *gdev = dev_get_drvdata(dev);
 
-	cdev_del(&gdev->chrdev);
 	list_del(&gdev->list);
 	ida_simple_remove(&gpio_ida, gdev->id);
 	kfree(gdev->label);
@@ -471,7 +470,6 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 
 	/* From this point, the .release() function cleans up gpio_device */
 	gdev->dev.release = gpiodevice_release;
-	get_device(&gdev->dev);
 	pr_debug("%s: registered GPIOs %d to %d on device: %s (%s)\n",
 		 __func__, gdev->base, gdev->base + gdev->ngpio - 1,
 		 dev_name(&gdev->dev), gdev->chip->label ? : "generic");
@@ -759,6 +757,8 @@ void gpiochip_remove(struct gpio_chip *chip)
 	 * be removed, else it will be dangling until the last user is
 	 * gone.
 	 */
+	cdev_del(&gdev->chrdev);
+	device_del(&gdev->dev);
 	put_device(&gdev->dev);
 }
 EXPORT_SYMBOL_GPL(gpiochip_remove);
-- 
2.8.1
