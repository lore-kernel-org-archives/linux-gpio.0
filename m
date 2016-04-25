From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] gpiolib-acpi: Duplicate con_id string when adding it
 to the crs lookup list
Date: Mon, 25 Apr 2016 14:18:18 -0700
Message-ID: <20160425211818.GH26059@dtor-ws>
References: <1460563836-1899-1-git-send-email-ville.syrjala@linux.intel.com>
 <1461589279-8911-1-git-send-email-ville.syrjala@linux.intel.com>
 <20160425132139.GA1721@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:33370 "EHLO
	mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933361AbcDYVSV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Apr 2016 17:18:21 -0400
Content-Disposition: inline
In-Reply-To: <20160425132139.GA1721@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: ville.syrjala@linux.intel.com, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, stable@vger.kernel.org

On Mon, Apr 25, 2016 at 04:21:39PM +0300, Mika Westerberg wrote:
> On Mon, Apr 25, 2016 at 04:01:19PM +0300, ville.syrjala@linux.intel.c=
om wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >=20
> > Calling gpiod_get() from a module and then unloading the module lea=
ds to an
> > oops due to acpi_can_fallback_to_crs() storing the pointer to the p=
assed
> > 'con_id' string onto acpi_crs_lookup_list. The next guy to come alo=
ng will then
> > try to access the string but the memory may now be gone with the mo=
dule.
> > Make a copy of the passed string instead, and store the copy on the=
 list.
> >
>=20
> [...]
>=20
> >=20
> > v2: Make the copied con_id const
> >=20
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
>=20
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

--=20
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
