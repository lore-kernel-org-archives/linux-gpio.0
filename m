From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] pinctrl: tb10x: Use flexible-array member and
 struct_size() helper
Date: Thu, 6 Jun 2019 13:55:02 -0700
Message-ID: <201906061354.CA1265C75E@keescook>
References: <20190606151232.GA20105@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190606151232.GA20105@embeddedor>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 06, 2019 at 10:12:32AM -0500, Gustavo A. R. Silva wrote:
> Update the code to use a flexible array member instead of a pointer in
> structure i2c_mux_pinctrl and use the struct_size() helper:
> 
> struct tb10x_pinctrl {
>         ...
> 	struct tb10x_of_pinfunc pinfuncs[];
> };
> 
> Also, make use of the struct_size() helper instead of an open-coded
> version in order to avoid any potential type mistakes, in particular
> in the context in which this code is being used.
> 
> So, replace the following form:
> 
> sizeof(struct tb10x_pinctrl) + of_get_child_count(of_node) * sizeof(struct tb10x_of_pinfunc)
> 
> with:
> 
> struct_size(state, pinfuncs, of_get_child_count(of_node))
> 
> This code was detected with the help of Coccinelle.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/pinctrl/pinctrl-tb10x.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
> index 2e90a6d8fb3b..a32badf3f118 100644
> --- a/drivers/pinctrl/pinctrl-tb10x.c
> +++ b/drivers/pinctrl/pinctrl-tb10x.c
> @@ -483,22 +483,22 @@ struct tb10x_port {
>   * @base: register set base address.
>   * @pingroups: pointer to an array of the pin groups this driver manages.
>   * @pinfuncgrpcnt: number of pingroups in @pingroups.
> - * @pinfuncs: pointer to an array of pin functions this driver manages.
>   * @pinfuncnt: number of pin functions in @pinfuncs.
>   * @mutex: mutex for exclusive access to a pin controller's state.
>   * @ports: current state of each port.
>   * @gpios: Indicates if a given pin is currently used as GPIO (1) or not (0).
> + * @pinfuncs: flexible array of pin functions this driver manages.
>   */
>  struct tb10x_pinctrl {
>  	struct pinctrl_dev *pctl;
>  	void *base;
>  	const struct tb10x_pinfuncgrp *pingroups;
>  	unsigned int pinfuncgrpcnt;
> -	struct tb10x_of_pinfunc *pinfuncs;
>  	unsigned int pinfuncnt;
>  	struct mutex mutex;
>  	struct tb10x_port ports[TB10X_PORTS];
>  	DECLARE_BITMAP(gpios, MAX_PIN + 1);
> +	struct tb10x_of_pinfunc pinfuncs[];
>  };
>  
>  static inline void tb10x_pinctrl_set_config(struct tb10x_pinctrl *state,
> @@ -771,15 +771,13 @@ static int tb10x_pinctrl_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  	}
>  
> -	state = devm_kzalloc(dev, sizeof(struct tb10x_pinctrl) +
> -					of_get_child_count(of_node)
> -					* sizeof(struct tb10x_of_pinfunc),
> -				GFP_KERNEL);
> +	state = devm_kzalloc(dev, struct_size(state, pinfuncs,
> +					      of_get_child_count(of_node)),
> +			     GFP_KERNEL);
>  	if (!state)
>  		return -ENOMEM;
>  
>  	platform_set_drvdata(pdev, state);
> -	state->pinfuncs = (struct tb10x_of_pinfunc *)(state + 1);
>  	mutex_init(&state->mutex);
>  
>  	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -- 
> 2.21.0
> 

-- 
Kees Cook
