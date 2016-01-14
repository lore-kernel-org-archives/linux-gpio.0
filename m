From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] USB: serial: cp210x: Adding GPIO support for CP2105
Date: Thu, 14 Jan 2016 10:28:29 +0100
Message-ID: <CACRpkdZvURbQEGujkUn8TO+11F+nQGk-bW8iUScr9HjAdxFJoA@mail.gmail.com>
References: <1452688237-30385-1-git-send-email-martyn.welch@collabora.co.uk>
	<BLUPR0701MB1572CDBC6E43EA82429B723491CC0@BLUPR0701MB1572.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:35559 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752885AbcANJ2a (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Jan 2016 04:28:30 -0500
Received: by mail-ob0-f173.google.com with SMTP id py5so110571516obc.2
        for <linux-gpio@vger.kernel.org>; Thu, 14 Jan 2016 01:28:30 -0800 (PST)
In-Reply-To: <BLUPR0701MB1572CDBC6E43EA82429B723491CC0@BLUPR0701MB1572.namprd07.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Konstantin Shkolnyy <Konstantin.Shkolnyy@silabs.com>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Jan 14, 2016 at 1:27 AM, Konstantin Shkolnyy
<Konstantin.Shkolnyy@silabs.com> wrote:

>> +#include <linux/gpio/driver.h>
>> +#include <linux/bitops.h>
>
> Enclose this in CONFIG_GPIOLIB?

Do not advise people to add excess #ifdef:s please. See at the end of:
Documentation/CodingStyle

Yours,
Linus Walleij
