From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH] pinctrl: mcp23s08: fix irq setup order
Date: Mon, 8 Jan 2018 13:29:20 +0800
Message-ID: <b8c00c49-5e87-1258-c51d-ed42f4871b42@electromag.com.au>
References: <1514474364-32169-1-git-send-email-mastichi@gmail.com>
 <CACRpkdZp0kp6vTAOj11Tc2mGD4MvWwpMGTQgEhQiQAdUgapcGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy2.45ru.net.au ([203.30.46.146]:46228 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751071AbeAHF3W (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jan 2018 00:29:22 -0500
In-Reply-To: <CACRpkdZp0kp6vTAOj11Tc2mGD4MvWwpMGTQgEhQiQAdUgapcGw@mail.gmail.com>
Content-Language: en-AU
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Dmitry Mastykin <mastichi@gmail.com>, Sebastian Reichel <sre@kernel.org>
Cc: linux-gpio@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 2/01/2018 17:10, Linus Walleij wrote:
> On Thu, Dec 28, 2017 at 4:19 PM, Dmitry Mastykin <mastichi@gmail.com> wrote:
> 
>> When using mcp23s08 module with gpio-keys, often (50% of boots)
>> it fails to get irq numbers with message:
>> "gpio-keys keys: Unable to get irq number for GPIO 0, error -6".
>> Seems that irqs must be setup before devm_gpiochip_add_data().
>>
>> Signed-off-by: Dmitry Mastykin <mastichi@gmail.com>
> 
> Patch applied, albeit for devel.
> 
> Should it be tagged for stable or go into fixes?
> 
I'm no expert on this one, but looking at other drivers they're using a mixture of ordering
for irq setup and devm_gpiochip_add_data() calls.

But should probably go into stable if it is the fix.


-- 
Regards
Phil Reid

