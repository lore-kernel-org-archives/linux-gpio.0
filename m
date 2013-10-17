From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] gpio: tegra: use new gpio_lock_as_irq() API
Date: Wed, 16 Oct 2013 22:25:21 -0600
Message-ID: <525F66B1.9020903@wwwdotorg.org>
References: <1381951533-18179-1-git-send-email-swarren@wwwdotorg.org> <525F5D69.60906@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:59131 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750890Ab3JQEZY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2013 00:25:24 -0400
In-Reply-To: <525F5D69.60906@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>

On 10/16/2013 09:45 PM, David Cohen wrote:
> Hi Stephen,
> 
> On 10/16/2013 12:25 PM, Stephen Warren wrote:
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> Whenever an IRQ is claimed or freed, call gpio_lock_as_irq() or
>> gpio_unlock_as_irq() on the associated GPIO, to prevent that GPIO from
>> being configured in a manner incompatible with an interrupt.

> As a suggestion, you could add a pointer to dev on tegra gpio priv data
> and recover it using ira_data_get_irq_chip_data(), instead of using
> static file-scope variable.

That's true, but I figured it wasn't worth doing that without getting
rid of all the other global data, which is a subject for another patch.

