From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 3/3] [v6] pinctrl: qcom: qdf2xxx: add support for new ACPI
 HID QCOM8002
Date: Thu, 4 Jan 2018 09:46:18 -0600
Message-ID: <8e985f68-5887-b0d5-8c45-e22b5d8f60cf@codeaurora.org>
References: <6ca3b4a6-90b9-0481-beb8-29a95c86f07c@codeaurora.org>
 <615426d4-7c46-9671-87ef-790fb5733385@codeaurora.org>
 <20171219023935.GA17456@codeaurora.org>
 <735d4316-9b18-2903-aabd-46ead1db5233@codeaurora.org>
 <20171220022626.GH7997@codeaurora.org>
 <d511f096-bad4-c7b3-d7d4-11b1fa3b1cce@codeaurora.org>
 <20171220081556.GA30524@codeaurora.org>
 <a5809701-3f81-3f79-f558-a831ce4091c2@codeaurora.org>
 <20171221003947.GJ7997@codeaurora.org>
 <38463c81-eeab-85dc-d197-6081ce1d1130@codeaurora.org>
 <20171222014633.GD7997@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:53908 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753419AbeADPqV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Jan 2018 10:46:21 -0500
In-Reply-To: <20171222014633.GD7997@codeaurora.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>

On 12/21/2017 07:46 PM, Stephen Boyd wrote:
> Ok. That's testable with acpi_match_device_ids() though. I can
> add that into pinctrl-msm.c so we don't have to pass info about
> available gpios from ACPI specific driver into the pinctrl-msm
> core driver. That's why I'm trying to avoid doing it in the ACPI
> specific driver. Do it close to where the gpiochip is created
> instead.

I guess we're just going to have to agree to disagree.  I see the DSDs 
as being SOC-specific, and therefore belong in the SOC driver.  I'm 
still going to need an SOC driver to define the TLMM register layout.

But as I said earlier, I've already spent way too much time working on a 
driver that, in all likelihood, never be used in any production system 
anyway.

I look forward to reviewing the next version of your patch.

> Maybe future HIDs could follow the DT design and then we can look
> for the same device property name in both firmwares. 

DSDs generally don't have the vendor prefix that DT properties do.

> Parsing
> ranges is simpler.

I'm not sure I agree with that.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
