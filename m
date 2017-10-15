From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 0/2] [v5] pinctrl: qcom: add support for sparse GPIOs
Date: Sun, 15 Oct 2017 16:09:19 -0500
Message-ID: <a6296a97-d9fc-2135-33a7-3eba436f0433@codeaurora.org>
References: <CACRpkdZcdLac_wYW+XqtZ=-APo8VmvYL4B1oL-wZyLy8KEs9AA@mail.gmail.com>
 <1ecdf6ee-5098-15d3-f85e-66b39a6c25f9@codeaurora.org>
 <CACRpkdaUV1Mjh7U9bBAgZA5Zq1oqN0HBT=VH5NkvPnY4gHxDVw@mail.gmail.com>
 <d53e67a2-4f69-752f-ba35-53872d9b9760@codeaurora.org>
 <CACRpkdYfAcKrgbgybccurUKTyR0E+tHDyzp7sbXxXxKuyMOGhQ@mail.gmail.com>
 <619f48d2-59c7-c090-4ace-9e8db9f92064@codeaurora.org>
 <CACRpkdZFunwQ=tiQqsapap7Ozz42hr=df5vqbC0S5xy5Wn+ZWw@mail.gmail.com>
 <255ad0dc-2d16-ae7f-0b45-500e23cff1a4@codeaurora.org>
 <20171003220311.GU457@codeaurora.org>
 <4f067c09-9ecf-9266-baa0-18575bca94eb@codeaurora.org>
 <20171015201811.GA13063@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:41208 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750883AbdJOVJX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 15 Oct 2017 17:09:23 -0400
In-Reply-To: <20171015201811.GA13063@mithrandir>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, anjiandi@codeaurora.org, Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On 10/15/17 3:18 PM, Thierry Reding wrote:
> This confuses me. Why would you even want to register pins that don't
> exist? It sounds to me like you're lying to gpiolib and then try to work
> around it trying to access the GPIOs that don't exist but which you told
> it were there.
> 
> Why not just tell gpiolib about only the GPIOs that exist?

Please look at my patches.  That's exactly what they do, but no one else 
likes that approach.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
