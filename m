From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: add blacklist list for XPS machines
Date: Wed, 5 Oct 2016 12:32:56 +0300
Message-ID: <20161005093256.GB1765@lahna.fi.intel.com>
References: <1475647025-25617-1-git-send-email-acelan.kao@canonical.com>
 <CAEhpT-WvLqfzfxrsRB_+tifq4tESnz_HqdaFb=0VUjff2=3-mg@mail.gmail.com>
 <20161005085502.GY1765@lahna.fi.intel.com>
 <CAFv23Qkv7EGQy+ObQukaArdyeeQhWTyUmvk=gxycwV_YD3dd2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:60358 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750807AbcJEJfN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 5 Oct 2016 05:35:13 -0400
Content-Disposition: inline
In-Reply-To: <CAFv23Qkv7EGQy+ObQukaArdyeeQhWTyUmvk=gxycwV_YD3dd2Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: AceLan Kao <acelan.kao@canonical.com>
Cc: Calvin Johnson <linux.cj@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Wed, Oct 05, 2016 at 05:23:08PM +0800, AceLan Kao wrote:
> Or maybe anyone of you can give me some hints, which pin related to
> the touchscreen which is connected on USB port.
> I can do some test to see if I can find other solution.
> The issue we encountered is that closing the lid to enter S3 and then
> open the lid to wake up, the touchscreen fails to work.
> By other ways to enter S3, pm-suspend, or click from GUI, the
> touchscreen still works after waking up.

You can start by either filing a bug in the kernel bugzilla or
alternatively send me full dmesg of the error. Also include output of
/proc/interrupts before and after suspend.

You can also try the following patch:

https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git/commit/?h=x86/urgent&id=db91aa793ff984ac048e199ea1c54202543952fe

It fixes a memory corruption during suspend/resume which might be
related to the issue you are seeing.
