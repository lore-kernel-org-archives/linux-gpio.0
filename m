From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: uniphier: include <linux/bits.h> instead of <linux/bitops.h>
Date: Tue, 16 Oct 2018 10:03:09 +0200
Message-ID: <CACRpkda-0nM1BHRza91=4tG5cKA7qL4H8wC3Syn9g37OJ0dUHQ@mail.gmail.com>
References: <1539663093-15923-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539663093-15923-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Oct 16, 2018 at 6:12 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The reason of including <linux/bitops.h> here is just for BIT() and
> GENMASK macros.
>
> Since commit 8bd9cb51daac8 ("locking/atomics, asm-generic: Move some
> macros from <linux/bitops.h> to a new <linux/bits.h> file"),
> <linux/bits.h> is enough for such compile-time macros.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
