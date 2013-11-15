From: David Cohen <david.a.cohen@linux.intel.com>
Subject: Re: [PATCH RFC] gpio: Driver for SYSCON-based GPIOs
Date: Fri, 15 Nov 2013 09:57:12 -0800
Message-ID: <52866078.2070703@linux.intel.com>
References: <1384497752-19032-1-git-send-email-shc_work@mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:22036 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751888Ab3KORwl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 15 Nov 2013 12:52:41 -0500
In-Reply-To: <1384497752-19032-1-git-send-email-shc_work@mail.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>

Hi Alexander,

On 11/14/2013 10:42 PM, Alexander Shiyan wrote:
> SYSCON driver was designed for using memory areas (registers)
> that are used in several subsystems. There are systems (CPUs)
> which use bits in one register for various purposes and thus
> should be handled by various kernel subsystems. This driver
> allows you to use the individual SYSCON bits as GPIOs.
> This is RFC only yet, so I did not add DT bindings for this
> driver.
>
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
> ---
>   drivers/gpio/Kconfig       |   6 ++
>   drivers/gpio/Makefile      |   1 +
>   drivers/gpio/gpio-syscon.c | 141 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 148 insertions(+)
>   create mode 100644 drivers/gpio/gpio-syscon.c
>

[snip]

> +	if (of_property_read_u32(np, "gpio-syscon,offset", &priv->bit_offset))
> +		return -EINVAL;

Any reason for dropping the error code from of_property_read_u32() in
favor of fixed -EINVAL?

Br, David Cohen
