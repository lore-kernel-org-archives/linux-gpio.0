From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] gpio: pca953x: remove incorrect le16_to_cpu calls
Date: Wed, 19 Jul 2017 15:14:52 +0300
Message-ID: <1500466492.29303.112.camel@linux.intel.com>
References: <20170718155116.88531-1-andriy.shevchenko@linux.intel.com>
         <871spc7i7v.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:25668 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751228AbdGSMR4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 19 Jul 2017 08:17:56 -0400
In-Reply-To: <871spc7i7v.fsf@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Yong Li <sdliyong@gmail.com>, Phil Reid <preid@electromag.com.au>

On Wed, 2017-07-19 at 13:56 +0200, Gregory CLEMENT wrote:
> Hi Andy,
>  
>  On mar., juil. 18 2017, Andy Shevchenko <andriy.shevchenko@linux.inte
> l.com> wrote:
> 
> > i2c_smbus commands handle the correct byte order for smbus
> > transactions
> 
> I am not sure of this claim, I didn't find any cpu_to_lexx in the
> sbmus
> function.

Of course you didn't (I didn't either on the first glance, then I read
the code more carefully).

It does that byte-by-byte.

That explains why people do not notice it AFAIU Sebastian's claim.

> 
> > internally. This will currently result in incorrect operation on big
> > endian systems.
> 
> Did you managed to test this driver in a big endian system and to
> check
> that with this patch the driver worked as expected?

Unfortunately no. I have big endian systems, though I have no such
device connected to them.

> 
> Thanks,
> 
> Gregory
> 
> 
> > 
> > Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> > Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> > - add RB tag
> >  drivers/gpio/gpio-pca953x.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-
> > pca953x.c
> > index 4c9e21300a26..1b9dbf691ae7 100644
> > --- a/drivers/gpio/gpio-pca953x.c
> > +++ b/drivers/gpio/gpio-pca953x.c
> > @@ -187,10 +187,9 @@ static int pca953x_write_regs_8(struct
> > pca953x_chip *chip, int reg, u8 *val)
> >  
> >  static int pca953x_write_regs_16(struct pca953x_chip *chip, int
> > reg, u8 *val)
> >  {
> > -	__le16 word = cpu_to_le16(get_unaligned((u16 *)val));
> > +	u16 word = get_unaligned((u16 *)val);
> >  
> > -	return i2c_smbus_write_word_data(chip->client,
> > -					 reg << 1, (__force
> > u16)word);
> > +	return i2c_smbus_write_word_data(chip->client, reg << 1,
> > word);
> >  }
> >  
> >  static int pca957x_write_regs_16(struct pca953x_chip *chip, int
> > reg, u8 *val)
> > @@ -241,8 +240,7 @@ static int pca953x_read_regs_16(struct
> > pca953x_chip *chip, int reg, u8 *val)
> >  	int ret;
> >  
> >  	ret = i2c_smbus_read_word_data(chip->client, reg << 1);
> > -	val[0] = (u16)ret & 0xFF;
> > -	val[1] = (u16)ret >> 8;
> > +	put_unaligned(ret, (u16 *)val);
> >  
> >  	return ret;
> >  }
> > -- 
> > 2.11.0
> > 
> 
> 

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
