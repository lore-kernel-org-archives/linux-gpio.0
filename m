From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 1/3] gliolib: request the gpio before querying its
 direction
Date: Mon, 21 Aug 2017 16:23:50 -0500
Message-ID: <103341c8-6cc5-3d3f-eef7-28b9f31cdc71@codeaurora.org>
References: <1501179565-26466-1-git-send-email-timur@codeaurora.org>
 <1501179565-26466-2-git-send-email-timur@codeaurora.org>
 <CACRpkdYPBd4ZvuXo__LRQezTQD3u=3r2WO+2dTzBanLL1zX72w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:49012 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753983AbdHUVXw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Aug 2017 17:23:52 -0400
In-Reply-To: <CACRpkdYPBd4ZvuXo__LRQezTQD3u=3r2WO+2dTzBanLL1zX72w@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 07/31/2017 08:35 AM, Linus Walleij wrote:
>> Before querying a GPIO to determine its direction, the GPIO should be
>> formally requested.  This allows the GPIO driver to block access to
>> unavailable GPIOs, which makes it easier for some drivers to support
>> sparse GPIO maps.
>>
>> Signed-off-by: Timur Tabi<timur@codeaurora.org>
> This makes all kind of semantic change, so patch applied.

Have you push it to git.kernel.org?  I don't see it.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
