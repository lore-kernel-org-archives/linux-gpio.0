From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: qcom: ssbi: mpp: constify gpio_chip structure
Date: Wed, 2 Aug 2017 10:27:17 +0200
Message-ID: <CACRpkdYPBseJY=DQ7_X_i6v+7OgEXyx__J_PEnVNW-MhrMuSuQ@mail.gmail.com>
References: <20170711211836.GA31321@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170711211836.GA31321@embeddedgus>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 11, 2017 at 11:18 PM, Gustavo A. R. Silva
<garsilva@embeddedor.com> wrote:

> This structure is only used to copy into another structure, so declare
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
>   15136    5112       0   20248    4f18 drivers/pinctrl/qcom/pinctrl-ssbi=
-mpp.o
>
> after:
>             bss     dec     hex filename
>   14849    5024       0   19873    4da1 drivers/pinctrl/qcom/pinctrl-ssbi=
-mpp.o
>
> Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>

Patch applied with Bj=C3=B6rn's review tag.

Yours,
Linus Walleij
