From: Darren Hart <dvhart@infradead.org>
Subject: Re: [GIT PULL] Immutable branch between MFD and X86 due for the
 v4.13 merge window
Date: Mon, 19 Jun 2017 12:54:38 -0700
Message-ID: <20170619195438.GB16249@fury>
References: <CAHp75VcQfSkn7NAWSC2Vq=8RCC0M1p9zvVFjJFLyEo17GDvHsA@mail.gmail.com>
 <cover.1496687716.git.sathyanarayanan.kuppuswamy@linux.intel.com>
 <20170619144849.ltx2qny5v66od3ml@dell>
 <CAHp75VcoS4khrYJ_6_hr_s+7eOz0GUA0qrjv5uKvw5KqQUuRMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:40142 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750757AbdFSTym (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2017 15:54:42 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75VcoS4khrYJ_6_hr_s+7eOz0GUA0qrjv5uKvw5KqQUuRMA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, "edubezval@gmail.com" <edubezval@gmail.com>, "Zhang, Rui" <rui.zhang@intel.com>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, USB <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>

On Mon, Jun 19, 2017 at 06:08:27PM +0300, Andy Shevchenko wrote:
> On Mon, Jun 19, 2017 at 5:48 PM, Lee Jones <lee.jones@linaro.org> wrote:
> > Enjoy!
> 
> Thanks!
> 
> I suppose this one kbuild bot doesn't complain about :-)
> 
> Darren, do we need it or we can survive until v4.13-rc1?

I suggest merging it to a local branch for safe keeping and if we see
conflicts in subsequent patches, we can apply it. I doubt it will be a problem.

-- 
Darren Hart
VMware Open Source Technology Center
