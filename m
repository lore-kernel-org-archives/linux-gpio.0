From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Subject: Re: [PATCH] gpio: max732x: Add IRQF_SHARED to irq flags
Date: Wed, 22 Apr 2015 22:53:05 +0300
Message-ID: <5537FC21.9050602@mentor.com>
References: <1429622344-19429-1-git-send-email-semen.protsenko@globallogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:63161 "EHLO
	relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756678AbbDVTxJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Apr 2015 15:53:09 -0400
In-Reply-To: <1429622344-19429-1-git-send-email-semen.protsenko@globallogic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Semen Protsenko <semen.protsenko@globallogic.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Semen,

On 21.04.2015 16:19, Semen Protsenko wrote:
> It's possible that multiple MAX732X can be hooked up to the same
> interrupt line with the processor. So add IRQF_SHARED in requesting irq.
> 
> Signed-off-by: Semen Protsenko <semen.protsenko@globallogic.com>
> ---
>  drivers/gpio/gpio-max732x.c |   10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
> index 0fa4543..55b13d4 100644
> --- a/drivers/gpio/gpio-max732x.c
> +++ b/drivers/gpio/gpio-max732x.c
> @@ -507,12 +507,10 @@ static int max732x_irq_setup(struct max732x_chip *chip,
>  		chip->irq_features = has_irq;
>  		mutex_init(&chip->irq_lock);
>  
> -		ret = devm_request_threaded_irq(&client->dev,
> -					client->irq,
> -					NULL,
> -					max732x_irq_handler,
> -					IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> -					dev_name(&client->dev), chip);
> +		ret = devm_request_threaded_irq(&client->dev, client->irq,
> +				NULL, max732x_irq_handler, IRQF_ONESHOT |
> +				IRQF_TRIGGER_FALLING | IRQF_SHARED,
> +				dev_name(&client->dev), chip);

is it still the case that for shared interrupts a hard IRQ handler is
mandatory to have?

Here I rely on
http://lists.kernelnewbies.org/pipermail/kernelnewbies/2011-March/001118.html

With best wishes,
Vladimir

