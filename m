From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH] pinctrl: qcom: pmic-gpio/mpp: of_irq_count() == npins
Date: Mon, 23 Nov 2015 10:21:06 -0800
Message-ID: <20151123182106.GO30882@usrtlx11787.corpusers.net>
References: <1447808426-21834-1-git-send-email-sboyd@codeaurora.org>
 <1447875197-21645-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([37.139.156.2]:2921 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752127AbbKWSVR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 23 Nov 2015 13:21:17 -0500
Content-Disposition: inline
In-Reply-To: <1447875197-21645-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andy Gross <agross@codeaurora.org>, "Ivan T. Ivanov" <iivanov@mm-sol.com>

On Wed 18 Nov 11:33 PST 2015, Stephen Boyd wrote:

> The number of interrupts is always equal to the number of pins
> provided by the PMIC gpio and MPP hardware blocks. Count the
> number of irqs to figure out the number of pins instead of adding
> more compatible strings or doing math on the reg property. This
> should make the code more generic and ease the number of changes
> we have to make to the driver for each new pmic revision.
> 
> Cc: "Ivan T. Ivanov" <iivanov@mm-sol.com>
> Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Regards,
Bjorn
