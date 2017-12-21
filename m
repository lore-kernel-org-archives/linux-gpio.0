From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: pinctrl-amd: What hardware does it apply to?
Date: Thu, 21 Dec 2017 14:12:56 +0200
Message-ID: <20171221121256.GY27654@lahna.fi.intel.com>
References: <6c675643-45ec-c57f-f1b2-afb25f3e947e@opengear.com>
 <CACRpkdaHj8SFL5AfSkAqDG0mHpgRVbmHuyrhwMUkEH2c4p0VDg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:61989 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752007AbdLUMNB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 21 Dec 2017 07:13:01 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdaHj8SFL5AfSkAqDG0mHpgRVbmHuyrhwMUkEH2c4p0VDg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Cooks <andrew.cooks@opengear.com>, linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Ken Xue <Ken.Xue@amd.com>, Tobias Diedrich <ranma+kernel@tdiedrich.de>, Sudheesh Mavila <sudheesh.mavila@amd.com>, platypus-sw <platypus-sw@opengear.com>, Timur Tabi <timur@codeaurora.org>

On Thu, Dec 21, 2017 at 11:11:18AM +0100, Linus Walleij wrote:
> > In contrast, the pinctrl-amd driver only mentions the newer KERNCZ platform
> > name and uses ACPI for probing without disclosing any Family or Model numbers.
> >
> > pinctrl-amd applies to "AMD0030" and "AMDI0030"
> >
> > The ACPI HID matching makes it difficult to determine what family and model the
> > driver applies to, or rather, I have not been able to find such a mapping of HIDs
> > to family and model numbers. It's also impossible to guess an ACPI _HID
> > that may or may not exist for the Family 16h Model 30h platform and even if I
> > allocate a new HID for our ACPI implementation, that HID has little hope of
> > being accepted into the mainline driver.
> 
> I didn't understand anything of what you just wrote.
> I am basically ignorant when it comes to ACPI details.
> 
> So let's CC the GPIO ACPI maintainer, Mika Westerberg.

If the hardware is not the same that is already supported by the
pinctrl-amd, then you definitely should allocate a new separate ACPI
_HID for it. That's pretty much what we do with every new SoC because
they typically don't have identical pin lists among other things.
