From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 1/4] Revert "gpio: set up initial state from
 .get_direction()"
Date: Tue, 31 Oct 2017 07:28:12 -0500
Message-ID: <a6c8b2ac-29de-4ec7-7b3f-fac1b5b16942@codeaurora.org>
References: <1509396602-1936-1-git-send-email-timur@codeaurora.org>
 <1509396602-1936-2-git-send-email-timur@codeaurora.org>
 <1509440926.10233.77.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1509440926.10233.77.camel@linux.intel.com>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, Stephen Boyd <sboyd@codeaurora.org>, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On 10/31/17 4:08 AM, Andy Shevchenko wrote:
> Can you preserve the style and indentation of the commit?
> Does checkpatch warn you about style? (It's apparently not a net
> subsystem)

I ran checkpatch on it and it didn't complain.

Also, I don't think that when reverting a patch, I am also supposed to 
to fix cosmetic changes of the code that existed before the original patch.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
