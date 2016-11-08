From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: em: depnd on ARCH_SHMOBILE
Date: Tue, 8 Nov 2016 11:18:24 +0100
Message-ID: <CACRpkdZRxAkjWabJDFiq6G7wk9LnR8vYU1ZwnDESRf=premUeQ@mail.gmail.com>
References: <20161106185322.28372-1-pbrobinson@gmail.com> <CACRpkdYC_fSPeJqaCK5ccH8b+4kb1kC8ateXojuYc2RzvW1qVA@mail.gmail.com>
 <CALeDE9OdN+mjf8i32WctKhU8TUiEo5SH2FCG8e_HSUH_8Eo1+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:35916 "EHLO
        mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932140AbcKHK1k (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Nov 2016 05:27:40 -0500
Received: by mail-qk0-f178.google.com with SMTP id n21so99852415qka.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Nov 2016 02:27:39 -0800 (PST)
In-Reply-To: <CALeDE9OdN+mjf8i32WctKhU8TUiEo5SH2FCG8e_HSUH_8Eo1+A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Nov 7, 2016 at 10:55 AM, Peter Robinson <pbrobinson@gmail.com> wrote:
> On Mon, Nov 7, 2016 at 9:01 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Sun, Nov 6, 2016 at 7:53 PM, Peter Robinson <pbrobinson@gmail.com> wrote:
>>
>>> The GPIO_EM is part of the Renesas SoCs so depend on the arch.
>>>
>>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>>
>> What about also enabling COMPILE_TEST?
>
> Happy to, never really know the rule of thumb on COMPILE_TEST, the
> decision to enable it always seems somewhat arbitrary (almost like it
> should be an option for all drivers when run in that mode as opposed
> to explicitly adding an option).

I think in these patches ask:

- Did it compile a lot before the change and get a lot of coverage?

- Does it compile less after this change?

- Then add COMPILE_TEST so we can get that coverage
  back when needed for test.

I do understand the point of not pushing a lot of options and pointless
compilation and modules in the face of everyone in the world, just that
the compile farms still need to churn these drivers.

Yours,
Linus Walleij
