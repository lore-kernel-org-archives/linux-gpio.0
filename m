From: "Tan, Jui Nee" <jui.nee.tan@intel.com>
Subject: RE: [PATCH v7 5/6] mfd: lpc_ich: Add Device IDs for Intel Apollo
 Lake PCH
Date: Fri, 7 Oct 2016 07:39:08 +0000
Message-ID: <0158A29DB680F54A88142ED28D55B1D0082F77C7@PGSMSX107.gar.corp.intel.com>
References: <1475056343-31907-1-git-send-email-jui.nee.tan@intel.com>
 <1475056343-31907-6-git-send-email-jui.nee.tan@intel.com>
 <20160929110859.GN1218@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:29129 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756204AbcJGHkR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 7 Oct 2016 03:40:17 -0400
In-Reply-To: <20160929110859.GN1218@lahna.fi.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Mika Westerberg' <mika.westerberg@linux.intel.com>
Cc: "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yong, Jonathan" <jonathan.yong@intel.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Luck, Tony" <tony.luck@intel.com>, "Wan Mohamad, Wan Ahmad Zainie" <wan.ahmad.zainie.wan.mohamad@intel.com>



> -----Original Message-----
> From: Mika Westerberg [mailto:mika.westerberg@linux.intel.com]
> Sent: Thursday, September 29, 2016 7:09 PM
> To: Tan, Jui Nee <jui.nee.tan@intel.com>
> Cc: heikki.krogerus@linux.intel.com; andriy.shevchenko@linux.intel.com;
> tglx@linutronix.de; mingo@redhat.com; hpa@zytor.com; x86@kernel.org;
> ptyser@xes-inc.com; lee.jones@linaro.org; linus.walleij@linaro.org; linux-
> gpio@vger.kernel.org; linux-kernel@vger.kernel.org; Yong, Jonathan
> <jonathan.yong@intel.com>; Yu, Ong Hock <ong.hock.yu@intel.com>; Luck,
> Tony <tony.luck@intel.com>; Wan Mohamad, Wan Ahmad Zainie
> <wan.ahmad.zainie.wan.mohamad@intel.com>
> Subject: Re: [PATCH v7 5/6] mfd: lpc_ich: Add Device IDs for Intel Apollo
> Lake PCH
> 
> On Wed, Sep 28, 2016 at 05:52:22PM +0800, Tan Jui Nee wrote:
> > Adding Intel codename Apollo Lake platform device IDs for PCH.
> >
> > Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
> > ---
> >  drivers/mfd/lpc_ich-core.c  | 6 ++++++
> 
> It should be either lpc_ich_core.c or lpc-ich-core.c. Ditto for -apl.c
> thing.
Thanks for your comment. I will send out another patch-set with filename lpc_ich_core.c and lpc_ich_apl.c.
