From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 030/182] gpio: lpc18xx: use gpiochip data pointer
Date: Tue, 15 Dec 2015 13:58:56 +0100
Message-ID: <CACRpkdZ1Lg+BH6bBRhy=T-wxknP3L8q4p3DLz_hmhfux3VyUzQ@mail.gmail.com>
References: <1449667013-31170-1-git-send-email-linus.walleij@linaro.org>
	<CAGhQ9VweDMhwTPWrjz6zfhaJqh_McWDMrsyZawQB_LF9RvoumA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:34366 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932283AbbLOM65 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2015 07:58:57 -0500
Received: by mail-ob0-f171.google.com with SMTP id iw8so5580490obc.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2015 04:58:57 -0800 (PST)
In-Reply-To: <CAGhQ9VweDMhwTPWrjz6zfhaJqh_McWDMrsyZawQB_LF9RvoumA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

On Sun, Dec 13, 2015 at 1:49 PM, Joachim  Eastwood <manabian@gmail.com> wrote:
> On 9 December 2015 at 14:16, Linus Walleij <linus.walleij@linaro.org> wrote:

> Acked-by: Joachim Eastwood <manabian@gmail.com>

Thx.

>> Joachim: this driver looks very simplistic, it seems it can
>> be totally replaced with drivers/gpio/gpio-generic.c provided
>> that some (optional) clock handling is added to the generic GPIO
>> driver, if you have some time, please look into that.
>
> I don't think gpio-generic supports one big gpio namespace of 256
> gpios which this driver uses.

No just 8, 16 or 32 simple registers, OK. (Maybe we could make
it more generic but it seems like overkill.)

Yours,
Linus Walleij
