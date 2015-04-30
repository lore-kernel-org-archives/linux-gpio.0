From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 01/23] gpio: sysfs: fix memory leaks and device hotplug
Date: Thu, 30 Apr 2015 10:26:19 +0200
Message-ID: <20150430082619.GH32318@localhost>
References: <1429630951-27082-1-git-send-email-johan@kernel.org>
 <1429630951-27082-2-git-send-email-johan@kernel.org>
 <CACRpkdahTSVKC5KVLWEv4JQWV8Buys2bjV7pvg-d82Vd9eHdyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:35594 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751853AbbD3I0Q (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Apr 2015 04:26:16 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdahTSVKC5KVLWEv4JQWV8Buys2bjV7pvg-d82Vd9eHdyA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>

On Wed, Apr 29, 2015 at 11:44:18PM +0200, Linus Walleij wrote:
> On Tue, Apr 21, 2015 at 5:42 PM, Johan Hovold <johan@kernel.org> wrote:
> 
> > Unregister GPIOs requested through sysfs at chip remove to avoid leaking
> > the associated memory and sysfs entries.
> >
> > The stale sysfs entries prevented the gpio numbers from being exported
> > when the gpio range was later reused (e.g. at device reconnect).
> >
> > This also fixes the related module-reference leak.
> >
> > Note that kernfs makes sure that any on-going sysfs operations finish
> > before the class devices are unregistered and that further accesses
> > fail.
> >
> > The chip exported flag is used to prevent gpiod exports during removal.
> > This also makes it harder to trigger, but does not fix, the related race
> > between gpiochip_remove and export_store, which is really a race with
> > gpiod_request that needs to be addressed separately.
> >
> > Also note that this would prevent the crashes (e.g. NULL-dereferences)
> > at reconnect that affects pre-3.18 kernels, as well as use-after-free on
> > operations on open attribute files on pre-3.14 kernels (prior to
> > kernfs).
> >
> > Fixes: d8f388d8dc8d ("gpio: sysfs interface")
> > Cc: stable <stable@vger.kernel.org>     # v2.6.27: 01cca93a9491
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> Patch applied for fixes.
> 
> I worry a bit about what userspaces do out there, but they
> cannot reasonably have behaviours tied to in-flight removal
> of GPIO chips, that would be bizarre.

You shouldn't worry too much; even before this patch userspace would see
an -ENODEV when accessing an open sysfs attribute file of a disconnected
device as kernfs would orphan the file -- only now without the associated
leaks and crashes. ;)

Johan
