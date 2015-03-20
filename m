From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [RFT OMAP1 PATCH 7/8] gpio: omap: get rid of omap_irq_to_gpio()
Date: Fri, 20 Mar 2015 19:56:06 +0100
Message-ID: <CABxcv==mH5tpvW0FOsv30A-aucyZCAKuSo95Y=LW21+EWR4uDA@mail.gmail.com>
References: <1426785944-17255-1-git-send-email-grygorii.strashko@linaro.org>
	<1426785944-17255-8-git-send-email-grygorii.strashko@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46]:35518 "EHLO
	mail-wg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751349AbbCTS4I (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Mar 2015 14:56:08 -0400
Received: by wgdm6 with SMTP id m6so96805063wgd.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2015 11:56:06 -0700 (PDT)
In-Reply-To: <1426785944-17255-8-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>, Tony Lindgren <tony@atomide.com>, "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, Linux GPIO List <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hello Grygorii,

On Thu, Mar 19, 2015 at 6:25 PM,  <grygorii.strashko@linaro.org> wrote:
> From: Grygorii Strashko <grygorii.strashko@linaro.org>
>
> Now OMAP GPIO driver prepared for omap_irq_to_gpio() removing.
> Do it ;)
>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>

I don't have access to OMAP1 boards to test but Tony did it o an
osk5912 and Aaro can confirm that it doesn't cause regressions on
other OMAP1 boards.

Thanks a lot for the cleanup.

Acked-by: Javier Martinez Canillas <javier@dowhile0.org>

Best regards,
Javier
