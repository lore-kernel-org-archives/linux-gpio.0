From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom-ssbi: support for pm8058
Date: Tue, 14 Jun 2016 10:43:00 -0700
Message-ID: <20160614174300.GC28218@codeaurora.org>
References: <1465777921-1989-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:46047 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751395AbcFNRnC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2016 13:43:02 -0400
Content-Disposition: inline
In-Reply-To: <1465777921-1989-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>

On 06/13, Linus Walleij wrote:
> The PM858 is found in connection to the APQ8060 on the APQ8060

s/PM858/PM8058/

> Dragonboard. Works the same as all others, just add the compatible
> string for this variant.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Andy Gross <andy.gross@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
