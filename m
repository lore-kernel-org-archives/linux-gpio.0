From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] gpio: simplify adding threaded interrupts
Date: Thu, 24 Nov 2016 13:38:53 +0100
Message-ID: <1479991133-24153-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34086 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938972AbcKXMi7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2016 07:38:59 -0500
Received: by mail-lf0-f49.google.com with SMTP id o141so27737867lff.1
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2016 04:38:58 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lars Poeschel <poeschel@lemonage.de>, Octavian Purdila <octavian.purdila@intel.com>, Daniel Baluta <daniel.baluta@intel.com>, Bin Gao <bin.gao@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Semen Protsenko <semen.protsenko@globallogic.com>, Alexander Stein <alexander.stein@systec-electronic.com>, Phil Reid <preid@electromag.com.au>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Patrice Chotard <patrice.chotard@st.com>

This tries to simplify the use of CONFIG_GPIOLIB_IRQCHIP when
using threaded interrupts: add a new call
gpiochip_irqchip_add_nested() to indicate that we're dealing
with a nested rather than a chained irqchip, then create a
separate gpiochip_set_nested_irqchip() to mirror
the gpiochip_set_chained_irqchip() call to connect the
parent and child interrupts.

In the nested case gpiochip_set_nested_irqchip() does nothing
more than call irq_set_parent() on each valid child interrupt,
which has little semantic effect in the kernel, but this is
probably still formally correct.

Update all drivers using nested interrupts to use
gpiochip_irqchip_add_nested() so we can now see clearly
which these users are.

The DLN2 driver can drop its specific hack with
.irq_not_threaded as we now recognize whether a chip is
threaded or not from its use of gpiochip_irqchip_add_nested()
signature rather than from inspecting .can_sleep.

We rename the .irq_parent to .irq_chained_parent since this
parent IRQ is only really kept around for the chained
interrupt handlers.

Cc: Lars Poeschel <poeschel@lemonage.de>
Cc: Octavian Purdila <octavian.purdila@intel.com>
Cc: Daniel Baluta <daniel.baluta@intel.com>
Cc: Bin Gao <bin.gao@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>
Cc: Semen Protsenko <semen.protsenko@globallogic.com>
Cc: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Phil Reid <preid@electromag.com.au>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/gpio/driver.txt   | 62 ++++++++++++++++++++----------------
 drivers/gpio/gpio-adnp.c        | 10 +++---
 drivers/gpio/gpio-crystalcove.c |  4 +--
 drivers/gpio/gpio-dln2.c        |  1 -
 drivers/gpio/gpio-max732x.c     | 17 +++++-----
 drivers/gpio/gpio-mcp23s08.c    | 17 +++++-----
 drivers/gpio/gpio-pca953x.c     | 16 +++++-----
 drivers/gpio/gpio-pcf857x.c     | 11 ++++---
 drivers/gpio/gpio-stmpe.c       | 17 +++++-----
 drivers/gpio/gpio-tc3589x.c     | 17 +++++-----
 drivers/gpio/gpio-wcove.c       |  4 +--
 drivers/gpio/gpiolib.c          | 69 +++++++++++++++++++++++++++++++++--------
 include/linux/gpio/driver.h     | 32 ++++++++++++++-----
 13 files changed, 171 insertions(+), 106 deletions(-)

diff --git a/Documentation/gpio/driver.txt b/Documentation/gpio/driver.txt
index 368d5a294d89..747c721776ed 100644
--- a/Documentation/gpio/driver.txt
+++ b/Documentation/gpio/driver.txt
@@ -175,8 +175,8 @@ The IRQ portions of the GPIO block are implemented using an irqchip, using
 the header <linux/irq.h>. So basically such a driver is utilizing two sub-
 systems simultaneously: gpio and irq.
 
-RT_FULL: GPIO driver should not use spinlock_t or any sleepable APIs
-(like PM runtime) as part of its irq_chip implementation on -RT.
+RT_FULL: a realtime compliant GPIO driver should not use spinlock_t or any
+sleepable APIs (like PM runtime) as part of its irq_chip implementation.
 - spinlock_t should be replaced with raw_spinlock_t [1].
 - If sleepable APIs have to be used, these can be done from the .irq_bus_lock()
   and .irq_bus_unlock() callbacks, as these are the only slowpath callbacks
