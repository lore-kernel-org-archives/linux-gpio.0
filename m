From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] Drivers: pinctrl: intel fixed typo
Date: Tue, 26 Sep 2017 09:46:53 +0300
Message-ID: <20170926064653.GF4630@lahna.fi.intel.com>
References: <1506364916-21349-1-git-send-email-chrisjohgorman@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:12093 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933842AbdIZGq6 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Sep 2017 02:46:58 -0400
Content-Disposition: inline
In-Reply-To: <1506364916-21349-1-git-send-email-chrisjohgorman@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Gorman <chrisjohgorman@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Sep 25, 2017 at 02:41:56PM -0400, Chris Gorman wrote:
> fixed typo in comment for north_community
> 
> Signed-off-by: Chris Gorman <chrisjohgorman@gmail.com>

Please fix title to be something like "pinctrl: cherryview: Fix typo
in comment". And also in the commit message, start it with capital
letter and end with "." like:

Fixed typo on comment for north_community.

The patch itself looks good.

Thanks!

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
