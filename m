From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/7] gpio: omap: fixes and improvements
Date: Wed, 26 Aug 2015 09:53:58 +0200
Message-ID: <CACRpkdZCGJ3JHxPCaiKkMAGZoxFVY7VbkhkJwBJdiP_452KNLg@mail.gmail.com>
References: <1439896258-26449-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:32967 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756236AbbHZHx6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Aug 2015 03:53:58 -0400
Received: by obbhe7 with SMTP id he7so164606740obb.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2015 00:53:58 -0700 (PDT)
In-Reply-To: <1439896258-26449-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@deeprootsystems.com>, Tony Lindgren <tony@atomide.com>, Javier Martinez Canillas <javier@dowhile0.org>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Aug 18, 2015 at 1:10 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> This patch series contains set of trivial fixes and improvements, and also
> patches which fixes wrong APIs usage in atomic context as for -RT as for
> non-RT kernel. The final goal of this series is to make TI OMAP GPIO
> driver compatible with -RT kernel as much as possible.
>
> Patch 1-4: trivial fixes and improvements
> Patch 5: fixes wrong CLK clk_prepare/unprepare APIs usage in atomic contexet

I've applied patches 1-5 with Santosh's ACK and Tony's Tested-by.

> Patch 6(rfc): required to be compatible with -RT kernel, because PM runtime
>  can't be used in atimic context on -RT.
> Patch 7(rfc): This patch converts TI OMAP GPIO driver to use generic irq
>  handler instead of chained IRQ handler. This way OMAP GPIO driver will be
>  compatible with RT kernel where it will be forced thread IRQ handler
>  while in non-RT kernel it still will be executed in HW IRQ context.

Waiting for more feedback here.

Yours,
Linus Walleij
