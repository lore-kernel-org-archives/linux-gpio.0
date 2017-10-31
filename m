From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 1/4] Revert "gpio: set up initial state from
 .get_direction()"
Date: Tue, 31 Oct 2017 07:36:14 -0500
Message-ID: <d424fea5-6b28-5cb0-5fda-e71a64bf8528@codeaurora.org>
References: <1509396602-1936-1-git-send-email-timur@codeaurora.org>
 <1509396602-1936-2-git-send-email-timur@codeaurora.org>
 <1509440926.10233.77.camel@linux.intel.com>
 <a6c8b2ac-29de-4ec7-7b3f-fac1b5b16942@codeaurora.org>
 <CAOMZO5CbPCJe76AMeRHNBUwfEu5jdWUEAqkZuxLBbgOHoLx_MQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5CbPCJe76AMeRHNBUwfEu5jdWUEAqkZuxLBbgOHoLx_MQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-msm@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On 10/31/17 7:33 AM, Fabio Estevam wrote:
> In this case checkpatch should have given you an error due to the
> missing Signed-off-by tag:-)

Indeed!  Something must be broken in my checkpatch invocation.  I did 
think that it was odd that I didn't get any complaints.  Thanks.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
