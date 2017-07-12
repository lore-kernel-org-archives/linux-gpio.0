From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] pinctrl: baytrail: Do not call WARN_ON for a firmware
 bug
Date: Wed, 12 Jul 2017 16:12:38 +0300
Message-ID: <1499865158.22624.363.camel@linux.intel.com>
References: <20170712123101.26996-1-hdegoede@redhat.com>
         <1499863132.22624.361.camel@linux.intel.com>
         <f38c9f73-c2ba-a119-0d4b-ba812ad40682@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:28179 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752039AbdGLNPm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Jul 2017 09:15:42 -0400
In-Reply-To: <f38c9f73-c2ba-a119-0d4b-ba812ad40682@redhat.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org

On Wed, 2017-07-12 at 14:44 +0200, Hans de Goede wrote:
> On 12-07-17 14:38, Andy Shevchenko wrote:
> > On Wed, 2017-07-12 at 14:31 +0200, Hans de Goede wrote:
> > > WARN_ON causes a backtrace to get logged which is only useful for
> > > kernel bugs. For signalling a firmware bug dev_warn(dev, FW_BUG
> > > "...")
> > > should be used.
> > > 
> > > This fixes users running userspace software to monitor kernel
> > > oopses
> > > getting a false positive bug-report every boot because of the
> > > wrong
> > > use of WARN_ON.
> > 
> > I'm not against the patch, looks good to me, though can you shed a
> > bit
> > of light what is the FW bug you are experiencing?
> 
> The bug is the code path which has the WARN_ON triggering, which means
> that the ACPI tables / or a driver want to use a pin as gpio and it
> has
> been setup differently (as a special function) by the firmware.

Yes, and what I'm asking are the details of it, what product, what
device needs that pin, and why do we think that is the rightful request
from the OS?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
