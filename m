From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 3/4] [v6] pinctrl: qcom: disable GPIO groups with no pins
Date: Fri, 17 Nov 2017 11:49:40 -0600
Message-ID: <2671cc63-6c8b-987d-ceb3-bd158bb9d1c3@codeaurora.org>
References: <1510096056-13765-1-git-send-email-timur@codeaurora.org>
 <1510096056-13765-4-git-send-email-timur@codeaurora.org>
 <20171117024332.GU11955@codeaurora.org>
 <dff45d26-e9df-6a4f-00a9-7d9ec5cbdf49@codeaurora.org>
 <20171117174617.GA29777@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20171117174617.GA29777@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On 11/17/2017 11:46 AM, Stephen Boyd wrote:
> On 11/16, Timur Tabi wrote:
>> On 11/16/17 8:43 PM, Stephen Boyd wrote:
>>>> Most access to unavailable GPIOs can be blocked via the gpio_chip.request
>>>> function.  The one exception is when gpiochip_add_data() scans all of
>>
>>> If patch 1 is applied is this statement still true?
>>
>> Nope.
>>
> 
> Ok. So what's the point of this patch then? Put another way, is
> there some path that doesn't request the gpio still even with
> patch 1 applied?

This patch is how the pinctrl-msm driver actually reports the sparse 
GPIO map.

Patch 1 prevents gpiolib from accessing GPIOs that haven't been properly 
requested.

Patch 2 adds an infrastructure for sparse GPIO maps

Patch 3 updates pinctrl-msm to use that expose that new infrastructure

Patch 4 updates pinctrl-qdf2xxx to work with the new feature in pinctrl-msm


-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
