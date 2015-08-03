From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: join dev_dbg strings into a single line
Date: Mon, 3 Aug 2015 10:13:33 +0200
Message-ID: <CACRpkdaCowtMffE8BYkQU15SZBdaBHVJfiaqCDrOEgN4_sNk4w@mail.gmail.com>
References: <1438244864-30737-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438244864-30737-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jul 30, 2015 at 10:27 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> These are user-visible strings, so can exceed 80 columns.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

I guess you were hit by this, not just patching around at random?

Patch applied.

Yours,
Linus Walleij
