From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: berlin: guard sub-directory with CONFIG_PINCTRL_BERLIN
Date: Tue, 1 Dec 2015 10:40:19 +0100
Message-ID: <CACRpkdYnkArvz6VBp0bLfD4g7SLR+G8FYAJDK+LZ97ohdTnjqw@mail.gmail.com>
References: <1448365524-12605-1-git-send-email-yamada.masahiro@socionext.com>
	<1448365524-12605-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448365524-12605-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jisheng Zhang <jszhang@marvell.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 24, 2015 at 12:45 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> CONFIG_PINCTRL_BERLIN is more suitable than CONFIG_ARCH_BERLIN
> to guard the drivers/pinctrl/berlin/ directory.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied with the ACKs.

Yours,
Linus Walleij
