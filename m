From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/1] gpio: gpio-altera: Remove gpiochip on probe failure.
Date: Wed, 27 Jan 2016 10:50:17 +0100
Message-ID: <CACRpkdaONPbiTRgTGJRBm0vxV6XM-HBez3Mm+fkKK671gFmnGA@mail.gmail.com>
References: <1452828742-57299-1-git-send-email-preid@electromag.com.au>
	<1452828742-57299-2-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:36487 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754241AbcA0JuT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2016 04:50:19 -0500
Received: by mail-ob0-f170.google.com with SMTP id ba1so2705455obb.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2016 01:50:17 -0800 (PST)
In-Reply-To: <1452828742-57299-2-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Tien Hock Loh <thloh@altera.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jan 15, 2016 at 4:32 AM, Phil Reid <preid@electromag.com.au> wrote:

> On failure to setup the irq altera_gpio_probe would return an error
> but not call altera_gpio_probe. This resulted in kernel fault
> "Unable to handle kernel paging request at virtual address xxxxxxxx"
> later on in of_gpiochip_find_and_xlate.
>
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Fixed up commit message and patch applied.

Yours,
Linus Walleij
