From: Deepak Das <deepak_das@mentor.com>
Subject: Re: [PATCH] gpio: mxc: Shift generic request/free after gpiochip
 registration
Date: Tue, 25 Oct 2016 17:50:50 +0530
Message-ID: <580F4E22.8020805@mentor.com>
References: <580EE62D.4090704@mentor.com>
 <CACRpkdYbMxk_NoJpJS5bU-zOL=aXDAxrhT2LjLSj+CaPaBE7jw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay1.mentorg.com ([192.94.38.131]:45373 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751594AbcJYMVB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Oct 2016 08:21:01 -0400
In-Reply-To: <CACRpkdYbMxk_NoJpJS5bU-zOL=aXDAxrhT2LjLSj+CaPaBE7jw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Vladimir Zapolskiy <Vladimir_Zapolskiy@mentor.com>, Fabio Estevam <fabio.estevam@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



On Tuesday 25 October 2016 05:41 PM, Linus Walleij wrote:
> On Tue, Oct 25, 2016 at 6:57 AM, Deepak Das <deepak_das@mentor.com> wrote:
> 
>> generic gpio request/free should be added after gpiocip registration
>> to validate mapping of gpiochip with pinctrl subsystem.
>>
>> gpiochip->pin_ranges list contains the information used by pinctrl
>> subsystem to configure corresponding pins for gpio usage.
>> This list will be empty if gpiochip fails to map with
>> pinctrl subsystem for any reason.
>> For Ex.:-
>> generic gpio request/free should not be used if IOMUX pin controller
>> device node is disabled in device tree.
>>
>> This commit checks above list and skips adding generic gpio request/free
>> if list is found empty.
>>
>> Signed-off-by: Deepak Das <deepak_das@mentor.com>
>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> 
> Third time I find this in my inbox and it still doesn't apply.
> 
> Yours,
> Linus Walleij

Hi Linus,

Sorry for the trouble. Three patches were sent by mistake. I am rebasing this patch on top of your gpio fixes branch.
This might not be required for stable branch since the original patch 
4c806c9 "gpio: mxc: add generic gpio request/free callbacks to pinctrl" was included in v4.9 so this cane be added in
v4.9 fixes.

with warm regards,
Deepak Das
> 
