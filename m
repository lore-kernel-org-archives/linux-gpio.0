From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] gpio: ep93xx: fix test for end of loop
Date: Thu, 6 Sep 2018 17:48:38 +0300
Message-ID: <20180906144838.2dtqexjqieqjdpub@mwanda>
References: <20180906133348.brzvqt53nzukn7n2@kili.mountain>
 <21c6b967-f4b5-db68-89b4-a9caa4e76fda@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <21c6b967-f4b5-db68-89b4-a9caa4e76fda@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Colin Ian King <colin.king@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Sep 06, 2018 at 02:50:44PM +0100, Colin Ian King wrote:
> On 06/09/18 14:33, Dan Carpenter wrote:
> > The problem is that if port == ARRAY_SIZE() and "gc == &epg->gc[port]"
> > then that should be treated as invalid.
> > 
> > Fixes: fd935fc421e7 ("gpio: ep93xx: Do not pingpong irq numbers")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
> > index 68a416fc3141..b0699f57ddf5 100644
> > --- a/drivers/gpio/gpio-ep93xx.c
> > +++ b/drivers/gpio/gpio-ep93xx.c
> > @@ -80,7 +80,7 @@ static int ep93xx_gpio_port(struct gpio_chip *gc)
> >  		port++;
> >  
> >  	/* This should not happen but is there as a last safeguard */
> > -	if (gc != &epg->gc[port]) {
> > +	if (port == ARRAY_SIZE(epg->gc)) {
> >  		pr_crit("can't find the GPIO port\n");
> >  		return 0;
> >  	}
> > 
> 
> Good catch! I overlooked that one.

It's unfortunate but I don't think any of our static checkers would have
caught it.  You found this bug because of cppcheck, right?  I know it
warns about the bounds test after use.  Does it also warn about the out
of bounds?

Smatch doesn't warn about the out of bounds read because Smatch has bad
handling of loops.  Smatch is supposed to warn about the test after use
but that code is buggy.  I will investigate what's going on.

I have an unpublished test so Smatch does warn that the port < sizeof()
means that port is in terms of bytes but we're using it as an array
offset.  That's how I noticed this code, but it only warns about the
first use, so it warns about the loop but not the post-loop test.

I should fix Smatch's handling of loops so that we know this function
originally could return 0-8 and you maybe get a warning in the caller.
Unfortunately, I'm not sure I would have paid very much attention to a
warning like that because they tend to be prone to false positives.  We
have a lot of loops that do:

	for (i = 0; i < ARRAY_SIZE(array); i++) {
		if (foo <= array[i])
			break;
	}

And the last element of the array[] is UINT_MAX so we always break.
It's a lot of work but not necessarily difficult work.

regards,
dan carpenter
