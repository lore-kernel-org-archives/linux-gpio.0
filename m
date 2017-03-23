From: Julia Cartwright <julia@ni.com>
Subject: Re: [PATCH v4 1/4] pinctrl: rockchip: remove unnecessary locking
Date: Thu, 23 Mar 2017 13:29:10 -0500
Message-ID: <20170323182910.GN10423@jcartwri.amer.corp.natinst.com>
References: <20170323105931.10455-1-john@metanate.com>
 <20170323161020.GM10423@jcartwri.amer.corp.natinst.com>
 <20170323175153.1a576d3c.john@metanate.com> <9002373.ugSBBElCUj@diego>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8766502199437054682=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <9002373.ugSBBElCUj@diego>
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

--===============8766502199437054682==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CGDBiGfvSTbxKZlW"
Content-Disposition: inline

--CGDBiGfvSTbxKZlW
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 23, 2017 at 06:55:50PM +0100, Heiko St?bner wrote:
> Am Donnerstag, 23. M=E4rz 2017, 17:51:53 CET schrieb John Keeping:
> > On Thu, 23 Mar 2017 11:10:20 -0500, Julia Cartwright wrote:
[..]
> > > [..]
> > >=20
> > > > @@ -1185,17 +1177,14 @@ static int rockchip_set_drive_perpin(struct
> > > > rockchip_pin_bank *bank,> >=20
> > > >  			rmask =3D BIT(15) | BIT(31);
> > > >  			data |=3D BIT(31);
> > > >  			ret =3D regmap_update_bits(regmap, reg, rmask, data);
> > > >=20
> > > > -			if (ret) {
> > > > -				spin_unlock_irqrestore(&bank->slock, flags);
> > > > +			if (ret)
> > > >=20
> > > >  				return ret;
> > > >=20
> > > > -			}
> > > >=20
> > > >  			rmask =3D 0x3 | (0x3 << 16);
> > > >  			temp |=3D (0x3 << 16);
> > > >  			reg +=3D 0x4;
> > > >  			ret =3D regmap_update_bits(regmap, reg, rmask, temp);
> > >=20
> > > Killing the lock here means the writes to to this pair of registers (=
reg
> > > and reg + 4) can be observed non-atomically.  Have you convinced
> > > yourself that this isn't a problem?
> >=20
> > I called it out in v1 [1] since this bit is new since v4.4 where I
> > originally wrote this patch, and didn't get any comments about it.
> >=20
> > I've convinced myself that removing the lock doesn't cause any problems
> > for writing to the hardware: if the lock would prevent writes
> > interleaving then it means that two callers are trying to write
> > different drive strengths to the same pin, and even with a lock here one
> > of them will end up with the wrong drive strength.
> >=20
> > But it does mean that a read via rockchip_get_drive_perpin() may see an
> > inconsistent state.  I think adding a new lock specifically for this
> > particular drive strength bit is overkill and I can't find a scenario
> > where this will actually matter; any driver setting a pinctrl config
> > must already be doing something to avoid racing two configurations
> > against each other, mustn't it?
>=20
> also, pins can normally only be requested once - see drivers complaining =
if=20
> one of their pins is already held by a different driver. So if you really=
 end=20
> up with two things writing to the same drive strength bits, the driver ho=
lding=20
> the pins must be really messed up anyway :-)

My concern would be if two independent pins' drive strength
configuration would walk on each other, because they happen to be
configured via the same registers.

If that's not possible, then great!

   Julia

--CGDBiGfvSTbxKZlW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEgKAEF431w1EL96k9jNrC4UVNdG8FAljUE/MACgkQjNrC4UVN
dG8Sigf+OA0NZsGDAWM/jkQHw9NofYU4V3IHN2Z4M2/MiV58C4WB8cIZJSzLPI5W
sQbGhpXwVspd9jCnm3hP9otwAIuq/erslI9yV0BIpZSV+/p57ZXHBJHkOvGhkDf8
WbWnOPQaJnYNsrIpB+hTus5sS6ZdzJmMJA6UDlJvpGgPOqIcGwY7fojmnbnOPXca
UX7wsG/EmJsrgIw4fwp0RP0Dc/vIHTgvCGohZ8HOXpr4uQB5/k9AP0J7GJ9dLnml
5e71kEmM4HCPBYtuxfWE8QERhoz6ERxnki/ex47asAbqfJIYq12lYAnp87TFjKfJ
YcgDbj/mzb2bfSl/gAe0a3A/o531oA==
=50MK
-----END PGP SIGNATURE-----

--CGDBiGfvSTbxKZlW--


--===============8766502199437054682==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8766502199437054682==--
