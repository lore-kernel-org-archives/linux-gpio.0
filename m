From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over
 suspend/resume
Date: Tue, 21 Nov 2017 14:04:22 +0200
Message-ID: <20171121120422.GR22431@lahna.fi.intel.com>
References: <20171115080446.GY17200@lahna.fi.intel.com>
 <018180A5-B0D2-418E-9DBC-EF5F310F7295@endlessm.com>
 <20171115101302.GA17200@lahna.fi.intel.com>
 <CAB4CAwc-SFtw4+74Qe-vX57JRGDjJMt9xM2+ev3OiipzwxBPBw@mail.gmail.com>
 <20171116124431.GS17200@lahna.fi.intel.com>
 <CAB4CAwfHx8DgCYk0piVnrTa7YP2=6A8Le4ekoENFPyNVF9g1rw@mail.gmail.com>
 <20171117064904.GZ17200@lahna.fi.intel.com>
 <CAB4CAwdGQjXc6gsswyCgLTfFRN9CgcC=OJ6pz4rX-HCn8AT-TQ@mail.gmail.com>
 <20171121105205.GP22431@lahna.fi.intel.com>
 <CAB4CAwcjXi=YX+0PEC6wBdfAZ=am+BceB4HCFzTXzdts_FE2vQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:22608 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751782AbdKUMNK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Nov 2017 07:13:10 -0500
Content-Disposition: inline
In-Reply-To: <CAB4CAwcjXi=YX+0PEC6wBdfAZ=am+BceB4HCFzTXzdts_FE2vQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>

On Tue, Nov 21, 2017 at 07:54:26PM +0800, Chris Chiu wrote:
> Yup, I checked the value of the corresponded pin. It shows following before
> suspend
> pin 18 (GPIO_18) GPIO 0x40800102 0x00024075
> 
> Then after resume
> pin 18 (GPIO_18) GPIO 0x40800102 0x00024075 [ACPI]

OK, so ownership is changed to ACPI.

> What else register do you suggest me to compare? The PADCFG2 is invalid

It's fine APL does not have PADCFG2.

Hmm, I don't understand how this can work in Windows either. The Windows
people told me that they don't save and restore anything else than
padcfg registers + ie. If the ownership is changed to ACPI it means you
don't get interrupts anymore (only GPEs) and that applies to Windows as
well.
