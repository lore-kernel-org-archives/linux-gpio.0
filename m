From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH RFT 5/5] pinctrl: replace trivial implementations of
 gpio_chip request/free
Date: Sun, 13 Sep 2015 12:07:30 -0700
Message-ID: <20150913190730.GG13472@usrtlx11787.corpusers.net>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
 <1442150498-31116-6-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([37.139.156.2]:14528 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753866AbbIMTHj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Sun, 13 Sep 2015 15:07:39 -0400
Content-Disposition: inline
In-Reply-To: <1442150498-31116-6-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jonas Aaberg <jonas.aberg@stericsson.com>, Baruch Siach <baruc>

On Sun 13 Sep 06:21 PDT 2015, Jonas Gorski wrote:

> Replace all trivial request/free callbacks that do nothing but call into
> pinctrl code with the generic versions.
> 
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>

[..]

> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 492cdd5..1d3dcb4 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -458,18 +458,6 @@ static void msm_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
>  	spin_unlock_irqrestore(&pctrl->lock, flags);
>  }
>  
> -static int msm_gpio_request(struct gpio_chip *chip, unsigned offset)
> -{
> -	int gpio = chip->base + offset;
> -	return pinctrl_request_gpio(gpio);
> -}
> -
> -static void msm_gpio_free(struct gpio_chip *chip, unsigned offset)
> -{
> -	int gpio = chip->base + offset;
> -	return pinctrl_free_gpio(gpio);
> -}
> -
>  #ifdef CONFIG_DEBUG_FS
>  #include <linux/seq_file.h>
>  
> @@ -527,8 +515,8 @@ static struct gpio_chip msm_gpio_template = {
>  	.direction_output = msm_gpio_direction_output,
>  	.get              = msm_gpio_get,
>  	.set              = msm_gpio_set,
> -	.request          = msm_gpio_request,
> -	.free             = msm_gpio_free,
> +	.request          = gpiochip_generic_request,
> +	.free             = gpiochip_generic_free,
>  	.dbg_show         = msm_gpio_dbg_show,
>  };
>  

For the msm-part:

Acked-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Regards,
Bjorn
