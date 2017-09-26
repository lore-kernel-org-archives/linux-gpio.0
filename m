From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview fixed typo in comment
Date: Tue, 26 Sep 2017 19:32:44 +0300
Message-ID: <20170926163244.GS4630@lahna.fi.intel.com>
References: <1506443260-6758-1-git-send-email-chrisjohgorman@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1506443260-6758-1-git-send-email-chrisjohgorman@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chris Gorman <chrisjohgorman@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 26, 2017 at 12:27:40PM -0400, Chris Gorman wrote:
> Fixed typo on comment for north_community.
> 
> Signed-off-by: Chris Gorman <chrisjohgorman@gmail.com>

Looks perfect now,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

> ---
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index 04e929f..8d50eae 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -491,7 +491,7 @@ static const struct chv_community north_community = {
>  	.ngpio_ranges = ARRAY_SIZE(north_gpio_ranges),
>  	.ngpios = ARRAY_SIZE(north_pins),
>  	/*
> -	 * North community can benerate GPIO interrupts only for the first
> +	 * North community can generate GPIO interrupts only for the first
>  	 * 8 interrupts. The upper half (8-15) can only be used to trigger
>  	 * GPEs.
>  	 */
> -- 
> 2.7.4
