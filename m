From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH] gpio: don't free unallocated ida on gpiochip_add_data_with_key() error path
Date: Fri,  2 Nov 2018 15:39:43 +0200
Message-ID: <20181102133943.7798-1-vz@mleia.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The change corrects the error path in gpiochip_add_data_with_key()
by avoiding to call ida_simple_remove(), if ida_simple_get() returns
an error.

Note that ida_simple_remove()/ida_free() throws a BUG(), if id argument
is negative, it allows to easily check the correctness of the fix by
fuzzing the return value from ida_simple_get().

Fixes: ff2b13592299 ("gpio: make the gpiochip a real device")
Cc: stable@vger.kernel.org # v4.6+
Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 drivers/gpio/gpiolib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 230e41562462..a2cbb474901c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1295,7 +1295,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	gdev->descs = kcalloc(chip->ngpio, sizeof(gdev->descs[0]), GFP_KERNEL);
 	if (!gdev->descs) {
 		status = -ENOMEM;
-		goto err_free_gdev;
+		goto err_free_ida;
 	}
 
 	if (chip->ngpio == 0) {
@@ -1427,8 +1427,9 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 	kfree_const(gdev->label);
 err_free_descs:
 	kfree(gdev->descs);
-err_free_gdev:
+err_free_ida:
 	ida_simple_remove(&gpio_ida, gdev->id);
+err_free_gdev:
 	/* failures here can mean systems won't boot... */
 	pr_err("%s: GPIOs %d..%d (%s) failed to register, %d\n", __func__,
 	       gdev->base, gdev->base + gdev->ngpio - 1,
-- 
2.17.1
