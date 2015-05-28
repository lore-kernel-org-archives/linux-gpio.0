From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] pinctrl: fix confusing debug message in
 pinctrl_register_map()
Date: Thu, 28 May 2015 11:30:09 -0700
Message-ID: <1432837809.1556.3.camel@perches.com>
References: <1432817579-4720-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432817579-4720-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, 2015-05-28 at 21:52 +0900, Masahiro Yamada wrote:
> There are two types for pinctrl maps: pinmux and pinconfig
> This debug message shows the number of maps of both types.
> The string "pinmux map" is not precise.  Let's say "pinctrl map"
> instead.
[]
> diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
[]
> @@ -1115,7 +1115,7 @@ int pinctrl_register_map(struct pinctrl_map const *maps, unsigned num_maps,
>  	int i, ret;
>  	struct pinctrl_maps *maps_node;
>  
> -	pr_debug("add %d pinmux maps\n", num_maps);
> +	pr_debug("add %d pinctrl maps\n", num_maps);

You might want to fix the %d/%u mismatch too
