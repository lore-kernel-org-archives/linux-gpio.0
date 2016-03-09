From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: core: only call
 pinctrl_provide_dummies() on SuperH
Date: Wed, 9 Mar 2016 15:25:55 +0300
Message-ID: <56E01653.3050006@cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
 <14300712.5chtEzsjIN@wasted.cogentembedded.com>
 <CACRpkdYGaAVz=Njykq9FhEdxLM62bP-G6vxPDH74vX61NEva7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f172.google.com ([209.85.217.172]:33441 "EHLO
	mail-lb0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751932AbcCIMZ4 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2016 07:25:56 -0500
Received: by mail-lb0-f172.google.com with SMTP id k15so63189649lbg.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Mar 2016 04:25:55 -0800 (PST)
In-Reply-To: <CACRpkdYGaAVz=Njykq9FhEdxLM62bP-G6vxPDH74vX61NEva7A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

Hello.

On 3/9/2016 2:09 PM, Linus Walleij wrote:

>> The 'ravb' Ethernet driver couldn't connect to  the PHY as the MDIO bus
>> appeared empty on the Renesas R-Car boards. The bug hunt finally pointed
>> at  the commit adding the "init" pintcrl state: it tries to switch to non-
>> default state before the driver probe which should fail but doesn't as the
>> PFC pinctrl driver happens to call pinctrl_provide_dummies()  which makes
>> all state lookups succeed, even though the state doesn't really exist.
>> That feature is only relevant to non-DT systems and all the ARM boards
>> that use the PFC driver  have been converted to the DT boot, so limiting
>> it to the SuperH architecture seems The Right Thing...
>>
>> Fixes: ef0eebc05130 ("drivers/pinctrl: Add the concept of an "init" state")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> CC: stable@vger.kernel.org
>
> Putting this on hold because another patch is being discussed as a
> more proper fix.

    Sigh, I had that variant of the fix too but erroneously thought that 
of_have_populated_dt() could only be used with CONFIG_OF=y, so didn't publish 
that variant... Had no idea someone else's working on the same issue.

> Yours,
> Linus Walleij

MBR, Sergei

