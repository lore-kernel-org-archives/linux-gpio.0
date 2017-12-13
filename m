From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 4/4] [v4] pinctrl: qcom: qdf2xxx: add support for new ACPI
 HID QCOM8002
Date: Wed, 13 Dec 2017 09:18:49 -0600
Message-ID: <c41db747-757a-131f-14b6-e181403db007@codeaurora.org>
References: <1512170904-4749-1-git-send-email-timur@codeaurora.org>
 <1512170904-4749-5-git-send-email-timur@codeaurora.org>
 <1513073105.25007.618.camel@linux.intel.com>
 <bae16fa3-1bdf-74b1-97b7-f6b2db212621@codeaurora.org>
 <1513175535.7000.10.camel@linux.intel.com>
 <9c28bebb-5f57-83e8-9885-5262bbdc1b94@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <9c28bebb-5f57-83e8-9885-5262bbdc1b94@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, Stephen Boyd <sboyd@codeaurora.org>, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

On 12/13/2017 08:46 AM, Timur Tabi wrote:
> 
>> Please, read my comment again. The key part of the phrase:
>> "Use members of struct device_driver"
>>
>> So, do not move the IDs. There are examples in the kernel how to access
>> it.
> 
> Sorry, I don't understand what you're talking about.  I don't see how I 
> can call
> 
>      const struct acpi_device_id *id =
>          acpi_match_device(qdf2xxx_acpi_ids, &pdev->dev);
> 
> without having qdf2xxx_acpi_ids already defined previously.  And without 
> the 'id', I can't figure out whether I've probed via QCOM8001 or QCOM8002.

I think I found it.  Are you talking about doing this instead:

id = acpi_match_device(pdev->dev.driver->acpi_match_table, &pdev->dev);

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
