From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 3/8] gpio: omap: convert debounce functions switch to use
 gpio offset
Date: Fri, 20 Mar 2015 19:44:16 +0100
Message-ID: <CABxcv==6ht31oAcFiwa14LfQ7BPM87HYBWw8bOJbygOmA7TFFw@mail.gmail.com>
References: <1426785944-17255-1-git-send-email-grygorii.strashko@linaro.org>
	<1426785944-17255-4-git-send-email-grygorii.strashko@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:34243 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751033AbbCTSoR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Mar 2015 14:44:17 -0400
Received: by wibg7 with SMTP id g7so890111wib.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2015 11:44:16 -0700 (PDT)
In-Reply-To: <1426785944-17255-4-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: grygorii.strashko@linaro.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>, Tony Lindgren <tony@atomide.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, Linux GPIO List <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Thu, Mar 19, 2015 at 6:25 PM,  <grygorii.strashko@linaro.org> wrote:
> From: Grygorii Strashko <grygorii.strashko@linaro.org>
>
> Convert debounce functions to use GPIO offset instead of system
> GPIO numbers. This allows to drop unneeded conversations between
> system GPIO <-> GPIO offset which are done in many places and
> many times.
> It is safe to do now because:
> - gpiolib always passes GPIO offset to GPIO controller
> - OMAP GPIO driver converted to use IRQ domain
>
> This is preparation step before removing:
>  #define GPIO_INDEX(bank, gpio)
>  #define GPIO_BIT(bank, gpio)
>  int omap_irq_to_gpio()
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>
> ---

Acked-by: Javier Martinez Canillas <javier@dowhile0.org>
