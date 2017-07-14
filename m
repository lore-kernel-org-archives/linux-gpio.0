From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 1/2] pinctrl: qcom: disable GPIO groups with no pins
Date: Fri, 14 Jul 2017 16:43:56 -0500
Message-ID: <8eaeefc0-2f2c-a488-283f-80e26f4d13f5@codeaurora.org>
References: <1499982763-29619-1-git-send-email-timur@codeaurora.org>
 <1499982763-29619-2-git-send-email-timur@codeaurora.org>
 <20170714171148.GH22780@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170714171148.GH22780@codeaurora.org>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

On 07/14/2017 12:11 PM, Stephen Boyd wrote:
> gpiochips also have a request() hook. Can we use that before
> initializing direction to make sure the GPIO is accessible?

So I tried it, and it didn't work:

static int msm_gpio_request(struct gpio_chip *chip, unsigned int offset)
{
	pr_info("%s:%u offset=%u\n", __func__, __LINE__, offset);

	return 0;
}

static struct gpio_chip msm_gpio_template = {
	.request          = msm_gpio_request,
	...

msm_gpio_request() is never called when the driver loads.  In fact, I 
can't figure out when it would be called.

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
