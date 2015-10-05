From: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH RFT 4/5] gpio: gpio-pl061: use the generic request/free
 implementations
Date: Mon, 5 Oct 2015 15:12:11 +0200
Message-ID: <5612772B.8090706@openwrt.org>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
 <1442150498-31116-5-git-send-email-jogo@openwrt.org>
 <CACRpkdbVQSTW3pEPLc-34m-zihWfw8fafQxWs_=wfU29GewkYA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:37202 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751189AbbJENMY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 5 Oct 2015 09:12:24 -0400
In-Reply-To: <CACRpkdbVQSTW3pEPLc-34m-zihWfw8fafQxWs_=wfU29GewkYA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abrestic@chromium.org>

On 05.10.2015 11:19, Linus Walleij wrote:
> On Sun, Sep 13, 2015 at 3:21 PM, Jonas Gorski <jogo@openwrt.org> wrote:
> 
>>         spin_lock_init(&chip->lock);
>> -       if (of_property_read_bool(dev->of_node, "gpio-ranges"))
>> -               chip->uses_pinctrl = true;
>> +       if (of_property_read_bool(dev->of_node, "gpio-ranges")) {
>> +               chip->gc.request = gpiochip_generic_request;
>> +               chip->gc.free = gpiochip_generic_free;
>> +       }
> 
> This is way better.
> 
> But now this code is starting to multiply in drivers.
> 
> Can we think of a way to do this even more generic:
> could gpiochip_generic_request() check if the range is
> there instead?

I thought about this, and AFAICT this would open a window in which gpio
requests could bypass the pinctrl subsystem, as ranges are only registered
after the gpio chip was registered.
pinctrl_request_gpio() -> pinctrl_get_device_gpio_range() returns -EPROBEDEFER if
it can't find a range for that reason.

To solve this we could introduce a gpiochip_add_with_range(), then we can assign
the generic _request/_free in gpiochip_add in case the callbacks aren't set yet
(and keep the way _request/_free are implemented).

If the gpio-ranges property is used, we could then check for its existence to
assign the callbacks.

So my idea is something like the following. The conversion would be then

chip->request = foo_request;
chip->free = foo_free;
gpiochip_add(chip);
gpiochip_add_pin_range(chip, "foo", 0, 0, npins);

=>

static const struct __initconst pinctrl_gpio_range foo_range = {
	.base = 0,
	.pinbase = 0,
	.npins = npins,
};

gpiochip_add_with_ranges(chip, "foo", &foo_range, 1);

which would be a bit more verbose, but for drivers like pinctrl-cygnus-gpio,
which registers 51(!) pinranges for the same gpio chip, it would mean quite a
bit of code reduction.

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index fa6e3c8..b4c6119 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -415,6 +415,11 @@ static int of_gpiochip_add_pin_range(struct gpio_chip *chip)
 	return 0;
 }
 
+bool of_gpiochip_has_pin_range(struct gpio_chip *chip)
+{
+	return !!of_find_property(chip->of_node, "gpio-ranges", NULL);
+}
+
 #else
 static int of_gpiochip_add_pin_range(struct gpio_chip *chip) { return 0; }
 #endif
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e0853fb..33f79b0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -236,14 +236,23 @@ static int gpiochip_add_to_list(struct gpio_chip *chip)
  * If chip->base is negative, this requests dynamic assignment of
  * a range of valid GPIOs.
  */
-int gpiochip_add(struct gpio_chip *chip)
+int gpiochip_add_with_ranges(struct gpio_chip *chip, const char *pinctl_name,
+			     const struct pinctrl_gpio_range *ranges,
+			     unsigned int nranges)
 {
 	unsigned long	flags;
 	int		status = 0;
-	unsigned	id;
+	unsigned	id, i;
 	int		base = chip->base;
 	struct gpio_desc *descs;
 
+	if ((nranges > 0) || of_gpiochip_has_pin_range(chip)) {
+		if (!chip->request)
+			chip->request = gpiochip_generic_request;
+		if (!chip->free)
+			chip->free = gpiochip_generic_free;
+	}
+
 	descs = kcalloc(chip->ngpio, sizeof(descs[0]), GFP_KERNEL);
 	if (!descs)
 		return -ENOMEM;
@@ -295,6 +304,16 @@ int gpiochip_add(struct gpio_chip *chip)
 	if (status)
 		goto err_remove_chip;
 
+	for (i = 0; i < nranges; i++) {
+		const struct pinctrl_gpio_range *range = ranges[i];
+
+		status = gpiochip_add_pin_range(chip, pinctl_name,
+						chip->base + range->base,
+						range->pinbase, range->npins);
+		if (status)
+			goto err_remove_chip;
+	}
+
 	acpi_gpiochip_add(chip);
 
 	status = gpiochip_sysfs_register(chip);
@@ -309,6 +328,7 @@ int gpiochip_add(struct gpio_chip *chip)
 
 err_remove_chip:
 	acpi_gpiochip_remove(chip);
+	gpiochip_remove_pin_ranges(chip);
 	gpiochip_free_hogs(chip);
 	of_gpiochip_remove(chip);
 	spin_lock_irqsave(&gpio_lock, flags);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index bf34300..05a71da 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -72,6 +72,15 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 
 struct gpio_desc *gpiochip_get_desc(struct gpio_chip *chip, u16 hwnum);
 
+#if defined(CONFIG_OF_GPIO) && defined(CONFIG_PINCTRL)
+bool of_gpiochip_has_pin_range(struct gpio_chip *chip);
+#else
+static inline bool of_gpiochip_has_pin_range(struct gpio_chip *chip)
+{
+	return false;
+}
+#endif
+
 extern struct spinlock gpio_lock;
 extern struct list_head gpio_chips;
 
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 0857c28..ea8a630 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -166,7 +166,14 @@ extern const char *gpiochip_is_requested(struct gpio_chip *chip,
 			unsigned offset);
 
 /* add/remove chips */
-extern int gpiochip_add(struct gpio_chip *chip);
+static inline int gpiochip_add(struct gpio_chip *chip)
+{
+	return gpiochip_add_with_ranges(chip, NULL, NULL, 0);
+}
+
+int gpiochip_add_with_ranges(struct gpio_chip *chip, const char *pinctl_name,
+			     const struct pinctrl_gpio_range *ranges,
+			     unsigned int nranges);
 extern void gpiochip_remove(struct gpio_chip *chip);
 extern struct gpio_chip *gpiochip_find(void *data,
 			      int (*match)(struct gpio_chip *chip, void *data));
