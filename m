From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: uniphier: include <linux/build_bug.h> instead of <linux/bug.h>
Date: Tue, 12 Sep 2017 09:35:21 +0200
Message-ID: <CACRpkdZjbaAEjUGmA0Auk_auMPQaaHrOu8rYAjVyCwPt_eRg-Q@mail.gmail.com>
References: <1504373178-1022-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1504373178-1022-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Sep 2, 2017 at 7:26 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The #includes <linux/bug.h> is here to use BUILD_BUG_ON_ZERO().
>
> Thanks to commit bc6245e5efd7 ("bug: split BUILD_BUG stuff out into
> <linux/build_bug.h>"), it is now possible to reduce the number of
> headers pulled in.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied for fixes.

Yours,
Linus Walleij
