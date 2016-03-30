From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.4.x
Date: Wed, 30 Mar 2016 13:33:13 +0300
Message-ID: <1459333993.5907.30.camel@linux.intel.com>
References: <CACPiFCKv=QJ0t5e=9Wm4cC4Spynx-tVCiabL7AcbcOkp_w47fQ@mail.gmail.com>
	 <20160322152218.GA2099@lahna.fi.intel.com>
	 <CACPiFC+hDF0+9vPCrhvo079E6RCVVmZXTS1ziS-jHAAZJQ+wNg@mail.gmail.com>
	 <20160322154950.GB2099@lahna.fi.intel.com>
	 <CACPiFCKS-8re6g1Zbhs8N9D_tDMENqXPeNGRS_0dU6tzz50T8A@mail.gmail.com>
	 <20160322162222.GF2099@lahna.fi.intel.com>
	 <CACPiFCKD_Nwut=GL-xOU5gN2k8Na7pFWdhsms85QsDTvvREJLw@mail.gmail.com>
	 <1458668165.5907.28.camel@linux.intel.com>
	 <CACPiFC+_TpiFFm+hYJd1tX4AnadxSj_KKOtDALjSj0_c8Qa2pA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:38760 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750794AbcC3KcT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 30 Mar 2016 06:32:19 -0400
In-Reply-To: <CACPiFC+_TpiFFm+hYJd1tX4AnadxSj_KKOtDALjSj0_c8Qa2pA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Langhoff <martin.langhoff@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Tue, 2016-03-22 at 13:53 -0400, Martin Langhoff wrote:
> On Tue, Mar 22, 2016 at 1:36 PM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > 
> > # CONFIG_X86_INTEL_LPSS is not set

> adding intel_lpss,intel_lpss_acpi,intel_lpss_pci to blacklisted
> modules in kernel command line did not change things for the better.

It's unrelated.


-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

