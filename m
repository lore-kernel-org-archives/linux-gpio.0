From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: uniphier: add UART hardware flow control pin-mux settings
Date: Tue, 27 Mar 2018 15:15:28 +0200
Message-ID: <CACRpkdatq6B7Of1DZAq0RcwcHxf6Qy1HcMaCC=3Wb_ogYsYfvw@mail.gmail.com>
References: <1521447194-26514-1-git-send-email-hayashi.kunihiko@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521447194-26514-1-git-send-email-hayashi.kunihiko@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Mar 19, 2018 at 9:13 AM, Kunihiko Hayashi
<hayashi.kunihiko@socionext.com> wrote:

> UniPhier SoCs have the following pins for hardware flow control of UART:
>   XRTS, XCTS
> and for modem control of UART:
>   XDTR, XDSR, XDCD, XRI
>
> The port number with the flow control is SoC-dependent.
>
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Patch applied with Masahiro's ACK!

Yours,
Linus Walleij
