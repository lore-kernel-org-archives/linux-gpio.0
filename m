From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [RFC v1 4/9] gpio: davinci: make IRQ initialization soc specific
Date: Fri, 29 Nov 2013 11:20:18 -0500
Message-ID: <5298BEC2.2060808@ti.com>
References: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com> <1385494815-15740-5-git-send-email-grygorii.strashko@ti.com> <CACRpkda+Gdp75Kw=n4y=yeZAdWxjpsdP8egtLNaQV0vDCXOkWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:39358 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751202Ab3K2QUW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 11:20:22 -0500
In-Reply-To: <CACRpkda+Gdp75Kw=n4y=yeZAdWxjpsdP8egtLNaQV0vDCXOkWQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Nori, Sekhar" <nsekhar@ti.com>, Prabhakar Lad <prabhakar.csengg@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>

On Friday 29 November 2013 04:21 AM, Linus Walleij wrote:
> On Tue, Nov 26, 2013 at 8:40 PM, Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
> 
>> The Davinci GPIO IRQs initialization may need to be performed in a
>> different way depending on SoC which use it. For example:
>> - Davinci dm365 has AINTC irq controller, implemented using Generic IRQ
>> chip, SPARSE_IRQ off;
>> - Davinci da850 has cp-intc controller, implemented using IRQ chip;
>> SPARSE_IRQ off;
>> - Kestone has arm-gic controller, implemented using IRQ chip;
>> SPARSE_IRQ on;
> 
> Now this is a pretty big patch ...
> 
> The big question that enters my mind is *why* is the da850 and
> dm365 not using SPARSE_IRQ?
> 
> As it happens I'm on an ARM32 crusade to get everyone and its
> dog to use, among other things, SPARSE_IRQ.
> 
> I would feel *much* *much* better if there was first a patch
> to the DaVinci tree to turn on SPARSE_IRQ for this subarch,
> and then this patch may look a bit different, maybe smaller
> I take it?
> 
> Is this totally unattainable?
> 
Probably Sekhar can comment but as such the GPIO driver should
work with and without SPARSE_IRQ and thats doable.

> Hence, introduce SoC specific initialization data
> struct davinci_gpio_init_data {
> 	int (*unbanked_irq_init)(struct platform_device *pdev);
> 	int (*banked_irq_init)(struct platform_device *pdev);
> };
> which can be selected using "compatibility" property in case of DT-boot
> and update code accordingly by splitting IRQ initialization code to
> banked and unbanked IRQs initialization functions.
> 
> Select Davinci specific initialization data by default for non-DT boot
> case.
> 
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
NAK. Lets drop this approach. Its easier to manage the
banked vs unbaked based on compatible as discussed over irc

Regards,
Santosh


