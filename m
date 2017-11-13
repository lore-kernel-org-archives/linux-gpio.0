From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 0/4] [v7] pinctrl: qcom: add support for sparse GPIOs
Date: Mon, 13 Nov 2017 15:53:45 -0600
Message-ID: <b8bbba8d-f91f-8e8f-8e79-2e772b48d9b9@codeaurora.org>
References: <1510096056-13765-1-git-send-email-timur@codeaurora.org>
 <c219c289-9cad-f96c-f766-ec28af8f078d@codeaurora.org>
 <CACRpkdbwe9+TovFYoD-W_9kabe+jsVbN6juJQBUzicq=1XDphg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:50578 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751845AbdKMVxs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Nov 2017 16:53:48 -0500
In-Reply-To: <CACRpkdbwe9+TovFYoD-W_9kabe+jsVbN6juJQBUzicq=1XDphg@mail.gmail.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Varadarajan Narayanan <varada@codeaurora.org>, Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>

On 11/13/2017 03:49 PM, Linus Walleij wrote:
> 
>  From what I have understood Qualcomm has one finger constantly
> on the fast-forward button for upstreaming right now, which I think
> is good (everyone should have!) but the limited number of trusted
> maintainers of core infrastructure code makes bottlenecks form
> around these drivers where review is really needed and deep queues
> of patches form. Sorry.

That's one of the reasons why I prefer v5 of my patch instead of v7.  v5 
does not touch the core.  It's much less intrusive and has no risk of 
breaking other drivers.  I can't say that about v7.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
