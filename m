From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] gpio: dwapb: enable for Quark
Date: Tue, 17 Mar 2015 14:28:54 +0200
Message-ID: <1426595334.14897.316.camel@linux.intel.com>
References: <1425573965-6971-1-git-send-email-andriy.shevchenko@linux.intel.com>
	 <CACRpkdbcgJA4x_Xub_J2TiV6_uFD1x5EOwCxpQ3OgpzD=DFFTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:32478 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752096AbbCQM25 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 17 Mar 2015 08:28:57 -0400
In-Reply-To: <CACRpkdbcgJA4x_Xub_J2TiV6_uFD1x5EOwCxpQ3OgpzD=DFFTg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Raymond Tan <raymond.tan@intel.com>, "Ong, Boon Leong" <boon.leong.ong@intel.com>

On Tue, 2015-03-17 at 13:20 +0100, Linus Walleij wrote:
> On Thu, Mar 5, 2015 at 5:46 PM, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > The Intel Quark SoC contains the DW GPIO on board. While fixing the build error
> > the commit 1972c97db5b0 (gpio: dwapb: fix compile errors) disables the
> > possibility to build the driver on X86, i.e. Intel Quark.
> >
> > The patch reenables it for Intel Quark as well.
> >
> > Since we have Intel Quark SoC introduced in 4.0-rc1 I would like to make this
> > fix available there as well, though the actual MFD driver [1] is not yet
> > applied.
> >
> > [1] https://lkml.org/lkml/2015/2/1/217
> >
> > Fixes: 1972c97db5b0 (gpio: dwapb: fix compile errors)
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Sorry commit b90f8f22ed86f4f1a38dd2178c4be558c0c70fb9
> "gpio: dwapb: re-enable GPIO_DWAPB for arm64"
> conflicts, re-enabling it for ARM64.
> 
> Can you rebase ... part of me just wanna enable this driver
> for the whole world, don't see why we need to narrow it down
> so much.

There was a v2 of that patch. Can you try it?
http://comments.gmane.org/gmane.linux.kernel.gpio/6552

-- 
Andy Shevchenko <andriy.shevchenko@intel.com>
Intel Finland Oy

