From: jacopo mondi <jacopo@jmondi.org>
Subject: Re: [RFC 1/5] pinctrl: rz-pfc: Add Renesas RZ pinctrl core module
Date: Thu, 26 Jan 2017 10:08:23 +0100
Message-ID: <718c2f23-c627-628a-dd27-a52a32afaee4@jmondi.org>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485367787-8109-2-git-send-email-jacopo+renesas@jmondi.org>
 <SG2PR06MB1165F5A3E97EF8381288EDC18A770@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:43724 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751550AbdAZJI2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2017 04:08:28 -0500
In-Reply-To: <SG2PR06MB1165F5A3E97EF8381288EDC18A770@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "geert+renesas@glider.be" <geert+renesas@glider.be>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Chris,

On 26/01/2017 03:58, Chris Brandt wrote:
> Hi Jacopo,
>
> On Wednesday, January 25, 2017, Jacopo Mondi wrote:
>>  drivers/pinctrl/Kconfig             |   1 +
>>  drivers/pinctrl/Makefile            |   1 +
>>  drivers/pinctrl/rz-pfc/Kconfig      |  18 ++
>>  drivers/pinctrl/rz-pfc/Makefile     |   1 +
>>  drivers/pinctrl/rz-pfc/pinctrl-rz.c | 447
>> ++++++++++++++++++++++++++++++++++++
>>  drivers/pinctrl/rz-pfc/pinctrl-rz.h | 114 +++++++++
>>  6 files changed, 582 insertions(+)
>>  create mode 100644 drivers/pinctrl/rz-pfc/Kconfig  create mode 100644
>> drivers/pinctrl/rz-pfc/Makefile  create mode 100644 drivers/pinctrl/rz-
>> pfc/pinctrl-rz.c
>>  create mode 100644 drivers/pinctrl/rz-pfc/pinctrl-rz.h
>
>
>
> I think we should try to avoid the rz naming as much as possible since
> this driver will hopefully be useful for other future Renesas devices if
> they move to a similar pin-control type method. Maybe future "R-car" SoCs?
> Or, maybe Renesas Marketing decides to come up with a new name for SoCs.
>
> Otherwise, you could end up with a directly like "mach-shmobile" filled
> with a bunch of...well...not SH-Mobile parts.
>
> Maybe just
>   drivers/pinctrl/renesas/pinctrl-renesas.c
>

Wouldn't this be confusing, as most of renesas SoC are supported through 
drivers/pinctrl/sh-pfc instead?

I agree on dropping the rz name, if more SoC will come and join the 
pin-based PFC realm...

Thanks
    j



>
>
> Chris
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

