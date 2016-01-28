From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5] gpio: Add GPIO support for the WinSystems WS16C48
Date: Thu, 28 Jan 2016 09:47:43 +0100
Message-ID: <CACRpkdaMchsc9E-8JTMoKR6cFP9WEBTUrkPiQxqyrkGHXp-xWg@mail.gmail.com>
References: <20160120184533.GA16632@sophia>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:36191 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965351AbcA1Iro (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Jan 2016 03:47:44 -0500
Received: by mail-ob0-f169.google.com with SMTP id ba1so30049555obb.3
        for <linux-gpio@vger.kernel.org>; Thu, 28 Jan 2016 00:47:43 -0800 (PST)
In-Reply-To: <20160120184533.GA16632@sophia>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jan 20, 2016 at 7:45 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The WinSystems WS16C48 device provides 48 lines of digital I/O. In
> addition, the first 24 lines may be used for interrupt-handled edge
> detection; rising edge detection and falling edge detection are
> supported.
>
> This driver provides GPIO and IRQ support for these 48 channels of
> digital I/O. The base port address for the device may be configured via
> the ws16c48_base module parameter. The interrupt line number for the
> device may be configured via the ws16c48_irq module parameter.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>
> ---
> Changes in v5:
>   - Allow sharing the IRQ

Patch applied.

Out of curiosity: what is your usecase for all these exotic
GPIO cards?

Yours,
Linus Walleij
