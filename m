From: Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH] gpio: em: depnd on ARCH_SHMOBILE
Date: Mon, 7 Nov 2016 09:55:29 +0000
Message-ID: <CALeDE9OdN+mjf8i32WctKhU8TUiEo5SH2FCG8e_HSUH_8Eo1+A@mail.gmail.com>
References: <20161106185322.28372-1-pbrobinson@gmail.com> <CACRpkdYC_fSPeJqaCK5ccH8b+4kb1kC8ateXojuYc2RzvW1qVA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:35384 "EHLO
        mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750998AbcKGLhy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 7 Nov 2016 06:37:54 -0500
Received: by mail-wm0-f42.google.com with SMTP id a197so176323681wmd.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Nov 2016 03:37:53 -0800 (PST)
In-Reply-To: <CACRpkdYC_fSPeJqaCK5ccH8b+4kb1kC8ateXojuYc2RzvW1qVA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Nov 7, 2016 at 9:01 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sun, Nov 6, 2016 at 7:53 PM, Peter Robinson <pbrobinson@gmail.com> wrote:
>
>> The GPIO_EM is part of the Renesas SoCs so depend on the arch.
>>
>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>
> What about also enabling COMPILE_TEST?

Happy to, never really know the rule of thumb on COMPILE_TEST, the
decision to enable it always seems somewhat arbitrary (almost like it
should be an option for all drivers when run in that mode as opposed
to explicitly adding an option).

Peter
