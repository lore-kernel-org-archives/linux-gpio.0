From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [STLinux Kernel] [PATCH 1/6] ARM: STi: DT: STiH407: Fix retime
 pin mask for PIO5 and PIO35
Date: Wed, 18 Mar 2015 17:36:56 +0100
Message-ID: <5509A9A8.5090206@st.com>
References: <1426675899-19882-1-git-send-email-lee.jones@linaro.org> <1426675899-19882-2-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:47687 "EHLO
	mx08-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755552AbbCRQh1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 18 Mar 2015 12:37:27 -0400
In-Reply-To: <1426675899-19882-2-git-send-email-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: kernel@stlinux.com, Karim BEN BELGACEM <karim.ben-belgacem@st.com>



On 03/18/2015 11:51 AM, Lee Jones wrote:
> From: Karim BEN BELGACEM <karim.ben-belgacem@st.com>
>
> This will avoid programming the retime registers when not implemented
>
> - PIO5  : no retime registers assigned to pins 6 and 7
> - PIO35 : pin 7 is reserved so no retime register assigned to it
>
> Signed-off-by: Karim BEN BELGACEM <karim.ben-belgacem@st.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   arch/arm/boot/dts/stih407-pinctrl.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
>

Acked-by: Maxime Coquelin <maxime.coquelin@st.com>

Thanks,
Maxime
