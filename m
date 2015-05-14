From: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH] gpio: discourage passing base to gpio_chip
Date: Thu, 14 May 2015 11:41:31 +0900
Message-ID: <55540B5B.8000303@nvidia.com>
References: <1431515095-29107-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:7437 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933139AbbENClh (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 May 2015 22:41:37 -0400
In-Reply-To: <1431515095-29107-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On 05/13/2015 08:04 PM, Linus Walleij wrote:
> Passing a fixed base in struct gpio_chip is done for legacy
> systems that cannot handle dynamic allocation. Discourage this
> behaviour in the kerneldoc.

Good idea, we are still seeing too much of these.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

