From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: make GPIO_OMAP bool instead of tristate
Date: Fri, 16 Oct 2015 17:08:25 +0200
Message-ID: <CACRpkdahobgJwcaU2L-Fm6pEonjZt9ogUZVD4t_iVmP9M-Nv+A@mail.gmail.com>
References: <1444132871-25798-1-git-send-email-sudipm.mukherjee@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:35185 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751655AbbJPPIZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 11:08:25 -0400
Received: by obbzf10 with SMTP id zf10so92766028obb.2
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 08:08:25 -0700 (PDT)
In-Reply-To: <1444132871-25798-1-git-send-email-sudipm.mukherjee@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Austin Schuh <austin@peloton-tech.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>

On Tue, Oct 6, 2015 at 2:01 PM, Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:

> While building arm allmodconfig the build fails with the error:
> ERROR: "handle_bad_irq" [drivers/gpio/gpio-omap.ko] undefined!
>
> The build breaks as handle_bad_irq is not exported for module use.
>
> Fixes: 450fa54cfd66 ("gpio: omap: convert to use generic irq handler")
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Austin Schuh <austin@peloton-tech.com>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>

Fixed upstream. Dropping this patch.

Yours,
Linus Walleij
