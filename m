From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/5] pinctrl: pinmux: Return selector to the pinctrl driver
Date: Sun, 17 Jun 2018 19:51:17 +0300
Message-ID: <CAHp75Ve4BYRbFsJRiwA2D-gJzVBj7JD2dfGhHSP3NDYwhAQyMg@mail.gmail.com>
References: <20180615111141.37184-1-tony@atomide.com> <20180615111141.37184-3-tony@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180615111141.37184-3-tony@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Haojian Zhuang <haojian.zhuang@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Paul Cercueil <paul@crapouillou.net>, sean.wang@mediatek.com
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 15, 2018 at 2:15 PM Tony Lindgren <tony@atomide.com> wrote:
>
> We must return the selector from pinmux_generic_add_function() so
> pin controller device drivers can remove the right group if needed
> for deferred probe for example.
>
> Note that fixes are also needed for the pin controller drivers to
> use the selector value.
>
> Fixes: a76edc89b100 ("pinctrl: core: Add generic pinctrl functions for
> managing groups")
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
> Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/pinctrl/pinmux.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
> --- a/drivers/pinctrl/pinmux.c
> +++ b/drivers/pinctrl/pinmux.c
> @@ -775,6 +775,7 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
>                                 void *data)
>  {
>         struct function_desc *function;
> +       int selector = pctldev->num_functions;
>
>         function = devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
>         if (!function)
> @@ -785,12 +786,12 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
>         function->num_group_names = num_groups;
>         function->data = data;
>
> -       radix_tree_insert(&pctldev->pin_function_tree, pctldev->num_functions,
> +       radix_tree_insert(&pctldev->pin_function_tree, selector,
>                           function);

Same nit: One line now?

>

>         pctldev->num_functions++;
>
> -       return 0;
> +       return selector;
>  }
>  EXPORT_SYMBOL_GPL(pinmux_generic_add_function);
>
> --
> 2.17.1



-- 
With Best Regards,
Andy Shevchenko
