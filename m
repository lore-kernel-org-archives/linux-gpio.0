From: "Zheng, Lv" <lv.zheng@intel.com>
Subject: RE: Question about patch "pinctrl: cherryview: Do not mask all
 interrupts on probe"
Date: Wed, 2 Sep 2015 08:51:17 +0000
Message-ID: <1AE640813FDE7649BE1B193DEA596E881EF3635F@SHSMSX101.ccr.corp.intel.com>
References: <CA+A7VXVOpLCvk3YLWq9=ESKGRUg3E+rBOV65eEEkw-TOTaCavQ@mail.gmail.com>
 <20150902073633.GD1609@lahna.fi.intel.com>
 <36DF59CE26D8EE47B0655C516E9CE6401CB03CF9@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:54095 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751110AbbIBIvW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Sep 2015 04:51:22 -0400
In-Reply-To: <36DF59CE26D8EE47B0655C516E9CE6401CB03CF9@SHSMSX101.ccr.corp.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Chen, Yu C" <yu.c.chen@intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Jo?o Paulo Rechi Vita <jprvita@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi,

> From: Chen, Yu C
> Sent: Wednesday, September 02, 2015 4:07 PM
>=20
>=20
> > From: Mika Westerberg [mailto:mika.westerberg@linux.intel.com]
> > Sent: Wednesday, September 02, 2015 3:37 PM
> >
> > On Tue, Sep 01, 2015 at 04:09:12PM -0400, Jo=E3o Paulo Rechi Vita w=
rote:
> > >
> > > I'm working on a ASUS E202SA laptop, in which the brightness keys
> > > depend on this patch to work. Are any plans to have it integrated=
, in
> > > the original form or in any other?
> >
> > Adding Yu to the loop.
> >
> > Yu was investigating alternative ways to fix this. Did you come to =
some
> > conclusion?
>=20
> Once I wrote a quirk patch to re-enable gpio irq in Embedded Controll=
er driver, and since
> ec driver is loaded before pinctrl driver , I need to modify the patc=
h to add a delay 'request_irq'
> in ec driver, maybe a workqueue mechanism. Then I switched to some ot=
her bugs..
> Yes, I'll continue this work recently, please stay tuned.

EC contains early initialization and late initialization.
During early initialization, IMO, you needn't do anything related to th=
e gpio irq.
The late initialization is invoked in the ACPI driver probe callback.
You can locate gpiolib there before proceeding.
If gpiolib is not found, you can return EPROBE_DEFER in this case.
So what's the problem now?

Thanks and best regards
-Lv

> Thanks
> Best Regards,
> Yu
>=20
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
