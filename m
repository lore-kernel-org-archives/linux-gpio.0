From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: ssbi-gpio: constify gpio_chip structure
Date: Tue, 1 Aug 2017 10:01:17 +0200
Message-ID: <CACRpkdbme0QkyJdNeg4di5=H+vhxvquNWS0k-KiqkCh4+5k99g@mail.gmail.com>
References: <20170711183950.GA26899@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170711183950.GA26899@embeddedgus>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 11, 2017 at 8:39 PM, Gustavo A. R. Silva
<garsilva@embeddedor.com> wrote:

> This structure is only used to copy into other structure, so declare
> it as const.
>
> This issue was detected using Coccinelle and the following semantic patch=
:
>
> @r disable optional_qualifier@
> identifier i;
> position p;
> @@
> static struct gpio_chip i@p =3D { ... };
>
> @ok@
> identifier r.i;
> expression e;
> position p;
> @@
> e =3D i@p;
>
> @bad@
> position p !=3D {r.p,ok.p};
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
>  struct gpio_chip i =3D { ... };
>
> In the following log you can see a significant difference in the code siz=
e
> and data segment, hence in the dec segment. This log is the output
> of the size command, before and after the code change:
>
> before:
>    text    data     bss     dec     hex filename
>   17061    6992       0   24053    5df5 drivers/pinctrl/qcom/pinctrl-ssbi=
-gpio.o
>
> after:
>    text    data     bss     dec     hex filename
>   16777    6904       0   23681    5c81 drivers/pinctrl/qcom/pinctrl-ssbi=
-gpio.o
>
> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>

Patch applied with Bj=C3=B6rn's ACK.

Yours,
Linus Walleij
