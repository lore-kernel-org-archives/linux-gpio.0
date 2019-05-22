From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] pinctrl: stmfx: Fix compile issue when CONFIG_OF_GPIO is
 not defined
Date: Tue, 21 May 2019 17:22:50 -0700
Message-ID: <381dcecc-2ca9-c44f-5a83-a293372ecd1e@infradead.org>
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Amelie Delaunay <amelie.delaunay@st.com>, Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, kbuild-all@01.org
List-Id: linux-gpio@vger.kernel.org

On 5/20/19 12:52 AM, Amelie Delaunay wrote:
> When CONFIG_GPIO_OF is not defined, struct gpio_chip 'of_node' member does
> not exist:
> drivers/pinctrl/pinctrl-stmfx.c: In function 'stmfx_pinctrl_probe':
> drivers/pinctrl/pinctrl-stmfx.c:652:17: error: 'struct gpio_chip' has no member named 'of_node'
>      pctl->gpio_chip.of_node = np;
> 
> Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO driver")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>

This is good as far as it goes, but I am also seeing a build error in
pinctrl-stmfx.c when CONFIG_OF is not set/enabled (randconfig):

../drivers/pinctrl/pinctrl-stmfx.c:409:20: error: ‘pinconf_generic_dt_node_to_map_pin’ undeclared here (not in a function)
  .dt_node_to_map = pinconf_generic_dt_node_to_map_pin,
                    ^

> ---
>  drivers/pinctrl/pinctrl-stmfx.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index eba872c..bb64aa0 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -648,7 +648,9 @@ static int stmfx_pinctrl_probe(struct platform_device *pdev)
>  	pctl->gpio_chip.base = -1;
>  	pctl->gpio_chip.ngpio = pctl->pctl_desc.npins;
>  	pctl->gpio_chip.can_sleep = true;
> +#ifdef CONFIG_OF_GPIO
>  	pctl->gpio_chip.of_node = np;
> +#endif
>  	pctl->gpio_chip.need_valid_mask = true;
>  
>  	ret = devm_gpiochip_add_data(pctl->dev, &pctl->gpio_chip, pctl);
> 


-- 
~Randy
