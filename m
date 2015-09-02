From: "Chen, Yu C" <yu.c.chen@intel.com>
Subject: RE: Question about patch "pinctrl: cherryview: Do not mask all
 interrupts on probe"
Date: Wed, 2 Sep 2015 08:06:57 +0000
Message-ID: <36DF59CE26D8EE47B0655C516E9CE6401CB03CF9@SHSMSX101.ccr.corp.intel.com>
References: <CA+A7VXVOpLCvk3YLWq9=ESKGRUg3E+rBOV65eEEkw-TOTaCavQ@mail.gmail.com>
 <20150902073633.GD1609@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:39426 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751184AbbIBIHC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Sep 2015 04:07:02 -0400
In-Reply-To: <20150902073633.GD1609@lahna.fi.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, =?iso-8859-1?Q?Jo=E3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Zheng, Lv" <lv.zheng@intel.com>


> -----Original Message-----
> From: Mika Westerberg [mailto:mika.westerberg@linux.intel.com]
> Sent: Wednesday, September 02, 2015 3:37 PM
> To: Jo=E3o Paulo Rechi Vita
> Cc: linux-gpio@vger.kernel.org; Chen, Yu C
> Subject: Re: Question about patch "pinctrl: cherryview: Do not mask a=
ll
> interrupts on probe"
>=20
> On Tue, Sep 01, 2015 at 04:09:12PM -0400, Jo=E3o Paulo Rechi Vita wro=
te:
> >
> > I'm working on a ASUS E202SA laptop, in which the brightness keys
> > depend on this patch to work. Are any plans to have it integrated, =
in
> > the original form or in any other?
>=20
> Adding Yu to the loop.
>=20
> Yu was investigating alternative ways to fix this. Did you come to so=
me
> conclusion?

Once I wrote a quirk patch to re-enable gpio irq in Embedded Controller=
 driver, and since=20
ec driver is loaded before pinctrl driver , I need to modify the patch =
to add a delay 'request_irq'=20
in ec driver, maybe a workqueue mechanism. Then I switched to some othe=
r bugs..
Yes, I'll continue this work recently, please stay tuned.
Thanks
Best Regards,
Yu
=20
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