@@ -185,33 +185,32 @@ RT_FULL: GPIO driver should not use spinlock_t or any sleepable APIs
 GPIO irqchips usually fall in one of two categories:
 
 * CHAINED GPIO irqchips: these are usually the type that is embedded on
-  an SoC. This means that there is a fast IRQ handler for the GPIOs that
+  an SoC. This means that there is a fast IRQ flow handler for the GPIOs that
   gets called in a chain from the parent IRQ handler, most typically the
-  system interrupt controller. This means the GPIO irqchip is registered
-  using irq_set_chained_handler() or the corresponding
-  gpiochip_set_chained_irqchip() helper function, and the GPIO irqchip
-  handler will be called immediately from the parent irqchip, while
-  holding the IRQs disabled. The GPIO irqchip will then end up calling
-  something like this sequence in its interrupt handler:
-
-  static irqreturn_t tc3589x_gpio_irq(int irq, void *data)
+  system interrupt controller. This means that the GPIO irqchip handler will
+  be called immediately from the parent irqchip, while holding the IRQs
+  disabled. The GPIO irqchip will then end up calling something like this
+  sequence in its interrupt handler:
+
+  static irqreturn_t foo_gpio_irq(int irq, void *data)
       chained_irq_enter(...);
       generic_handle_irq(...);
       chained_irq_exit(...);
 
   Chained GPIO irqchips typically can NOT set the .can_sleep flag on
-  struct gpio_chip, as everything happens directly in the callbacks.
+  struct gpio_chip, as everything happens directly in the callbacks: no
+  slow bus traffic like I2C can be used.
 
   RT_FULL: Note, chained IRQ handlers will not be forced threaded on -RT.
   As result, spinlock_t or any sleepable APIs (like PM runtime) can't be used
   in chained IRQ handler.
-  if required (and if it can't be converted to the nested threaded GPIO irqchip)
-  - chained IRQ handler can be converted to generic irq handler and this way
-  it will be threaded IRQ handler on -RT and hard IRQ handler on non-RT
+  If required (and if it can't be converted to the nested threaded GPIO irqchip)
+  a chained IRQ handler can be converted to generic irq handler and this way
+  it will be a threaded IRQ handler on -RT and a hard IRQ handler on non-RT
   (for example, see [3]).
   Know W/A: The generic_handle_irq() is expected to be called with IRQ disabled,
-  so IRQ core will complain if it will be called from IRQ handler which is
-  forced thread. The "fake?" raw lock can be used to W/A this problem:
+  so the IRQ core will complain if it is called from an IRQ handler which is
+  forced to a thread. The "fake?" raw lock can be used to W/A this problem:
 
 	raw_spinlock_t wa_lock;
 	static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
@@ -243,7 +242,7 @@ GPIO irqchips usually fall in one of two categories:
   by the driver. The hallmark of this driver is to call something like
   this in its interrupt handler:
 
-  static irqreturn_t tc3589x_gpio_irq(int irq, void *data)
+  static irqreturn_t foo_gpio_irq(int irq, void *data)
       ...
       handle_nested_irq(irq);
 
@@ -256,23 +255,31 @@ associated irqdomain and resource allocation callbacks, the gpiolib has
 some helpers that can be enabled by selecting the GPIOLIB_IRQCHIP Kconfig
 symbol:
 
-* gpiochip_irqchip_add(): adds an irqchip to a gpiochip. It will pass
+* gpiochip_irqchip_add(): adds a chained irqchip to a gpiochip. It will pass
   the struct gpio_chip* for the chip to all IRQ callbacks, so the callbacks
   need to embed the gpio_chip in its state container and obtain a pointer
   to the container using container_of().
   (See Documentation/driver-model/design-patterns.txt)
 
-  If there is a need to exclude certain GPIOs from the IRQ domain, one can
-  set .irq_need_valid_mask of the gpiochip before gpiochip_add_data() is
-  called. This allocates .irq_valid_mask with as many bits set as there are
-  GPIOs in the chip. Drivers can exclude GPIOs by clearing bits from this
-  mask. The mask must be filled in before gpiochip_irqchip_add() is called.
+* gpiochip_irqchip_add_nested(): adds a nested irqchip to a gpiochip.
+  Apart from that it works exactly like the chained irqchip.
 
 * gpiochip_set_chained_irqchip(): sets up a chained irq handler for a
   gpio_chip from a parent IRQ and passes the struct gpio_chip* as handler
   data. (Notice handler data, since the irqchip data is likely used by the
-  parent irqchip!) This is for the chained type of chip. This is also used
-  to set up a nested irqchip if NULL is passed as handler.
+  parent irqchip!).
+
+* gpiochip_set_nested_irqchip(): sets up a nested irq handler for a
+  gpio_chip from a parent IRQ. As the parent IRQ has usually been
+  explicitly requested by the driver, this does very little more than
+  mark all the child IRQs as having the other IRQ as parent.
+
+If there is a need to exclude certain GPIOs from the IRQ domain, you can
+set .irq_need_valid_mask of the gpiochip before gpiochip_add_data() is
+called. This allocates an .irq_valid_mask with as many bits set as there
+are GPIOs in the chip. Drivers can exclude GPIOs by clearing bits from this
+mask. The mask must be filled in before gpiochip_irqchip_add() or
+gpiochip_irqchip_add_nested() is called.
 
 To use the helpers please keep the following in mind:
 
@@ -323,6 +330,9 @@ When implementing an irqchip inside a GPIO driver, these two functions should
 typically be called in the .startup() and .shutdown() callbacks from the
 irqchip.
 
+When using the gpiolib irqchip helpers, these callback are automatically
+assigned.
+
 Real-Time compliance for GPIO IRQ chips
 ---------------------------------------
 
diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index 8ff7b0d3eac6..7a5c0a93e1ff 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -468,11 +468,11 @@ static int adnp_irq_setup(struct adnp *adnp)
 		return err;
 	}
 
