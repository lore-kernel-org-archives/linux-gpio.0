From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 3/3] [v6] pinctrl: qcom: qdf2xxx: add support for new ACPI
 HID QCOM8002
Date: Wed, 20 Dec 2017 11:46:35 -0600
Message-ID: <a5809701-3f81-3f79-f558-a831ce4091c2@codeaurora.org>
References: <1513189818-7384-1-git-send-email-timur@codeaurora.org>
 <1513189818-7384-4-git-send-email-timur@codeaurora.org>
 <20171213230155.GS7997@codeaurora.org>
 <6ca3b4a6-90b9-0481-beb8-29a95c86f07c@codeaurora.org>
 <615426d4-7c46-9671-87ef-790fb5733385@codeaurora.org>
 <20171219023935.GA17456@codeaurora.org>
 <735d4316-9b18-2903-aabd-46ead1db5233@codeaurora.org>
 <20171220022626.GH7997@codeaurora.org>
 <d511f096-bad4-c7b3-d7d4-11b1fa3b1cce@codeaurora.org>
 <20171220081556.GA30524@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20171220081556.GA30524@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Archit Taneja <architt@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

On 12/20/2017 02:15 AM, Stephen Boyd wrote:
> Here's the patch. I get a hang when dumping debugfs, but at least
> sysfs expose fails when trying to request blocked gpios. I need
> to check if we need to say "yes" to pins that are above the gpio
> max for pinctrl. I'll do that tomorrow.

Sorry, I just don't see how this is better than my patches.  I don't 
understand the need for involving the IRQ valid mask.  I also don't see 
the value in adding code to look for a property that exists only in one 
ACPI HID (QCOM8002) as if it were generic.  The "num-gpios" and "gpios" 
DSDs are not supposed to exist in any other HID, so there should be no 
code that reads it in pinctrl-msm.

I'm going on vacation soon.  I will post a v11 that eliminates support 
for QCOM8001.  Maybe that version is "good enough" for now and you can 
add DT and/or IRQ support on top of it.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
