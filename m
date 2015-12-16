From: Michael Trimarchi <michael@amarulasolutions.com>
Subject: Re: BGPIOF_READ_OUTPUT_REG_SET problem
Date: Wed, 16 Dec 2015 19:17:57 +0100
Message-ID: <20151216181752.GD20121@panicking>
References: <20151216140456.GA20121@panicking>
 <56717A1F.7020105@mentor.com>
 <20151216152511.GB20121@panicking>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f41.google.com ([74.125.82.41]:33807 "EHLO
	mail-wm0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934392AbbLPSSC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Dec 2015 13:18:02 -0500
Received: by mail-wm0-f41.google.com with SMTP id l126so52191703wml.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Dec 2015 10:18:01 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151216152511.GB20121@panicking>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Hi

On Wed, Dec 16, 2015 at 04:25:11PM +0100, Michael Trimarchi wrote:
> Hi
> 
> On Wed, Dec 16, 2015 at 04:50:07PM +0200, Vladimir Zapolskiy wrote:
> > Hi Michael,
> > 
> > On 16.12.2015 16:05, Michael Trimarchi wrote:
> > > Hi
> > > 
> > > I have get a problem using gpio and imx6q freescale architecture. 
> > 
> > what is the problem you experience? What is the version of the kernel
> > (commit hash id) you run?
> > 
> 
> I don't want the mask back when I read the gpio. I want to know if it's
> 1 or 0
> 

This is my starting commit on my local tree:

dd5ae6818ccd4ab0aa6f7d84e88f60a48af0fb52

Michael


> Michael
> 
> > > I don't really understand how should work your change and I have done a quick
> > > fix for me. Can you explain what was the idea?
> > 
> > I believe here you are talking about changes b19e7f51a5 and
> > 442b2494b17d1 , please explain the problem.
> > 
> > With best wishes,
> > Vladimir
> > 
> > > Michael
> > > 
> > > diff --git a/drivers/gpio/gpio-generic.c b/drivers/gpio/gpio-generic.c
> > > index a3f0753..f9c6ff7 100644
> > > --- a/drivers/gpio/gpio-generic.c
> > > +++ b/drivers/gpio/gpio-generic.c
> > > @@ -139,11 +139,14 @@ static int bgpio_get_set(struct gpio_chip *gc, unsigned int gpio)
> > >  {
> > >  	struct bgpio_chip *bgc = to_bgpio_chip(gc);
> > >  	unsigned long pinmask = bgc->pin2mask(bgc, gpio);
> > > +	unsigned long reg;
> > >  
> > >  	if (bgc->dir & pinmask)
> > > -		return bgc->read_reg(bgc->reg_set) & pinmask;
> > > +		reg = bgc->read_reg(bgc->reg_set) & pinmask;
> > >  	else
> > > -		return bgc->read_reg(bgc->reg_dat) & pinmask;
> > > +		reg = bgc->read_reg(bgc->reg_dat) & pinmask;
> > > +
> > > +	return !!(reg &  bgc->pin2mask(bgc, gpio));
> > >  }
> > >  
> > >  static int bgpio_get(struct gpio_chip *gc, unsigned int gpio)
> > > 
> 
> -- 
> | Michael Nazzareno Trimarchi                     Amarula Solutions BV |
> | COO  -  Founder                                      Cruquiuskade 47 |
> | +31(0)851119172                                 Amsterdam 1018 AM NL |
> |                  [`as] http://www.amarulasolutions.com               |

-- 
| Michael Nazzareno Trimarchi                     Amarula Solutions BV |
| COO  -  Founder                                      Cruquiuskade 47 |
| +31(0)851119172                                 Amsterdam 1018 AM NL |
|                  [`as] http://www.amarulasolutions.com               |
