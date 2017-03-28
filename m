From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Query about Open drain flag with active LOW
Date: Tue, 28 Mar 2017 11:06:21 +0200
Message-ID: <CACRpkdYVdUyueSFsSi5SG6nfRn_s4tqfhHSkK3jhQov+9y2koA@mail.gmail.com>
References: <58D92DE0.3000907@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f41.google.com ([209.85.214.41]:35206 "EHLO
        mail-it0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932101AbdC1JGw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Mar 2017 05:06:52 -0400
Received: by mail-it0-f41.google.com with SMTP id y18so104811409itc.0
        for <linux-gpio@vger.kernel.org>; Tue, 28 Mar 2017 02:06:41 -0700 (PDT)
In-Reply-To: <58D92DE0.3000907@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Mar 27, 2017 at 5:21 PM, Laxman Dewangan <ldewangan@nvidia.com> wro=
te:

> I have the schematics, where I need to set it as
> Pin state HIGH (by setting gpio-input mode) to enable the circuit.
> Pin state LOW (by setting gpio-output mode with value to 0) to disable th=
e
> circuit.
(...)
> With this, I think the GPIO is active HIGH and open drain type.
> If I set the active LOW from DT then I can not set pin to logical 1 using
> the API gpiod_set_value() with =E2=80=9C1=E2=80=9D.
> As this invert before calling _gpiod_set_raw_value() and so the value =3D=
 0
> and it set the pin in the gpio mode output-Low.
>
> Shouldn'=E2=80=99t open drain pin are active HIGH?

Sorry I do not understand, have you solved it?

Else can you try to break down the problem, do you mean there is a bug
in inverted handling for open drain lines in gpiolib?

Yours,
Linus Walleij
