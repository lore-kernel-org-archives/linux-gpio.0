From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/3] mfd: lpc_ich: use a correct mask for the GPIO base
 address
Date: Thu, 11 Feb 2016 17:12:38 +0000
Message-ID: <20160211171238.GJ20693@x1>
References: <1453566729-30220-1-git-send-email-antoine.tenart@free-electrons.com>
 <1453566729-30220-3-git-send-email-antoine.tenart@free-electrons.com>
 <20160125124444.GJ3368@x1>
 <1453738070.1770.74.camel@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:38749 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750863AbcBKRMn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 12:12:43 -0500
Received: by mail-wm0-f47.google.com with SMTP id p63so77516375wmp.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2016 09:12:42 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1453738070.1770.74.camel@xes-inc.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Tyser <ptyser@xes-inc.com>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>

On Mon, 25 Jan 2016, Peter Tyser wrote:

>=20
> On Mon, 2016-01-25 at 12:44 +0000, Lee Jones wrote:
> > On Sat, 23 Jan 2016, Antoine Tenart wrote:
> >=20
> > > The GPIO base address is read from the GPIOBASE register. The fir=
st
> > > bit must be cleared as it can be hardwired to 1 to represent the =
i/o
> > > space. Other bits are either containing the base address of are
> > > reserved. They should not be cleared as all the chipsets do not h=
ave
> > > the same reserved bits.
> > >=20
> > > Signed-off-by: Antoine Tenart tenart@free-electrons.com>
> > > ---
> > >  drivers/mfd/lpc_ich.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > Applied, thanks.
>=20
> Is it possible to hold off on the application of the change Lee?

Patch unapplied.

> > > diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
> > > index b514f3cf140d..f13a5ded3958 100644
> > > --- a/drivers/mfd/lpc_ich.c
> > > +++ b/drivers/mfd/lpc_ich.c
> > > @@ -921,7 +921,10 @@ static int lpc_ich_init_gpio(struct pci_dev =
*dev)
> > >  gpe0_done:
> > >         /* Setup GPIO base register */
> > >         pci_read_config_dword(dev, priv->gbase, &base_addr_cfg);
> > > -       base_addr =3D base_addr_cfg & 0x0000ff80;
> > > +
> > > +       /* Clear the i/o flag */
> > > +       base_addr =3D base_addr_cfg & ~BIT(0);
> > > +
>=20
>=20
> Does this patch work around an issue you are seeing?  Looking at the =
Bay=20
> Trail EDS, the GPIO base address register looks like it should work f=
ine=20
> with the original code (it uses 0xff00 as a mask for the address, and=
=20
> reserves 0x80 which reads as a 0).  Also, Bay Trail bit 1 is an enabl=
e=20
> flag, which this patch wouldn't mask off.  Eg if the BIOS enables the=
 GPIO=20
> controller and sets the enable bit, I think things would break with t=
his=20
> patch.
>=20
> It's also scary to not mask off the reserved bits on other Intel chip=
sets -
> you're assuming they all read as 0 and I'm not sure if this is true o=
r=20
> not.  The patch also doesn't make the same change to the other base=20
> register reads either, and ideally they'd be kept in sync.
>=20
> Seems like things should be left as-is, or use an accurate chip-speci=
fic=20
> mask.
>=20
> I'd leave as-is personally.  Like Mika mentioned, Baytrail GPIO shoul=
d=20
> already be supported elsewhere, which should make this change unneces=
sary.
>=20
> Regards,
> Peter

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
