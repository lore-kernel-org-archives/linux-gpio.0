From: "David.Wu" <david.wu@rock-chips.com>
Subject: Re: [PATCH 2/2] pinctrl: rockchip: Fix the correct routing config for
 the gmac-m1 pins of rmii and rgmii
Date: Mon, 9 Oct 2017 09:21:22 +0800
Message-ID: <19faa81c-aebb-0786-54fd-93b0a5a18b9a@rock-chips.com>
References: <1506773601-27315-1-git-send-email-david.wu@rock-chips.com>
 <1506773601-27315-3-git-send-email-david.wu@rock-chips.com>
 <1908269.6t3djq65xf@phil>
 <CACRpkdYOuf_8_EWg1GtV-75YvmnLkpadKrGMfQZ2v2RRqbYvRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.130]:44052 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753280AbdJIBVZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 8 Oct 2017 21:21:25 -0400
In-Reply-To: <CACRpkdYOuf_8_EWg1GtV-75YvmnLkpadKrGMfQZ2v2RRqbYvRw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Tao Huang <huangtao@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

Thanks for you adding it.
I left the office for a few days due to holiday.

在 2017/10/7 18:32, Linus Walleij 写道:
> On Sat, Sep 30, 2017 at 5:07 PM, Heiko Stuebner <heiko@sntech.de> wrote:
>> Am Samstag, 30. September 2017, 20:13:21 CEST schrieb David Wu:
>>> If the gmac-m1 optimization(bit10) is selected, the gpio function
>>> of gmac pins is not valid. We may use the rmii mode for gmac interface,
>>> the pins such as rx_d2, rx_d3, which the rgmii mode used, but rmii not
>>> used could be taken as gpio function. So gmac_rxd0m1 selects the bit2,
>>> and gmac_rxd0m3 select bit10 is more correct.
>>>
>>> Signed-off-by: David Wu <david.wu@rock-chips.com>
>>
>> the patch subject should mention the the rk3328 whose routing gets fixed
>> (like adding a simple "on rk3328" to it), otherwise
>>
>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> 
> I added rk3328 to it, also assumed this Reviewed-by covers patch 1/2
> as well and applied both with your tag.
> 
> Yours,
> Linus Walleij
> 
> 
> 

