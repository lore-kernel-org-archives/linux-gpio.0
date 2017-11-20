From: Davide Hug <d@videhug.ch>
Subject: Re: Should irq_enable/disable be flagging/unflagging gpio lines
 used as irq?
Date: Mon, 20 Nov 2017 23:48:41 +0100
Message-ID: <20171120234841.b5367dbeb92a4e47e1557054@videhug.ch>
References: <20170711195518.34aa849888e9d67a0736a990@videhug.ch>
        <CACRpkdaqJT5SLSCDtHtfXXpF4j+ig5CQeDhLFJw47Lcgmc6rCQ@mail.gmail.com>
        <alpine.DEB.2.20.1707122330060.2510@nanos>
        <20170713221729.cb6352445665b4e3d71d1cb1@videhug.ch>
        <CACRpkdZ2gm6gE+M2OLHBchUtS+F-L+UYSVSZyXOJin9j9Q4EVg@mail.gmail.com>
        <20170826004514.be093db11518876eb85f4e10@videhug.ch>
        <CACRpkdaB1_xJAPxikmMaZYT3CXgHubNdqbnUYyWpkjfF4zz8zA@mail.gmail.com>
        <20170910161600.e1643057e6b8fd1e7834c3a8@videhug.ch>
        <CACRpkdb1X8H7Q0o_JNSmmyfY0b4mVqsv1=VNAG3dDUmJzxx+rA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from s067.cyon.net ([149.126.4.76]:45960 "EHLO s067.cyon.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751173AbdKTWzN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Nov 2017 17:55:13 -0500
In-Reply-To: <CACRpkdb1X8H7Q0o_JNSmmyfY0b4mVqsv1=VNAG3dDUmJzxx+rA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Grygorii Strashko <grygorii.strashko@ti.com>, Marc Zyngier <marc.zyngier@arm.com>

I'm really sorry that I come back to this only now.

On Tue, 12 Sep 2017 15:57:47 +0200
Linus Walleij <linus.walleij@linaro.org> wrote:

> > At each measurement the bidirectional data line is used by the sensor as data
> > ready signal. So the IRQ is used only to detect the data ready signal. After that
> > the IRQ is disabled to avoid triggering interrupts during the serial
> > communication.
> 
> That is a fully valid usecase and I think something gpiolib
> should be able to support. If it bugs you, it will also soon bug
> somebody else.

Reading through the mailing list from when irq_request/release_resources were
introduced I see how more involved this is than I would first think.
Also, from the discussion above I understand that for the hwmon/sht15 driver it
is acceptable to use a simple polling loop without irq.
But it seems that iio/humidity/dht11 is another driver with a similar
situation.

> Somewhere the backing irqchip is talking to gpiochip by
> issueing gpiochip_lock_as_irq() on this
> line and it should be made to issue gpiochip_unlock_as_irq()
> before used as serial line, and then gpiochip_lock_as_irq()
> again when the go back to using it as irq.
> 
> Currently, this mostly gets done in the .irq_request_resources
> and .irq_release_resources of the irqchip.
> 
> Intuitively I would say it should be done by
> .irq_enable()/.irq_disable() but that has the problem that it
> is fastpath, and not all GPIO irqchips can handle that.

Do I understand this correctly? Some GPIO drivers can be slow and sleep, and
.irq_enable/disable can be called from places where this is not acceptable.

(I see that only gpio/gpio-pcf857x implements .irq_enable/disable and has
.can_sleep=true)

> Maybe we should do it in .irq_enable()/.irq_disable() in case
> the .can_sleep bool on the gpiochip is not set, simply?
> This way the irqchip should be able to lock/unlock the GPIO
> lines dynamically.

So, before a driver relays on locking/unlocking a GPIO line dynamically, the
driver would have to make sure that the GPIO has not .can_sleep=true. Right?

> We would need to patch a few drivers, but the generic code
> for simple gpio irqchips is in gpiolib.c and can be fixed once
> and for all. (Which is kind of why I insist on drivers to use
> that...)

With a default .irq_enable/disable implementation in gpiolib (something as in
the patch below) the GPIO driver implementing their own .irq_enable/disable
would have to be fixed, right?

Grepping around I get 12 drivers that call gpiochip_irqchip_add, that don't
have .can_sleep=true and implement their own .irq_enable/.irq_disable.
Also, 5 of these drivers only implement either .irq_enable or .irq_disable. This
would be a problem with my patch below which assumes that both are implemented
or neither.

> comm -3 <(grep -r 'gpiochip_irqchip_add' drivers/ -l | xargs grep "\.irq_enable" -l |sort) \
>         <(grep -r 'gpiochip_irqchip_add' drivers/ -l | xargs grep "\.irq_disable" -l |sort)
		drivers/gpio/gpio-xlp.c
drivers/gpio/gpio-zynq.c
drivers/pinctrl/intel/pinctrl-intel.c
		drivers/pinctrl/pinctrl-at91.c
		drivers/pinctrl/pinctrl-st.c


Thanks,
Davide




diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index aad84a6306c4..2435654d2ffd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1701,6 +1701,24 @@ static void gpiochip_irq_relres(struct irq_data *d)
 	module_put(chip->gpiodev->owner);
 }
 
+static void gpiochip_irq_disable(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+
+	gpiochip_unlock_as_irq(chip, data->hwirq);
+	if (data->chip->irq_mask)
+		data->chip->irq_mask(data);
+}
+
+static void gpiochip_irq_enable(struct irq_data *data)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
+
+	gpiochip_lock_as_irq(chip, data->hwirq);
+	if (data->chip->irq_unmask)
+		data->chip->irq_unmask(data);
+}
+
 static int gpiochip_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	if (!gpiochip_irqchip_irq_valid(chip, offset))
@@ -1834,6 +1852,8 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip)
 	if (gpiochip->irq.chip) {
 		gpiochip->irq.chip->irq_request_resources = NULL;
 		gpiochip->irq.chip->irq_release_resources = NULL;
+		gpiochip->irq.chip->irq_disable = NULL;
+		gpiochip->irq.chip->irq_enable  = NULL;
 		gpiochip->irq.chip = NULL;
 	}
 
@@ -1931,6 +1951,13 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gpiochip,
 		irqchip->irq_release_resources = gpiochip_irq_relres;
 	}
 
+	if (!gpiochip->can_sleep &&
+	    !irqchip->irq_disable &&
+	    !irqchip->irq_enable) {
+		irqchip->irq_disable = gpiochip_irq_disable;
+		irqchip->irq_enable  = gpiochip_irq_enable;
+	}
+
 	acpi_gpiochip_request_interrupts(gpiochip);
 
 	return 0;
