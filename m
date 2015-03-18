From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [STLinux Kernel] [PATCH 5/6] pinctrl: st: Show correct pin direction
 -- even when in GPIO mode
Date: Wed, 18 Mar 2015 17:45:08 +0100
Message-ID: <5509AB94.8040100@st.com>
References: <1426675899-19882-1-git-send-email-lee.jones@linaro.org> <1426675899-19882-6-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:48169 "EHLO
	mx08-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932069AbbCRQpl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 18 Mar 2015 12:45:41 -0400
In-Reply-To: <1426675899-19882-6-git-send-email-lee.jones@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: kernel@stlinux.com



On 03/18/2015 11:51 AM, Lee Jones wrote:
> Until now ST's pinconf_dbg_show() call-back has displayed the PIO
> alternate function direction, which is only relevant if a pin is
> operating in an alternate function mode i.e not GPIO mode.  If a
> pin is in GPIO mode its direction is both set and status is
> obtained by a completely different/unrelated bunch of registers.
>
> This change ensures that the correct pin direction is shown, even
> if a pin is operating in GPIO mode.
>
> Reported-by: Olivier Clergeaud <olivier.clergeaud@st.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/pinctrl/pinctrl-st.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
>


Acked-by: Maxime Coquelin <maxime.coquelin@st.com>

Thanks,
Maxime
