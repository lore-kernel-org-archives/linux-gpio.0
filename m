From: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 2/2] pinctrl: sunxi: add support of R40 to A10 pinctrl driver
Date: Fri, 07 Jul 2017 07:13:30 +0800
Message-ID: <72337BAD-680C-46BC-8DF5-645028E08F65@aosc.io>
References: <20170706142822.20296-1-icenowy@aosc.io> <20170706142822.20296-3-icenowy@aosc.io> <20170706205030.e6wzn5n7ix3443cl@flea>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:52831 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752649AbdGFXNn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 6 Jul 2017 19:13:43 -0400
In-Reply-To: <20170706205030.e6wzn5n7ix3443cl@flea>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com



于 2017年7月7日 GMT+08:00 上午4:50:30, Maxime Ripard <maxime.ripard@free-electrons.com> 写到:
>On Thu, Jul 06, 2017 at 10:28:22PM +0800, Icenowy Zheng wrote:
>>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 0),
>>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>> -		  SUNXI_FUNCTION(0x2, "i2c0")),		/* SCK */
>> +		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SCK */
>> +		  SUNXI_FUNCTION_VARIANT(0x3,
>> +					 "pll_lock_dbg",
>> +					 PINCTRL_SUN8I_R40)),
>
>You have a number of lines where the wrapping is not consistent with
>the rest, such as this one, but also...

I think this one is because of extraordinary function name.

>
>>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 20),
>>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>> -		  SUNXI_FUNCTION(0x2, "i2c2")),		/* SCK */
>> +		  SUNXI_FUNCTION(0x2, "i2c2"),		/* SCK */
>> +		  SUNXI_FUNCTION_VARIANT(0x4,
>> +					 "pwm",		/* PWM4 */
>> +					 PINCTRL_SUN8I_R40)),
>
>... this one for example. Please fix this.
>
>Looks good otherwise.
>
>Maxime
