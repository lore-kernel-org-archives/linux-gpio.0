From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 3/3] [v6] pinctrl: qcom: qdf2xxx: add support for new ACPI
 HID QCOM8002
Date: Tue, 19 Dec 2017 13:27:33 -0600
Message-ID: <1f6b198f-d277-51dd-09ad-e1d751d5c1fa@codeaurora.org>
References: <1513189818-7384-1-git-send-email-timur@codeaurora.org>
 <1513189818-7384-4-git-send-email-timur@codeaurora.org>
 <20171213230155.GS7997@codeaurora.org>
 <6ca3b4a6-90b9-0481-beb8-29a95c86f07c@codeaurora.org>
 <615426d4-7c46-9671-87ef-790fb5733385@codeaurora.org>
 <20171219023935.GA17456@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:46544 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752812AbdLST1g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Dec 2017 14:27:36 -0500
In-Reply-To: <20171219023935.GA17456@codeaurora.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>

On 12/18/2017 08:39 PM, Stephen Boyd wrote:
> +	for (i = 0, j = 0; i < num_gpios; i++) {
>   		pins[i].number = i;
> -		pins[i].name = names[i];
> +		groups[i].pins = &pins[i].number;
> +
> +		/* Only expose GPIOs that are available */
> +		if (gpios && gpios[j] != i)
> +			continue;

I don't know if I would say this is an improvement.  For one thing, 
QCOM8001 systems are deprecated and don't really exist any more.  At the 
time I originally wrote this patch, they were still in the wild, but 
they're all gone now.  So it's no longer efficient to treat QCOM8001 as 
the default case.  This means that the for-loop will iterate over the 
full range now, instead of the partial range that it does with my v10 patch.

If I post another version of this patch, I'm just going to remove 
support for QCOM8001.

If you want to avoid kmalloc'ing the GPIOs array, we can put it on the 
stack with a dynamic size, since it will be no more than MAX_GPIOS * 2 
(i.e. 512) bytes in size.

	u16 gpios[avail_gpios];

It would be a little hackish since it needs to be defined at the 
beginning of a code block, so I would probably put into its own 
function, but I still fail to see what's wrong with using kmalloc to 
allocate that array for short-term use temporarily.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
