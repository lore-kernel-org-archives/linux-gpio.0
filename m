From: Daniel Lockyer <thisisdaniellockyer@gmail.com>
Subject: Re: [PATCH] GPIO: Fix checkpatch.pl issues
Date: Wed, 10 Jun 2015 14:18:05 +0100
Message-ID: <20150610131805.GA14834@eve.soton.ac.uk>
References: <20150608190305.GA11525@eve.soton.ac.uk>
 <CAAVeFu+wXS=qGRn_qTU4AD0LQ8DUZp=EMgSYw20infejXHAejA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:34156 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754011AbbFJNSH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2015 09:18:07 -0400
Received: by wibut5 with SMTP id ut5so48173070wib.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2015 06:18:06 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAAVeFu+wXS=qGRn_qTU4AD0LQ8DUZp=EMgSYw20infejXHAejA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Jun 10, 2015 at 11:17:10AM +0900, Alexandre Courbot wrote:
> On Tue, Jun 9, 2015 at 4:03 AM, Daniel Lockyer
> <thisisdaniellockyer@gmail.com> wrote:
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index 6bc612b..f2cab60 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -1300,9 +1300,8 @@ static void gpio_chip_set_multiple(struct gpio_chip *chip,
> >                                 continue;
> >                         }
> >                         /* set outputs if the corresponding mask bit is set */
> > -                       if (__test_and_clear_bit(i, mask)) {
> > -                               chip->set(chip, i, test_bit(i, bits));
> > -                       }
> > +                       if (__test_and_clear_bit(i, mask))
> > +                               chip->set(chip, i, test_bit(i, bits));}
> 
> That closing bracket at the end of the line does not look like it
> should be here. Does gpiolib even compile after this?

I apologise... not sure what went on here.

New patch will be coming through soon.

Daniel
