From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/2] pinctrl: qcom: disable GPIO groups with no pins
Date: Fri, 14 Jul 2017 14:46:48 -0700
Message-ID: <20170714214648.GL22780@codeaurora.org>
References: <1499982763-29619-1-git-send-email-timur@codeaurora.org>
 <1499982763-29619-2-git-send-email-timur@codeaurora.org>
 <20170714171148.GH22780@codeaurora.org>
 <8eaeefc0-2f2c-a488-283f-80e26f4d13f5@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:54038 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751012AbdGNVqu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Jul 2017 17:46:50 -0400
Content-Disposition: inline
In-Reply-To: <8eaeefc0-2f2c-a488-283f-80e26f4d13f5@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 07/14, Timur Tabi wrote:
> On 07/14/2017 12:11 PM, Stephen Boyd wrote:
> >gpiochips also have a request() hook. Can we use that before
> >initializing direction to make sure the GPIO is accessible?
> 
> So I tried it, and it didn't work:
> 
> static int msm_gpio_request(struct gpio_chip *chip, unsigned int offset)
> {
> 	pr_info("%s:%u offset=%u\n", __func__, __LINE__, offset);
> 
> 	return 0;
> }
> 
> static struct gpio_chip msm_gpio_template = {
> 	.request          = msm_gpio_request,
> 	...
> 
> msm_gpio_request() is never called when the driver loads.  In fact,
> I can't figure out when it would be called.
> 

Right, the gpiolib core would need to be updated to request the
gpio in gpiochip_add_data() around the loop where it goes and
configures things. And it could ignore ones that it can't request
there.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
