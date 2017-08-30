From: Timur Tabi <timur@codeaurora.org>
Subject: Re: linux-next regression caused by "gpiolib: request the gpio before
 querying its direction"
Date: Wed, 30 Aug 2017 09:22:55 -0500
Message-ID: <442accaa-15a0-4efb-4e5c-cebca7140213@codeaurora.org>
References: <20170830112424.7a3a7c36@windsurf.lan>
 <3cce6903-d167-1bfc-38b4-1fdd7b3ff24b@codeaurora.org>
 <87ziah2m3f.fsf@free-electrons.com> <20170830161730.41919554@windsurf.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:57838 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751317AbdH3OW6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Aug 2017 10:22:58 -0400
In-Reply-To: <20170830161730.41919554@windsurf.lan>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?Q?Antoine_T=c3=a9nart?= <antoine.tenart@free-electrons.com>, =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>

On 8/30/17 9:17 AM, Thomas Petazzoni wrote:
> So what Timur is saying perhaps is that
> mvebu_pinmux_gpio_request_enable() shouldn't be changing the type of
> muxing, and therefore shouldn't be calling mvebu_pinconf_group_set().
> 
> However, even the "reference" pinctrl-single.c implementation does it,
> in pcs_request_gpio().
> 
> Am I missing something ?

No, that's it.  The question is, what exactly should the 'request' 
function do?  Should it be modifying the hardware to satisfy the 
request?  When I wrote my patch, I assumed that it wouldn't.  I thought 
that request simply answered the question, "can I touch this GPIO"?

-- 
Sent by an employee of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, hosted by The Linux Foundation.
