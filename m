From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCH v5 1/1] USB: serial: cp210x: Adding GPIO support
 for CP2105
Date: Thu, 11 Aug 2016 13:26:22 +0200
Message-ID: <CACRpkdZNcO2dLSe6g3zJKQ43geNc1rhJt1GSAH=SXE+PEfm8fA@mail.gmail.com>
References: <cover.1469182892.git.martyn.welch@collabora.co.uk> <48345361784d4f2f9b81bf41d34ff17510bd4d80.1469182892.git.martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:35530 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932194AbcHKL0Y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Aug 2016 07:26:24 -0400
Received: by mail-oi0-f48.google.com with SMTP id 4so838288oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 11 Aug 2016 04:26:23 -0700 (PDT)
In-Reply-To: <48345361784d4f2f9b81bf41d34ff17510bd4d80.1469182892.git.martyn.welch@collabora.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Jul 22, 2016 at 12:33 PM, Martyn Welch
<martyn.welch@collabora.co.uk> wrote:

> This patch adds support for the GPIO found on the CP2105. Unlike the GPIO
> provided by some of the other devices supported by the cp210x driver, the
> GPIO on the CP2015 is muxed on pins otherwise used for serial control
> lines. The GPIO have been configured in 2 separate banks as the choice to
> configure the pins for GPIO is made separately for pins shared with each
> of the 2 serial ports this device provides, though the choice is made for
> all pins associated with that port in one go. The choice of whether to use
> the pins for GPIO or serial is made by adding configuration to a one-time
> programable PROM in the chip and can not be changed at runtime. The device
> defaults to GPIO.
>
> This device supports either push-pull or open-drain modes, it doesn't
> provide an explicit input mode, though the state of the GPIO can be read
> when used in open-drain mode. Like with pin use, the mode is configured in
> the one-time programable PROM and can't be changed at runtime.
>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Still stands.

> V2: - Doesn't break build when gpiolib isn't selected.

Nowadays I have changed the kernel so the driver can actually
select GPIOLIB, any arch supports it now.

Yours,
Linus Walleij
