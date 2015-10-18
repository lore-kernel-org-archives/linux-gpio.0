From: Marcin Wojtas <mw@semihalf.com>
Subject: Re: [PATCH] pinctrl: mvebu: armada-38x: add suspend/resume support
Date: Sun, 18 Oct 2015 10:43:42 +0200
Message-ID: <CAPv3WKed+Q3K0ky9b9AAYSymB-tE0O=57UdrgM+7Cx-X9PeVcA@mail.gmail.com>
References: <1445117328-31678-1-git-send-email-mw@semihalf.com>
	<20151017222927.GR32532@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151017222927.GR32532@n2100.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: linux-kernel@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, linus.walleij@linaro.org, nadavh@marvell.com, Lior Amsalem <alior@marvell.com>, =?UTF-8?Q?Gregory_Cl=C3=A9ment?= <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Hi Russell,

Thanks for pointing this. I based on pinctrl-armada-xp.c (it needs a
fix then, too) and it worked. I must have missed, because I got proper
registers' number and values in suspend/resume routines. As
pinctrl-armada-xp.c needs also a small fix and in order not to
duplicate code, how about a following solution:
- *mpp_saved_regs and *mpp_base become members of struct mvebu_pinctrl_soc_info
- common mvebu_pinctrl_suspend/resume functions in pinctrl-mvebu.c
(now there will be two users AXP and A38X)

Please let me know what you think.

Best regards,
Marcin



2015-10-18 0:29 GMT+02:00 Russell King - ARM Linux <linux@arm.linux.org.uk>:
> On Sat, Oct 17, 2015 at 11:28:48PM +0200, Marcin Wojtas wrote:
>> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-38x.c b/drivers/pinctrl/mvebu/pinctrl-armada-38x.c
>> index 6ec82c6..094cb48 100644
>> --- a/drivers/pinctrl/mvebu/pinctrl-armada-38x.c
>> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-38x.c
>> @@ -23,6 +23,7 @@
>>  #include "pinctrl-mvebu.h"
>>
>>  static void __iomem *mpp_base;
>> +static u32 *mpp_saved_regs;
>
> I'm not a fan of unnecessary global variables.  It adds to the bulk of
> the kernel when built-in (even though it's in .bss, it still has a cost)
> and these all add up when built-in.
>
> Please make it part of the driver data allocated at probe time.
>
>>  static int armada_38x_mpp_ctrl_get(unsigned pid, unsigned long *config)
>>  {
>> @@ -424,6 +425,7 @@ static int armada_38x_pinctrl_probe(struct platform_device *pdev)
>>       const struct of_device_id *match =
>>               of_match_device(armada_38x_pinctrl_of_match, &pdev->dev);
>>       struct resource *res;
>> +     int nregs;
>>
>>       if (!match)
>>               return -ENODEV;
>> @@ -441,11 +443,44 @@ static int armada_38x_pinctrl_probe(struct platform_device *pdev)
>>       soc->modes = armada_38x_mpp_modes;
>>       soc->nmodes = armada_38x_mpp_controls[0].npins;
>>
>> +     nregs = DIV_ROUND_UP(soc->nmodes, MVEBU_MPPS_PER_REG);
>> +
>> +     mpp_saved_regs = devm_kcalloc(&pdev->dev, nregs, sizeof(u32),
>> +                                   GFP_KERNEL);
>> +     if (!mpp_saved_regs)
>> +             return -ENOMEM;
>> +
>>       pdev->dev.platform_data = soc;
>
> The 'soc' is stored in platform data, not driver data, but...
>
>>
>>       return mvebu_pinctrl_probe(pdev);
>>  }
>>
>> +int armada_38x_pinctrl_suspend(struct platform_device *pdev, pm_message_t state)
>> +{
>> +     struct mvebu_pinctrl_soc_info *soc = platform_get_drvdata(pdev);
>
> You access it through driver data.  Isn't the driver data here a
> struct mvebu_pinctrl pointer?  See platform_set_drvdata() in
> mvebu_pinctrl_probe().
>
>> +     int i, nregs;
>> +
>> +     nregs = DIV_ROUND_UP(soc->nmodes, MVEBU_MPPS_PER_REG);
>> +
>> +     for (i = 0; i < nregs; i++)
>> +             mpp_saved_regs[i] = readl(mpp_base + i * 4);
>> +
>> +     return 0;
>> +}
>> +
>> +int armada_38x_pinctrl_resume(struct platform_device *pdev)
>> +{
>> +     struct mvebu_pinctrl_soc_info *soc = platform_get_drvdata(pdev);
>
> Ditto.
>
> --
> FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
> according to speedtest.net.
