From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 3/3] [v6] pinctrl: qcom: qdf2xxx: add support for new ACPI
 HID QCOM8002
Date: Mon, 18 Dec 2017 19:18:06 -0600
Message-ID: <615426d4-7c46-9671-87ef-790fb5733385@codeaurora.org>
References: <1513189818-7384-1-git-send-email-timur@codeaurora.org>
 <1513189818-7384-4-git-send-email-timur@codeaurora.org>
 <20171213230155.GS7997@codeaurora.org>
 <6ca3b4a6-90b9-0481-beb8-29a95c86f07c@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <6ca3b4a6-90b9-0481-beb8-29a95c86f07c@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

Stephen, any follow-up to this?  I'd like to get these patches into 4.16 
if at all possible.  Thanks.

On 12/13/17 5:09 PM, Timur Tabi wrote:
> On 12/13/2017 05:01 PM, Stephen Boyd wrote:
>> Given that we have MAX_GPIOS, it would be better to declare a
>> bitmap of available gpios of that size on the stack and then
>> iterate through the bitmap and set bits for the available ones.
>> In the QCOM8001 case, that would be setting all bits up to
>> num_gpios, and in the QCOM8002 case it would be iterating through
>> the list of gpios from the DSD property and setting the bit for
>> that gpio number.  This avoids explicitly allocating a list of
>> numbers that is freed almost immediately. Instead we just stack
>> 256 / sizeof(unsigned long) words and set bits.
> 
> I'm not sure I understand.  The only think I'm allocating temporarily is 
> the 'gpios' array, which is an array of shorts.  Each element stores the 
> gpio number.  It's not a bit array, so "256 / sizeof(unsigned long)" 
> doesn't apply.  I need that array to read the DSD.  You can't iterate 
> through an DSD property without reading it completely first.
> 
>> Hopefully we could lift the same logic into the core pinctrl msm
>> driver for usage on non-ACPI systems.
> 
> There is no new memory allocation being done in pinctrl-msm, so I don't 
> understand this either.
> 


-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
