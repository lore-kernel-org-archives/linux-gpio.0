From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Oops in acpi_gpiochip_add on MacBookPro with Linux
 v3.14-12042-g69cd9eba3886
Date: Thu, 10 Apr 2014 15:40:45 +0300
Message-ID: <20140410124045.GX19349@intel.com>
References: <CA+5PVA5VBns=hkOSViucrpT340uG0=hgrWqf=LYHTBFAe74tBg@mail.gmail.com>
 <CACna6ry+FOYykZpzycEjDA+ncGNLk6eXkwadXy548h9dgU1Bgw@mail.gmail.com>
 <CA+5PVA4ijLmwRKHD4RYE6qSqkN7p8v1GB9w9GAGAJKG45bBTnw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:34938 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030371AbaDJMdS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 10 Apr 2014 08:33:18 -0400
Content-Disposition: inline
In-Reply-To: <CA+5PVA4ijLmwRKHD4RYE6qSqkN7p8v1GB9w9GAGAJKG45bBTnw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Josh Boyer <jwboyer@fedoraproject.org>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

On Thu, Apr 10, 2014 at 08:22:12AM -0400, Josh Boyer wrote:
> On Thu, Apr 10, 2014 at 2:50 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmai=
l.com> wrote:
> > 2014-04-09 23:09 GMT+02:00 Josh Boyer <jwboyer@fedoraproject.org>:
> >> With Linux v3.14-12042-g69cd9eba3886 I get an oops from the bcma
> >> module on the MacBookPro 10,2 I have here.  This works fine with L=
inux
> >> v3.14-7333-g59ecc26004e7.  There have been no changes between thos=
e
> >> two versions to bcma itself, but the GPIO merge did go in that win=
dow.
> >>  I can attempt to do a bisect tomorrow, but looking over some of t=
he
> >> GPIO commits it seems pretty relevant to the ACPI GPIO changes.  I=
'm
> >> hoping someone here has an idea on what the issue might be and has
> >> some possible things for me to test for fixes.
> >
> > Bug report: https://lkml.org/lkml/2014/3/24/262
> > Patch: https://lkml.org/lkml/2014/3/24/293
> > Tested by Sabrina: https://lkml.org/lkml/2014/3/24/304
> > (all links are for the same thread).
> >
> > Now you simply have to find above patch in some git tree :) Not sur=
e
> > if it's already in Linus's one.
>=20
> Ah, wonderful.  I now wish I would have found those in my searching
> before doing the bisect.  Oh well.  For what it's worth, my bisect
> landed on the same commit.
>=20
> The fix isn't in Linus' tree or linux-next.  I'm guessing Mika is
> either still on vacation, or hasn't sent out the formal fix yet.

No, not on vacation anymore (unfortunately). I did send the formal patc=
h
already:

https://lkml.org/lkml/2014/3/31/135

but it isn't merged to Linus' GPIO tree yet.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
