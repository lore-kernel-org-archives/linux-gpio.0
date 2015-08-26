From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/7] gpio: omap: fix clk_prepare/unprepare usage
Date: Wed, 26 Aug 2015 09:52:02 +0200
Message-ID: <CACRpkda3aN=SDhJ80=uR_=aDEmpRbHJxQvgedJMApV2=NgG43g@mail.gmail.com>
References: <1439896258-26449-1-git-send-email-grygorii.strashko@ti.com>
	<1439896258-26449-6-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:35740 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751898AbbHZHwE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Aug 2015 03:52:04 -0400
Received: by oiew67 with SMTP id w67so116854423oie.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2015 00:52:02 -0700 (PDT)
In-Reply-To: <1439896258-26449-6-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>, Tony Lindgren <tony@atomide.com>, Javier Martinez Canillas <javier@dowhile0.org>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Aug 18, 2015 at 1:10 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> As per CCF documentation (clk.txt) the clk_prepare/unprepare APIs
> are not allowed in atomic context. But now OMAP GPIO driver
> uses them while applying debounce settings and as part
> of PM runtime irqsafe operations:
>
> - omap_gpio_debounce() is holding the lock with IRQs off.
>   + omap2_set_gpio_debounce()
>    + clk_prepare_enable()
>     + clk_prepare() this one might sleep.
>
> - pm_runtime_get_sync() is holding the lock with IRQs off
>   + omap_gpio_runtime_suspend()
>     + raw_spin_lock_irqsave()
>     + omap_gpio_dbck_disable()
>       + clk_disable_unprepare()
>
> Hence, fix it by moeving dbclk prepare/unprepare in OMAP GPIO
> omap_gpio_probe/omap_gpio_remove. Also, while here, ensure that
> debounce functionality is disabled if clk_get() failed,
> because otherwise kernel will carsh in omap2_set_gpio_debounce().
>
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

Patch applied.

Yours,
Linus Walleij
