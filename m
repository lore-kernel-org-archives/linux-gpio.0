From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4] ARM/serial: at91: switch atmel serial to use gpiolib
Date: Wed, 8 Jan 2014 13:42:09 +0100
Message-ID: <CACRpkdb2GvHAa9kF5KXWMiTDnyepziGmjqrCcgB1B7e0iHVKXA@mail.gmail.com>
References: <1383816355-2956-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:45962 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756086AbaAHMmK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 8 Jan 2014 07:42:10 -0500
Received: by mail-oa0-f46.google.com with SMTP id l6so1696642oag.33
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jan 2014 04:42:10 -0800 (PST)
In-Reply-To: <1383816355-2956-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andrew Victor <linux@maxim.org.za>, Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Jakub Pavelek <jakub.pavelek@linaro.org>

On Thu, Nov 7, 2013 at 10:25 AM, Linus Walleij <linus.walleij@linaro.org> wrote:

> This passes the errata fix using a GPIO to control the RTS pin
> on one of the AT91 chips to use gpiolib instead of the
> AT91-specific interfaces. Also remove the reliance on
> compile-time #defines and the cpu_* check and rely on the
> platform passing down the proper GPIO pin through platform
> data.
>
> This is a prerequisite for getting rid of the local GPIO
> implementation in the AT91 platform and move toward
> multiplatform.
>
> The patch also adds device tree support for getting the
> RTS GPIO pin from the device tree on DT boot paths.
>
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v3->v4:

Hi Nicolas, I don't see this patch in linux-next, where did it
get stuck? Something I can help with? Greg has ACKed it
and all I think ...

Yours,
Linus Walleij
