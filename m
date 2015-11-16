From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH] pinctrl: fix qcom ssbi drivers for 64-bit compilation
Date: Mon, 16 Nov 2015 10:28:27 -0800
Message-ID: <20151116182826.GD30882@usrtlx11787.corpusers.net>
References: <5235862.Gokjxf5QH1@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([37.139.156.2]:4327 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751266AbbKPS2h (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 16 Nov 2015 13:28:37 -0500
Content-Disposition: inline
In-Reply-To: <5235862.Gokjxf5QH1@wuerfel>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>

On Mon 16 Nov 08:41 PST 2015, Arnd Bergmann wrote:

> When building pinctrl-ssbi-gpio and pinctrl-ssbi-mpp for ARM64, we get
> a compile warning about invalid types:
> 
> drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c: In function 'pm8xxx_gpio_probe':
> drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:675:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c: In function 'pm8xxx_mpp_probe':
> drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c:766:17: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> 
> This changes the code so we cast the pointer to 'unsigned long', which
> is the right thing to do here.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 

Thanks Arnd,

Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Regards,
Bjorn
