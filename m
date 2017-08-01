From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/6] pinctrl: uniphier: remove unneeded EXPORT_SYMBOL_GPL()
Date: Tue, 1 Aug 2017 10:10:30 +0200
Message-ID: <CACRpkdZP42gui618JdQWCapU4M8qy3ok7ej1qnM+7=x9m8BG1A@mail.gmail.com>
References: <1501482071-9819-1-git-send-email-yamada.masahiro@socionext.com> <1501482071-9819-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501482071-9819-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 31, 2017 at 8:21 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> All UniPhier pinctrl drivers are built-in.  Exporting the symbol
> is meaningless.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
