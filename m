From: Mark Walton <mark.walton@serialtek.com>
Subject: RE: [PATCH v2] gpio: pca953x: Fix dereference of irq data in shutdown
Date: Thu, 28 Feb 2019 15:33:47 +0000
Message-ID: <DM6PR19MB2602EA71E878FFAD339CAB94FB750@DM6PR19MB2602.namprd19.prod.outlook.com>
References: <20190228142539.GA7744@mark-devvm>
 <20190228151543.GC1360@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190228151543.GC1360@kroah.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Marek Vasut <marek.vasut@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: 28 February 2019 15:16
> To: Mark Walton <mark.walton@serialtek.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>; Bartosz Golaszewski
> <bgolaszewski@baylibre.com>; Marek Vasut <marek.vasut@gmail.com>;
> linux-gpio@vger.kernel.org; stable@vger.kernel.org
> Subject: Re: [PATCH v2] gpio: pca953x: Fix dereference of irq data in
> shutdown
>=20
> On Thu, Feb 28, 2019 at 02:27:33PM +0000, Mark Walton wrote:
> > If a PCA953x gpio was used as an interrupt and then released, the
> > shutdown function was trying to extract the pca953x_chip pointer
> > directly from the irq_data, but in reality was getting the gpio_chip
> > structure.
> >
> > The net effect was that the subsequent writes to the data structure
> > corrupted data in the gpio_chip structure, which wasn't immediately
> > obvious until attempting to use the GPIO again in the future, at which
> > point the kernel panics.
> >
> > This fix correctly extracts the pca953x_chip structure via the
> > gpio_chip structure, as is correctly done in the other irq functions.
> >
> > Fixes: 0a70fe00efea ("gpio: pca953x: Clear irq trigger type on irq
> > shutdown")
> > Signed-off-by: Mark Walton <mark.walton@serialtek.com>
> > ---
> >  drivers/gpio/gpio-pca953x.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> <formletter>
>=20
> This is not the correct way to submit patches for inclusion in the stable=
 kernel
> tree.  Please read:
>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.ht=
ml
> for how to do this properly.
>=20
> </formletter>

Hi Greg,

Apologies, I'm pretty new to submitting patches to the kernel.

Is it just a case of needing to move the CC: stable@vger.kernel.org line to=
 the sign-off area?

As far as I can tell it meets all of the other requirements (with the excep=
tion of not being in the upstream).

Thanks,

Mark
