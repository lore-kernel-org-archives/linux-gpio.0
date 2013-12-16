From: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [Linux-Xtensa] [PATCH v3] gpio: driver for Xtensa GPIO32
Date: Mon, 16 Dec 2013 08:40:29 +0200
Message-ID: <20131216064029.GC3807@tarshish>
References: <36330381d07aed97fa587a6600ddee5f0be16da5.1386839921.git.baruch@tkos.co.il>
 <20131212181558.GA12555@psi-dev26.jf.intel.com>
 <20131212182442.GN1217@tarshish>
 <20131212192300.GB14726@psi-dev26.jf.intel.com>
 <20131216055032.GB3807@tarshish>
 <8CA974F497CA064FA9926E10ABCC061F047C83D8C3@MAILSJ4.global.cadence.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:32895 "EHLO
	mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750813Ab3LPGkc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 16 Dec 2013 01:40:32 -0500
Content-Disposition: inline
In-Reply-To: <8CA974F497CA064FA9926E10ABCC061F047C83D8C3@MAILSJ4.global.cadence.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marc Gauthier <marc@cadence.com>
Cc: David Cohen <david.a.cohen@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>

Hi Marc,

On Sun, Dec 15, 2013 at 10:11:06PM -0800, Marc Gauthier wrote:
> Baruch Siach wrote:
> [...]
> > We could depend on, say HAVE_XTENSA_GPIO32, and select it
> > from arch/xtensa/Kconfig for the appropriate xtensa variants.
> > The problem is that no current mainline xtensa variant
> > supports GPIO32. So, at some future point one of those who are 
> > looking for unreferenced Kconfig symbols will just remove the 
> > whole driver.
> 
> The Diamond 233L core has GPIO32.
> The GPIO32 option is not mentioned in the variant core.h, however.

Thanks, your are right. The fsf and 232c variants also support GPIO32 
according to their tie.h. I should have used grep earlier. A patch is on the 
way.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
