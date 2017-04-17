From: Gary Bisson <gary.bisson@boundarydevices.com>
Subject: Re: pinctrl: imx: Checking reuse of grouping functionality
Date: Mon, 17 Apr 2017 10:25:58 +0200
Message-ID: <CAAMH-ysVX+ZX-+nEF2kyrAKqhrkaZisBKiZuv6fAZUrKk3-ZDg@mail.gmail.com>
References: <60eb8e84-7914-4e25-4822-7e1d8fd8afcb@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <60eb8e84-7914-4e25-4822-7e1d8fd8afcb@users.sourceforge.net>
Sender: kernel-janitors-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>, Fabio Estevam <fabio.estevam@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peng Fan <van.freenix@gmail.com>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Markus, All,

On Sat, Apr 15, 2017 at 9:55 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> Hello,
>
> A preprocessor symbol like =E2=80=9CCONFIG_GENERIC_PINCTRL_GROUPS=E2=80=
=9D was introduced
> by the commit c033a718f615b6b3ddc83ce3e0a217c30bd09cb5 (=E2=80=9Cpinctrl:=
 stricten up
> generic group code=E2=80=9D) on 2017-01-03. Some functions are only avail=
able then
> when this macro is defined.

Yes because the pinctrl driver can be used without this configuration
by some drivers.

> I have got the impression that the corresponding programming interface is=
 used
> by the source file =E2=80=9Cdrivers/pinctrl/freescale/pinctrl-imx.c=E2=80=
=9D unconditionally.
> How do you think about to extend specifications for conditional compilati=
on there?

However the imx pinctrl driver _absolutely_ needs this configuration
to work. That is why it is selected automatically when the driver is
enabled [1].

Therefore it isn't possible to build the driver without
GENERIC_PINCTRL_GROUPS and so adding conditions is not necessary.

Regards,
Gary

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/pinctrl/freescale/Kconfig#n3
