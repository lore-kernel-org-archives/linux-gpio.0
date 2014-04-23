From: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [PATCH] gpio: mcp23s08: Bug fix of SPI device tree registration.
Date: Wed, 23 Apr 2014 15:13:32 +0200
Message-ID: <87fvl42npf.fsf@dell.be.48ers.dk>
References: <1397696424-3394-1-git-send-email-mwelling@ieee.org>
	<CACRpkdYCjjJ8U6JT+1mFXagG5fSKKoqDo043rB-Vw6mNhWwm+g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47]:41771 "EHLO
	mail-ee0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751923AbaDWNNg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 09:13:36 -0400
Received: by mail-ee0-f47.google.com with SMTP id b15so776996eek.20
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 06:13:35 -0700 (PDT)
In-Reply-To: <CACRpkdYCjjJ8U6JT+1mFXagG5fSKKoqDo043rB-Vw6mNhWwm+g@mail.gmail.com>
	(Linus Walleij's message of "Wed, 23 Apr 2014 14:01:40 +0200")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Welling <mwelling@ieee.org>, "Daniel M. Weeks" <dan@danweeks.net>, Lars Poeschel <poeschel@lemonage.de>, Peter Korsgaard <jacmet@sunsite.dk>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

>>>>> "Linus" == Linus Walleij <linus.walleij@linaro.org> writes:

 > Daniel, Lars, Peter: can either of you have a look at this patch
 > and ACK/NACK it?

Sorry, it seems like I wasn't CC'ed on this patch (or the one adding the
DT bindings). The patch looks good to me:

Acked-by: Peter Korsgaard <peter@korsgaard.com>


 > On Thu, Apr 17, 2014 at 3:00 AM, Michael Welling <mwelling@ieee.org> wrote:
 >> The chips variable needs to be incremented for each chip that is found in the
 >> spi_present_mask when register via device tree. Without this and the checking

s/register/registrering/


 >> a negative index is passed to the data->chip array in a subsequent loop.
 >> 
 >> Signed-off-by: Michael Welling <mwelling@ieee.org>
 >> ---
 >> drivers/gpio/gpio-mcp23s08.c |   12 +++++++-----
 >> 1 file changed, 7 insertions(+), 5 deletions(-)
 >> 
 >> diff --git a/drivers/gpio/gpio-mcp23s08.c b/drivers/gpio/gpio-mcp23s08.c
 >> index 99a6831..3d53fd6 100644
 >> --- a/drivers/gpio/gpio-mcp23s08.c
 >> +++ b/drivers/gpio/gpio-mcp23s08.c
 >> @@ -894,9 +894,11 @@ static int mcp23s08_probe(struct spi_device *spi)
 >> dev_err(&spi->dev, "invalid spi-present-mask\n");
 >> return -ENODEV;
 >> }
 >> -
 >> -               for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++)
 >> +               for (addr = 0; addr < ARRAY_SIZE(pdata->chip); addr++) {
 >> +                       if ((spi_present_mask & (1 << addr)))
 >> +                               chips++;
 >> pullups[addr] = 0;
 >> +               }
 >> } else {
 >> type = spi_get_device_id(spi)->driver_data;
 >> pdata = dev_get_platdata(&spi->dev);
 >> @@ -919,12 +921,12 @@ static int mcp23s08_probe(struct spi_device *spi)
 >> pullups[addr] = pdata->chip[addr].pullups;
 >> }
 >> 
 >> -               if (!chips)
 >> -                       return -ENODEV;
 >> -
 >> base = pdata->base;
 >> }
 >> 
 >> +       if (!chips)
 >> +               return -ENODEV;
 >> +
 >> data = kzalloc(sizeof(*data) + chips * sizeof(struct mcp23s08),
 >> GFP_KERNEL);
 >> if (!data)
 >> --
 >> 1.7.9.5
 >> 


-- 
Bye, Peter Korsgaard
