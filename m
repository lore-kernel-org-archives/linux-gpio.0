From: arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: Re: [PATCH V1] pinctrl:pxa:pinctrl-pxa2xx:- No need of devm functions
Date: Sun, 11 Dec 2016 13:34:06 +0530
Message-ID: <e6f176d2-c5f0-e3f5-0cc4-576c605da387@gmail.com>
References: <1481207730-6332-1-git-send-email-arvind.yadav.cs@gmail.com>
 <87eg1g16r8.fsf@belgarion.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36233 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753171AbcLKIEM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Dec 2016 03:04:12 -0500
In-Reply-To: <87eg1g16r8.fsf@belgarion.home>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: daniel@zonque.org, haojian.zhuang@gmail.com, linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Yes, It will not fixes any defect. But we are going to free allocate
memory then why we need devm api. In this case Devm will first add this
entry to list and immediately  it will remove from list.

-Arvind

On Saturday 10 December 2016 02:49 PM, Robert Jarzmik wrote:
> Arvind Yadav <arvind.yadav.cs@gmail.com> writes:
>
> Hi Arvind,
>
>> In functions pxa2xx_build_functions, the memory allocated for
>> 'functions' is live within the function only. After the
>> allocation it is immediately freed with devm_kfree. There is
>> no need to allocate memory for 'functions' with devm function
>> so replace devm_kcalloc  with kcalloc and devm_kfree with kfree.
> That's not very true : the "need" is to spare the "manual" kfree you're adding
> in your patch for one, and make it consistent with pxa2xx_build_groups() and
> pxa2xx_build_state() for two.
>
> Therefore I'm not very thrilled by this patch and unless it fixes a defect in
> the driver I'd rather not have it in.
>
> Cheers.
>
> --
> Robert

