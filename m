From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: [PATCH] pinctrl: zynq: change error code for pinctrl_register
 failure
Date: Tue, 26 May 2015 11:37:34 -0700
Message-ID: <20150526183734.GA31081@xsjsorenbubuntu>
References: <1432613909-13457-1-git-send-email-yamada.masahiro@socionext.com>
 <4437293.G26yCXqFQH@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4437293.G26yCXqFQH@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Tue, 2015-05-26 at 10:12AM +0200, Arnd Bergmann wrote:
> On Tuesday 26 May 2015 13:18:29 Masahiro Yamada wrote:
> > diff --git a/drivers/pinctrl/pinctrl-zynq.c b/drivers/pinctrl/pinct=
rl-zynq.c
> > index 04748a4..0ff653c 100644
> > --- a/drivers/pinctrl/pinctrl-zynq.c
> > +++ b/drivers/pinctrl/pinctrl-zynq.c
> > @@ -1141,7 +1141,7 @@ static int zynq_pinctrl_probe(struct platform=
_device *pdev)
> > =20
> >         pctrl->pctrl =3D pinctrl_register(&zynq_desc, &pdev->dev, p=
ctrl);
> >         if (!pctrl->pctrl)
> > -               return -ENOMEM;
> > +               return -EINVAL;
> > =20
> >         platform_set_drvdata(pdev, pctrl);
> > =20
> >=20
>=20
> One choice seems as bad as the other to me ;-)
>=20
> Could we add a pinctrl_register_reason() variant that returns a meani=
ngful
> error code as ERR_PTR?

I agree with Arnd. As long as we don't get a precise error code we can
just keep the current one.

	S=C3=B6ren
