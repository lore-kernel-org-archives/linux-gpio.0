From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] gpio: pca953x: fix vendor prefix for PCA9654
Date: Fri, 17 Nov 2017 13:47:04 +0300
Message-ID: <7232ae40-189b-9ec5-87ef-7933e161422f@cogentembedded.com>
References: <20171116201842.006310882@cogentembedded.com>
 <CAMuHMdVAD5saFjnkMViTeCm2vDYfEraq9DdHqNLet3YHjo0UeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:37389 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751268AbdKQKrH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Nov 2017 05:47:07 -0500
Received: by mail-lf0-f68.google.com with SMTP id y2so1268792lfj.4
        for <linux-gpio@vger.kernel.org>; Fri, 17 Nov 2017 02:47:07 -0800 (PST)
In-Reply-To: <CAMuHMdVAD5saFjnkMViTeCm2vDYfEraq9DdHqNLet3YHjo0UeQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

On 11/17/2017 12:06 PM, Geert Uytterhoeven wrote:

>> Despite commit 55020c8056a8 ("of: Add vendor prefix for ON Semiconductor
>> Corp.") was made long ago, the latter commit 9f49f6dd0473 ("gpio: pca953x:
>> add onsemi,pca9654 id") made use of another, undocumented vendor prefix.
> 
> Ouch...
> 
>> Since such prefix doesn't seem to be used in any device trees, I think we
>> can just fix the "compatible" string in the driver and the bindings and be
>> done with that...
>>
>> Fixes: 9f49f6dd0473 ("gpio: pca953x: add onsemi,pca9654 id")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> The patch is against the 'fixes' branch of LinusW's 'linux-gpio.git' repo.
>>
>>   Documentation/devicetree/bindings/gpio/gpio-pca953x.txt |    2 +-
>>   drivers/gpio/gpio-pca953x.c                             |    2 +-
> 
> There's another (different) one in
> Documentation/devicetree/bindings/misc/idt_89hpesx.txt

    Saw that. Do you think it also should be fixed (in this patch)?

> Gr{oetje,eeting}s,
> 
>                          Geert

MBR, Sergei
