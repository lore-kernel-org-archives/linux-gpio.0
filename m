From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Add GPIO support for the ACCES 104-IDI-48
Date: Tue, 1 Dec 2015 09:57:27 +0100
Message-ID: <CACRpkda7QAKB=7W6rVA8fh873wTy9wm=8ta+mKZmuP2Sj7rCHA@mail.gmail.com>
References: <20151123175450.GA16041@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:35281 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755343AbbLAI52 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2015 03:57:28 -0500
Received: by obbnk6 with SMTP id nk6so149590876obb.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2015 00:57:27 -0800 (PST)
In-Reply-To: <20151123175450.GA16041@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Nov 23, 2015 at 6:54 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES 104-IDI-48 family of PC/104 utility boards feature 48
> individually optically isolated digital inputs. Enabled inputs feature
> change-of-state detection capability; if change-of-state detection is
> enabled, an interrupt is fired off if a change of input level
> (low-to-high or high-to-low) is detected. Change-of-state IRQs are
> enabled/disabled on 8-bit boundaries, for a total of six boundaries.
>
> This driver provides GPIO and IRQ support for these 48 channels of
> digital input. The base port address for the device may be configured
> via the idi_48_base module parameter. The interrupt line number for the
> device may be configured via the idi_48_irq module parameter.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

This is a very nice and clean written driver.

Patch applied.

Yours,
Linus Walleij
