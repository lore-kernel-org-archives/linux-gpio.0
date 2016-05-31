From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 08/17] pinctrl: uniphier: support 3-bit drive strength control
Date: Tue, 31 May 2016 12:46:46 +0200
Message-ID: <CACRpkdaDReMSb6uBi2ono_m-fnMoh9-p=Wj=XB5nF72FEmXmyA@mail.gmail.com>
References: <1464681923-7469-1-git-send-email-yamada.masahiro@socionext.com>
	<1464681923-7469-9-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464681923-7469-9-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 31, 2016 at 10:05 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> The new ARMv8 SoC, PH1-LD20, supports more fine-grained drive
> strength control.  Drive strength of some pins are controlled by
> 3-bit width registers (8-level granularity).
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied.

Yours,
Linus Walleij
