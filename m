From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 4/5] pinctrl: cherryview: prevent concurrent access to
 GPIO controllers
Date: Mon, 6 Jun 2016 13:31:24 +0300
Message-ID: <20160606103124.GV1743@lahna.fi.intel.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
 <1464904543-4094-5-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:47707 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751039AbcFFKb2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 6 Jun 2016 06:31:28 -0400
Content-Disposition: inline
In-Reply-To: <1464904543-4094-5-git-send-email-dan@emutex.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan O'Donovan <dan@emutex.com>
Cc: linus.walleij@linaro.org, heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org

On Thu, Jun 02, 2016 at 10:55:42PM +0100, Dan O'Donovan wrote:
> Due to a silicon issue on the Atom X5-Z8000 "Cherry Trail" processor
> series, a common lock must be used to prevent concurrent accesses
> across the 4 GPIO controllers managed by this driver.
> 
> See Intel Atom Z8000 Processor Series Specification Update
> (Rev. 005), errata #CHT34, for further information.
> 
> Signed-off-by: Dan O'Donovan <dan@emutex.com>

This should be the first patch in the series. It should also be tagged
for stable.

> ---
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 84 ++++++++++++++++--------------
>  1 file changed, 46 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index 7df4b40..5064f93 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -160,7 +160,6 @@ struct chv_pin_context {
>   * @pctldev: Pointer to the pin controller device
>   * @chip: GPIO chip in this pin controller
>   * @regs: MMIO registers
> - * @lock: Lock to serialize register accesses
>   * @intr_lines: Stores mapping between 16 HW interrupt wires and GPIO
>   *		offset (in GPIO number space)
>   * @community: Community this pinctrl instance represents
> @@ -174,7 +173,6 @@ struct chv_pinctrl {
>  	struct pinctrl_dev *pctldev;
>  	struct gpio_chip chip;
>  	void __iomem *regs;
> -	raw_spinlock_t lock;
>  	unsigned int intr_lines[16];
>  	const struct chv_community *community;
>  	u32 saved_intmask;
> @@ -659,6 +657,17 @@ static const struct chv_community *chv_communities[] = {
>  	&southeast_community,
>  };
>  
> +/*
> + * Lock to serialize register accesses
> + *
> + * Due to a silicon issue, a shared lock must be used to prevent
> + * concurrent accesses across the 4 GPIO controllers.
> + *
> + * See Intel Atom Z8000 Processor Series Specification Update (Rev. 005),
> + * errata #CHT34, for further information.
> + */
> +static DEFINE_RAW_SPINLOCK(chv_reg_lock);

Can we call it chv_lock instead?
