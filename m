From: "Westerberg, Mika" <mika.westerberg@intel.com>
Subject: Re: [PATCH v2 2/2] pinctrl:Intel: implement gpio_irq_enable
Date: Fri, 1 Apr 2016 14:54:09 +0300
Message-ID: <20160401115409.GQ1719@lahna.fi.intel.com>
References: <1458152126-2333-1-git-send-email-qipeng.zha@intel.com>
 <1458152126-2333-2-git-send-email-qipeng.zha@intel.com>
 <CACRpkdZjCBNdbXyxv-dGkWah+4zqmFD0X4AeV9GyQK0o-Gv_ew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:45188 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752492AbcDALyN (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 1 Apr 2016 07:54:13 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZjCBNdbXyxv-dGkWah+4zqmFD0X4AeV9GyQK0o-Gv_ew@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Qipeng Zha <qipeng.zha@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Qi Zheng <qi.zheng@intel.com>

On Thu, Mar 17, 2016 at 03:07:33PM +0100, Linus Walleij wrote:
> On Wed, Mar 16, 2016 at 7:15 PM, Qipeng Zha <qipeng.zha@intel.com> wrote:
> 
> > From: Qi Zheng <qi.zheng@intel.com>
> >
> > There is unexpected gpio interrupt after irq_enable. If not
> > implemeted gpio_irq_enable callback, irq_enable calls irq_unmask
> > instead. But if there was interrupt set before the irq_enable,
> > unmask it may trigger the unexpected interrupt. By implementing
> > the gpio_irq_enable callback, do interrupt status ack, the issue
> > has gone.
> >
> > Signed-off-by: Qi Zheng <qi.zheng@intel.com>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Signed-off-by: Qipeng Zha <qipeng.zha@intel.com>
> 
> Patch applied for fixes.

Linus, what happend to these two patches? I do not find them in the
mainline for some reason.
