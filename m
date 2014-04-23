From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH] gpio: mcp23s08: Bug fix of SPI device tree registration.
Date: Wed, 23 Apr 2014 18:12:58 -0500
Message-ID: <20140423231258.GA2442@deathray>
References: <1397696424-3394-1-git-send-email-mwelling@ieee.org>
 <CACRpkdYCjjJ8U6JT+1mFXagG5fSKKoqDo043rB-Vw6mNhWwm+g@mail.gmail.com>
 <87fvl42npf.fsf@dell.be.48ers.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171]:49182 "EHLO
	mail-ig0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751126AbaDWXNC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 19:13:02 -0400
Received: by mail-ig0-f171.google.com with SMTP id c1so202226igq.16
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 16:13:01 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <87fvl42npf.fsf@dell.be.48ers.dk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "Daniel M. Weeks" <dan@danweeks.net>, Lars Poeschel <poeschel@lemonage.de>, Peter Korsgaard <jacmet@sunsite.dk>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Apr 23, 2014 at 03:13:32PM +0200, Peter Korsgaard wrote:
> >>>>> "Linus" == Linus Walleij <linus.walleij@linaro.org> writes:
> 
>  > Daniel, Lars, Peter: can either of you have a look at this patch
>  > and ACK/NACK it?
> 
> Sorry, it seems like I wasn't CC'ed on this patch (or the one adding the
> DT bindings). The patch looks good to me:
> 
> Acked-by: Peter Korsgaard <peter@korsgaard.com>
> 
The patched driver was tested and working on actual hardware.
> 
>  > On Thu, Apr 17, 2014 at 3:00 AM, Michael Welling <mwelling@ieee.org> wrote:
>  >> The chips variable needs to be incremented for each chip that is found in the
>  >> spi_present_mask when register via device tree. Without this and the checking
> 
> s/register/registrering/
s/registrering/registering/

I should really proof read my commit logs.
> 
> 
>  >> a negative index is passed to the data->chip array in a subsequent loop.
>  >> 
>  >> Signed-off-by: Michael Welling <mwelling@ieee.org>
>  >> ---
>  >> drivers/gpio/gpio-mcp23s08.c |   12 +++++++-----
>  >> 1 file changed, 7 insertions(+), 5 deletions(-)
>  >> 
>  >> diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
>  >> index 99a6831..3d53fd6 100644
>  >> --- a/drivers/gpio/gpio-mcp23s08.c
>  >> +++ b/drivers/gpio/gpio-mcp23s08.c
>  >> @@ -894,9 +894,11 @@ static int mcp23s08_probe(struct spi_device *spi)
>  >> dev_err(&spi->dev, "invalid spi-present-mask\n");
>  >> return -ENODEV;
>  >> }
>  >> -
>  >> -               for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++)
>  >> +               for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
>  >> +                       if ((spi_present_mask & (1 << addr)))
>  >> +                               chips++;
>  >> pullups[addr] = 0;
>  >> +               }
>  >> } else {
>  >> type = spi_get_device_id(spi)->driver_data;
>  >> pdata = dev_get_platdata(&spi->dev);
>  >> @@ -919,12 +921,12 @@ static int mcp23s08_probe(struct spi_device *spi)
>  >> pullups[addr] = pdata->chip[addr].pullups;
>  >> }
>  >> 
>  >> -               if (!chips)
>  >> -                       return -ENODEV;
>  >> -
>  >> base = pdata->base;
>  >> }
>  >> 
>  >> +       if (!chips)
>  >> +               return -ENODEV;
>  >> +
>  >> data = kzalloc(sizeof(*data) + chips * sizeof(struct mcp23s08),
>  >> GFP_KERNEL);
>  >> if (!data)
>  >> --
>  >> 1.7.9.5
>  >> 
> 
> 
> -- 
> Bye, Peter Korsgaard
