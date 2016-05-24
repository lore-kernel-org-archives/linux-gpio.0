From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [PATCH v2] pinctrl: stm32: factorize
 stm32_pconf_input/output_get()
Date: Tue, 24 May 2016 14:04:21 +0200
Message-ID: <57444345.9030107@st.com>
References: <1464091063-22341-1-git-send-email-patrice.chotard@st.com>
 <1464091063-22341-2-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:42312 "EHLO
	mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754327AbcEXMEz (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 24 May 2016 08:04:55 -0400
In-Reply-To: <1464091063-22341-2-git-send-email-patrice.chotard@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: patrice.chotard@st.com, linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>



On 05/24/2016 01:57 PM, patrice.chotard@st.com wrote:
> From: Patrice Chotard<patrice.chotard@st.com>
>
> As these 2 functions code are 95% similar, factorize them.
>
> Signed-off-by: Patrice Chotard<patrice.chotard@st.com>
> ---
>   drivers/pinctrl/stm32/pinctrl-stm32.c | 31 ++++++++++---------------------
>   1 file changed, 10 insertions(+), 21 deletions(-)

Acked-by: Maxime Coquelin <maxime.coquelin@st.com>

Thanks!
Maxime