-	err = gpiochip_irqchip_add(chip,
-				   &adnp_irq_chip,
-				   0,
-				   handle_simple_irq,
-				   IRQ_TYPE_NONE);
+	err = gpiochip_irqchip_add_nested(chip,
+					  &adnp_irq_chip,
+					  0,
+					  handle_simple_irq,
+					  IRQ_TYPE_NONE);
 	if (err) {
 		dev_err(chip->parent,
 			"could not connect irqchip to gpiochip\n");
diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 7c446d118cd6..d0022d655a09 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -351,8 +351,8 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
 		return retval;
 	}
 
-	gpiochip_irqchip_add(&cg->chip, &crystalcove_irqchip, 0,
-			     handle_simple_irq, IRQ_TYPE_NONE);
+	gpiochip_irqchip_add_nested(&cg->chip, &crystalcove_irqchip, 0,
+				    handle_simple_irq, IRQ_TYPE_NONE);
 
 	retval = request_threaded_irq(irq, NULL, crystalcove_gpio_irq_handler,
 				      IRQF_ONESHOT, KBUILD_MODNAME, cg);
diff --git a/drivers/gpio/gpio-dln2.c b/drivers/gpio/gpio-dln2.c
index f7a60a441e95..5d38b08d1ee2 100644
--- a/drivers/gpio/gpio-dln2.c
+++ b/drivers/gpio/gpio-dln2.c
@@ -467,7 +467,6 @@ static int dln2_gpio_probe(struct platform_device *pdev)
 	dln2->gpio.base = -1;
 	dln2->gpio.ngpio = pins;
 	dln2->gpio.can_sleep = true;
-	dln2->gpio.irq_not_threaded = true;
 	dln2->gpio.set = dln2_gpio_set;
 	dln2->gpio.get = dln2_gpio_get;
 	dln2->gpio.request = dln2_gpio_request;
diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index a9aaf9d822b4..4ea4c6a1313b 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -520,20 +520,19 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 				client->irq);
 			return ret;
 		}
-		ret =  gpiochip_irqchip_add(&chip->gpio_chip,
-					    &max732x_irq_chip,
-					    irq_base,
-					    handle_simple_irq,
-					    IRQ_TYPE_NONE);
+		ret =  gpiochip_irqchip_add_nested(&chip->gpio_chip,
+						   &max732x_irq_chip,
+						   irq_base,
+						   handle_simple_irq,
+						   IRQ_TYPE_NONE);
 		if (ret) {
 			dev_err(&client->dev,
 				"could not connect irqchip to gpiochip\n");
 			return ret;
 		}
