From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 13/54] gpio: pcf857x: Be sure to clamp return value
Date: Sun, 27 Dec 2015 09:47:29 +0200
Message-ID: <4184910.enE8aZKjEM@avalon>
References: <1450794009-22885-1-git-send-email-linus.walleij@linaro.org> <11897257.suvtS8Wvz6@avalon> <567F3258.7020003@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:56263 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752435AbbL0Hro (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2015 02:47:44 -0500
In-Reply-To: <567F3258.7020003@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, George Cherian <george.cherian@ti.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Hi Vladimir,

On Sunday 27 December 2015 02:35:36 Vladimir Zapolskiy wrote:
> On 27.12.2015 00:35, Laurent Pinchart wrote:
> > On Tuesday 22 December 2015 15:20:09 Linus Walleij wrote:
> >> As we want gpio_chip .get() calls to be able to return negative
> >> error codes and propagate to drivers, we need to go over all
> >> drivers and make sure their return values are clamped to [0,1].
> >> We do this by using the ret = !!(val) design pattern.
> > 
> > The patch itself looks good to me, but wouldn't it be easier to patch the
> > caller to clamp positive values to [0,1] and propagate negative values
> > untouched ?
> 
> this has been done in v4.3 e20538b82f1f ("gpio: Propagate errors from
> chip->get()"), but the change causes problems with GPIO line id 31 and
> the change is temporarily reverted by 45ad7db90b ("gpio: revert get() to
> non-errorprogating behaviour").
> 
> See also a recent discussion related to this problem
> http://www.spinics.net/lists/linux-gpio/msg10677.html
> 
> >> Also start returning the error code if something fails, as the
> >> end of the series augment the core to support this.
> >> 
> >> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> >> Cc: George Cherian <george.cherian@ti.com>
> >> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >> ---
> >> 
> >>  drivers/gpio/gpio-pcf857x.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >> 
> >> diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
> >> index bf511c0efa48..f64380a7d004 100644
> >> --- a/drivers/gpio/gpio-pcf857x.c
> >> +++ b/drivers/gpio/gpio-pcf857x.c
> >> @@ -154,7 +154,7 @@ static int pcf857x_get(struct gpio_chip *chip,
> >> unsigned
> >> offset) int		value;
> >> 
> >>  	value = gpio->read(gpio->client);
> >> 
> >> -	return (value < 0) ? 0 : (value & (1 << offset));
> >> +	return (value < 0) ? value : !!(value & (1 << offset));
> >> 
> >>  }
> 
> Back to your question, assume here in unmodified version the case of
> (offset == 31) [1], on upper level the returned value will be
> misapprehended as a negative number.
> 
> [1] (offset == 31) may be an invalid GPIO line id in this particular
> driver, but some other gpiochip drivers should support line id 31.

Would something like the following make sense ?

	value = chip->get ? chip->get(chip, offset) : -EIO;
	value = IS_ERR_VALUE(value) ? value : !!value;

Granted, GPIO drivers would still need to make sure that the value they return 
from register reads don't get considered as an error code, but any val & (1 << 
offset) would be fine, which is the most common case.

If you still think that patching all GPIO drivers is better I won't oppose to 
that.

> >>  static int pcf857x_output(struct gpio_chip *chip, unsigned offset, int
> >> 
> >> value)

-- 
Regards,

Laurent Pinchart

