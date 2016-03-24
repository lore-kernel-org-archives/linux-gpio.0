From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2] gpio / ACPI: ignore GpioInt() GPIOs when requesting
 GPIO_OUT_*
Date: Thu, 24 Mar 2016 10:50:25 -0700
Message-ID: <20160324175025.GA4149@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f176.google.com ([209.85.192.176]:33399 "EHLO
	mail-pf0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751193AbcCXRu3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Mar 2016 13:50:29 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

From: Dmitry Torokhov <dtor@chromium.org>

When firmware does not use _DSD properties that allow properly name GPIO
resources, the kernel falls back on parsing _CRS resources, and will
return entries described as GpioInt() as general purpose GPIOs even
though they are meant to be used simply as interrupt sources for the
device:

Device (ETSA)
{
	Name (_HID, "ELAN0001")
	...

	Method(_CRS, 0x0, NotSerialized)
	{
		Name(BUF0,ResourceTemplate ()
		{
			I2CSerialBus(
				0x10,                     /* SlaveAddress */
				ControllerInitiated,      /* SlaveMode */
				400000,                   /* ConnectionSpeed */
				AddressingMode7Bit,       /* AddressingMode */
				"\\_SB.I2C1",             /* ResourceSource */
			)
			GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullNone,,
				 "\\_SB.GPSW") { BOARD_TOUCH_GPIO_INDEX }
		} )
		Return (BUF0)
	}
...
}

This gives troubles with drivers such as Elan Touchscreen driver
(elants_i2c) that uses devm_gpiod_get to look up "reset" GPIO line and
decide whether the driver is responsible for powering up and resetting
the device, or firmware is. In the above case the lookup succeeds, we
map GPIO as output and later fail to request client->irq interrupt that
is mapped to the same GPIO.

Let's ignore resources described as GpioInt() while parsing _CRS when
requesting output GPIOs (but allow them when requesting GPIOD_ASIS or
GPIOD_IN as some drivers, such as i2c-hid, do request GPIO as input and
then map it to interrupt with gpiod_to_irq).

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Dmitry Torokhov <dtor@chromium.org>
---

v1->v2:
- reworded commit message slightly to make it clearer that we only
  ignore GpioInt entries when falling back to parsing _CRS
- cleared Chrome OS tags from commit message
- added Mika's acked-by
- no code changes

 drivers/gpio/gpiolib.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 7206553..4a0e66b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2231,9 +2231,11 @@ static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 	return desc;
 }
 
-static struct gpio_desc *acpi_find_gpio(struct device *dev, const char *con_id,
+static struct gpio_desc *acpi_find_gpio(struct device *dev,
+					const char *con_id,
 					unsigned int idx,
-					enum gpio_lookup_flags *flags)
+					enum gpiod_flags flags,
+					enum gpio_lookup_flags *lookupflags)
 {
 	struct acpi_device *adev = ACPI_COMPANION(dev);
 	struct acpi_gpio_info info;
@@ -2264,10 +2266,16 @@ static struct gpio_desc *acpi_find_gpio(struct device *dev, const char *con_id,
 		desc = acpi_get_gpiod_by_index(adev, NULL, idx, &info);
 		if (IS_ERR(desc))
 			return desc;
+
+		if ((flags == GPIOD_OUT_LOW || flags == GPIOD_OUT_HIGH) &&
+		    info.gpioint) {
+			dev_dbg(dev, "refusing GpioInt() entry when doing GPIOD_OUT_* lookup\n");
+			return ERR_PTR(-ENOENT);
+		}
 	}
 
 	if (info.polarity == GPIO_ACTIVE_LOW)
-		*flags |= GPIO_ACTIVE_LOW;
+		*lookupflags |= GPIO_ACTIVE_LOW;
 
 	return desc;
 }
@@ -2530,7 +2538,7 @@ struct gpio_desc *__must_check gpiod_get_index(struct device *dev,
 			desc = of_find_gpio(dev, con_id, idx, &lookupflags);
 		} else if (ACPI_COMPANION(dev)) {
 			dev_dbg(dev, "using ACPI for GPIO lookup\n");
-			desc = acpi_find_gpio(dev, con_id, idx, &lookupflags);
+			desc = acpi_find_gpio(dev, con_id, idx, flags, &lookupflags);
 		}
 	}
 
-- 
2.8.0.rc3.226.g39d4020


-- 
Dmitry