-		gpiochip_set_chained_irqchip(&chip->gpio_chip,
-					     &max732x_irq_chip,
-					     client->irq,
-					     NULL);
+		gpiochip_set_nested_irqchip(&chip->gpio_chip,
+					    &max732x_irq_chip,
+					    client->irq);
 	}
 
 	return 0;
diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
index 99d37b56c258..504550665091 100644
--- a/drivers/gpio/gpio-mcp23s08.c
+++ b/drivers/gpio/gpio-mcp23s08.c
@@ -473,21 +473,20 @@ static int mcp23s08_irq_setup(struct mcp23s08 *mcp)
 		return err;
 	}
 
-	err =  gpiochip_irqchip_add(chip,
-				    &mcp23s08_irq_chip,
-				    0,
-				    handle_simple_irq,
-				    IRQ_TYPE_NONE);
+	err =  gpiochip_irqchip_add_nested(chip,
+					   &mcp23s08_irq_chip,
+					   0,
+					   handle_simple_irq,
+					   IRQ_TYPE_NONE);
 	if (err) {
 		dev_err(chip->parent,
 			"could not connect irqchip to gpiochip: %d\n", err);
 		return err;
 	}
 
-	gpiochip_set_chained_irqchip(chip,
-				     &mcp23s08_irq_chip,
-				     mcp->irq,
-				     NULL);
+	gpiochip_set_nested_irqchip(chip,
+				    &mcp23s08_irq_chip,
+				    mcp->irq);
 
 	return 0;
 }
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 601c4550ee27..9733678f0219 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -636,20 +636,20 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 			return ret;
 		}
 
-		ret =  gpiochip_irqchip_add(&chip->gpio_chip,
-					    &pca953x_irq_chip,
-					    irq_base,
-					    handle_simple_irq,
-					    IRQ_TYPE_NONE);
+		ret =  gpiochip_irqchip_add_nested(&chip->gpio_chip,
+						   &pca953x_irq_chip,
+						   irq_base,
+						   handle_simple_irq,
+						   IRQ_TYPE_NONE);
 		if (ret) {
 			dev_err(&client->dev,
 				"could not connect irqchip to gpiochip\n");
 			return ret;
 		}
 
-		gpiochip_set_chained_irqchip(&chip->gpio_chip,
-					     &pca953x_irq_chip,
-					     client->irq, NULL);
+		gpiochip_set_nested_irqchip(&chip->gpio_chip,
+					    &pca953x_irq_chip,
+					    client->irq);
 	}
 
 	return 0;
diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index d168410e2338..895af42a4513 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -378,9 +378,10 @@ static int pcf857x_probe(struct i2c_client *client,
 
 	/* Enable irqchip if we have an interrupt */
 	if (client->irq) {
-		status = gpiochip_irqchip_add(&gpio->chip, &pcf857x_irq_chip,
-					      0, handle_level_irq,
-					      IRQ_TYPE_NONE);
+		status = gpiochip_irqchip_add_nested(&gpio->chip,
+						     &pcf857x_irq_chip,
+						     0, handle_level_irq,
+						     IRQ_TYPE_NONE);
 		if (status) {
 			dev_err(&client->dev, "cannot add irqchip\n");
 			goto fail;
@@ -393,8 +394,8 @@ static int pcf857x_probe(struct i2c_client *client,
 		if (status)
 			goto fail;
 
-		gpiochip_set_chained_irqchip(&gpio->chip, &pcf857x_irq_chip,
-					     client->irq, NULL);
+		gpiochip_set_nested_irqchip(&gpio->chip, &pcf857x_irq_chip,
+					    client->irq);
 		gpio->irq_parent = client->irq;
 	}
 
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index e7d422a6b90b..e194d8ad8612 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -484,21 +484,20 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 				if (stmpe_gpio->norequest_mask & BIT(i))
 					clear_bit(i, stmpe_gpio->chip.irq_valid_mask);
 		}
-		ret =  gpiochip_irqchip_add(&stmpe_gpio->chip,
-					    &stmpe_gpio_irq_chip,
-					    0,
-					    handle_simple_irq,
-					    IRQ_TYPE_NONE);
+		ret =  gpiochip_irqchip_add_nested(&stmpe_gpio->chip,
+						   &stmpe_gpio_irq_chip,
+						   0,
+						   handle_simple_irq,
+						   IRQ_TYPE_NONE);
 		if (ret) {
 			dev_err(&pdev->dev,
 				"could not connect irqchip to gpiochip\n");
 			goto out_disable;
 		}
 
-		gpiochip_set_chained_irqchip(&stmpe_gpio->chip,
-					     &stmpe_gpio_irq_chip,
-					     irq,
-					     NULL);
+		gpiochip_set_nested_irqchip(&stmpe_gpio->chip,
+					    &stmpe_gpio_irq_chip,
+					    irq);
 	}
 
 	platform_set_drvdata(pdev, stmpe_gpio);
diff --git a/drivers/gpio/gpio-tc3589x.c b/drivers/gpio/gpio-tc3589x.c
index 5a5a6cb00eea..f041965f1b03 100644
--- a/drivers/gpio/gpio-tc3589x.c
+++ b/drivers/gpio/gpio-tc3589x.c
@@ -337,21 +337,20 @@ static int tc3589x_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret =  gpiochip_irqchip_add(&tc3589x_gpio->chip,
-				    &tc3589x_gpio_irq_chip,
-				    0,
-				    handle_simple_irq,
-				    IRQ_TYPE_NONE);
+	ret =  gpiochip_irqchip_add_nested(&tc3589x_gpio->chip,
+					   &tc3589x_gpio_irq_chip,
+					   0,
+					   handle_simple_irq,
+					   IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(&pdev->dev,
 			"could not connect irqchip to gpiochip\n");
 		return ret;
 	}
 
-	gpiochip_set_chained_irqchip(&tc3589x_gpio->chip,
-				     &tc3589x_gpio_irq_chip,
-				     irq,
-				     NULL);
+	gpiochip_set_nested_irqchip(&tc3589x_gpio->chip,
+				    &tc3589x_gpio_irq_chip,
+				    irq);
 
 	platform_set_drvdata(pdev, tc3589x_gpio);
 
diff --git a/drivers/gpio/gpio-wcove.c b/drivers/gpio/gpio-wcove.c
index d0ddba7a9d08..88f29601f8de 100644
--- a/drivers/gpio/gpio-wcove.c
+++ b/drivers/gpio/gpio-wcove.c
@@ -426,8 +426,8 @@ static int wcove_gpio_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = gpiochip_irqchip_add(&wg->chip, &wcove_irqchip, 0,
-			     handle_simple_irq, IRQ_TYPE_NONE);
+	ret = gpiochip_irqchip_add_nested(&wg->chip, &wcove_irqchip, 0,
+					  handle_simple_irq, IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(dev, "Failed to add irqchip: %d\n", ret);
 		return ret;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e97e88e48191..11540c343eb6 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1439,7 +1439,7 @@ static bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gpiochip,
 }
 
 /**
- * gpiochip_set_chained_irqchip() - sets a chained irqchip to a gpiochip
+ * gpiochip_set_cascaded_irqchip() - connects a cascaded irqchip to a gpiochip
  * @gpiochip: the gpiochip to set the irqchip chain to
  * @irqchip: the irqchip to chain to the gpiochip
  * @parent_irq: the irq number corresponding to the parent IRQ for this
@@ -1448,10 +1448,10 @@ static bool gpiochip_irqchip_irq_valid(const struct gpio_chip *gpiochip,
  * coming out of the gpiochip. If the interrupt is nested rather than
  * cascaded, pass NULL in this handler argument
  */
-void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
-				  struct irq_chip *irqchip,
-				  int parent_irq,
-				  irq_flow_handler_t parent_handler)
+static void gpiochip_set_cascaded_irqchip(struct gpio_chip *gpiochip,
+					  struct irq_chip *irqchip,
+					  int parent_irq,
+					  irq_flow_handler_t parent_handler)
 {
 	unsigned int offset;
 
@@ -1475,7 +1475,7 @@ void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 		irq_set_chained_handler_and_data(parent_irq, parent_handler,
 						 gpiochip);
 
-		gpiochip->irq_parent = parent_irq;
+		gpiochip->irq_chained_parent = parent_irq;
 	}
 
 	/* Set the parent IRQ for all affected IRQs */
@@ -1486,9 +1486,48 @@ void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 			       parent_irq);
 	}
 }
