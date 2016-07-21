From: Helmut Grohne <h.grohne@intenta.de>
Subject: Re: [PATCH 4.6 69/81] gpio: zynq: initialize clock even without
 CONFIG_PM
Date: Thu, 21 Jul 2016 12:57:54 +0200
Message-ID: <20160721105754.GA5086@laureti-dev>
References: <20160622223743.240652686@linuxfoundation.org>
 <20160622223746.777833462@linuxfoundation.org>
 <CAKfKVtEFF=PvZ62N-Re9BX4iq+pCK5qchbp7N3TworkpRkAZZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.intenta.de ([194.31.246.158]:45430 "EHLO mail.intenta.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751932AbcGULEC (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 21 Jul 2016 07:04:02 -0400
Content-Disposition: inline
In-Reply-To: <CAKfKVtEFF=PvZ62N-Re9BX4iq+pCK5qchbp7N3TworkpRkAZZQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Cc: linux-gpio@vger.kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

On Fri, Jul 08, 2016 at 10:23:07AM +0200, Shubhrajyoti Datta wrote:
>  A small issue
> 
> Now it will be off by 1 ie we enable twice in probe.
> 
> solution is that either there should be get_sync or clk_enable but not both.

As far as I understand the inner workings of pm_runtime_get_sync this is
not a problem.

> > +       ret = clk_prepare_enable(gpio->clk);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "Unable to enable clock.\n");
> > +               return ret;
> > +       }
> 
> This will now enable the first time.
> >
> > +       pm_runtime_set_active(&pdev->dev);
> the the pm core that it is enabled .

This function sets pdev->dev.power.runtime_status to RPM_ACTIVE (via
__update_runtime_status).

> >         pm_runtime_enable(&pdev->dev);
> >         ret = pm_runtime_get_sync(&pdev->dev);
> 
> this will enable the second time.

The bulk of the work is done by rpm_resume. Close to the top of the
function the runtime_status field is compared to RPM_ACTIVE and if so,
the resume operation is skipped.

Is there any mistake in that analysis?

Helmut
