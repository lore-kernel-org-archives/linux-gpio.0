From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 031/182] gpio: lpc32xx: use gpiochip data pointer
Date: Tue, 15 Dec 2015 14:00:32 +0100
Message-ID: <CACRpkdbFW3VtOOsyyvRwpOhKz_hw1=EB-atrbaKeP-UOOobQ3A@mail.gmail.com>
References: <1449667026-31219-1-git-send-email-linus.walleij@linaro.org>
	<566C87E3.8030602@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:35664 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932283AbbLONAd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2015 08:00:33 -0500
Received: by mail-ob0-f175.google.com with SMTP id 18so5598236obc.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2015 05:00:33 -0800 (PST)
In-Reply-To: <566C87E3.8030602@mleia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Roland Stigge <stigge@antcom.de>

On Sat, Dec 12, 2015 at 9:47 PM, Vladimir Zapolskiy <vz@mleia.com> wrote:

> Acked-by: Vladimir Zapolskiy <vz@mleia.com>

Thx.

>> Roland: this looks like a driver that should move to drivers/pinctrl
>> since it is obviously controlling a lot of pins. Can you confirm?
>
> The platform to which this driver belongs is unmaintained (and broken)
> for more than one year.
>
> If you remember I've recently sent a complete replacement of this
> driver, but not this legacy driver nor mine new one control pin
> functions, there should be another pinctrl driver.

OK sorry that I don't manage to keep everything in my head at the
moment, too much going on at the same time.

Yours.
Linus Walleij
