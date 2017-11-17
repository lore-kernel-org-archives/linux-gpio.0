From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: intel-gpio interrupts stop firing with Focaltech I2C-HID touchpad
Date: Fri, 17 Nov 2017 11:11:34 +0200
Message-ID: <20171117091134.GB17200@lahna.fi.intel.com>
References: <CAD8Lp47LZs6qbd00CDeX4s-eQkqf1dGO9VaFXuCaReQ2yE73Og@mail.gmail.com>
 <20171116115244.GQ17200@lahna.fi.intel.com>
 <CAD8Lp46fz-80hsOY1b4BFSHrr15Pk8nhYbaFh7MA0hquVSSc4g@mail.gmail.com>
 <20171116130743.GT17200@lahna.fi.intel.com>
 <CAB4CAwcqxBJNnaS9q7S7dy_1GoR5m1VHY89y+8g-G7rXBBJ1hg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:23404 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933916AbdKQJLj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Nov 2017 04:11:39 -0500
Content-Disposition: inline
In-Reply-To: <CAB4CAwcqxBJNnaS9q7S7dy_1GoR5m1VHY89y+8g-G7rXBBJ1hg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: Daniel Drake <drake@endlessm.com>, heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Endless Linux Upstreaming Team <linux@endlessm.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>

On Fri, Nov 17, 2017 at 04:27:39PM +0800, Chris Chiu wrote:
> On Thu, Nov 16, 2017 at 9:07 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Thu, Nov 16, 2017 at 12:01:24PM +0000, Daniel Drake wrote:
> >> On Thu, Nov 16, 2017 at 11:52 AM, Mika Westerberg
> >> <mika.westerberg@linux.intel.com> wrote:
> >> > Please first check the signal with some analyzator if it works as
> >> > expected and let's then figure out what needs to be fixed and where ;-)
> >>
> >> It works fine under Windows, so I think it's already clear that there
> >> is a Linux bug to be solved here.
> >
> > Can you remove all the "debugging" patches and hacks and then add
> > "i2c_hid.debug=1" to the kernel command line.
> >
> > Then reproduce the issue and send me full dmesg and acpidump of the
> > system. Thanks.
> 
> Hi Mika,
>     Here's the dmesg log which stops at 214th seconds and no more
> further output and archive of "acpidump -b" output files FYI.

Thanks!

The dmesg is not complete, I wonder if you can make the buffer a bit
bigger by increasing CONFIG_LOG_BUF_SHIFT (or get it from
/var/log/messages or so). I would like to see i2c-hid init and related
messages.

>From the acpidump related to the i2c-hid device, the system provides
custom I2C timings via FMCN ACPI method but it misses one value
(sda_hold). Not sure if if has anything to do with the problem, though.
Adding Jarkko in case he has any ideas.

BTW, is this the same machine which has problems in S3 suspend/resume?
