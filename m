From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH] pinctrl: msm: allow the gpio base to be configurable
Date: Wed, 7 Feb 2018 08:50:35 -0600
Message-ID: <38f2a1d3-7736-6100-0fd1-4b7bcb648de8@codeaurora.org>
References: <1516915209-28295-1-git-send-email-timur@codeaurora.org>
 <20180128232310.GA12728@builder>
 <042b6cea-38f7-a660-0059-5f24fc7db9eb@codeaurora.org>
 <20180129005129.GB12728@builder>
 <CACRpkdaa0Ovb0kbE6J0vy4UJYv5fn6X2289pkX3b+HBze5FRJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaa0Ovb0kbE6J0vy4UJYv5fn6X2289pkX3b+HBze5FRJg@mail.gmail.com>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

On 2/7/18 7:19 AM, Linus Walleij wrote:
> if (tlmm_has_only_one_instance)
>     base = 0;
> else
>     base = -1;

This is effectively what my patch does.  The first instance gets 0.  The 
second instance, if it exists, gets -1.

When the first instance is registered, there's no way to know whether 
there will be a second instance.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
