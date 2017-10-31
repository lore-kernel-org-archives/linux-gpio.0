From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [PATCH 2/4] gpiolib: add bitmask for valid GPIO lines
Date: Tue, 31 Oct 2017 13:54:56 -0500
Message-ID: <02208047-38c8-f97b-5c53-6cced7bdecc6@codeaurora.org>
References: <1509396602-1936-1-git-send-email-timur@codeaurora.org>
 <1509396602-1936-3-git-send-email-timur@codeaurora.org>
 <1509441149.10233.80.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1509441149.10233.80.camel@linux.intel.com>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, thierry.reding@gmail.com, Stephen Boyd <sboyd@codeaurora.org>, david.brown@linaro.org, andy.gross@linaro.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: linux-gpio@vger.kernel.org

On 10/31/2017 04:12 AM, Andy Shevchenko wrote:
> Instead of mangling this function wouldn't be better to introduce a
> separate one for line and perhaps a third one which calls them both?

The diff is convoluted, but the end result is clean:

static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip)
{
	if (gpiochip->irq_need_valid_mask) {
		gpiochip->irq_valid_mask =
			kcalloc(BITS_TO_LONGS(gpiochip->ngpio),
				sizeof(long), GFP_KERNEL);
		if (!gpiochip->irq_valid_mask)
			return -ENOMEM;

		/* Assume by default all GPIOs are valid */
		bitmap_fill(gpiochip->irq_valid_mask, gpiochip->ngpio);
	}

	if (gpiochip->line_need_valid_mask) {
		gpiochip->line_valid_mask =
			kcalloc(BITS_TO_LONGS(gpiochip->ngpio),
				sizeof(long), GFP_KERNEL);
		if (!gpiochip->line_valid_mask)
			return -ENOMEM;

		/* Assume by default all GPIOs are valid */
		bitmap_fill(gpiochip->line_valid_mask, gpiochip->ngpio);
	}

	return 0;
}

Is this acceptable?

-- 
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm
Technologies, Inc.  Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
