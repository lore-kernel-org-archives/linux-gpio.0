From: Julia Cartwright <julia@ni.com>
Subject: Re: [PATCH v2 2/4] pinctrl: rockchip: convert to raw spinlock
Date: Wed, 15 Mar 2017 13:23:09 -0500
Message-ID: <20170315182309.GD682@jcartwri.amer.corp.natinst.com>
References: <20170315174654.15128-1-john@metanate.com>
 <20170315180137.GB682@jcartwri.amer.corp.natinst.com>
 <20170315180806.3714af56.john@metanate.com> <8564532.G8NNa9Oa4k@phil>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2775803137229735270=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8564532.G8NNa9Oa4k@phil>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, John Keeping <john@metanate.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

--===============2775803137229735270==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline

--32u276st3Jlj2kUU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2017 at 07:16:53PM +0100, Heiko Stuebner wrote:
> Am Mittwoch, 15. M=E4rz 2017, 18:08:06 CET schrieb John Keeping:
> > On Wed, 15 Mar 2017 13:01:37 -0500, Julia Cartwright wrote:
> > > On Wed, Mar 15, 2017 at 05:46:52PM +0000, John Keeping wrote:
> > > > This lock is used from rockchip_irq_set_type() which is part of the
> > > > irq_chip implementation and thus must use raw_spinlock_t as documen=
ted
> > > > in Documentation/gpio/driver.txt.
> > > >=20
> > > > Signed-off-by: John Keeping <john@metanate.com>
> > > > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > > > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > > > ---
> > > > v2: unchanged
> > > > ---
> > > >=20
> > > >  drivers/pinctrl/pinctrl-rockchip.c | 30 +++++++++++++++-----------=
----
> > > >  1 file changed, 15 insertions(+), 15 deletions(-)
> > > >=20
> > > > diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> > > > b/drivers/pinctrl/pinctrl-rockchip.c index 128c383ea7ba..8c1cae6d78=
d7
> > > > 100644
[..]
> > > > @@ -1295,14 +1295,14 @@ static int rockchip_set_pull(struct
> > > > rockchip_pin_bank *bank,> >=20
> > > >  	switch (ctrl->type) {
> > > >=20
> > > >  	case RK2928:
> > > > -		spin_lock_irqsave(&bank->slock, flags);
> > > > +		raw_spin_lock_irqsave(&bank->slock, flags);
> > > >=20
> > > >  		data =3D BIT(bit + 16);
> > > >  		if (pull =3D=3D PIN_CONFIG_BIAS_DISABLE)
> > > >  	=09
> > > >  			data |=3D BIT(bit);
> > >=20
> > > This should be lifted out from under the lock.
> > >=20
> > > >  		ret =3D regmap_write(regmap, reg, data);
> > >=20
> > > How is this legal?  The regmap_write() here is going to end up acquir=
ing
> > > the regmap mutex.
> >=20
> > It's not, the spinlock can be deleted here.  I only have RK3288 hardware
> > to test and I missed this when checking the uses of slock.
>=20
> That part could very well also use regmap_update_bits like the other part=
s.
> Not really sure, why we use regmap_write here, but I'm also not sure, if =
it=20
> matters at all.

regmap_update_bits also acquires the regmap lock, which would similarly
be a problem here.[1]

But, if we could pull this entire operation out of the lock (and
convince ourselves that it's okay to do so), then even better!

   Julia

1: Why is this a problem?  Because we're in the middle of a
   raw_spinlock_t protected critical region: if there were contention on
   the nested mutex (the "regmap mutex"), then we'd attempt to sleep in
   atomic context.

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEgKAEF431w1EL96k9jNrC4UVNdG8FAljJho0ACgkQjNrC4UVN
dG9L5gf9HAniORxEmhcyYmIbIM77+XtRxjnUUbEWh0Qc02pi4VfI1zcSXXb9BHAB
50Ctjimpwwhfu2sQf29nJzj5ImUFUfzW838ekKhvHIZe+z7LzJVHWB0IpiTlhfML
I5TAkM+2yHPa8OB0H+k5eUAVxby4QzLhLUXP/KkXArjfZx1EXemNvx/ht9pZ8vpF
LzqPx8zXOMXUc/t0fDJ6MiENSTIAFoCzJQVi1bifKPxvXlD3AkkogdU6wtPBPwI0
9D466vTOzkasd+LFoHaBCT/JoBhpeHFNvfIUueo87DcKv+1tyvb5zkMGWFRWVoCL
6Ok29NQgXVE9AItJip+2JmbIJBGhVQ==
=42xr
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--


--===============2775803137229735270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2775803137229735270==--
