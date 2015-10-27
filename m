From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v10] gpio: Add GPIO support for the ACCES 104-IDIO-16
Date: Tue, 27 Oct 2015 16:23:43 +0200
Message-ID: <20151027142343.GI1548@lahna.fi.intel.com>
References: <20151019165914.GA22867@sophia>
 <CACRpkdbQyed0S0Y6MSt35LuOekFprvbPMDpsGku-cBXBt=9j0Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:52108 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932254AbbJ0OXs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 27 Oct 2015 10:23:48 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbQyed0S0Y6MSt35LuOekFprvbPMDpsGku-cBXBt=9j0Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>, Andreas Bofjall <andreas@gazonk.org>, Simon Guinot <simon.guinot@sequanux.org>, Diego Elio =?iso-8859-1?Q?Petten=F2?= <flameeyes@flameeyes.eu>, Daniel Krueger <daniel.krueger@systec-electronic.com>, Bruno Randolf <br1@einfach.org>, Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Oct 27, 2015 at 11:06:58AM +0100, Linus Walleij wrote:
> > +menu "ISA GPIO drivers"
> > +
> > +config GPIO_104_IDIO_16
> > +       tristate "ACCES 104-IDIO-16 GPIO support"
> > +       depends on X86
> > +       help
> > +         Enables GPIO support for the ACCES 104-IDIO-16 family.
> > +
> > +endmenu
> 
> I have five other drivers using port-based I/O:
> 
> gpio-f7188x.c
> gpio-it87.c
> gpio-sch.c
> gpio-sch311x.c
> gpio-ts5500.c
> 
> Do you think it makes sense to move all of these in under
> the "ISA GPIO drivers" menu as well? I guess they all require
> ISA after all.
> 
> (Added their maintainers to the To: line so I can get some input
> on this.)

Not all of them actually require ISA. For example gpio-sch is part of an
MFD device which is a PCI device. PCI bus also has notion of I/O ports.
