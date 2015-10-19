From: Marcin Wojtas <mw@semihalf.com>
Subject: Re: [PATCH] pinctrl: mvebu: armada-38x: add suspend/resume support
Date: Mon, 19 Oct 2015 08:04:49 +0200
Message-ID: <CAPv3WKdKea-85_0xUv218OVfhnfMvisYXh8qRNRjvmNkweSUJg@mail.gmail.com>
References: <1445117328-31678-1-git-send-email-mw@semihalf.com>
	<20151017222927.GR32532@n2100.arm.linux.org.uk>
	<CAPv3WKed+Q3K0ky9b9AAYSymB-tE0O=57UdrgM+7Cx-X9PeVcA@mail.gmail.com>
	<20151018160123.6694b4be@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:36131 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750912AbbJSGEt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2015 02:04:49 -0400
Received: by oiao187 with SMTP id o187so35424475oia.3
        for <linux-gpio@vger.kernel.org>; Sun, 18 Oct 2015 23:04:49 -0700 (PDT)
In-Reply-To: <20151018160123.6694b4be@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, nadavh@marvell.com, linux-gpio@vger.kernel.org, Lior Amsalem <alior@marvell.com>, =?UTF-8?Q?Gregory_Cl=C3=A9ment?= <gregory.clement@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>

Hi Thomas,

2015-10-18 16:01 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello Marcin,
>
> On Sun, 18 Oct 2015 10:43:42 +0200, Marcin Wojtas wrote:
>
>> Thanks for pointing this. I based on pinctrl-armada-xp.c (it needs a
>> fix then, too) and it worked. I must have missed, because I got proper
>> registers' number and values in suspend/resume routines. As
>> pinctrl-armada-xp.c needs also a small fix and in order not to
>> duplicate code, how about a following solution:
>> - *mpp_saved_regs and *mpp_base become members of struct mvebu_pinctrl_soc_info
>
> I don't like this. The mvebu_pinctrl_soc_info structure is meant to be
> a read-only structure that only describes static information giving
> SoC-specific details for pin-muxing. The idea is that in the event
> where you had multiple pinctrl in the same system, you would still have
> only one instance of mvebu_pinctrl_soc_info.

Ok, understood. What with current static globals, like mpp_base? This
is a problem when we consider hypothetical multi-pintrl system...

>
> So, I'd prefer if mpp_saved_regs and mpp_base became members of a new
> structure, that gets allocated at ->probe() time, on a per-instance
> basis.
>
>> - common mvebu_pinctrl_suspend/resume functions in pinctrl-mvebu.c
>> (now there will be two users AXP and A38X)
>
> Not sure how to handle that if the per-instance structure is defined on
> a per-SoC basis, but I'm interested in seeing proposals.
>

In genereal, I think storing additional global data is not
starightforward, as dev->platform_data and dev->driver_data are
currently occupied by mvebu_pinctrl and mvebu_pinctrl_soc_info. I
propose the following:

1. Create a new structure:
struct mvebu_pinctrl_pm_info {
    void __iomem *base;
    static u32 *mpp_saved_regs;
    int nregs;
}

2. Add new field to struct mvebu_pinctrl:
struct mvebu_pinctrl_pm_info *pm_info;

3. In armada_38x/xp_pinctrl_probe we do the allocations and pass
struct pm_info using dev->driver data (later in mvebu_pinctrl_probe it
will be replaced by struct mvebu_pinctrl):
platform_set_drvdata(pdev, pm_info);

return mvebu_pinctrl_probe(pdev);

4. In mvebu_pinctrl_probe:
struct mvebu_pinctrl_pm_info *pm_info = platform_get_drvdata(pdev);
(...)

if (pm_info)
    pctl->pm_info = pm_info;
platform_set_drvdata(pdev, pctl);

5. Now, we can simply use all stored data in common
mvebu_pinctrl_suspend/resume.

I hope the above is clear. I'm looking forward to your opinion.

Beste regards,
Marcin
