From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/3] extcon: gpio: Localize platform data
Date: Fri, 02 Mar 2018 08:32:39 +0900
Message-ID: <5A988D97.9080805@samsung.com>
References: <20180212085314.23014-1-linus.walleij@linaro.org>
        <CGME20180301091450epcas3p2a8ee4986c2f9e24c05c0132e659232bb@epcas3p2.samsung.com>
        <CACRpkdanbnodBa335hM5DYpgeW-6pU_oB_vbbUSxR2wRS6FPsw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <CACRpkdanbnodBa335hM5DYpgeW-6pU_oB_vbbUSxR2wRS6FPsw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-gpio@vger.kernel.org

Hi,

On 2018년 03월 01일 18:14, Linus Walleij wrote:
> On Mon, Feb 12, 2018 at 9:53 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> 
>> Nothing in the entire kernel #includes <linux/extcon/extcon-gpio.h>
>> so move the platform data declaration inside of the driver.
>>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> No reply on these patches so far,
> if you prefer I can just apply them to the GPIO
> tree.

I'm sorry for late reply. The extcon-gpio.c should be solved
how to to get the unique id such as EXTCON_USB, EXTCON_DISP_HDMI and so on.
As you knew, you already tried to develop it with device-tree.
But, it is not accepted.

Even if extcon-gpio.c has a problem still to get the extcon id,
I'll apply this series. Because I don't want to remove extcon-gpio.c
and you need to clean-up the gpio library. On later, I'll try to fix this issue.

I added the 'FIXME' comment which explains the extcon_id issue
and then applied this series.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
