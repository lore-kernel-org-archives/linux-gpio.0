From: Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2] gpio: em: lock IRQs when starting them
Date: Wed, 27 Nov 2013 16:33:41 +0900
Message-ID: <CANqRtoRf6eyahaSvPEVNV6LOOSpSUOx=UhgjhrfrXaqPLJe3og@mail.gmail.com>
References: <1385460978-4122-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:49274 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752813Ab3K0Hdn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2013 02:33:43 -0500
Received: by mail-lb0-f172.google.com with SMTP id z5so5227215lbh.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2013 23:33:41 -0800 (PST)
In-Reply-To: <1385460978-4122-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, Magnus Damm <damm@opensource.se>, Ian Molton <ian.molton@codethink.co.uk>, Simon Horman <horms+renesas@verge.net.au>, Alexandre Courbot <acourbot@nvidia.com>

Hi Linus,

On Tue, Nov 26, 2013 at 7:16 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> This uses the new API for tagging GPIO lines as in use by
> IRQs. This enforces a few semantic checks on how the underlying
> GPIO line is used.
>
> Also assign the gpio_chip.dev pointer to be used for error
> messages.
>
> Cc: Magnus Damm <damm@opensource.se>
> Cc: Ian Molton <ian.molton@codethink.co.uk>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Satisfy implicit semantics by calling .enable and .disable
>   callbacks in the startup/shutdown callbacks.

I've tested this briefly on my KZM9D board and all is fine. I still
seem to be able to use the on-board ethernet controller with
interrupts via the GPIO driver.

Acked-by: Magnus Damm <damm@opensource.se>

Thanks for your help!

Cheers,

/ magnus
