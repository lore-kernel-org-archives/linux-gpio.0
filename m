From: John Keeping <john@metanate.com>
Subject: Re: [PATCH v2 2/4] pinctrl: rockchip: convert to raw spinlock
Date: Wed, 15 Mar 2017 18:46:27 +0000
Message-ID: <20170315184627.60baad35.john@metanate.com>
References: <20170315174654.15128-1-john@metanate.com>
        <20170315180137.GB682@jcartwri.amer.corp.natinst.com>
        <20170315180806.3714af56.john@metanate.com>
        <8564532.G8NNa9Oa4k@phil>
        <20170315182309.GD682@jcartwri.amer.corp.natinst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170315182309.GD682@jcartwri.amer.corp.natinst.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Cartwright <julia@ni.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, 15 Mar 2017 13:23:09 -0500, Julia Cartwright wrote:
> On Wed, Mar 15, 2017 at 07:16:53PM +0100, Heiko Stuebner wrote:
> > Am Mittwoch, 15. M=C3=A4rz 2017, 18:08:06 CET schrieb John Keeping: =20
> > > On Wed, 15 Mar 2017 13:01:37 -0500, Julia Cartwright wrote: =20
> > > > On Wed, Mar 15, 2017 at 05:46:52PM +0000, John Keeping wrote: =20
> > > > > This lock is used from rockchip_irq_set_type() which is part of t=
he
> > > > > irq_chip implementation and thus must use raw_spinlock_t as docum=
ented
> > > > > in Documentation/gpio/driver.txt.
> > > > >=20
> > > > > Signed-off-by: John Keeping <john@metanate.com>
> > > > > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> > > > > Tested-by: Heiko Stuebner <heiko@sntech.de>
> > > > > ---
> > > > > v2: unchanged
> > > > > ---
> > > > >=20
> > > > >  drivers/pinctrl/pinctrl-rockchip.c | 30 +++++++++++++++---------=
------
> > > > >  1 file changed, 15 insertions(+), 15 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> > > > > b/drivers/pinctrl/pinctrl-rockchip.c index 128c383ea7ba..8c1cae6d=
78d7
> > > > > 100644 =20
> [..]
> > > > > @@ -1295,14 +1295,14 @@ static int rockchip_set_pull(struct
> > > > > rockchip_pin_bank *bank,> >=20
> > > > >  	switch (ctrl->type) {
> > > > >=20
> > > > >  	case RK2928:
> > > > > -		spin_lock_irqsave(&bank->slock, flags);
> > > > > +		raw_spin_lock_irqsave(&bank->slock, flags);
> > > > >=20
> > > > >  		data =3D BIT(bit + 16);
> > > > >  		if (pull =3D=3D PIN_CONFIG_BIAS_DISABLE)
> > > > >  	=09
> > > > >  			data |=3D BIT(bit); =20
> > > >=20
> > > > This should be lifted out from under the lock.
> > > >  =20
> > > > >  		ret =3D regmap_write(regmap, reg, data); =20
> > > >=20
> > > > How is this legal?  The regmap_write() here is going to end up acqu=
iring
> > > > the regmap mutex. =20
> > >=20
> > > It's not, the spinlock can be deleted here.  I only have RK3288 hardw=
are
> > > to test and I missed this when checking the uses of slock. =20
> >=20
> > That part could very well also use regmap_update_bits like the other pa=
rts.
> > Not really sure, why we use regmap_write here, but I'm also not sure, i=
f it=20
> > matters at all. =20
>=20
> regmap_update_bits also acquires the regmap lock, which would similarly
> be a problem here.[1]
>=20
> But, if we could pull this entire operation out of the lock (and
> convince ourselves that it's okay to do so), then even better!

Yes, we can delete the lock here for the same reason as all of the
others that are removed in patch 1.

I don't think it makes much difference whether we use regmap_write or
regmap_update_bits here (although consistently using regmap_update_bits
might be nice) so I won't change it as part of this series, especially
since I don't have an RK2928 to test.


John
