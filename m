From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH] pinctrl: qcom: add get_direction function
Date: Sat, 11 Feb 2017 15:32:15 -0600
Message-ID: <51200db0-552b-221d-1e81-f1a3ee286c6c@codeaurora.org>
References: <1486768860-18237-1-git-send-email-timur@codeaurora.org>
 <8652c018-4051-5c77-3126-2d41d150518a@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:57012 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750940AbdBKVcM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Feb 2017 16:32:12 -0500
In-Reply-To: <8652c018-4051-5c77-3126-2d41d150518a@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Stephen Boyd wrote:
>> > +	/* 0 = output, 1 = input */
>> > +	return val & BIT(g->oe_bit) ? 0 : 1;
> Maybe we can use the macros GPIOF_DIR_IN and GPIOF_DIR_OUT here instead?

Ok, I posted a v2.

Is it too late for this patch to make the 4.11 merge window, or maybe 4.11-rc2? 
 From the perspective of our server platform, it's a bug fix.

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
