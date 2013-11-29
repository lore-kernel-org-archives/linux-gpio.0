From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add GPIO support for SMSC SCH311x
Date: Fri, 29 Nov 2013 21:00:06 +0100
Message-ID: <CACRpkdYoA3JfDMXfE6VVsyYVAETR=zqru5FGeRkvBOanTDEA7g@mail.gmail.com>
References: <1385597895-26418-1-git-send-email-br1@einfach.org>
	<CACRpkdaXO+tYRq=uyQiAopRDPwKv1_F4yZwCWr4-JL1xnio4Wg@mail.gmail.com>
	<5298CD1C.9010704@einfach.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:40873 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752597Ab3K2UAH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Nov 2013 15:00:07 -0500
Received: by mail-ob0-f176.google.com with SMTP id va2so10433119obc.35
        for <linux-gpio@vger.kernel.org>; Fri, 29 Nov 2013 12:00:06 -0800 (PST)
In-Reply-To: <5298CD1C.9010704@einfach.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bruno Randolf <br1@einfach.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Simon Guinot <simon.guinot@sequanux.org>, Wim Van Sebroeck <wim@iguana.be>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Nov 29, 2013 at 6:21 PM, Bruno Randolf <br1@einfach.org> wrote:
> [Me]

>> ISA-style probing, yeah I had to accept this last time ...
>> So no discovery on this system, no ACPI?
>
> The system has ACPI, but GPIOs were not working... I don't know enough
> about ACPI, but if someone tells me what to look for I can try to debug it.

Yeah :-/

I don't know how you do the driver/board split in x86 so
please enlighten me.

>> Please devm_kzalloc() a state container
>> instead, look in other GPIO drivers for examples of this.
>
> Do you have a good example?

Most new drivers ..
gpio-intel-mid.c
gpio-tb10x.c
gpio-em.c

>> So if you really only support push/pull, open drain and maybe even
>> open source, then it's OK to use the GPIO subsystem. If you start
>> doing more things, this becomes a matter of pin control.
>
> It can just be configured as just push/pull or open drain. Is there any
> way this can be configured within the GPIO subsystem?

Yeah that's OK. grep for GPIOF_OPEN_DRAIN,
GPIOF_OPEN_SOURCE.

Yours,
Linus Walleij
