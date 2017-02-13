From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] gpio: return NULL from gpiod_get_optional when
 GPIOLIB is disabled
Date: Mon, 13 Feb 2017 09:32:56 -0800
Message-ID: <20170213172441.GA20057@dtor-ws>
References: <20170213011355.GA13075@dtor-ws>
 <20170213011501.GB528@dtor-ws>
 <20170213074506.cf2zrjp2lmhtyoo5@pengutronix.de>
 <20170213082008.GA22252@dtor-ws>
 <20170213085935.76rlb6pwarejpmlh@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:36785 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750943AbdBMRdA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Feb 2017 12:33:00 -0500
Content-Disposition: inline
In-Reply-To: <20170213085935.76rlb6pwarejpmlh@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Uwe,

On Mon, Feb 13, 2017 at 09:59:35AM +0100, Uwe Kleine-König wrote:
> Hello Dmitry,
> 
> On Mon, Feb 13, 2017 at 12:20:08AM -0800, Dmitry Torokhov wrote:
> > On Mon, Feb 13, 2017 at 08:45:06AM +0100, Uwe Kleine-König wrote:
> > > My concern is still there. This might break some setups. IMHO it's not
> > > ok to request that a device in a certain configuration only works when
> > > the (optional) Kconfig option GPIOLIB is enabled and silently breaks if
> > > it's not. And you cannot rely on the person who configured the kernel.
> > 
> > Really? So I guess we can tell people do just do "make randconfig"
> > and start reporting bugs when that kernel would not work on their
> > hardware?
> 
> No, but if randconfig enabled a driver for your temperature sensor and
> that driver manages to try binding to that device, it should fail if the
> temperature sensor might have a GPIO that must be taken into account for
> proper functioning if it's there and the driver cannot find out if it's
> there.

I disagree. The gpio might be there, the regulator might be there, they
might be physically present, but not described in DT, ACPI might be
disabled, another subsystem might be disabled, kernel parameters might
be wrong, additional DT data might be wrong. We are not going to "fix"
everything.

> 
> If your driver can handle a GPIO that can also safely be ignored, then
> sure, this function's semantic is a nuisance. But then given that this
> semantic is what most drivers should use AFAICT the right thing is to
> introduce another function with the semantic:
> 
> 	if there is a gpio and GPIOLIB is enabled:
> 		return gpio
> 	else:
> 		return NULL

gpiod_get_optional_I_really_mean_it_scouts_honor()?

> 
> > > When accepting this you will burn debug time of others who see their
> > > device breaking with no or unrelated error messages.
> > > 
> > > The only reliable way out here is to enable enough of GPIOLIB to only
> > > return NULL in ..._optional when there is no gpio required. You can have
> > > a suggested-by for that.
> > > 
> > > The semantic of gpiod_get_optional is:
> > > 
> > > 	if there is a gpio:
> > > 		give it to me
> > > 	else:
> > > 		give me a dummy
> > > 
> > > If the kernel is configured to be unable to answer the question "is
> > > there a gpio?" that is worth a -ENOSYS.
> > 
> > You know what every single driver for peripherals that are used on
> > variety of systems using has to do for gpios that are truly optional?
> 
> What is the difference between "truly optional" and the meaning of
> optional in gpiod_get_optional?

I do not see there is anything different, at least for me. The drivers
that believe they need to know about "true" presence of optional GPIOs
are free to add "depend GPIOLIB" to their Kconfig entries.

