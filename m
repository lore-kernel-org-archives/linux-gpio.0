From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] mdio-mux-gpio: Remove VLA usage
Date: Tue, 29 May 2018 16:19:02 -0700
Message-ID: <56a8f4d988151f94950b355dba6ab83b5dfdb9c2.camel@perches.com>
References: <20180529225901.GA30464@beast>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180529225901.GA30464@beast>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Pramod Kumar <pramod.kumar@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, 2018-05-29 at 15:59 -0700, Kees Cook wrote:
> In the quest to remove all stack VLA usage from the kernel[1], this
> allocates the values buffer during the callback instead of putting it
> on the stack.
> 
> [1] https://lkml.kernel.org/r/CA+55aFzCG-zNmZwX4A2FQpadafLfEzK6CC=qPXydAacU1RqZWA@mail.gmail.com
[]
> diff --git a/drivers/net/phy/mdio-mux-gpio.c b/drivers/net/phy/mdio-mux-gpio.c
[]
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

This function previously only returned 0
and now it can return -ENOMEM.

How do you know all the indirect callers
via the switch_fn stored in mdio_mux_init
can handle the new return value?

If you have explored these code paths, it
would be good to explain that in the commit
message.
