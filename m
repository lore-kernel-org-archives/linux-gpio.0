From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: moxart: fix build regression
Date: Thu, 7 Jan 2016 16:17:16 +0100
Message-ID: <CACRpkdabuSueuTyUH-1VBO883eR_eyh8Kbp0k6SMCrWQf8c+vA@mail.gmail.com>
References: <4110228.QqTjkKaKSX@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:33809 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752062AbcAGPRQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2016 10:17:16 -0500
Received: by mail-ob0-f171.google.com with SMTP id wp13so193676484obc.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2016 07:17:16 -0800 (PST)
In-Reply-To: <4110228.QqTjkKaKSX@wuerfel>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Jan 7, 2016 at 2:55 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> A cleanup patch replaced bgpio_chip with gpio_chip but missed
> two references to the bgpio_chip:
>
> drivers/gpio/gpio-moxart.c:60:19: error: use of undeclared identifier 'bgc'; did you mean 'gc'?
>         gc->bgpio_data = bgc->read_reg(bgc->reg_set);
> drivers/gpio/gpio-moxart.c:35:20: note: 'gc' declared here
> drivers/gpio/gpio-moxart.c:60:33: error: use of undeclared identifier 'bgc'; did you mean 'gc'?
>         gc->bgpio_data = bgc->read_reg(bgc->reg_set);
>
> This adds the missing change.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 0f4630f3720e ("gpio: generic: factor into gpio_chip struct")

Patch applied, sorry for the mess...

Yours,
Linus Walleij
