From: =?UTF-8?B?6ZmI6LGq?= <jacobchen110@gmail.com>
Subject: Re: [PATCH] pinctrl: rockchip: don't disable clk when irq mask is
 already set
Date: Sat, 24 Sep 2016 22:42:31 +0800
Message-ID: <CAFLEztQHyJ5XJ_3KqHjNQFHSH3H3tP=AVO7ePnuYYFqrFMqv9Q@mail.gmail.com>
References: <1474655197-26919-1-git-send-email-jacob-chen@iotwrt.com> <fb4ec747-fde3-142b-1963-be3b9cfab260@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:38348 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753315AbcIXOmd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Sep 2016 10:42:33 -0400
In-Reply-To: <fb4ec747-fde3-142b-1963-be3b9cfab260@rock-chips.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-gpio@vger.kernel.org

2016-09-24 18:24 GMT+08:00 Shawn Lin <shawn.lin@rock-chips.com>:
> On 2016/9/24 2:26, Jacob Chen wrote:
>>
>> From: Jacob Chen <jacob2.chen@rock-chips.com>
>>
>> In some drivers, disable_irq() call don't be symmetric with enable_irq()
>> , disable_irq() will be called before call free_irq().
>
>
> Which upstream drivers you refer to?
>
> Shouldn't it be the unbalanced call for these drivers?
>


I met this in bcmdhd driver, it seems upstream brcmfmac driver don't
have this problem.

======================================================================
void bcmsdh_oob_intr_unregister(bcmsdh_info_t *bcmsdh)
{
    int err = 0;
    bcmsdh_os_info_t *bcmsdh_osinfo = bcmsdh->os_cxt;

    SDLX_MSG(("%s: Enter\n", __FUNCTION__));
    if (!bcmsdh_osinfo->oob_irq_registered) {
        SDLX_MSG(("%s: irq is not registered\n", __FUNCTION__));
    return;
}
    if (bcmsdh_osinfo->oob_irq_wake_enabled) {
    err = disable_irq_wake(bcmsdh_osinfo->oob_irq_num);
    if (!err)
        bcmsdh_osinfo->oob_irq_wake_enabled = FALSE;
    }
    if (bcmsdh_osinfo->oob_irq_enabled) {
        disable_irq(bcmsdh_osinfo->oob_irq_num);
        bcmsdh_osinfo->oob_irq_enabled = FALSE;
    }
    free_irq(bcmsdh_osinfo->oob_irq_num, bcmsdh);
    bcmsdh_osinfo->oob_irq_registered = FALSE;
}
======================================================================
In this funciton, it will disable irq before free_irq.
At first, i think that commenting the line
"disable_irq(bcmsdh_osinfo->oob_irq_num);" can slove this problem,
but actually this driver have many hidden calls to disable_irq and
hardlly to correct....

Besides, I think that umask() and mask() aren't supposed to be strict symmetric.

>>
>> But both disable_irq() and free_irq() will call
>> rockchip_irq_gc_mask_set_bit,
>>  and clk_disable() will be called more times than clk_enable(), which will
>> cause bugs.
>>
>> I think we can correct that by checking of mask.If mask is already set, do
>> nothing.
>>
>
> Looks like a little hacky to me.
>

Yes, it's pretty hacky, but i think it can work stable since this
condition only take effect when disbale_irq + free_irq was called.
