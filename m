From: Julia Cartwright <julia@ni.com>
Subject: Re: [PATCH v4 1/4] pinctrl: rockchip: remove unnecessary locking
Date: Thu, 23 Mar 2017 15:43:22 -0500
Message-ID: <20170323204322.GO10423@jcartwri.amer.corp.natinst.com>
References: <20170323105931.10455-1-john@metanate.com>
 <9002373.ugSBBElCUj@diego>
 <20170323182910.GN10423@jcartwri.amer.corp.natinst.com>
 <3695399.LE2KsF2WZK@diego>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5931885812877845041=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3695399.LE2KsF2WZK@diego>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko St?bner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, John Keeping <john@metanate.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

--===============5931885812877845041==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FeAIMMcddNRN4P4/"
Content-Disposition: inline

--FeAIMMcddNRN4P4/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2017 at 09:01:43PM +0100, Heiko St?bner wrote:
> Am Donnerstag, 23. M=E4rz 2017, 13:29:10 CET schrieb Julia Cartwright:
> > On Thu, Mar 23, 2017 at 06:55:50PM +0100, Heiko St?bner wrote:
> > > Am Donnerstag, 23. M=E4rz 2017, 17:51:53 CET schrieb John Keeping:
> > > > On Thu, 23 Mar 2017 11:10:20 -0500, Julia Cartwright wrote:
[..]
> > > > > > @@ -1185,17 +1177,14 @@ static int rockchip_set_drive_perpin(st=
ruct
> > > > > > rockchip_pin_bank *bank,> >
> > > > > >=20
> > > > > >  			rmask =3D BIT(15) | BIT(31);
> > > > > >  			data |=3D BIT(31);
> > > > > >  			ret =3D regmap_update_bits(regmap, reg, rmask, data);
> > > > > >=20
> > > > > > -			if (ret) {
> > > > > > -				spin_unlock_irqrestore(&bank->slock, flags);
> > > > > > +			if (ret)
> > > > > >=20
> > > > > >  				return ret;
> > > > > >=20
> > > > > > -			}
> > > > > >=20
> > > > > >  			rmask =3D 0x3 | (0x3 << 16);
> > > > > >  			temp |=3D (0x3 << 16);
> > > > > >  			reg +=3D 0x4;
> > > > > >  			ret =3D regmap_update_bits(regmap, reg, rmask, temp);
> > > > >=20
> > > > > Killing the lock here means the writes to to this pair of registe=
rs
> > > > > (reg
> > > > > and reg + 4) can be observed non-atomically.  Have you convinced
> > > > > yourself that this isn't a problem?
> > > >=20
> > > > I called it out in v1 [1] since this bit is new since v4.4 where I
> > > > originally wrote this patch, and didn't get any comments about it.
> > > >=20
> > > > I've convinced myself that removing the lock doesn't cause any prob=
lems
> > > > for writing to the hardware: if the lock would prevent writes
> > > > interleaving then it means that two callers are trying to write
> > > > different drive strengths to the same pin, and even with a lock her=
e one
> > > > of them will end up with the wrong drive strength.
> > > >=20
> > > > But it does mean that a read via rockchip_get_drive_perpin() may se=
e an
> > > > inconsistent state.  I think adding a new lock specifically for this
> > > > particular drive strength bit is overkill and I can't find a scenar=
io
> > > > where this will actually matter; any driver setting a pinctrl config
> > > > must already be doing something to avoid racing two configurations
> > > > against each other, mustn't it?
> > >=20
> > > also, pins can normally only be requested once - see drivers complain=
ing
> > > if
> > > one of their pins is already held by a different driver. So if you re=
ally
> > > end up with two things writing to the same drive strength bits, the
> > > driver holding the pins must be really messed up anyway :-)
> >=20
> > My concern would be if two independent pins' drive strength
> > configuration would walk on each other, because they happen to be
> > configured via the same registers.
> >=20
> > If that's not possible, then great!
>=20
> ah sorry that we didn't make that clearer in the beginning, but no that a=
lso=20
> isn't possible. The registers use a "hiword-mask" scheme, so on each writ=
e to=20
> bit (x) the corresponding write-mask in bit (x+16) also needs to be set, =
so=20
> the each write will always only affect bits enabled in that way.

Awesome, thanks for clearing things up.

Thanks!
   Julia

--FeAIMMcddNRN4P4/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEgKAEF431w1EL96k9jNrC4UVNdG8FAljUM2YACgkQjNrC4UVN
dG8XyAf8CKpyGTgNTVt3BUdIYvfXRGUVC+jZvtY4VzZdd9Ibio1qzpuKGqaIX0BR
0Ldbbp5cBuS3+lVy5XZNfQ39G9DRZtgFCNXNuc4UgI3GWfck40llhvHxqaUZX0YW
s6iHtSxf/ooh7EFItvIq0VtaY7wymjPTl5uKy1a/bV1Fb0cH01JYKD4dqDgDbZVS
sdwpDpr2ywqspwdvT+I2crOqblUG/Cfop6f3LfMaYfvRM/GvpB+4Fn4s+P1kFw/l
9qZ93DDfhrtWHReoxmAN12Rraq5SyDalvq7LYaNyJBRToztSceOeqhPZGv1cqYiu
QRc3dvOYC3HHBUSpm3MvmE1C44VjLw==
=KHj2
-----END PGP SIGNATURE-----

--FeAIMMcddNRN4P4/--


--===============5931885812877845041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============5931885812877845041==--
