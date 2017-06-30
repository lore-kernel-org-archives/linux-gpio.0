From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: rza1: Remove unneeded wrong check for wrong variable
Date: Fri, 30 Jun 2017 15:47:05 +0200
Message-ID: <CACRpkdaZBVeJkf55EzH+UjNt1d9_PJ7kq2Lm_i-zy7X3gmrS2w@mail.gmail.com>
References: <1498805859-4136-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1498805859-4136-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Chris Brandt <chris.brandt@renesas.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 30, 2017 at 8:57 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Depending on compiler version:
>
>     drivers/pinctrl/pinctrl-rza1.c: In function =E2=80=98rza1_pinctrl_pro=
be=E2=80=99:
>     drivers/pinctrl/pinctrl-rza1.c:1260:5: warning: =E2=80=98ret=E2=80=99=
 may be used uninitialized in this function [-Wmaybe-uninitialized]
>       if (ret)
>          ^
>
> Indeed, the result returned by platform_get_resource() was stored in
> "res", not "ret".  In addition, the correct error check would be
> "if (!res)", as platform_get_resource() does not return an error code,
> but returns NULL on failure.
>
> However, as devm_ioremap_resource() verifies the validity of the passed
> resource pointer anyway, the check can just be removed.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Fixes: 5a49b644b3075f88 ("pinctrl: Renesas RZ/A1 pin and gpio controller"=
)
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
