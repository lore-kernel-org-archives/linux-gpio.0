From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: coh901: constify gpio_chip structure
Date: Tue, 1 Aug 2017 09:59:58 +0200
Message-ID: <CACRpkdZTqtXobKpk-utj3=zBnjgyKiyVNi2BZC+ZwFngLT4suQ@mail.gmail.com>
References: <20170711213519.GA3391@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170711213519.GA3391@embeddedgus>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 11, 2017 at 11:35 PM, Gustavo A. R. Silva
<garsilva@embeddedor.com> wrote:

> This structure is only used to copy into another structure, so declare
> it as const.
>
> This issue was detected using Coccinelle and the following semantic patch:
>
> @r disable optional_qualifier@
> identifier i;
> position p;
> @@
> static struct gpio_chip i@p = { ... };
>
> @ok@
> identifier r.i;
> expression e;
> position p;
> @@
> e = i@p;
>
> @bad@
> position p != {r.p,ok.p};
> identifier r.i;
> struct gpio_chip e;
> @@
> e@i@p
>
> @depends on !bad disable optional_qualifier@
> identifier r.i;
> @@
> static
> +const
>  struct gpio_chip i = { ... };
>
> In the following log you can see a significant difference in the code size
> and data segment, hence in the dec segment. This log is the output
> of the size command, before and after the code change:
>
> before:
>    text    data     bss     dec     hex filename
>   12775    3696      64   16535    4097 drivers/pinctrl/pinctrl-coh901.o
>
> after:
>             bss     dec     hex filename
>   12440    3640      64   16144    3f10 drivers/pinctrl/pinctrl-coh901.o
>
> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>

Patch applied.

Yours,
Linus Walleij
