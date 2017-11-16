From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over
 suspend/resume
Date: Thu, 16 Nov 2017 14:44:31 +0200
Message-ID: <20171116124431.GS17200@lahna.fi.intel.com>
References: <20171114104136.25595-1-chiu@endlessm.com>
 <20171115080446.GY17200@lahna.fi.intel.com>
 <018180A5-B0D2-418E-9DBC-EF5F310F7295@endlessm.com>
 <20171115101302.GA17200@lahna.fi.intel.com>
 <CAB4CAwc-SFtw4+74Qe-vX57JRGDjJMt9xM2+ev3OiipzwxBPBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:41714 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934703AbdKPMoe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Nov 2017 07:44:34 -0500
Content-Disposition: inline
In-Reply-To: <CAB4CAwc-SFtw4+74Qe-vX57JRGDjJMt9xM2+ev3OiipzwxBPBw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: heikki.krogerus@linux.intel.com, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Linux Upstreaming Team <linux@endlessm.com>

On Wed, Nov 15, 2017 at 06:19:56PM +0800, Chris Chiu wrote:
> Hi Mika,
>     I've confirmed with Asus and they said it's the latest BIOS for
> shipment and verified OK on Windows. So their BIOS team will not do
> anything for this.

I'll ask around if our Windows people know anything about this. My gut
feeling is that the Windows driver does not touch HOSTSW_OWN either.
