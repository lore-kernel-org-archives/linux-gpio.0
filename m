From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] pinctrl: intel: Only restore pins that are used by the driver
Date: Wed, 12 Oct 2016 09:35:57 +0800
Message-ID: <CAFv23Qkv_rUnwgr3=CTgN=GEpP=JpfW9NNMnypwNEtcVaV=ZrQ@mail.gmail.com>
References: <CAFv23Q=_wSqhBE9ni9YmtxyEKFSENLYZ512Ent9iyWd7hv3gYg@mail.gmail.com>
 <20161010133931.88055-1-mika.westerberg@linux.intel.com> <0e3bf0b8c82d4c3ca6d753abfd1063bf@ausx13mpc124.AMER.DELL.COM>
 <20161010145346.GI30800@lahna.fi.intel.com> <CAFv23Qn+dDRyGutHBh0FfXRBZCmfTf_B0bQy-E-bb+4Nx+Xx2Q@mail.gmail.com>
 <CAFv23QkWFkzGsUFEN5GW+47qQgNAtqSnXZeU_phos=J7czrKgQ@mail.gmail.com> <20161011092728.GE2774@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f172.google.com ([209.85.220.172]:33898 "EHLO
        mail-qk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752089AbcJLBg6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2016 21:36:58 -0400
Received: by mail-qk0-f172.google.com with SMTP id f128so12604073qkb.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Oct 2016 18:35:58 -0700 (PDT)
In-Reply-To: <20161011092728.GE2774@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Mario.Limonciello@dell.com, Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Calvin Johnson <linux.cj@gmail.com>, Jared.Dominguez@dell.com, linux-gpio@vger.kernel.org

Cool, the fix works for me.

I really hope these fixes could be in stable kernel from 4.1+,
but if you have any concerns or troubles in doing that, please let me know,
I'll submit those patches to ubuntu 4.4 and 4.8 kernels.
Thanks.

2016-10-11 17:27 GMT+08:00 Mika Westerberg <mika.westerberg@linux.intel.com>:
> On Tue, Oct 11, 2016 at 10:38:27AM +0800, AceLan Kao wrote:
>> Hi Mika,
>>
>> BTW, I failed to compile the kernel 4.4 with the patch.
>>
>> The patch uses gpiochip_line_is_irq() function which has been
>> introduced since 4.6-rc1, so we need to cherry pick this commit, too.
>>    6cee382 gpio/pinctrl: sunxi: stop poking around in private vars
>>
>> But the above commit uses gpiodev data member in struct gpio_chip
>> which is introduced from this commit, and it's a big commit that can't
>> be cherry-picked clearly.
>>    ff2b135 gpio: make the gpiochip a real device
>>
>> Will you provide other patch that can apply on top of old stable kernels?
>
> Hmm,
>
> So 6cee382 ("gpio/pinctrl: sunxi: stop poking around in private vars")
> needs the following patch.
>
> I can backport 6cee382 with the below patch and send both patches to
> stable@ after this gets merged to mainline but not sure if that's the
> correct process to follow.
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index db007a3e2af7..6240dd40e8be 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1524,7 +1524,7 @@ bool gpiochip_line_is_irq(struct gpio_chip *chip, unsigned int offset)
>         if (offset >= chip->ngpio)
>                 return false;
>
> -       return test_bit(FLAG_USED_AS_IRQ, &chip->gpiodev->descs[offset].flags);
> +       return test_bit(FLAG_USED_AS_IRQ, &chip->desc[offset].flags);
>  }
>  EXPORT_SYMBOL_GPL(gpiochip_line_is_irq);
>
