From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2] gpiolib-acpi: Duplicate con_id string when adding it
 to the crs lookup list
Date: Mon, 25 Apr 2016 16:21:39 +0300
Message-ID: <20160425132139.GA1721@lahna.fi.intel.com>
References: <1460563836-1899-1-git-send-email-ville.syrjala@linux.intel.com>
 <1461589279-8911-1-git-send-email-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:31052 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932166AbcDYNVr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 25 Apr 2016 09:21:47 -0400
Content-Disposition: inline
In-Reply-To: <1461589279-8911-1-git-send-email-ville.syrjala@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: ville.syrjala@linux.intel.com
Cc: linux-gpio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, stable@vger.kernel.org

On Mon, Apr 25, 2016 at 04:01:19PM +0300, ville.syrjala@linux.intel.com=
 wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>=20
> Calling gpiod_get() from a module and then unloading the module leads=
 to an
> oops due to acpi_can_fallback_to_crs() storing the pointer to the pas=
sed
> 'con_id' string onto acpi_crs_lookup_list. The next guy to come along=
 will then
> try to access the string but the memory may now be gone with the modu=
le.
> Make a copy of the passed string instead, and store the copy on the l=
ist.
>

[...]

>=20
> v2: Make the copied con_id const
>=20
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
