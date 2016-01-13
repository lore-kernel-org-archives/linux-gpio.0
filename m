From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: generic: make bgpio_pdata always visible
Date: Wed, 13 Jan 2016 16:01:19 +0100
Message-ID: <CACRpkdZd6sToPvGXtjrXEvoHyARfL9gz=t91Q_Qmawwu5_A8Jw@mail.gmail.com>
References: <21095568.bdP2eOAsBs@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:33349 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755106AbcAMPBU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Jan 2016 10:01:20 -0500
Received: by mail-ob0-f169.google.com with SMTP id is5so56903266obc.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 Jan 2016 07:01:20 -0800 (PST)
In-Reply-To: <21095568.bdP2eOAsBs@wuerfel>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Alexander Shiyan <shc_work@mail.ru>

On Sat, Jan 9, 2016 at 10:16 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> Board files that define their own bgpio_pdata are broken when
> CONFIG_GPIO_GENERIC is disabled and the bgpio_pdata structure
> definition is hidden by the #ifdef:
>
> arch/arm/mach-clps711x/board-autcpu12.c:148:15: error: variable 'autcpu12_mmgpio_pdata' has initializer but incomplete type
>  static struct bgpio_pdata autcpu12_mmgpio_pdata __initdata = {
> arch/arm/mach-clps711x/board-autcpu12.c:149:2: error: unknown field 'base' specified in initializer
>   .base = AUTCPU12_MMGPIO_BASE,
>
> Since the board files should generally not care what drivers are
> enabled, this makes the structure definition visible again.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 0f4630f3720e ("gpio: generic: factor into gpio_chip struct")

Thanks a lot, patch applied!

Yours,
Linus Walleij
