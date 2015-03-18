From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [STLinux Kernel] [PATCH 6/6] pinctrl: st: Display pin's function
 when printing pinctrl debug information
Date: Wed, 18 Mar 2015 17:35:06 +0100
Message-ID: <5509A93A.5080202@st.com>
References: <1426675899-19882-1-git-send-email-lee.jones@linaro.org> <1426675899-19882-7-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:57301 "EHLO
	mx08-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750729AbbCRQfk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 18 Mar 2015 12:35:40 -0400
In-Reply-To: <1426675899-19882-7-git-send-email-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: kernel@stlinux.com

Hi Lee,

On 03/18/2015 11:51 AM, Lee Jones wrote:
> Great for easily determining which mode a pin is operating in.
> This patch was particularly helpful when debugging a recent GPIO/
> Pinctrl disparity issue.
>
> Before:
>      $ cat /sys/kernel/debug/pinctrl/<pin-controller>/pinconf-pins
>        pin 33 (PIO4[1]):[OE:0,PU:0,OD:0]
>               [retime:0,invclk:0,clknotdat:0,de:0,rt-clk:0,rt-delay:0]
>
> After [GPIO]:
>      $ cat /sys/kernel/debug/pinctrl/<pin-controller>/pinconf-pins
>        pin 33 (PIO4[1]):[OE:0,PU:0,OD:0] GPIO
>               [retime:0,invclk:0,clknotdat:0,de:0,rt-clk:0,rt-delay:0]
>
> After [Alt]:
>      $ cat /sys/kernel/debug/pinctrl/<pin-controller>/pinconf-pins
>        pin 33 (PIO4[1]):[OE:0,PU:0,OD:0] Alt Fn 2
>               [retime:0,invclk:0,clknotdat:0,de:0,rt-clk:0,rt-delay:0]
>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/pinctrl/pinctrl-st.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
A couple of comments below.
Once fixed, you can add my:
Acked-by: Maxime Coquelin <maxime.coquelin@st.com>



>
> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
> index 1cda40e..d5b2ffa 100644
> --- a/drivers/pinctrl/pinctrl-st.c
> +++ b/drivers/pinctrl/pinctrl-st.c
> @@ -1058,18 +1058,28 @@ static void st_pinconf_dbg_show(struct pinctrl_dev *pctldev,
>   {
>   	struct st_pio_control *pc;
>   	unsigned long config;
> +	unsigned int function;
>   	int offset = st_gpio_pin(pin_id);
> +	char f[64];
64 bytes is way too big here
>   
>   	mutex_unlock(&pctldev->mutex);
>   	pc = st_get_pio_control(pctldev, pin_id);
>   	st_pinconf_get(pctldev, pin_id, &config);
>   	mutex_lock(&pctldev->mutex);
> -	seq_printf(s, "[OE:%ld,PU:%ld,OD:%ld]\n"
> +
> +	function = st_pctl_get_pin_function(pc, offset);
> +	if (function)
> +		sprintf(f, "Alt Fn %d", function);
Please use snprintf.

> +	else
> +		sprintf(f, "GPIO");
> +
> +	seq_printf(s, "[OE:%d,PU:%ld,OD:%ld]\t%s\n"
>   		"\t\t[retime:%ld,invclk:%ld,clknotdat:%ld,"
>   		"de:%ld,rt-clk:%ld,rt-delay:%ld]",
>   		!st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset),
>   		ST_PINCONF_UNPACK_PU(config),
>   		ST_PINCONF_UNPACK_OD(config),
> +		f,
>   		ST_PINCONF_UNPACK_RT(config),
>   		ST_PINCONF_UNPACK_RT_INVERTCLK(config),
>   		ST_PINCONF_UNPACK_RT_CLKNOTDATA(config),

Thanks,
Maxime
