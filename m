From: "Westerberg, Mika" <mika.westerberg@intel.com>
Subject: Re: [PATCH v2 2/2] pinctrl:Intel: implement gpio_irq_enable
Date: Wed, 13 Apr 2016 16:54:03 +0300
Message-ID: <20160413135403.GN1714@lahna.fi.intel.com>
References: <1458152126-2333-1-git-send-email-qipeng.zha@intel.com>
 <1458152126-2333-2-git-send-email-qipeng.zha@intel.com>
 <CACRpkdZjCBNdbXyxv-dGkWah+4zqmFD0X4AeV9GyQK0o-Gv_ew@mail.gmail.com>
 <20160401115409.GQ1719@lahna.fi.intel.com>
 <CACRpkdYQDSMUdRMbCYQ9PzR8mqpSE_DrOtc==NQ=30+sF_hYWQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:54445 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757460AbcDMNyI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 13 Apr 2016 09:54:08 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdYQDSMUdRMbCYQ9PzR8mqpSE_DrOtc==NQ=30+sF_hYWQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Qipeng Zha <qipeng.zha@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Qi Zheng <qi.zheng@intel.com>

On Wed, Apr 13, 2016 at 03:29:00PM +0200, Linus Walleij wrote:
> On Fri, Apr 1, 2016 at 1:54 PM, Westerberg, Mika
> <mika.westerberg@intel.com> wrote:
> > On Thu, Mar 17, 2016 at 03:07:33PM +0100, Linus Walleij wrote:
> >> On Wed, Mar 16, 2016 at 7:15 PM, Qipeng Zha <qipeng.zha@intel.com> wrote:
> >>
> >> > From: Qi Zheng <qi.zheng@intel.com>
> >> >
> >> > There is unexpected gpio interrupt after irq_enable. If not
> >> > implemeted gpio_irq_enable callback, irq_enable calls irq_unmask
> >> > instead. But if there was interrupt set before the irq_enable,
> >> > unmask it may trigger the unexpected interrupt. By implementing
> >> > the gpio_irq_enable callback, do interrupt status ack, the issue
> >> > has gone.
> >> >
> >> > Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> >> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> >> > Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> >>
> >> Patch applied for fixes.
> >
> > Linus, what happend to these two patches? I do not find them in the
> > mainline for some reason.
> 
> I guess lack of patience or me being slow :)
> 
> It's there now AFAICT.

Thank you :)
