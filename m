From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/5] pinctrl: rockchip: fix leaked of_node references
Date: Fri, 12 Apr 2019 13:20:06 +0200
Message-ID: <1737000.EArop0DIDs@diego>
References: <201904121645298604058@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201904121645298604058@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: wen.yang99@zte.com.cn
Cc: linux-kernel@vger.kernel.org, wang.yi59@zte.com.cn, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Hi,

Am Freitag, 12. April 2019, 10:45:29 CEST schrieb wen.yang99@zte.com.cn:
> > > The call to of_parse_phandle returns a node pointer with refcount
> > > incremented thus it must be explicitly decremented after the last
> > > usage.
> > >
> > > Detected by coccinelle with the following warnings:
> > > ./drivers/pinctrl/pinctrl-rockchip.c:3221:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 3196, but without a corresponding object release within this function.
> > > ./drivers/pinctrl/pinctrl-rockchip.c:3223:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 3196, but without a corresponding object release within this function.
> > >
> > > Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > Cc: Heiko Stuebner <heiko@sntech.de>
> > > Cc: linux-gpio@vger.kernel.org
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: linux-rockchip@lists.infradead.org
> > > Cc: linux-kernel@vger.kernel.org
> > > ---
> > >  drivers/pinctrl/pinctrl-rockchip.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> > > index 16bf21b..e22d387 100644
> > > --- a/drivers/pinctrl/pinctrl-rockchip.c
> > > +++ b/drivers/pinctrl/pinctrl-rockchip.c
> > > @@ -3195,6 +3195,7 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank,
> > >
> > >          node = of_parse_phandle(bank->of_node->parent,
> > >                      "rockchip,pmu", 0);
> > > +        of_node_put(node);
> > >          if (!node) {
> > >              if (of_address_to_resource(bank->of_node, 1, &res)) {
> > >                  dev_err(info->dev, "cannot find IO resource for bank\n");
> > >
> > 
> > hmm, the conditional does still use the node pointer, so the of_node_put
> > should probably be below the whole if clause?
> 
> Thank you for your comments.
> 
> There may be two methods to fix this issue here.
> Method 1, Add of_node_put after the conditional statement:
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 16bf21b..5f822e6 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3198,12 +3198,15 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank,
>                 if (!node) {
>                         if (of_address_to_resource(bank->of_node, 1, &res)) {
>                                 dev_err(info->dev, "cannot find IO resource for bank\n");
> +                               of_node_put(node);
>                                 return -ENOENT;
>                         }
> 
>                         base = devm_ioremap_resource(info->dev, &res);
> -                       if (IS_ERR(base))
> +                       if (IS_ERR(base)) {
> +                               of_node_put(node);
>                                 return PTR_ERR(base);
> +                       }
>                         rockchip_regmap_config.max_register =
>                                                     resource_size(&res) - 4;
>                         rockchip_regmap_config.name =
> @@ -3212,6 +3215,7 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank,
>                                                     base,
>                                                     &rockchip_regmap_config);
>                 }
> +               of_node_put(node);
>         }
> 
>         bank->irq = irq_of_parse_and_map(bank->of_node, 0)
> 
> Method 2, Add of_node_put before conditional statement:
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 16bf21b..e22d387 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3195,6 +3195,7 @@ static int rockchip_get_bank_data(struct rockchip_pin_bank *bank,
> 
>                 node = of_parse_phandle(bank->of_node->parent,
>                                         "rockchip,pmu", 0);
> +               of_node_put(node);
>                 if (!node) {
>                         if (of_address_to_resource(bank->of_node, 1, &res)) {
>                                 dev_err(info->dev, "cannot find IO resource for bank\n");
> 
> Since we're just determining whether the node pointer is null, and don't need to dereference the node pointer.
> So if we use the Method 2, it might be a little bit simpler.
> Thanks.

personally I prefer to do it cleanly honoring the rules of using of_nodes.

So while your method 2 may make it simpler people possibly editing the
code later then need to remember that the node actually is already put
when it is checked (or possibly even used in some later patch)


Heiko
