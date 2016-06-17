From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] gpiolib: potential oops on failure path
Date: Fri, 17 Jun 2016 12:59:05 +0300
Message-ID: <20160617095740.GB32301@mwanda>
References: <20160617091550.GB25609@mwanda>
 <5763C2C1.8000505@bfs.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5763C2C1.8000505@bfs.de>
Sender: kernel-janitors-owner@vger.kernel.org
To: walter harms <wharms@bfs.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 17, 2016 at 11:28:33AM +0200, walter harms wrote:
> >  out_free_descs:
> > +	if (i == GPIOHANDLES_MAX)
> > +		i--;
> >  	for (; i >= 0; i--)
> >  		gpiod_free(lh->descs[i]);
> >  	kfree(lh->label);
> 
> 
> Since we have already noticed that programmes are bad at counting backwards
> is it possible to change the loop into counting up ?
> 
> btw: if lh->descs[i] is initialized to NULL it would be more robust just to free everything like:
> 
> for(i=0;i< GPIOHANDLES_MAX; i++)
>   gpiod_free(lh->descs[i]);
>

Depending on the config gpiod_free(NULL) generates a warning.  It's
possible that it will be generated once with the current code actually
but I didn't feel it was worth worrying about that.

Still I wouldn't want to generate 64 warnings.

regards,
dan carpenter

