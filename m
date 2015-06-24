From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 8/8] pinctrl: qcom: ssbi: Family A gpio & mpp drivers
Date: Wed, 24 Jun 2015 20:54:37 +0100
Message-ID: <558B0AFD.8050202@linaro.org>
References: <1434610052-602-1-git-send-email-bjorn.andersson@sonymobile.com> <1434610052-602-9-git-send-email-bjorn.andersson@sonymobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:33268 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753276AbbFXTyq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Jun 2015 15:54:46 -0400
Received: by wiwl6 with SMTP id l6so104873947wiw.0
        for <linux-gpio@vger.kernel.org>; Wed, 24 Jun 2015 12:54:44 -0700 (PDT)
In-Reply-To: <1434610052-602-9-git-send-email-bjorn.andersson@sonymobile.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>, Linus Walleij <linus.walleij@linaro.org>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, marc.zyngier@arm.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org



On 18/06/15 07:47, Bjorn Andersson wrote:
> This introduces pinctrl drivers for gpio and mpp blocks found in family A
> PMICs.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> ---
>   .../devicetree/bindings/pinctrl/qcom,pmic-mpp.txt  |   5 +
>   drivers/pinctrl/qcom/Kconfig                       |  12 +
>   drivers/pinctrl/qcom/Makefile                      |   2 +
>   drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c           | 795 ++++++++++++++++++

Tested the gpio driver with WLAN on IFC6410

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


--srini
