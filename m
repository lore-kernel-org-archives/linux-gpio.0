From: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: Re: [PATCH] pinctrl: qcom: Hook pm_power_down for shutdown support
Date: Mon, 13 Jul 2015 15:59:57 -0700
Message-ID: <20150713225957.GF15178@usrtlx11787.corpusers.net>
References: <1436231370-18301-1-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from seldrel01.sonyericsson.com ([37.139.156.2]:13681 "EHLO
	seldrel01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752590AbbGMXAE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 13 Jul 2015 19:00:04 -0400
Content-Disposition: inline
In-Reply-To: <1436231370-18301-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Pramod Gurav <pramod.gurav@smartplayin.com>

On Mon 06 Jul 18:09 PDT 2015, Stephen Boyd wrote:

> Assign pm_power_off() if we have the PS_HOLD functionality so
> that we can properly shutdown the SoC. Otherwise, shutdown won't
> do anything besides put the CPU into a tight loop. Unfortunately,
> we have to use a singleton here because pm_power_off() doesn't
> take any arguments. Fortunately there's only one instance of the
> pinctrl device on a running system so this isn't a problem.
> 
> Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
> Cc: Pramod Gurav <pramod.gurav@smartplayin.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>


I do find it odd that there's generic handling for restart but only the
crude way pm_power_off to shut the system down... But this seems to be
the way it should be done...

Acked-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>

Regards,
Bjorn
