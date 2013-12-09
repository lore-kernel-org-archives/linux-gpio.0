From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/3] SFI: fix compiler warnings
Date: Mon, 09 Dec 2013 10:52:36 +0200
Message-ID: <1386579156.1871.100.camel@smile>
References: <1386261409-13850-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <1386261409-13850-2-git-send-email-andriy.shevchenko@linux.intel.com>
	 <52A102C9.2060400@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:29211 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932334Ab3LIIxG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Dec 2013 03:53:06 -0500
In-Reply-To: <52A102C9.2060400@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Cohen <david.a.cohen@intel.com>
Cc: linux-gpio@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>

On Thu, 2013-12-05 at 14:48 -0800, David Cohen wrote:
> On 12/05/2013 08:36 AM, Andy Shevchenko wrote:
> > This fixes the following compiler warnings when build is done by ma=
ke W=3D1.
> >
> > drivers/sfi/sfi_acpi.c:154:5: warning: no previous prototype for =E2=
=80=98sfi_acpi_table_parse=E2=80=99 [-Wmissing-prototypes]
> >
> > drivers/sfi/sfi_core.c:164:26: warning: no previous prototype for =E2=
=80=98sfi_map_table=E2=80=99 [-Wmissing-prototypes]
> > drivers/sfi/sfi_core.c:192:6: warning: no previous prototype for =E2=
=80=98sfi_unmap_table=E2=80=99 [-Wmissing-prototypes]
> >
> > Indentation fixes are also included.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> IMO this patch could be accepted regardless of this series feedback.
> It's a simple fix without much dependence with the other patches.

Yes, but it was ignored all times. Do you know a maintainer who can
upstream this one?


--=20
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
