From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Subject: Re: [RFC 08/18] gpio: add driver for Atheros AR5312 SoC GPIO controller
Date: Tue, 30 Sep 2014 00:18:11 +0400
Message-ID: <CAHNKnsRtzHXmdqDADVqt1hmAriEK5PUEHw4Mak4X9dv1Pw7mRA@mail.gmail.com>
References: <1410723213-22440-1-git-send-email-ryazanov.s.a@gmail.com>
 <1410723213-22440-9-git-send-email-ryazanov.s.a@gmail.com> <CACRpkda2nNqb9iARw+ze=vsdmXVePGu+Fb5PMGo75FSCGJ+tDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yh0-f41.google.com ([209.85.213.41]:62183 "EHLO
	mail-yh0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754663AbaI2USb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Sep 2014 16:18:31 -0400
Received: by mail-yh0-f41.google.com with SMTP id i57so898523yha.14
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2014 13:18:31 -0700 (PDT)
In-Reply-To: <CACRpkda2nNqb9iARw+ze=vsdmXVePGu+Fb5PMGo75FSCGJ+tDA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

2014-09-29 13:03 GMT+04:00 Linus Walleij <linus.walleij@linaro.org>:
> On Sun, Sep 14, 2014 at 9:33 PM, Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:
>
>> Atheros AR5312 SoC have a builtin GPIO controller, which could be accessed
>> via memory mapped registers. This patch adds new driver for them.
>>
>> Signed-off-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Alexandre Courbot <gnurou@gmail.com>
>> Cc: linux-gpio@vger.kernel.org
> (...)
>
>> diff --git a/arch/mips/ar231x/Kconfig b/arch/mips/ar231x/Kconfig
>> diff --git a/arch/mips/ar231x/ar5312.c b/arch/mips/ar231x/ar5312.c
>> diff --git a/arch/mips/include/asm/mach-ar231x/ar5312_regs.h b/arch/mips/include/asm/mach-ar231x/ar5312_regs.h
>
> Please put these MIPS-related changes into a separate patch
> to be handled through the MIPS git tree.
>
Already do that in non RFC patch.

-- 
BR,
Sergey
