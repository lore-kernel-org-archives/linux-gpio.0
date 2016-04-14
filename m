From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] gpiolib-acpi: Duplicate con_id string when adding it to
 the crs lookup list
Date: Thu, 14 Apr 2016 15:41:11 +0300
Message-ID: <20160414124111.GO4329@intel.com>
References: <1460563836-1899-1-git-send-email-ville.syrjala@linux.intel.com>
 <20160414122749.GV1714@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160414122749.GV1714@lahna.fi.intel.com>
Sender: stable-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, stable@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 14, 2016 at 03:27:49PM +0300, Mika Westerberg wrote:
> On Wed, Apr 13, 2016 at 07:10:36PM +0300, ville.syrjala@linux.intel.c=
om wrote:
> > diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acp=
i.c
> > index 682070d20f00..6238ddb81709 100644
> > --- a/drivers/gpio/gpiolib-acpi.c
> > +++ b/drivers/gpio/gpiolib-acpi.c
> > @@ -950,7 +950,7 @@ int acpi_gpio_count(struct device *dev, const c=
har *con_id)
> >  struct acpi_crs_lookup {
> >  	struct list_head node;
> >  	struct acpi_device *adev;
> > -	const char *con_id;
> > +	char *con_id;
>=20
> Why it cannot be left as const?

I suppose it could.

>=20
> >  };
> > =20
> >  static DEFINE_MUTEX(acpi_crs_lookup_lock);
> > @@ -977,7 +977,7 @@ bool acpi_can_fallback_to_crs(struct acpi_devic=
e *adev, const char *con_id)
> >  		lookup =3D kmalloc(sizeof(*lookup), GFP_KERNEL);
> >  		if (lookup) {
> >  			lookup->adev =3D adev;
> > -			lookup->con_id =3D con_id;
> > +			lookup->con_id =3D kstrdup(con_id, GFP_KERNEL);
> >  			list_add_tail(&lookup->node, &acpi_crs_lookup_list);
> >  		}
> >  	}
> > --=20
> > 2.7.4

--=20
Ville Syrj=E4l=E4
Intel OTC
