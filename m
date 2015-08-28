From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH] gpio: msm: Remove unused driver
Date: Fri, 28 Aug 2015 15:24:03 -0700
Message-ID: <20150828222403.GV13472@usrtlx11787.corpusers.net>
References: <1440798536-8337-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([37.139.156.2]:18514 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752645AbbH1WwT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 28 Aug 2015 18:52:19 -0400
Content-Disposition: inline
In-Reply-To: <1440798536-8337-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Andy Gross <agross@codeaurora.org>

On Fri 28 Aug 14:48 PDT 2015, Stephen Boyd wrote:

> Remove this driver now that Bjorn has introduced a pinctrl driver
> for msm8660 and the dts files have been updated with the pinctrl
> compatibles.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Cc: Andy Gross <agross@codeaurora.org>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Regards,
Bjorn
