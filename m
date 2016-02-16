From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] pinctrl: intel: Turn Baytrail support to tristate
Date: Tue, 16 Feb 2016 10:15:43 +0100
Message-ID: <20160216101543.7602d9e8@endymion>
References: <20160211120551.4d8224a4@endymion>
	<20160211112317.GT16826@lahna.fi.intel.com>
	<CACRpkdaBBeZbbZGduHOJKuqQmCdyXaMatFt97Bjxsbfdf6V3Rw@mail.gmail.com>
	<20160216085346.GA1742@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:49898 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752598AbcBPJPr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 16 Feb 2016 04:15:47 -0500
In-Reply-To: <20160216085346.GA1742@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>

Hi Mika, Linus,

On Tue, 16 Feb 2016 10:53:46 +0200, Mika Westerberg wrote:
> On Tue, Feb 16, 2016 at 12:13:36AM +0100, Linus Walleij wrote:
> > On Thu, Feb 11, 2016 at 12:23 PM, Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > On Thu, Feb 11, 2016 at 12:05:51PM +0100, Jean Delvare wrote:
> > >> The pinctrl-baytrail driver builds just fine as a module so give
> > >> users this option.
> > >
> > > IIRC the reason why this is built-in is that there are all kind of ACPI
> > > GPIO magic happening behind the scenes on Baytrail-T based machines
> > > (such as Asus T100) and it does not work without the GPIO driver. Some
> > > of the stuff is done pretty early too.
> > 
> > Hm I wonder if that could be the case for the AMD driver that just
> > got tristated too...
> 
> If they use ACPI GPIO events and operation regions early at boot then it
> can be the case.

TBH my patches were more RFCs or even wishful thinking than real
patches. Sorry for not being clearer about this.

Hardware-specific code which can only be built-in is a problem, because
it doesn't scale in the long run, so the pinctrl-baytrail and
pinctrl-amd drivers as they exist today do not please me. Same for
acpi_lpss and acpi_apd, btw... Hardware-specific code that is always
built-in. If we keep doing that then distribution kernels will just
grow and grow beyond reason.

So if there is any way to let this code be modularized, that would be
great. At this point I still did not see the explanation as to why it
can't be done. "All kind of ACPI GPIO magic happening behind the
scenes" is not an explanation, that's something I would expect from the
marketing department, not engineering ;-) I'd like to know what exactly
is being done, how and why it technically can't be done after loading a
module, it that's actually the case.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