> 
> > 	gpio = gpio_get_optional();
> > 	if (IS_ERR(gpio)) {
> > 		error = PTR_ERR(gpio);
> > 		if (error == -ENOSYS) {
> > 			/*
> > 			 * - It's OK, we said it's optional GPIO so
> > 			 * if GPIOLIB is not there we should not fail
> > 			 * to enable the device, because this gpio is
> > 			 * *OPTIONAL*.
> > 			 * - But what if it is actually there? What if the
> > 			 * kernel is misconfigured?
> > 			 * - And what if it is not? How would we know?
> > 			 * - Let's parse device tree by hand! And check
> > 			 * ACPI. And if ACPI is disabled reimplement it
> > 			 * because we should not silently break users!
> > 			 * - ... no, let's not.
> > 			 */
> > 			gpio = NULL;
> > 		} else {
> > 			return error;
> > 		}
> > 	}
> 
> I don't know a good name, but implementing a separate helper function
> with this semantic is great. It simplifies all these drivers, makes them
> easily greppable for, and lets the drivers that want the reliable
> semantic just continue to use gpiod_get_optional().

Or they can say "depends on GPIOLIB" and get that reliable semantics
without introducing new API.

> 
> Can you list a few drivers that should make use of this new function
> instead of gpiod_get_optional()?

Instead? None. But I consider all of the following:

drivers/input/misc/drv260x.c:   haptics->enable_gpio = devm_gpiod_get_optional(dev, "enable",
drivers/input/touchscreen/cyttsp_core.c:        ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
drivers/input/touchscreen/edt-ft5x06.c: tsdata->reset_gpio = devm_gpiod_get_optional(&client->dev,
drivers/input/touchscreen/edt-ft5x06.c: tsdata->wake_gpio = devm_gpiod_get_optional(&client->dev,
drivers/input/touchscreen/goodix.c:     gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_INT_NAME, GPIOD_IN);
drivers/input/touchscreen/goodix.c:     gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_RST_NAME, GPIOD_IN);
drivers/input/touchscreen/melfas_mip4.c:        ts->gpio_ce = devm_gpiod_get_optional(&client->dev,
drivers/input/touchscreen/pixcir_i2c_ts.c:      tsdata->gpio_reset = devm_gpiod_get_optional(dev, "reset",
drivers/input/touchscreen/pixcir_i2c_ts.c:      tsdata->gpio_wake = devm_gpiod_get_optional(dev, "wake",
drivers/input/touchscreen/pixcir_i2c_ts.c:      tsdata->gpio_enable = devm_gpiod_get_optional(dev, "enable",
drivers/input/touchscreen/raydium_i2c_ts.c:     ts->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
drivers/input/touchscreen/silead.c:     data->gpio_power = devm_gpiod_get_optional(dev, "power", GPIOD_OUT_LOW);
drivers/input/touchscreen/sis_i2c.c:    ts->attn_gpio = devm_gpiod_get_optional(&client->dev,
drivers/input/touchscreen/sis_i2c.c:    ts->reset_gpio = devm_gpiod_get_optional(&client->dev,
drivers/input/touchscreen/tsc200x-core.c:       ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
drivers/input/touchscreen/zforce_ts.c:  ts->gpio_rst = devm_gpiod_get_optional(&client->dev, "reset",
drivers/input/touchscreen/zforce_ts.c:          ts->gpio_int = devm_gpiod_get_optional(&client->dev, "irq",

slightly broken right now. Some of them are working around not having to
care about -ENOSYS by using "depends on GPIOLIB || COMPILE_TEST" and
forcing enabling gpiolib even on systems where there are no gpios
exposed to the drivers (let's say there is an ACPI system where all
gpios are ACPI owned and not to be touched by the kernel).

> 
> Or alternatively (if "truly optional" means: I don't need to do anything
> even if it's available) just do the following instead:
> 
> 	/*
> 	 * There might be a gpio but to not make the driver depend
> 	 * on GPIOLIB we don't make use of it.
> 	 */
> 	gpio = NULL;

That is not really helpful.

OK, I do not think we'll have a meeting of minds here, as I strongly
believe that configuring kernel is something that is not done randomly
and "randconfig" option is not something that we should try to make
working while you advocating for some developer blindly enabling and
disabling kernel options and the rest of the kernel developers taking
pains as to not inconvenience said developer. So let's leave this to
Linus and Alexandre to decide if they believe my (and your older)
proposal makes sense or not.

Thanks.

-- 
Dmitry
