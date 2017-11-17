From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over
 suspend/resume
Date: Fri, 17 Nov 2017 08:49:04 +0200
Message-ID: <20171117064904.GZ17200@lahna.fi.intel.com>
References: <20171114104136.25595-1-chiu@endlessm.com>
 <20171115080446.GY17200@lahna.fi.intel.com>
 <018180A5-B0D2-418E-9DBC-EF5F310F7295@endlessm.com>
 <20171115101302.GA17200@lahna.fi.intel.com>
 <CAB4CAwc-SFtw4+74Qe-vX57JRGDjJMt9xM2+ev3OiipzwxBPBw@mail.gmail.com>
 <20171116124431.GS17200@lahna.fi.intel.com>
 <CAB4CAwfHx8DgCYk0piVnrTa7YP2=6A8Le4ekoENFPyNVF9g1rw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:38437 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757044AbdKQGzk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Nov 2017 01:55:40 -0500
Content-Disposition: inline
In-Reply-To: <CAB4CAwfHx8DgCYk0piVnrTa7YP2=6A8Le4ekoENFPyNVF9g1rw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: heikki.krogerus@linux.intel.com, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Linux Upstreaming Team <linux@endlessm.com>

On Thu, Nov 16, 2017 at 09:27:51PM +0800, Chris Chiu wrote:
> On Thu, Nov 16, 2017 at 8:44 PM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > On Wed, Nov 15, 2017 at 06:19:56PM +0800, Chris Chiu wrote:
> >> Hi Mika,
> >>     I've confirmed with Asus and they said it's the latest BIOS for
> >> shipment and verified OK on Windows. So their BIOS team will not do
> >> anything for this.
> >
> > I'll ask around if our Windows people know anything about this. My gut
> > feeling is that the Windows driver does not touch HOSTSW_OWN either.
> 
> Thanks. Please let me know if you need any information. I still keep
> the machine.

Got confirmation from Windows people. So Windows pretty much saves and
restores the same registers than we do (padcfg + ie).

Have you tried whether s2idle works instead of S3 suspend? You can try
it like

  # echo freeze > /sys/power/state

If that works, I'm guessing that this system uses s2idle and that's also
what Windows uses and could explain why it works in Windows.
