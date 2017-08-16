From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 2/3] [v3] pinctrl: qcom: disable GPIO groups with no pins
Date: Wed, 16 Aug 2017 14:55:03 -0500
Message-ID: <4b1ac1f5-f302-6a02-798a-814b4b3a9b79@codeaurora.org>
References: <1501179565-26466-1-git-send-email-timur@codeaurora.org>
 <1501179565-26466-3-git-send-email-timur@codeaurora.org>
 <CACRpkdZj+tnMcEpic6PrQS-qMJDodmc_uFJVudxc=USCTXpyKg@mail.gmail.com>
 <d0b16753-b202-5756-1cba-1cd083af52ed@codeaurora.org>
 <7c278367-bf3b-6a26-e31f-ee696cb5534e@codeaurora.org>
 <66bfbee6-245d-fddb-f6cb-a2c3c06ffc9b@codeaurora.org>
 <b99e9fc2-2531-20d6-6b25-830f7583e2bc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:34702 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752138AbdHPTzG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Aug 2017 15:55:06 -0400
In-Reply-To: <b99e9fc2-2531-20d6-6b25-830f7583e2bc@codeaurora.org>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jiandi An <anjiandi@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 08/16/2017 02:31 PM, Jiandi An wrote:
> That is why the suggestion is instead of patching in each of the op
> function of registered irq_chip for the unavailable gpio that won't
> have use for all that anyways, simply don't register irq for the
> unavailable gpio

Ah, it looks like maybe I can update gpio_chip.irq_valid_mask after 
calling gpiochip_add_data().  I'll try it.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
