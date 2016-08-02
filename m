From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Subject: Re: [PATCH 4.6 69/81] gpio: zynq: initialize clock even without CONFIG_PM
Date: Tue, 2 Aug 2016 14:29:05 +0530
Message-ID: <CAKfKVtGedpeOYYaxO4JMoxHeLep5o8C4md1quAsUVQo0vvEtAQ@mail.gmail.com>
References: <20160622223743.240652686@linuxfoundation.org> <20160622223746.777833462@linuxfoundation.org>
 <CAKfKVtEFF=PvZ62N-Re9BX4iq+pCK5qchbp7N3TworkpRkAZZQ@mail.gmail.com> <20160721105754.GA5086@laureti-dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:34019 "EHLO
	mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751716AbcHBI72 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Aug 2016 04:59:28 -0400
Received: by mail-qt0-f196.google.com with SMTP id c52so9248560qte.1
        for <linux-gpio@vger.kernel.org>; Tue, 02 Aug 2016 01:59:07 -0700 (PDT)
In-Reply-To: <20160721105754.GA5086@laureti-dev>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Helmut Grohne <h.grohne@intenta.de>
Cc: linux-gpio@vger.kernel.org, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>

On Thu, Jul 21, 2016 at 4:27 PM, Helmut Grohne <h.grohne@intenta.de> wrote:
> On Fri, Jul 08, 2016 at 10:23:07AM +0200, Shubhrajyoti Datta wrote:
>>  A small issue
>>
>> Now it will be off by 1 ie we enable twice in probe.
>>
>> solution is that either there should be get_sync or clk_enable but not both.
>
> As far as I understand the inner workings of pm_runtime_get_sync this is
> not a problem.

the issue is not with the runtime.
>
>> > +       ret = clk_prepare_enable(gpio->clk);
>> > +       if (ret) {
>> > +               dev_err(&pdev->dev, "Unable to enable clock.\n");
>> > +               return ret;
>> > +       }
>>
>> This will now enable the first time.
>> >
>> > +       pm_runtime_set_active(&pdev->dev);
>> the the pm core that it is enabled .
>
> This function sets pdev->dev.power.runtime_status to RPM_ACTIVE (via
> __update_runtime_status).
>
>> >         pm_runtime_enable(&pdev->dev);
>> >         ret = pm_runtime_get_sync(&pdev->dev);
>>
>> this will enable the second time.
>
> The bulk of the work is done by rpm_resume. Close to the top of the
> function the runtime_status field is compared to RPM_ACTIVE and if so,
> the resume operation is skipped.
>
> Is there any mistake in that analysis?

I feel that if you can print the clk enable count in at boot things
could be easy
to understand.

>
> Helmut
