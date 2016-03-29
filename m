From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.4.x
Date: Tue, 29 Mar 2016 12:15:14 +0300
Message-ID: <20160329091514.GA2099@lahna.fi.intel.com>
References: <CACPiFC+hDF0+9vPCrhvo079E6RCVVmZXTS1ziS-jHAAZJQ+wNg@mail.gmail.com>
 <20160322154950.GB2099@lahna.fi.intel.com>
 <CACPiFCKS-8re6g1Zbhs8N9D_tDMENqXPeNGRS_0dU6tzz50T8A@mail.gmail.com>
 <20160322162222.GF2099@lahna.fi.intel.com>
 <CACPiFCKD_Nwut=GL-xOU5gN2k8Na7pFWdhsms85QsDTvvREJLw@mail.gmail.com>
 <1458668165.5907.28.camel@linux.intel.com>
 <CACPiFC+_TpiFFm+hYJd1tX4AnadxSj_KKOtDALjSj0_c8Qa2pA@mail.gmail.com>
 <20160323112532.GK2099@lahna.fi.intel.com>
 <CACPiFCJg0dx+zFnybtMBKH3jKrMQgwpfiD9Q8YhvpvC6YW68Yg@mail.gmail.com>
 <CACPiFC+7m_ePr59M=upxsjXF1f0Z8uLcOiy58DDCcOpOA-rhyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:15677 "EHLO mga04.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756428AbcC2JPT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 29 Mar 2016 05:15:19 -0400
Content-Disposition: inline
In-Reply-To: <CACPiFC+7m_ePr59M=upxsjXF1f0Z8uLcOiy58DDCcOpOA-rhyA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Langhoff <martin.langhoff@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Mon, Mar 28, 2016 at 04:57:04PM -0400, Martin Langhoff wrote:
> Took a few days but managed to get my hands on the laptop again.
> 
> A kernel built with CONFIG_X86_INTEL_LPSS=n boots with noapic in the
> cmdline. Somehow during the build all the PINCTRL options in the
> kernel got switched off, perhaps they depend on X86_INTEL_LPSS?

That's correct.

> If I don't add noapic, we crash during boot.

Okay, so there is something wrong with either IO-APIC or the pinctrl on
this particular machine.

> I'm about to lose access to this laptop as I am traveling back home,
> leaving it with its new owner...

We will try to get one such machine here to debug the issue further.
Thanks.
