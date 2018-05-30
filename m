From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] mdio-mux-gpio: Remove VLA usage
Date: Wed, 30 May 2018 02:57:42 +0200
Message-ID: <20180530005742.GA30239@lunn.ch>
References: <20180529225901.GA30464@beast>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180529225901.GA30464@beast>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Pramod Kumar <pramod.kumar@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, May 29, 2018 at 03:59:01PM -0700, Kees Cook wrote:
> In the quest to remove all stack VLA usage from the kernel[1], this
> allocates the values buffer during the callback instead of putting it
> on the stack.
> 
> [1] https://lkml.kernel.org/r/CA+55aFzCG-zNmZwX4A2FQpadafLfEzK6CC=qPXydAacU1RqZWA@mail.gmail.com
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/net/phy/mdio-mux-gpio.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/phy/mdio-mux-gpio.c b/drivers/net/phy/mdio-mux-gpio.c
> index 082ffef0dec4..e99994f4ed50 100644
> --- a/drivers/net/phy/mdio-mux-gpio.c
> +++ b/drivers/net/phy/mdio-mux-gpio.c
> @@ -26,18 +26,23 @@ static int mdio_mux_gpio_switch_fn(int current_child, int desired_child,
>  				   void *data)
>  {
>  	struct mdio_mux_gpio_state *s = data;
> -	int values[s->gpios->ndescs];
> +	int *values;
>  	unsigned int n;
>  
>  	if (current_child == desired_child)
>  		return 0;
>  
> +	values = kmalloc_array(s->gpios->ndescs, sizeof(*values), GFP_KERNEL);
> +	if (!values)
> +		return -ENOMEM;
> +
>  	for (n = 0; n < s->gpios->ndescs; n++)
>  		values[n] = (desired_child >> n) & 1;
>  
>  	gpiod_set_array_value_cansleep(s->gpios->ndescs, s->gpios->desc,
>  				       values);
>  
> +	kfree(values);
>  	return 0;
>  }

Hi Kees

This is the 'hot path' for this driver, and you are making it more
expensive. 

Please allocate the memory once in mdio_mux_gpio_probe and make it
part of mdio_mux_gpio_state.

	Thanks
		Andrew
