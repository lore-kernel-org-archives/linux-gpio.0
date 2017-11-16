From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: intel-gpio interrupts stop firing with Focaltech I2C-HID touchpad
Date: Thu, 16 Nov 2017 15:07:43 +0200
Message-ID: <20171116130743.GT17200@lahna.fi.intel.com>
References: <CAD8Lp47LZs6qbd00CDeX4s-eQkqf1dGO9VaFXuCaReQ2yE73Og@mail.gmail.com>
 <20171116115244.GQ17200@lahna.fi.intel.com>
 <CAD8Lp46fz-80hsOY1b4BFSHrr15Pk8nhYbaFh7MA0hquVSSc4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:59500 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S964791AbdKPNMJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Nov 2017 08:12:09 -0500
Content-Disposition: inline
In-Reply-To: <CAD8Lp46fz-80hsOY1b4BFSHrr15Pk8nhYbaFh7MA0hquVSSc4g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: heikki.krogerus@linux.intel.com, Chris Chiu <chiu@endlessm.com>, linux-gpio@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Endless Linux Upstreaming Team <linux@endlessm.com>

On Thu, Nov 16, 2017 at 12:01:24PM +0000, Daniel Drake wrote:
> On Thu, Nov 16, 2017 at 11:52 AM, Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > Please first check the signal with some analyzator if it works as
> > expected and let's then figure out what needs to be fixed and where ;-)
> 
> It works fine under Windows, so I think it's already clear that there
> is a Linux bug to be solved here.

Can you remove all the "debugging" patches and hacks and then add
"i2c_hid.debug=1" to the kernel command line.

Then reproduce the issue and send me full dmesg and acpidump of the
system. Thanks.
