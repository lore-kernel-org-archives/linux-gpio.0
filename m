From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [PATCH] gpio: xtensa: fix build when XCHAL_HAVE_CP is 0
Date: Thu, 23 Jan 2014 10:59:57 +0200
Message-ID: <20140123085957.GC12751@tarshish>
References: <4fa4f5ee7ded179ab42bb1b028955252e4e307c2.1390459838.git.baruch@tkos.co.il>
 <CACRpkdaGjr2CdHkQcv+L1HoGL16Eef0r7T2ru=1giw31_Bu4bA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:36732 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751939AbaAWJAC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 23 Jan 2014 04:00:02 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdaGjr2CdHkQcv+L1HoGL16Eef0r7T2ru=1giw31_Bu4bA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-xtensa@linux-xtensa.org

Hi Linus,

On Thu, Jan 23, 2014 at 09:46:42AM +0100, Linus Walleij wrote:
> On Thu, Jan 23, 2014 at 7:50 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > In xtensa coprocessors may exist without coprocessor context, i.e. they 
> > cannot
> > be disabled/enabled. In this case the RSR_CPENABLE/WSR_CPENABLE are undefined,
> > thus breaking the build. Fix the build by adding dummy versions of
> > enable_cp/disable_cp in this case.
> >
> > Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> Patch applied for fixes, but I really don't like this compile-time
> thing. It'd be better if your Xtensa code would adjust to different
> hardware at runtime rather than compile time. This is the overall
> kernel design pattern these days AFICT.

We are talking about Xtensa here, not ARM. Different Xtensa variants are 
binary incompatible from each other is some very fundamental ways. In most 
cases you even need a different toolchain for each variant. Given that, I'm 
not sure that runtime hardware check is worth it, or even possible is some 
cases.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
