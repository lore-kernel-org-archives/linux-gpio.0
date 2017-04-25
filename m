From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH V2 3/4] gpio: Add ROHM BD9571MWV-M PMIC GPIO driver
Date: Tue, 25 Apr 2017 15:41:05 +0200
Message-ID: <4710b052-0634-5779-4dcf-3523ced709f4@gmail.com>
References: <20170424152130.32410-1-marek.vasut+renesas@gmail.com>
 <20170424152130.32410-3-marek.vasut+renesas@gmail.com>
 <CACRpkdYR2mE6sOoP_WgsNtXsGvFhFE3bAgVDoNsaAQ7E4dZE=A@mail.gmail.com>
 <ae65d889-baf4-e24b-d72d-05f29bba4f87@gmail.com>
 <20170425122144.lxeuxohwg2rnw3zn@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36118 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758807AbdDYNuV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Apr 2017 09:50:21 -0400
In-Reply-To: <20170425122144.lxeuxohwg2rnw3zn@dell>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>

On 04/25/2017 02:21 PM, Lee Jones wrote:
> On Tue, 25 Apr 2017, Marek Vasut wrote:
> 
>> On 04/25/2017 11:32 AM, Linus Walleij wrote:
>>> On Mon, Apr 24, 2017 at 5:21 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
>>>
>>>> Add driver for the GPIO block in the ROHM BD9571MWV-W MFD PMIC.
>>>> This block is pretty trivial and supports setting GPIO direction
>>>> as Input/Output and in case of Output, supports setting value.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>> Cc: linux-gpio@vger.kernel.org
>>>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>>> Cc: Linus Walleij <linus.walleij@linaro.org>
>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>> ---
>>>> V2: Use linux/gpio/driver.h instead of linux/gpio.h
>>>
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>
>>> Are you merging this through MFD?
>>
>> I thought that was a question for Lee initially , IMO it'd make sense if
>> this went through one tree.
> 
> Because your mailer is broken, I know have no idea which thread this
> mail belongs to.  Please fix your mailer to reply 'threaded'.

You just were not on CC for the whole series, just the MFD part,
probably that was the mistake, sorry. PW links below:

https://patchwork.kernel.org/patch/9696589/
https://patchwork.kernel.org/patch/9696591/
https://patchwork.kernel.org/patch/9696597/
https://patchwork.kernel.org/patch/9696593/

-- 
Best regards,
Marek Vasut
