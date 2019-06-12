From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: remove unused pin_is_valid()
Date: Wed, 12 Jun 2019 09:11:21 +0200
Message-ID: <CACRpkdaSM4y_CEJH-MWx_7BqSP6PpTwQ21ZG++wfAT29RPcBHg@mail.gmail.com>
References: <20190609150953.6432-1-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609150953.6432-1-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Jun 9, 2019 at 5:10 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> This function was used by pin_request() to pointlessly double-check
> the pin validity, and it was the only user ever.
>
> Since commit d2f6a1c6fb0e ("pinctrl: remove double pin validity
> check."), no one has ever used it.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Good catch!
Patch applied.

Yours,
Linus Walleij
