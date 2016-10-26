From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v8 5/6] mfd: lpc_ich: Add Device IDs for Intel Apollo
 Lake PCH
Date: Wed, 26 Oct 2016 17:18:22 +0100
Message-ID: <20161026161821.GL13127@dell>
References: <1476255066-22653-1-git-send-email-jui.nee.tan@intel.com>
 <1476255066-22653-6-git-send-email-jui.nee.tan@intel.com>
 <20161026130604.GD12618@dell>
 <20161026130631.GE12618@dell>
 <1477494008.5295.10.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:35981 "EHLO
        mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755589AbcJZQPy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 Oct 2016 12:15:54 -0400
Received: by mail-wm0-f45.google.com with SMTP id b80so232763322wme.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Oct 2016 09:15:53 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1477494008.5295.10.camel@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tan Jui Nee <jui.nee.tan@intel.com>, mika.westerberg@linux.intel.com, heikki.krogerus@linux.intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, ptyser@xes-inc.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jonathan.yong@intel.com, ong.hock.yu@intel.com, tony.luck@intel.com, wan.ahmad.zainie.wan.mohamad@intel.com

On Wed, 26 Oct 2016, Andy Shevchenko wrote:

> On Wed, 2016-10-26 at 14:06 +0100, Lee Jones wrote:
> > On Wed, 26 Oct 2016, Lee Jones wrote:
> > 
> > > On Wed, 12 Oct 2016, Tan Jui Nee wrote:
> > > 
> > > > Adding Intel codename Apollo Lake platform device IDs for PCH.
> > > > 
> > > > Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
> > > > ---
> > > > Changes in V8:
> > > > 	- No change
> > > > 
> > > >  drivers/mfd/lpc_ich_core.c  | 6 ++++++
> > > >  include/linux/mfd/lpc_ich.h | 1 +
> > > >  2 files changed, 7 insertions(+)
> > > 
> > > For my own reference:
> > >   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> > 
> > I should really be clear.
> > 
> > Please add my Ack when resubmitting this patch-set.
> 
> ...to this very patch only. Right?

Right.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
