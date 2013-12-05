From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 2/5] gpiolib: introduce chip_* to print with
 chip->label prefix
Date: Thu, 05 Dec 2013 11:09:30 +0200
Message-ID: <1386234570.1871.64.camel@smile>
References: <1386164580-32288-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <1386164580-32288-3-git-send-email-andriy.shevchenko@linux.intel.com>
	 <529FE34F.3040704@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:8106 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751053Ab3LEJKM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 5 Dec 2013 04:10:12 -0500
In-Reply-To: <529FE34F.3040704@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alex Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Thu, 2013-12-05 at 11:22 +0900, Alex Courbot wrote:
> On 12/04/2013 10:42 PM, Andy Shevchenko wrote:
> > In several places we are printing messages with prefix based on chip->label.
> > Introduced macros help us to do this easier and in uniform way.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> > ---
> >   drivers/gpio/gpiolib.c | 41 ++++++++++++++++++++++++++---------------
> >   1 file changed, 26 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 7cf3f84..70e560c 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -85,6 +85,8 @@ static DEFINE_IDR(dirent_idr);
> >   static int gpiod_request(struct gpio_desc *desc, const char *label);
> >   static void gpiod_free(struct gpio_desc *desc);
> >
> > +/* With descriptor prefix */
> > +
> >   #ifdef CONFIG_DEBUG_FS
> >   #define gpiod_emerg(desc, fmt, ...)					       \
> >   	pr_emerg("gpio-%d (%s): " fmt, desc_to_gpio(desc), desc->label ? : "?",\
> > @@ -119,6 +121,21 @@ static void gpiod_free(struct gpio_desc *desc);
> >   	pr_debug("gpio-%d: " fmt, desc_to_gpio(desc), ##__VA_ARGS__)
> >   #endif
> >
> > +/* With chip prefix */
> > +
> > +#define chip_emerg(chip, fmt, ...)					\
> > +	pr_emerg("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
> > +#define chip_crit(chip, fmt, ...)					\
> > +	pr_crit("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
> > +#define chip_err(chip, fmt, ...)					\
> > +	pr_err("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
> > +#define chip_warn(chip, fmt, ...)					\
> > +	pr_warn("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
> > +#define chip_info(chip, fmt, ...)					\
> > +	pr_info("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
> > +#define chip_dbg(chip, fmt, ...)					\
> > +	pr_debug("%s: GPIO chip: " fmt, chip->label, ##__VA_ARGS__)
> 
> One last comment on this: how about using "GPIO chip %s: " for message 
> prefix instead? (less ':' and less characters overall).

Agree. Will change this one.

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

