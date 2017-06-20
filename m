From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: [PATCH] gpio: dwapb: fix missing first irq for edgeboth irq
 type
Date: Tue, 20 Jun 2017 10:40:54 +0800
Message-ID: <20170620104054.45847c81@xhacker>
References: <20170601232715.2788-1-xgchenshy@gmail.com>
        <CACRpkdbnXOab-wn3z9BQrs7RVrqag8wtdwsmUvekYLY29rxdVw@mail.gmail.com>
        <20170612130530.724305b5@xhacker>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:32922 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750990AbdFTCpo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 19 Jun 2017 22:45:44 -0400
In-Reply-To: <20170612130530.724305b5@xhacker>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: xgchenshy@gmail.com, Hoan Tran <hotran@apm.com>, Jiang Qiu <qiujiang@huawei.com>, Jamie Iles <jamie@jamieiles.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, 12 Jun 2017 13:05:30 +0800 Jisheng Zhang wrote:

> On Fri, 9 Jun 2017 11:26:19 +0200 Linus Walleij wrote:
> 
> > 
> > On Fri, Jun 2, 2017 at 1:27 AM,  <xgchenshy@gmail.com> wrote:  
> > > From: Xiaoguang Chen <xgchenshy@gmail.com>
> > >
> > > dwapb_irq_set_type overwrites polarity register value for
> > > IRQ_TYPE_EDGE_BOTH case. If the polarity of one gpio is 0
> > > by default, then it will set falling edge irq trigger.
> > > and the gpio may requires rising edge irq for the first time,
> > > and it will be missed.
> > >
> > > Do not overwrite polarity register for IRQ_TYPE_EDGE_BOTH case
> > > can solve this issue.  
> 
> I think this is a correct fix.
> 
> > >
> > > Signed-off-by: Xiaoguang Chen <xgchenshy@gmail.com>  
> 
> Tested-by: Jisheng Zhang <jszhang@marvell.com>

Per my test, this patch fixes the following bug:

make use of CD-GPIO mechanism. Cold boot with sdcard inserted, hot-unplug
the sdcard, sometimes, kernel won't get the remove interrupt.

Thanks