+
+/**
+ * gpiochip_set_chained_irqchip() - connects a chained irqchip to a gpiochip
+ * @gpiochip: the gpiochip to set the irqchip chain to
+ * @irqchip: the irqchip to chain to the gpiochip
+ * @parent_irq: the irq number corresponding to the parent IRQ for this
+ * chained irqchip
+ * @parent_handler: the parent interrupt handler for the accumulated IRQ
+ * coming out of the gpiochip. If the interrupt is nested rather than
+ * cascaded, pass NULL in this handler argument
+ */
+void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
+				  struct irq_chip *irqchip,
+				  int parent_irq,
+				  irq_flow_handler_t parent_handler)
+{
+	gpiochip_set_cascaded_irqchip(gpiochip, irqchip, parent_irq,
+				      parent_handler);
+}
 EXPORT_SYMBOL_GPL(gpiochip_set_chained_irqchip);
 
 /**
+ * gpiochip_set_nested_irqchip() - connects a nested irqchip to a gpiochip
+ * @gpiochip: the gpiochip to set the irqchip nested handler to
+ * @irqchip: the irqchip to nest to the gpiochip
+ * @parent_irq: the irq number corresponding to the parent IRQ for this
+ * nested irqchip
+ */
+void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
+				 struct irq_chip *irqchip,
+				 int parent_irq)
+{
+	if (!gpiochip->irq_nested) {
+		chip_err(gpiochip, "tried to nest a chained gpiochip\n");
+		return;
+	}
+	gpiochip_set_cascaded_irqchip(gpiochip, irqchip, parent_irq,
+				      NULL);
+}
+EXPORT_SYMBOL_GPL(gpiochip_set_nested_irqchip);
+
+/**
  * gpiochip_irq_map() - maps an IRQ into a GPIO irqchip
  * @d: the irqdomain used by this irqchip
  * @irq: the global irq number used by this GPIO irqchip irq
@@ -1510,8 +1549,8 @@ static int gpiochip_irq_map(struct irq_domain *d, unsigned int irq,
 	 */
 	irq_set_lockdep_class(irq, chip->lock_key);
 	irq_set_chip_and_handler(irq, chip->irqchip, chip->irq_handler);
-	/* Chips that can sleep need nested thread handlers */
-	if (chip->can_sleep && !chip->irq_not_threaded)
+	/* Chips that use nested thread handlers have them marked */
+	if (chip->irq_nested)
 		irq_set_nested_thread(irq, 1);
 	irq_set_noprobe(irq);
 
