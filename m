From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: gpiod API considerations [Was: [GIT PULL] On-demand device
 probing]
Date: Tue, 20 Oct 2015 09:14:55 +0200
Message-ID: <20151020071454.GE4931@pengutronix.de>
References: <20151018195330.GB14956@sirena.org.uk>
 <1445247881.53393.146.camel@infradead.org>
 <CAL_JsqKehmSobpbdeXGo=-1pAbtrhCHovyyCWya_MNOhGCi8CQ@mail.gmail.com>
 <1445258870.53393.173.camel@infradead.org>
 <20151019145048.GI14956@sirena.org.uk>
 <1445268580.53393.183.camel@infradead.org>
 <20151019154324.GN32532@n2100.arm.linux.org.uk>
 <20151019182744.GD4931@pengutronix.de>
 <20151019183905.GS32532@n2100.arm.linux.org.uk>
 <CAAVeFuKvwYikwjdTHK5Bq+Ot3s3hySe=7e-_8cXFN7tdUV18YA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAVeFuKvwYikwjdTHK5Bq+Ot3s3hySe=7e-_8cXFN7tdUV18YA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hello,

[trimming list of recipients considerably because of changed topic]

On Tue, Oct 20, 2015 at 08:47:21AM +0900, Alexandre Courbot wrote:
> On Tue, Oct 20, 2015 at 3:39 AM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> > On Mon, Oct 19, 2015 at 08:27:44PM +0200, Uwe Kleine-K=F6nig wrote:
> >> On Mon, Oct 19, 2015 at 04:43:24PM +0100, Russell King - ARM Linux=
 wrote:
> >> > It's a bit ironic that you've chosen GPIO as an example there.  =
The
> >> > "new" GPIO API (the gpiod_* stuff) only has a fwnode way to get =
the
> >> > gpio descriptor.  There's no of_* method.
> >>
> >> Without following all that fwnode discussion:
> >> gpiod_get et al. should work for you here, doesn't it? It just tak=
es a
> >> struct device * and I'm happy with it.
> >
> > What if you don't have a struct device?  I had that problem recentl=
y
> > when modifying the mvebu PCIe code.  The 'struct device' node doesn=
't
> > contain the GPIOs, it's the PCIe controller.  Individual ports on t=
he
> > controller are described in DT as sub-nodes, and the sub-nodes can
> > have a GPIO for card reset purposes.  These sub-nodes don't have a
> > struct device.
> >
> > Right now, I'm having to do this to work around this issue:
> >
> >         reset_gpio =3D of_get_named_gpio_flags(child, "reset-gpios"=
, 0, &flags);
> >         if (reset_gpio =3D=3D -EPROBE_DEFER) {
> >                 ret =3D reset_gpio;
> >                 goto err;
> >         }
> >
> >         if (gpio_is_valid(reset_gpio)) {
> >                 unsigned long gpio_flags;
> >
> >                 port->reset_name =3D devm_kasprintf(dev, GFP_KERNEL=
, "%s-reset",
> >                                                   port->name);
> >                 if (!port->reset_name) {
> >                         ret =3D -ENOMEM;
> >                         goto err;
> >                 }
> >
> >                 if (flags & OF_GPIO_ACTIVE_LOW) {
> >                         dev_info(dev, "%s: reset gpio is active low=
\n",
> >                                  of_node_full_name(child));
> >                         gpio_flags =3D GPIOF_ACTIVE_LOW |
> >                                      GPIOF_OUT_INIT_LOW;
> >                 } else {
> >                         gpio_flags =3D GPIOF_OUT_INIT_HIGH;
> >                 }
> >
> >                 ret =3D devm_gpio_request_one(dev, reset_gpio, gpio=
_flags,
> >                                             port->reset_name);
> >                 if (ret) {
> >                         if (ret =3D=3D -EPROBE_DEFER)
> >                                 goto err;
> >                         goto skip;
> >                 }
> >
> >                 port->reset_gpio =3D gpio_to_desc(reset_gpio);
> >         }
> >
> > Not nice, is it?  Not nice to have that in lots of drivers either.
> >
> > However, switching to use any of_* or fwnode_* thing also carries w=
ith
> > it another problem: you can't control the name appearing in the
> > allocation, so you end up with a bunch of GPIOs requested with a "r=
eset"
> > name - meaning you lose any identification of which port the GPIO w=
as
> > bound to.
>=20
> There are a few holes in the gpiod API. I see two solutions here:
>=20
> 1) extend devm_get_gpiod_from_child() to take an optional name argume=
nt
> 2) add a function to explicitly change a GPIO's name
>=20
> 2) seems to be the most generic solution, would that do the trick?

I would prefer 1) without "optional". A third alternative is to add at
least dev_name(dev) and maybe index to the name where applicable. Also
note that gpiod_request is called with label=3DNULL (in
fwnode_get_named_gpiod which is used in devm_get_gpiod_from_child), so
/sys/kernel/debug/gpio doesn't even contain "reset". I only see questio=
n
marks (using v4.3-rc5).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
