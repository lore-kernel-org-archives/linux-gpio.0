From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] tools/gpio: Fix build error with musl libc
Date: Thu, 21 Dec 2017 13:51:39 +0100
Message-ID: <CACRpkdYuR33EOS+OPDh+fCcdVsa5N3ajsALyaa5PH7z858euvA@mail.gmail.com>
References: <20171221004131.23691-1-joel@jms.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:37360 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752553AbdLUMvk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Dec 2017 07:51:40 -0500
Received: by mail-it0-f67.google.com with SMTP id d137so10728347itc.2
        for <linux-gpio@vger.kernel.org>; Thu, 21 Dec 2017 04:51:40 -0800 (PST)
In-Reply-To: <20171221004131.23691-1-joel@jms.id.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>

On Thu, Dec 21, 2017 at 1:41 AM, Joel Stanley <joel@jms.id.au> wrote:

> The GPIO tools build fails when using a buildroot toolchain that uses mus=
l
> as it's C library:
>
> arm-broomstick-linux-musleabi-gcc -Wp,-MD,./.gpio-event-mon.o.d \
>  -Wp,-MT,gpio-event-mon.o -O2 -Wall -g -D_GNU_SOURCE \
>  -Iinclude -D"BUILD_STR(s)=3D#s" -c -o gpio-event-mon.o gpio-event-mon.c
> gpio-event-mon.c:30:6: error: unknown type name =E2=80=98u_int32_t=E2=80=
=99; did you mean =E2=80=98uint32_t=E2=80=99?
>       u_int32_t handleflags,
>       ^~~~~~~~~
>       uint32_t
>
> The glibc headers installed on my laptop include sys/types.h in
> unistd.h, but it appears that musl does not.
>
> Fixes: 97f69747d8b1 ("tools/gpio: add the gpio-event-mon tool")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Patch applied.

Yours,
Linus Walleij
