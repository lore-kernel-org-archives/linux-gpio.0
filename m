From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 157/182] input: ad7879: use gpiochip data pointer
Date: Wed, 16 Dec 2015 14:08:39 -0800
Message-ID: <20151216220839.GD10962@dtor-ws>
References: <1449668721-5832-1-git-send-email-linus.walleij@linaro.org>
 <5668300F.8070800@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f169.google.com ([209.85.192.169]:36195 "EHLO
	mail-pf0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754929AbbLPWIm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2015 17:08:42 -0500
Received: by mail-pf0-f169.google.com with SMTP id o64so18831083pfb.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2015 14:08:42 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <5668300F.8070800@analog.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michael Hennerich <michael.hennerich@analog.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

On Wed, Dec 09, 2015 at 02:43:43PM +0100, Michael Hennerich wrote:
> On 12/09/2015 02:45 PM, Linus Walleij wrote:
> >This makes the driver use the data pointer added to the gpio_chip
> >to store a pointer to the state container instead of relying on
> >container_of().
> >
> >Cc: Michael Hennerich <michael.hennerich@analog.com>
> >Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Acked-by: Michael Hennerich <michael.hennerich@analog.com>
> 
> >---
> >Dmitry: please ACK this so I can take it through the GPIO tree.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> >---
> >  drivers/input/touchscreen/ad7879.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> >diff --git a/drivers/input/touchscreen/ad7879.c b/drivers/input/touchscreen/ad7879.c
> >index 16b5cc2196f2..583a0590ceb2 100644
> >--- a/drivers/input/touchscreen/ad7879.c
> >+++ b/drivers/input/touchscreen/ad7879.c
> >@@ -379,7 +379,7 @@ static const struct attribute_group ad7879_attr_group = {
> >  static int ad7879_gpio_direction_input(struct gpio_chip *chip,
> >  					unsigned gpio)
> >  {
> >-	struct ad7879 *ts = container_of(chip, struct ad7879, gc);
> >+	struct ad7879 *ts = gpiochip_get_data(chip);
> >  	int err;
> >
> >  	mutex_lock(&ts->mutex);
> >@@ -393,7 +393,7 @@ static int ad7879_gpio_direction_input(struct gpio_chip *chip,
> >  static int ad7879_gpio_direction_output(struct gpio_chip *chip,
> >  					unsigned gpio, int level)
> >  {
> >-	struct ad7879 *ts = container_of(chip, struct ad7879, gc);
> >+	struct ad7879 *ts = gpiochip_get_data(chip);
> >  	int err;
> >
> >  	mutex_lock(&ts->mutex);
> >@@ -412,7 +412,7 @@ static int ad7879_gpio_direction_output(struct gpio_chip *chip,
> >
> >  static int ad7879_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
> >  {
> >-	struct ad7879 *ts = container_of(chip, struct ad7879, gc);
> >+	struct ad7879 *ts = gpiochip_get_data(chip);
> >  	u16 val;
> >
> >  	mutex_lock(&ts->mutex);
> >@@ -425,7 +425,7 @@ static int ad7879_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
> >  static void ad7879_gpio_set_value(struct gpio_chip *chip,
> >  				  unsigned gpio, int value)
> >  {
> >-	struct ad7879 *ts = container_of(chip, struct ad7879, gc);
> >+	struct ad7879 *ts = gpiochip_get_data(chip);
> >
> >  	mutex_lock(&ts->mutex);
> >  	if (value)
> >@@ -456,7 +456,7 @@ static int ad7879_gpio_add(struct ad7879 *ts,
> >  		ts->gc.owner = THIS_MODULE;
> >  		ts->gc.parent = ts->dev;
> >
> >-		ret = gpiochip_add(&ts->gc);
> >+		ret = gpiochip_add_data(&ts->gc, ts);
> >  		if (ret)
> >  			dev_err(ts->dev, "failed to register gpio %d\n",
> >  				ts->gc.base);
> >
> 
> 
> -- 
> Greetings,
> Michael
> 
> --
> Analog Devices GmbH      Wilhelm-Wagenfeld-Str. 6      80807 Muenchen
> Sitz der Gesellschaft: Muenchen; Registergericht: Muenchen HRB 40368;
> Geschaeftsfuehrer:Dr.Carsten Suckrow, Thomas Wessel, William A. Martin,
> Margaret Seif

-- 
Dmitry
