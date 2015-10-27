From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v10] gpio: Add GPIO support for the ACCES 104-IDIO-16
Date: Tue, 27 Oct 2015 11:06:58 +0100
Message-ID: <CACRpkdbQyed0S0Y6MSt35LuOekFprvbPMDpsGku-cBXBt=9j0Q@mail.gmail.com>
References: <20151019165914.GA22867@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:33065 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751646AbbJ0KG6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 Oct 2015 06:06:58 -0400
Received: by obbwb3 with SMTP id wb3so166592114obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2015 03:06:58 -0700 (PDT)
In-Reply-To: <20151019165914.GA22867@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>, Andreas Bofjall <andreas@gazonk.org>, Simon Guinot <simon.guinot@sequanux.org>, =?UTF-8?Q?Diego_Elio_Petten=C3=B2?= <flameeyes@flameeyes.eu>, Mika Westerberg <mika.westerberg@linux.intel.com>, Daniel Krueger <daniel.krueger@systec-electronic.com>, Bruno Randolf <br1@einfach.org>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Oct 19, 2015 at 6:59 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES 104-IDIO-16 family of PC/104 utility boards feature 16
> optically isolated inputs and 16 optically isolated FET solid state
> outputs. This driver provides GPIO support for these 32 channels of
> digital I/O. Change-of-State detection interrupts are not supported.
>
> GPIO 0-15 correspond to digital outputs 0-15, while GPIO 16-31
> correspond to digital inputs 0-15. The base port address for the device
> may be set via the idio_16_base module parameter.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
> Changes in v10:
>   - Rename symbols to be more concise
>   - Allocate GPIO device private data structure in probe function

Yes, exactly like this. :)

Patcha applied for kernel v4.4.

> +menu "ISA GPIO drivers"
> +
> +config GPIO_104_IDIO_16
> +       tristate "ACCES 104-IDIO-16 GPIO support"
> +       depends on X86
> +       help
> +         Enables GPIO support for the ACCES 104-IDIO-16 family.
> +
> +endmenu

I have five other drivers using port-based I/O:

gpio-f7188x.c
gpio-it87.c
gpio-sch.c
gpio-sch311x.c
gpio-ts5500.c

Do you think it makes sense to move all of these in under
the "ISA GPIO drivers" menu as well? I guess they all require
ISA after all.

(Added their maintainers to the To: line so I can get some input
on this.)

Yours,
Linus Walleij
