From: walter harms <wharms@bfs.de>
Subject: Re: [patch] gpiolib: potential oops on failure path
Date: Fri, 17 Jun 2016 11:28:33 +0200
Message-ID: <5763C2C1.8000505@bfs.de>
References: <20160617091550.GB25609@mwanda>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20160617091550.GB25609@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org



Am 17.06.2016 11:15, schrieb Dan Carpenter:
> If anon_inode_getfd() fails then "i" is set to GPIOHANDLES_MAX.  It
> means that we will read beyond the end of the array and dereference an
> invalid pointer.
> 
> Fixes: d7c51b47ac11 ('gpio: userspace ABI for reading/writing GPIO lines')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 8b3db59..8578b7f 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -495,6 +495,8 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
>  	return 0;
>  
>  out_free_descs:
> +	if (i == GPIOHANDLES_MAX)
> +		i--;
>  	for (; i >= 0; i--)
>  		gpiod_free(lh->descs[i]);
>  	kfree(lh->label);


Since we have already noticed that programmes are bad at counting backwards
is it possible to change the loop into counting up ?

btw: if lh->descs[i] is initialized to NULL it would be more robust just to free everything like:

for(i=0;i< GPIOHANDLES_MAX; i++)
  gpiod_free(lh->descs[i]);

just my two cents,

re,
 wh




