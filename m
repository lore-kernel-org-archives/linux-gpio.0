From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/5] gpio: of: remove of_gpiochip_and_xlate() and struct gg_data
Date: Thu, 23 Jun 2016 09:41:20 +0200
Message-ID: <CACRpkdaOHA03oArvish8v95vB=usAtdSMnQwj2CsK-DDwCxVig@mail.gmail.com>
References: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com> <1465898827-2229-5-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465898827-2229-5-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 14, 2016 at 12:07 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The usage of gpiochip_find(&gg_data, of_gpiochip_and_xlate) is odd.
>
> Usually gpiochip_find() is used to find a gpio_chip.  Here, however,
> the return value from gpiochip_find() is just discarded.  Instead,
> gpiochip_find(&gg_data, of_gpiochip_and_xlate) is called for the
> side-effect of the match function.
>
> The match function, of_gpiochip_find_and_xlate(), fills the given
> struct gg_data, but a match function should be simply called to
> judge the matching.
>
> This commit fixes this distortion and makes the code more readable.
> Remove of_gpiochip_find_and_xlate() and struct gg_data.  Instead,
> this adds a very simple helper function of_find_gpiochip_by_node().
> Now, of_get_named_gpiod_flags() is implemented more straight-forward.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Excellent patch, this always confused me too. Now I understand
the code.

Patch applied.

Yours,
Linus Walleij
