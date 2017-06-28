From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom: qdf2xxx: expose only some GPIO pins
Date: Wed, 28 Jun 2017 17:38:38 -0500
Message-ID: <d4ed2a91-5f19-fa04-42ed-02b94dde1b6e@codeaurora.org>
References: <1498164850-4738-1-git-send-email-timur@codeaurora.org>
 <CACRpkdZeDjS_g27=1e7uCmFpjnqX+sDSu5G2VAuwFr_GJW1mug@mail.gmail.com>
 <20170628191204.GP18666@tuxbook>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:44332 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751518AbdF1Wik (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jun 2017 18:38:40 -0400
In-Reply-To: <20170628191204.GP18666@tuxbook>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 06/28/2017 02:12 PM, Bjorn Andersson wrote:
> It seems that if we extend the msm_pingroup with a flag to carry the XPU
> lock information and then implement pinmux_ops->request() and deny any
> requests on the locked pins, we should cover all[*] the normal GPIO code
> paths.

I managed to get this to work, so I'll post a patchset by tomorrow that 
implements this.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
