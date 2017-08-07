From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: uniphier: widen all pinconf-derived arguments to u32
Date: Mon, 7 Aug 2017 15:10:50 +0200
Message-ID: <CACRpkdYvZwQaoHEi0rC+OgSrk2gLjp4ibJvOBCVT0Ss2KVCLyQ@mail.gmail.com>
References: <1501819285-12827-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501819285-12827-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 4, 2017 at 6:01 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Since commit 58957d2edfa1 ("pinctrl: Widen the generic pinconf argument
> from 16 to 24 bits"), the generic pinconf arguments are handled by u32.
>
> UniPhier pinctrl drivers do not support debouncing, so u16 is working,
> but align the argument type to u32 for consistency.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
