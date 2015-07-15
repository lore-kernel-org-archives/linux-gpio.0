From: Vinay Simha <simhavcs@gmail.com>
Subject: Re: [PATCH] pinctrl/qcom Kconfig CFG repeated
Date: Wed, 15 Jul 2015 21:05:28 +0530
Message-ID: <CAGWqDJ7Epdm7tVYj0F8mCJA7rC-rO3CXq_Gd0c13mqQ8zxBZ-g@mail.gmail.com>
References: <1436972027-2914-1-git-send-email-simhavcs@gmail.com>
	<55A6768A.7010605@mm-sol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vn0-f47.google.com ([209.85.216.47]:34497 "EHLO
	mail-vn0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751546AbbGOPf3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jul 2015 11:35:29 -0400
In-Reply-To: <55A6768A.7010605@mm-sol.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, "Ivan T. Ivanov" <iivanov@mm-sol.com>, Joonwoo Park <joonwoop@codeaurora.org>, Georgi Djakov <gdjakov@mm-sol.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

sorry. My mistake. i saw both as 8064.

On Wed, Jul 15, 2015 at 8:34 PM, Stanimir Varbanov <svarbanov@mm-sol.com> wrote:
> On 07/15/2015 05:53 PM, Vinay Simha BN wrote:
>> repeatation of the same configs
>> obj-$(CONFIG_PINCTRL_APQ8084)   += pinctrl-apq8084.o
>
> hm you might be kidding, apq8064 and apq8084 are different SoCs.
>
>>
>> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
>> ---
>>  drivers/pinctrl/qcom/Makefile | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
>> index 3666c70..d26a878 100644
>> --- a/drivers/pinctrl/qcom/Makefile
>> +++ b/drivers/pinctrl/qcom/Makefile
>> @@ -1,7 +1,6 @@
>>  # Qualcomm pin control drivers
>>  obj-$(CONFIG_PINCTRL_MSM)    += pinctrl-msm.o
>>  obj-$(CONFIG_PINCTRL_APQ8064)        += pinctrl-apq8064.o
>> -obj-$(CONFIG_PINCTRL_APQ8084)        += pinctrl-apq8084.o
>>  obj-$(CONFIG_PINCTRL_IPQ8064)        += pinctrl-ipq8064.o
>>  obj-$(CONFIG_PINCTRL_MSM8660)        += pinctrl-msm8660.o
>>  obj-$(CONFIG_PINCTRL_MSM8960)        += pinctrl-msm8960.o
>>
>
>
> --
> regards,
> Stan



-- 
Regards,

Vinay Simha.B.N.
