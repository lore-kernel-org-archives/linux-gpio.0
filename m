From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/2] GPIO support for Socionext Synquacer
Date: Tue, 31 Oct 2017 14:13:40 +0100
Message-ID: <CACRpkdb89o6b+os8RMUB-TN=Sz0UmGeesWYvqYbupNFF438kmA@mail.gmail.com>
References: <20171027202148.4188-1-ard.biesheuvel@linaro.org>
 <CACRpkdbfM6SuXxkbfcmJ-JxK1Mt=oxy1qN3rEawoNb8gpmjM9Q@mail.gmail.com> <CAKv+Gu-20f8VXW1x1T5BVoFwFiiNsS1XYvrA7XPo438-C6=u+A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:53655 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751539AbdJaNNl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 31 Oct 2017 09:13:41 -0400
Received: by mail-io0-f194.google.com with SMTP id 189so34952489iow.10
        for <linux-gpio@vger.kernel.org>; Tue, 31 Oct 2017 06:13:41 -0700 (PDT)
In-Reply-To: <CAKv+Gu-20f8VXW1x1T5BVoFwFiiNsS1XYvrA7XPo438-C6=u+A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, Masami Hiramatsu <masami.hiramatsu@linaro.org>

On Tue, Oct 31, 2017 at 1:27 PM, Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:

> I currently have this in my DTS:
>
> &gpio {
>     dsw3_1 {
>         gpios = <0 GPIO_ACTIVE_HIGH>;
>         gpio-hog;
>         input;
>     };
>
>     dsw3_2 {
>         gpios = <1 GPIO_ACTIVE_HIGH>;
>         gpio-hog;
>         input;
>     };
>
>     dsw3_3 {
>         gpios = <2 GPIO_ACTIVE_HIGH>;
>         gpio-hog;
>         input;
>     };
>
>     dsw3_4 {
>         gpios = <3 GPIO_ACTIVE_HIGH>;
>         gpio-hog;
>         input;
>     };
>
>     dsw3_5 {
>         gpios = <4 GPIO_ACTIVE_HIGH>;
>         gpio-hog;
>         input;
>     };
>
>     dsw3_6 {
>         gpios = <5 GPIO_ACTIVE_HIGH>;
>         gpio-hog;
>         input;
>     };
>
>     dsw3_7 {
>         gpios = <6 GPIO_ACTIVE_HIGH>;
>         gpio-hog;
>         input;
>     };
>
>     dsw3_8 {
>         gpios = <7 GPIO_ACTIVE_HIGH>;
>         gpio-hog;
>         input;
>     };
>
> for the 8 DIP switches that are connected to GPIO lines.

I have no idea how to make proper use of DIP switches really.
We *could* route them as inputs using GPIO keys, but it would
maybe give people the idea that it is a good idea to start
prying them at runtime.

If they don't have a usecase I would just leave them as this.

I guess/hope they will not be used by userspace either.

> So I can add the names for all the lines that have a purpose, but is
> that orthogonal to hogging?

Naming is orthogonal to hogging and should be a functional name
for the line, preferably header name, else rail name or something
else reasonable.

Yours,
Linus Walleij
