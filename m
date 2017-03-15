From: Julia Cartwright <julia@ni.com>
Subject: Re: [RFC PATCH 0/4] pinctrl: rockchip: PREEMPT_RT_FULL fixes
Date: Wed, 15 Mar 2017 13:17:30 -0500
Message-ID: <20170315181730.GC682@jcartwri.amer.corp.natinst.com>
References: <20170313183813.3582-1-john@metanate.com>
 <CACRpkdZXBZr_Syur3r=3GTjjrCPx4bgj0g5iNSN6rdikqkww4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0693551128324563205=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdZXBZr_Syur3r=3GTjjrCPx4bgj0g5iNSN6rdikqkww4w@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, John Keeping <john@metanate.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

--===============0693551128324563205==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2017 at 02:12:39PM +0100, Linus Walleij wrote:
> On Mon, Mar 13, 2017 at 7:38 PM, John Keeping <john@metanate.com> wrote:
>=20
> > As described in Documentation/gpio/driver.txt, we should not be using
> > sleepable APIs in the irqchip implementation.  Since this includes the
> > regmap API, this patch series ends up moving the mux setup for IRQs into
> > an irq_bus_sync_unlock() handler which may result in the IRQ being
> > configured before the port has been muxed as a GPIO.
> >
> > I've marked the series as RFC because I'm not sure if this is the best
> > way to accomplish this or if there is another approach that is cleaner.
> > Also, the first patch may not be correct on RK3399 because I originally
> > wrote the patch for RK3288 on top of v4.4 where all drive updates only
> > affect a single register.  We don't need locking in this case because
> > regmap_update_bits() takes a lock on the regmap internally, but if these
> > two registers need to be updated atomically then another lock will
> > be required here - slock cannot be used if it is converted to a raw
> > spinlock since with full RT preemption the regmap's spinlock may sleep.
>=20
> Nice work! It all looks good to me, let's see what Heiko says.
>=20
> Please keep Julia Cartwright on the CC for this patch series, she is
> doing some coccinelle-based rewrites to use raw spinlocks as we
> speak, and she knows this stuff.
>=20
> She has not targeted the Rockchip driver yet, I guess because of
> its complexity.

I haven't really given much thought to how we might generically solve
raw_spinlock problems for those drivers which make of irq_chip_generic
just yet.  I don't imagine it would be too difficult, just more work.

Thanks for the CC.

   Julia

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEgKAEF431w1EL96k9jNrC4UVNdG8FAljJhTcACgkQjNrC4UVN
dG8J0ggAnmLjlTFh5Xc+HNTHAda33ZrkUSdO/yu8HYGet+iZXDr5LXJe9JMHqSRB
//IPiMJjeRhagDFB/rYHmDu1WehVBLy/UcM+75g8B0fUnpJ9ikqVTddRrx292IxT
xxsnyLkelJRNI43hYMjeOSungCL7etHxYM53YIKeyob6DvU+69L5TlXlEHr8WlZm
haT+M8PVkKQiAgueFjniCN+UsR1GXOuM8omYSFJoBVTjAAvN6z/XbVl3JGsh4hbO
LYUnBZPOa778h/ljJW526Fza6f69FzHEiSN3JeQWI0bi/gAjmKyLd5WvbpE6w0Ui
53XWUAzdVOhR4pcMd88mMzEc81f0aw==
=Z0Qv
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--


--===============0693551128324563205==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0693551128324563205==--
