From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 00/14] pinctrl-sx150x: Various bug-fixes and code
 simplifications
Date: Wed, 2 Nov 2016 12:01:38 +0100
Message-ID: <9bc0e603-b861-85d8-914f-bd4b6e8a8020@baylibre.com>
References: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478015868-10309-1-git-send-email-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>, linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, linux-kernel@vger.kernel.org, cphealy@gmail.com
List-Id: linux-gpio@vger.kernel.org

On 11/01/2016 04:57 PM, Andrey Smirnov wrote:
> Linus, Neil:
> 
> I've had some help and got my hardware setup modified to enable IRQ
> functionality testing, so ended up looking at the code of SX150x more
> resulting in some code improvements (hopefully) and bugfixes.
> 
> There are many small changes each of which is probably better
> described by corresponding commit's message, however the most
> porminenet changes of the whole patchset are the switch to regmap API
> (patches ## 7,8) and reduction of locking (patch # 9)
> 
> Please let me know what you think.
> 
> Thanks,
> Andrey
> 
> Andrey Smirnov (14):
>   pinctrl-sx150x: Rely on of_modalias_node for OF matching
>   pinctrl-sx150x: Add SX1503 specific data
>   pinctrl-sx150x: Replace magic number in sx150x_init_hw
>   pinctrl-sx150x: Fix incorrect constant in sx150x_init_hw
>   pinctrl-sx150x: Move some code out of sx150x_init_hw
>   pinctrl-sx150x: Improve sx150x_init_misc for SX1504/5/6
>   pinctrl-sx150x: Convert driver to use regmap API
>   pinctrl-sx150x: Replace sx150x_*_cfg by means of regmap API
>   pinctrl-sx150x: Remove excessive locking
>   pinctrl-sx150x: Improve oscio GPIO functions
>   pinctrl-sx150x: Simplify interrupt handler
>   pinctrl-sx150x: Use handle_bad_irq instead of handle_edge_irq
>   pinctrl-sx150x: Remove magic numbers from sx150x_irq_set_type
>   pinctrl-sx150x: Remove magic numbers from sx150x_reset
> 
>  drivers/pinctrl/pinctrl-sx150x.c | 753 +++++++++++++++++++++------------------
>  1 file changed, 416 insertions(+), 337 deletions(-)
> 

Hi Andrey,

This is good, you went faster than me !

Small point, could you add Kconfig dependency on REGMAP ?

I will try out this patchset and hopefully get you a Tested-by in the next few days.

Neil
