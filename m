From: Timur Tabi <timur@codeaurora.org>
Subject: Re: Fwd: [PATCH 4/4] [v3] pinctrl: qcom: qdf2xxx: add support for new
 ACPI HID QCOM8002
Date: Wed, 15 Nov 2017 09:14:27 -0600
Message-ID: <54f0056d-7367-92ad-50dd-bdfdaf5c7b6a@codeaurora.org>
References: <1510096056-13765-5-git-send-email-timur@codeaurora.org>
 <133cd447-c5c8-2b3e-1ae2-484307d5e39d@codeaurora.org>
 <20171115064722.GB22802@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20171115064722.GB22802@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Varadarajan Narayanan <varada@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, Stephen Boyd <sboyd@codeaurora.org>, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On 11/15/2017 12:47 AM, Varadarajan Narayanan wrote:
>> +	if (id->driver_data == QDF2XXX_V1) {
>> +		avail_gpios = num_gpios;
>> +
>> +		gpios = devm_kcalloc(&pdev->dev, avail_gpios, sizeof(gpios[0]),
>> +				     GFP_KERNEL);
> Wouldn't kmalloc suffice since the array gets initialized just below.

Sure.

>> +		if (!gpios)
>> +			return -ENOMEM;
>> +
>> +		for (i = 0; i < avail_gpios; i++)
>> +			gpios[i] = i;
>> +	} else {
>> +		/* The number of GPIOs in the approved list */
>> +		ret = device_property_read_u16_array(&pdev->dev, "gpios",
>> +						     NULL, 0);
>> +		if (ret < 0) {
>> +			dev_err(&pdev->dev, "missing 'num-gpios' property\n");
>> +			return ret;
>> +		}
>> +		if (!ret || ret > MAX_GPIOS) {
> Instead of ret > MAX_GPIOS, should we check for ret > num_gpios?

Yes.

> 
>> +			dev_err(&pdev->dev, "invalid 'num-gpios' property\n");
>> +			return -ENODEV;
>> +		}
> In both the above error messages 'num-gpios' should be 'gpios'

Thanks, I not sure how that got messed up.

> 
>> +		avail_gpios = ret;
>> +
>> +		gpios = devm_kcalloc(&pdev->dev, avail_gpios, sizeof(gpios[0]),
>> +				     GFP_KERNEL);
> devm_kmalloc?

Ok.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
