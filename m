From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Wed, 17 Aug 2016 11:13:44 +0300
Message-ID: <20160817081344.GM30827@lahna.fi.intel.com>
References: <1432281368-88687-1-git-send-email-mika.westerberg@linux.intel.com>
 <20150601092348.GK1747@lahna.fi.intel.com>
 <CACRpkdbQpx4oas72PSVXkyxCv4Vz+3PTistDh7EKB126E0Q_GQ@mail.gmail.com>
 <20150602141520.GE4057@lahna.fi.intel.com>
 <CALUN=qLAvUipcHArE_NT7Opv8iDjaZ3OTAsgs_jpXtBbvpwUXQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:9494 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753616AbcHQINt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 17 Aug 2016 04:13:49 -0400
Content-Disposition: inline
In-Reply-To: <CALUN=qLAvUipcHArE_NT7Opv8iDjaZ3OTAsgs_jpXtBbvpwUXQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Anisse Astier <anisse@astier.eu>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Aug 16, 2016 at 06:12:40PM +0200, Anisse Astier wrote:
> Hi Mika,
> 
> On Tue, Jun 2, 2015 at 4:15 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Tue, Jun 02, 2015 at 03:53:40PM +0200, Linus Walleij wrote:
> >> On Mon, Jun 1, 2015 at 11:23 AM, Mika Westerberg
> >> <mika.westerberg@linux.intel.com> wrote:
> >> > On Fri, May 22, 2015 at 10:56:08AM +0300, Mika Westerberg wrote:
> >> >> BIOS/platform may use some of the pins by themselves, such as providing SCI
> >> >> (System Control Interrupt) from the embedded controller. The driver masks
> >> >> all interrupts at probe time which prevents those pins from triggering
> >> >> interrupts properly.
> >> >>
> >> >> Fix this by not masking all interrupts at probe -- it should be enough just
> >> >> to clear the status register.
> >> >>
> >> >> Reported-by: Yu C Chen <yu.c.chen@intel.com>
> >> >> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> >> >
> >> > Please ignore this patch for now. It turned out to be causing spurious
> >> > interrupts on another platform.
> >> >
> >> > I'll need to rethink how to fix the reported issue.
> >>
> >> Looks like a case of "embed more magic knowledge" in the driver :/
> >>
> >> It needs to know what platform it is running on, and only leave specific
> >> bits unmasked on these specific platforms. Right? Thereby
> >> tossing all of the acpi_device_id matching and abstraction out
> >> of the window.
> >
> > That's right.
> >
> > We still have few options left, like using ACPI _AEI (ACPI GPIO
> > triggered events) for this or adding GPIO interrupt support directly to
> > the EC driver.
> 
> Did you find a way to fix this issue ? I'm seeing a similar problem on a
> laptop where this masks the interrupt used for ACPI events (brightness,
> lid, battery).

I seem to have forgotten this completely :-/

Can you send me output of /sys/kernel/debug/pinctrl/INT33FF:*/pins for
that particular EC pin?

In addition if you apply this patch do you see that ACPI events start
working?
