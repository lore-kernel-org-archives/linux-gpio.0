From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: Do not mask all interrupts on probe
Date: Tue, 2 Jun 2015 17:15:20 +0300
Message-ID: <20150602141520.GE4057@lahna.fi.intel.com>
References: <1432281368-88687-1-git-send-email-mika.westerberg@linux.intel.com>
 <20150601092348.GK1747@lahna.fi.intel.com>
 <CACRpkdbQpx4oas72PSVXkyxCv4Vz+3PTistDh7EKB126E0Q_GQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:4614 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759135AbbFBOPn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 2 Jun 2015 10:15:43 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdbQpx4oas72PSVXkyxCv4Vz+3PTistDh7EKB126E0Q_GQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Yu C Chen <yu.c.chen@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 02, 2015 at 03:53:40PM +0200, Linus Walleij wrote:
> On Mon, Jun 1, 2015 at 11:23 AM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Fri, May 22, 2015 at 10:56:08AM +0300, Mika Westerberg wrote:
> >> BIOS/platform may use some of the pins by themselves, such as providing SCI
> >> (System Control Interrupt) from the embedded controller. The driver masks
> >> all interrupts at probe time which prevents those pins from triggering
> >> interrupts properly.
> >>
> >> Fix this by not masking all interrupts at probe -- it should be enough just
> >> to clear the status register.
> >>
> >> Reported-by: Yu C Chen <yu.c.chen@intel.com>
> >> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> >
> > Please ignore this patch for now. It turned out to be causing spurious
> > interrupts on another platform.
> >
> > I'll need to rethink how to fix the reported issue.
> 
> Looks like a case of "embed more magic knowledge" in the driver :/
> 
> It needs to know what platform it is running on, and only leave specific
> bits unmasked on these specific platforms. Right? Thereby
> tossing all of the acpi_device_id matching and abstraction out
> of the window.

That's right.

We still have few options left, like using ACPI _AEI (ACPI GPIO
triggered events) for this or adding GPIO interrupt support directly to
the EC driver.
