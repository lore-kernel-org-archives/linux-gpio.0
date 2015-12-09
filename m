From: Maxime Coquelin <maxime.coquelin@st.com>
Subject: Re: [PATCH 106/182] pinctrl: st: use gpiochip data pointer
Date: Wed, 9 Dec 2015 15:54:44 +0100
Message-ID: <566840B4.40603@st.com>
References: <1449667946-2800-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:5245 "EHLO
	mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751341AbbLIOzA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 09:55:00 -0500
In-Reply-To: <1449667946-2800-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Patrice Chotard <patrice.chotard@st.com>

Hi Linus,

On 12/09/2015 02:32 PM, Linus Walleij wrote:
> This makes the driver use the data pointer added to the gpio_chip
> to store a pointer to the state container instead of relying on
> container_of().
>
> Cc: Srinivas Kandagatla<srinivas.kandagatla@gmail.com>
> Cc: Maxime Coquelin<maxime.coquelin@st.com>
> Cc: Patrice Chotard<patrice.chotard@st.com>
> Signed-off-by: Linus Walleij<linus.walleij@linaro.org>
> ---
>   drivers/pinctrl/pinctrl-st.c | 21 +++++++++------------
>   1 file changed, 9 insertions(+), 12 deletions(-)

Acked-by: Maxime Coquelin <maxime.coquelin@st.com>

Thanks,
Maxime
