From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: uniphier: fix .pin_dbg_show() callback
Date: Tue, 31 May 2016 10:56:46 +0200
Message-ID: <CACRpkdbwD5Kb+HG+T2Geo4fN272CD2iAgDH4qSkgo8HgA4U3SQ@mail.gmail.com>
References: <1464676210-16508-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464676210-16508-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 31, 2016 at 8:30 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Without this, reading the "pins" in the debugfs causes kernel BUG.
>
> Fixes: 6e9088920258 ("pinctrl: UniPhier: add UniPhier pinctrl core support")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