@@ -1529,7 +1568,7 @@ static void gpiochip_irq_unmap(struct irq_domain *d, unsigned int irq)
 {
 	struct gpio_chip *chip = d->host_data;
 
-	if (chip->can_sleep)
+	if (chip->irq_nested)
 		irq_set_nested_thread(irq, 0);
 	irq_set_chip_and_handler(irq, NULL, NULL);
 	irq_set_chip_data(irq, NULL);
@@ -1584,9 +1623,9 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 
 	acpi_gpiochip_free_interrupts(gpiochip);
 
-	if (gpiochip->irq_parent) {
-		irq_set_chained_handler(gpiochip->irq_parent, NULL);
-		irq_set_handler_data(gpiochip->irq_parent, NULL);
+	if (gpiochip->irq_chained_parent) {
+		irq_set_chained_handler(gpiochip->irq_chained_parent, NULL);
+		irq_set_handler_data(gpiochip->irq_chained_parent, NULL);
 	}
 
 	/* Remove all IRQ mappings and delete the domain */
@@ -1610,7 +1649,7 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 }
 
 /**
- * gpiochip_irqchip_add() - adds an irqchip to a gpiochip
+ * _gpiochip_irqchip_add() - adds an irqchip to a gpiochip
  * @gpiochip: the gpiochip to add the irqchip to
  * @irqchip: the irqchip to add to the gpiochip
  * @first_irq: if not dynamically assigned, the base (first) IRQ to
@@ -1618,6 +1657,8 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
  * @handler: the irq handler to use (often a predefined irq core function)
  * @type: the default type for IRQs on this irqchip, pass IRQ_TYPE_NONE
  * to have the core avoid setting up any default type in the hardware.
+ * @nested: whether this is a nested irqchip calling handle_nested_irq()
+ * in its IRQ handler
  * @lock_key: lockdep class
  *
  * This function closely associates a certain irqchip with a certain
@@ -1639,6 +1680,7 @@ int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 			  unsigned int first_irq,
 			  irq_flow_handler_t handler,
 			  unsigned int type,
+			  bool nested,
 			  struct lock_class_key *lock_key)
 {
 	struct device_node *of_node;
@@ -1653,6 +1695,7 @@ int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 		pr_err("missing gpiochip .dev parent pointer\n");
 		return -EINVAL;
 	}
+	gpiochip->irq_nested = nested;
 	of_node = gpiochip->parent->of_node;
 #ifdef CONFIG_OF_GPIO
 	/*
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2dfcf25b1724..c2748accea71 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -82,8 +82,6 @@ enum single_ended_mode {
  *	implies that if the chip supports IRQs, these IRQs need to be threaded
  *	as the chip access may sleep when e.g. reading out the IRQ status
  *	registers.
- * @irq_not_threaded: flag must be set if @can_sleep is set but the
- *	IRQs don't need to be threaded
  * @read_reg: reader function for generic GPIO
  * @write_reg: writer function for generic GPIO
  * @pin2mask: some generic GPIO controllers work with the big-endian bits
@@ -109,8 +107,10 @@ enum single_ended_mode {
  *	for GPIO IRQs, provided by GPIO driver
  * @irq_default_type: default IRQ triggering type applied during GPIO driver
  *	initialization, provided by GPIO driver
- * @irq_parent: GPIO IRQ chip parent/bank linux irq number,
- *	provided by GPIO driver
+ * @irq_chained_parent: GPIO IRQ chip parent/bank linux irq number,
+ *	provided by GPIO driver for chained interrupt (not for nested
+ *	interrupts).
+ * @irq_nested: True if set the interrupt handling is nested.
  * @irq_need_valid_mask: If set core allocates @irq_valid_mask with all
  *	bits set to one
  * @irq_valid_mask: If not %NULL holds bitmask of GPIOs which are valid to
@@ -166,7 +166,6 @@ struct gpio_chip {
 	u16			ngpio;
 	const char		*const *names;
 	bool			can_sleep;
-	bool			irq_not_threaded;
 
 #if IS_ENABLED(CONFIG_GPIO_GENERIC)
 	unsigned long (*read_reg)(void __iomem *reg);
@@ -192,7 +191,8 @@ struct gpio_chip {
 	unsigned int		irq_base;
 	irq_flow_handler_t	irq_handler;
 	unsigned int		irq_default_type;
-	int			irq_parent;
+	int			irq_chained_parent;
+	bool			irq_nested;
 	bool			irq_need_valid_mask;
 	unsigned long		*irq_valid_mask;
 	struct lock_class_key	*lock_key;
@@ -270,24 +270,40 @@ void gpiochip_set_chained_irqchip(struct gpio_chip *gpiochip,
 		int parent_irq,
 		irq_flow_handler_t parent_handler);
 
+void gpiochip_set_nested_irqchip(struct gpio_chip *gpiochip,
+		struct irq_chip *irqchip,
+		int parent_irq);
+
 int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 			  struct irq_chip *irqchip,
 			  unsigned int first_irq,
 			  irq_flow_handler_t handler,
 			  unsigned int type,
+			  bool nested,
 			  struct lock_class_key *lock_key);
 
+/* FIXME: I assume threaded IRQchips do not have the lockdep problem */
+static inline int gpiochip_irqchip_add_nested(struct gpio_chip *gpiochip,
+			  struct irq_chip *irqchip,
+			  unsigned int first_irq,
+			  irq_flow_handler_t handler,
+			  unsigned int type)
+{
+	return _gpiochip_irqchip_add(gpiochip, irqchip, first_irq,
+				     handler, type, true, NULL);
+}
+
 #ifdef CONFIG_LOCKDEP
 #define gpiochip_irqchip_add(...)				\
 (								\
 	({							\
 		static struct lock_class_key _key;		\
-		_gpiochip_irqchip_add(__VA_ARGS__, &_key);	\
+		_gpiochip_irqchip_add(__VA_ARGS__, false, &_key); \
 	})							\
 )
 #else
 #define gpiochip_irqchip_add(...)				\
-	_gpiochip_irqchip_add(__VA_ARGS__, NULL)
+	_gpiochip_irqchip_add(__VA_ARGS__, false, NULL)
 #endif
 
 #endif /* CONFIG_GPIOLIB_IRQCHIP */
-- 
2.7.4

