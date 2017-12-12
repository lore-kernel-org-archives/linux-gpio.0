From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 4/4] [v4] pinctrl: qcom: qdf2xxx: add support for new ACPI
 HID QCOM8002
Date: Tue, 12 Dec 2017 14:17:48 -0600
Message-ID: <bae16fa3-1bdf-74b1-97b7-f6b2db212621@codeaurora.org>
References: <1512170904-4749-1-git-send-email-timur@codeaurora.org>
 <1512170904-4749-5-git-send-email-timur@codeaurora.org>
 <1513073105.25007.618.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:56514 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752247AbdLLURv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Dec 2017 15:17:51 -0500
In-Reply-To: <1513073105.25007.618.camel@linux.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, Stephen Boyd <sboyd@codeaurora.org>, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>

On 12/12/2017 04:05 AM, Andy Shevchenko wrote:
>> +static const struct acpi_device_id qdf2xxx_acpi_ids[] = {
>> +	{"QCOM8001", QDF2XXX_V1},
>> +	{"QCOM8002", QDF2XXX_V2},
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(acpi, qdf2xxx_acpi_ids);
>>
>> +	const struct acpi_device_id *id =
>> +		acpi_match_device(qdf2xxx_acpi_ids, &pdev->dev);
> JFYI: there is no need to move IDs like this.
> Use members of struct device_driver wisely.

I have to move it, otherwise I get:

drivers/pinctrl/qcom/pinctrl-qdf2xxx.c:49:21: error: 'qdf2xxx_acpi_ids' 
undeclared (first use in this function); did you mean 'qdf2xxx_pinctrl'?

I reference the structure in qdf2xxx_pinctrl_probe().

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
