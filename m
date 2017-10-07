From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv2] Add a GPIO driver for Altera FPGA Manager Fabric I/O
Date: Sun, 8 Oct 2017 01:37:46 +0200
Message-ID: <CACRpkdapoA3ftrcH2gwSTXj28sjXS7rvRsYk9QPoQe6+1sXydA@mail.gmail.com>
References: <AM5PR0701MB2657A33A85F675C4A0175CE0E4670@AM5PR0701MB2657.eurprd07.prod.outlook.com>
 <CACRpkda39LU8hynYtnMyKxm+A8Behkam8CWBTSkt+0U_Fw_VtQ@mail.gmail.com>
 <8da7f1f2-7934-0b88-6eb1-8cdce8d5a7ea@hotmail.de> <CACRpkdYFct4VWe7AUJR_CCw25bRQDjSLCgDb1phMaTKuNz6bxA@mail.gmail.com>
 <AM5PR0701MB26578D847A68BB475974BAE2E4760@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f177.google.com ([209.85.223.177]:57247 "EHLO
        mail-io0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752997AbdJGXhr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Oct 2017 19:37:47 -0400
Received: by mail-io0-f177.google.com with SMTP id m81so9276369ioi.13
        for <linux-gpio@vger.kernel.org>; Sat, 07 Oct 2017 16:37:47 -0700 (PDT)
In-Reply-To: <AM5PR0701MB26578D847A68BB475974BAE2E4760@AM5PR0701MB2657.eurprd07.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bernd Edlinger <bernd.edlinger@hotmail.de>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Oct 7, 2017 at 7:39 PM, Bernd Edlinger
<bernd.edlinger@hotmail.de> wrote:

> On 10/07/17 12:39, Linus Walleij wrote:
>> Just resend the patch with a v2 suffix after PATCH.
>>
>> Else I get confused!
>
> Sure, resent patch follows.
> I will send the device tree bindings patch in a separate mail.

The bindings must be reviewed first before I can apply them
and then the driver.

Please keep the patches together in a series 1/2, 2/2.

Please send patches with git send-email as separate mails,
not inline.

Yours,
Linus Walleij
