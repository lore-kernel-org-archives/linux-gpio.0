From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: merrifield: fix dup size in probe
Date: Wed, 31 Aug 2016 16:54:49 +0300
Message-ID: <1472651689.4887.412.camel@linux.intel.com>
References: <1466678976-52598-1-git-send-email-andriy.shevchenko@linux.intel.com>
         <20160831123050.13202-1-vincent.stehle@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160831123050.13202-1-vincent.stehle@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vincent =?ISO-8859-1?Q?Stehl=E9?= <vincent.stehle@intel.com>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, 2016-08-31 at 14:30 +0200, Vincent Stehlé wrote:
> In function mrfld_pinctrl_probe(), when duplicating the mrfld_families
> array the requested memory region length is multiplied once too many
> by the
> number of elements in the original array. Fix this to spare some
> memory.

Good catch!
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

P.S. Linus, perhaps this is material for -rc5.

> 
> Fixes: 4e80c8f505741cbd ("pinctrl: intel: Add Intel Merrifield pin
> controller support")
> Signed-off-by: Vincent Stehlé <vincent.stehle@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/pinctrl/intel/pinctrl-merrifield.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c
> b/drivers/pinctrl/intel/pinctrl-merrifield.c
> index 7fb7656..7826c7f 100644
> --- a/drivers/pinctrl/intel/pinctrl-merrifield.c
> +++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
> @@ -854,7 +854,7 @@ static int mrfld_pinctrl_probe(struct
> platform_device *pdev)
>  	 */
>  	nfamilies = ARRAY_SIZE(mrfld_families),
>  	families = devm_kmemdup(&pdev->dev, mrfld_families,
> -					    nfamilies *
> sizeof(mrfld_families),
> +					    sizeof(mrfld_families),
>  					    GFP_KERNEL);
>  	if (!families)
>  		return -ENOMEM;

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
