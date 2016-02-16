From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Turn Baytrail support to tristate
Date: Tue, 16 Feb 2016 10:53:46 +0200
Message-ID: <20160216085346.GA1742@lahna.fi.intel.com>
References: <20160211120551.4d8224a4@endymion>
 <20160211112317.GT16826@lahna.fi.intel.com>
 <CACRpkdaBBeZbbZGduHOJKuqQmCdyXaMatFt97Bjxsbfdf6V3Rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:64272 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754279AbcBPIyE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 16 Feb 2016 03:54:04 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdaBBeZbbZGduHOJKuqQmCdyXaMatFt97Bjxsbfdf6V3Rw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jean Delvare <jdelvare@suse.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Mathias Nyman <mathias.nyman@intel.com>

On Tue, Feb 16, 2016 at 12:13:36AM +0100, Linus Walleij wrote:
> On Thu, Feb 11, 2016 at 12:23 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Thu, Feb 11, 2016 at 12:05:51PM +0100, Jean Delvare wrote:
> >> The pinctrl-baytrail driver builds just fine as a module so give
> >> users this option.
> >
> > IIRC the reason why this is built-in is that there are all kind of ACPI
> > GPIO magic happening behind the scenes on Baytrail-T based machines
> > (such as Asus T100) and it does not work without the GPIO driver. Some
> > of the stuff is done pretty early too.
> 
> Hm I wonder if that could be the case for the AMD driver that just
> got tristated too...

If they use ACPI GPIO events and operation regions early at boot then it
can be the case.
