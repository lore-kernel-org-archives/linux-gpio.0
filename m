From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Subject: Re: [PATCH] gpio: group port-mapped I/O drivers in a menu
Date: Sat, 31 Oct 2015 18:03:01 -0400
Message-ID: <20151031220300.GA18387@ketchup.lan>
References: <1446197896-5383-1-git-send-email-linus.walleij@linaro.org>
 <20151030154645.GA1156@ketchup.mtl.sfl>
 <CACRpkdYOGCD7D98kBeKmJXA31KEpYR+HPQiDep1QFz60F2v9rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([208.88.110.44]:48145 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750763AbbJaWMR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 31 Oct 2015 18:12:17 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdYOGCD7D98kBeKmJXA31KEpYR+HPQiDep1QFz60F2v9rQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, Andreas Bofjall <andreas@gazonk.org>, Simon Guinot <simon.guinot@sequanux.org>, Diego Elio =?iso-8859-1?Q?Petten=F2?= <flameeyes@flameeyes.eu>, Daniel Krueger <daniel.krueger@systec-electronic.com>, Bruno Randolf <br1@einfach.org>

Hi Linus,

On Oct. Saturday 31 (44) 10:11 PM, Linus Walleij wrote:
> On Fri, Oct 30, 2015 at 4:46 PM, Vivien Didelot
> <vivien.didelot@savoirfairelinux.com> wrote:
> 
> >> +menu "Port-mapped I/O GPIO drivers"
> >> +     depends on X86
> >> +
> >> +config GPIO_104_IDIO_16
> >> +     tristate "ACCES 104-IDIO-16 GPIO support"
> >> +     depends on X86
> >
> > Since the menu depends on X86, shouldn't we remove the "depends on X86"
> > of its drivers?
> 
> Maybe. I'm scared of KConfig.
> 
> Will be a separate patch anyways.

Entries will inherit the X86 dependency of the menu, so you can safely
remove it from the entries in this same patch which adds the menu.

Thanks,
-v
