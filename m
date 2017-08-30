From: Timur Tabi <timur@codeaurora.org>
Subject: Re: linux-next regression caused by "gpiolib: request the gpio before
 querying its direction"
Date: Wed, 30 Aug 2017 07:31:41 -0500
Message-ID: <3cce6903-d167-1bfc-38b4-1fdd7b3ff24b@codeaurora.org>
References: <20170830112424.7a3a7c36@windsurf.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:35106 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751318AbdH3Mbo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Aug 2017 08:31:44 -0400
In-Reply-To: <20170830112424.7a3a7c36@windsurf.lan>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Gr=c3=a9gory_Clement?= <gregory.clement@free-electrons.com>, =?UTF-8?Q?Antoine_T=c3=a9nart?= <antoine.tenart@free-electrons.com>, =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>

On 8/30/17 4:24 AM, Thomas Petazzoni wrote:
> Therefore, with Timur's commit applied, when the system boots, we get
> serial output, up to the point where gpiochip_add_data() is called, and
> requests all GPIOs. Since our UART pins are not requested at the
> pinctrl level, the gpio_request succeeds and re-muxes those pins as
> GPIOs: we lose the UART.

This part I don't understand.  My patch just only impacts the code that 
queries the direction of the GPIO.  It does not set the direction.

When gpiochip_add_data() calls chip->request, what function is that calling?

The only thing I can think of is that the ->request function is not just 
returning status, but is also muxing the GPIO.  If so, then I think 
that's a bug.

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
