From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH 2/2] pinctrl: digicolor: convert null test to IS_ERR test
Date: Tue, 25 Aug 2015 07:33:48 +0300
Message-ID: <20150825043348.GX2619@sapphire.tkos.co.il>
References: <1440450747-10080-1-git-send-email-Julia.Lawall@lip6.fr>
 <1440450747-10080-3-git-send-email-Julia.Lawall@lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1440450747-10080-3-git-send-email-Julia.Lawall@lip6.fr>
Sender: kernel-janitors-owner@vger.kernel.org
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Julia,

On Mon, Aug 24, 2015 at 11:12:27PM +0200, Julia Lawall wrote:
> Since commit 323de9efdf3e ("pinctrl: make pinctrl_register() return proper
> error code"), pinctrl_register returns an error code rather than NULL on
> failure.  Update a driver that was introduced more recently.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression e,e1,e2;
> @@
> 
> e = pinctrl_register(...)
> ... when != e = e1
> if (
> -   e == NULL
> +   IS_ERR(e)
>    ) {
>      ...
>      return
> -      e2
> +      PTR_ERR(e)
>      ;
>      }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

>  drivers/pinctrl/pinctrl-digicolor.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-digicolor.c b/drivers/pinctrl/pinctrl-digicolor.c
> index 461fffc..11f8b83 100644
> --- a/drivers/pinctrl/pinctrl-digicolor.c
> +++ b/drivers/pinctrl/pinctrl-digicolor.c
> @@ -337,9 +337,9 @@ static int dc_pinctrl_probe(struct platform_device *pdev)
>  	pmap->dev = &pdev->dev;
>  
>  	pmap->pctl = pinctrl_register(pctl_desc, &pdev->dev, pmap);
> -	if (!pmap->pctl) {
> +	if (IS_ERR(pmap->pctl)) {
>  		dev_err(&pdev->dev, "pinctrl driver registration failed\n");
> -		return -EINVAL;
> +		return PTR_ERR(pmap->pctl);
>  	}
>  
>  	ret = dc_gpiochip_add(pmap, pdev->dev.of_node);

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
