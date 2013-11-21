From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH 1/5] net: rfkill: gpio: convert to descriptor-based GPIO interface
Date: Thu, 21 Nov 2013 22:46:28 +0100
Message-ID: <1735877.0KPLyChZ35@vostro.rjw.lan>
References: <1385045153-25160-1-git-send-email-mika.westerberg@linux.intel.com> <528E3D5E.20907@nvidia.com> <20131121172217.GE2281@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20131121172217.GE2281@intel.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Rhyland Klein <rklein@nvidia.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Chris Ball <cjb@laptop.org>, Johannes Berg <johannes@sipsolutions.net>, Adrian Hunter <adrian.hunter@intel.com>, Alex Courbot <acourbot@nvidia.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Rob Landley <rob@landley.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thursday, November 21, 2013 07:22:17 PM Mika Westerberg wrote:
> On Thu, Nov 21, 2013 at 12:05:34PM -0500, Rhyland Klein wrote:
> > This seems like a reasonable patch, and likely a good way to go. I don't
> > have a AC100 to test this with though, so I can't verify this
> > personally. Also, would the paz00 patch become a dependency of this
> > patchset? Mika, maybe you can therefore include a patch for paz00 in
> > your patchset?
> 
> Sure I can, if everyone is OK with that.

No objections from me.

Thanks!

-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
