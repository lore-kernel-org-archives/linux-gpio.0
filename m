From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] pinctrl: clean up after enable refactoring
Date: Wed, 03 Sep 2014 09:02:46 -0600
Message-ID: <54072D96.6070906@wwwdotorg.org>
References: <1409742329-17411-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:56999 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755013AbaICPCn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Sep 2014 11:02:43 -0400
In-Reply-To: <1409742329-17411-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org, Fan Wu <fwu@marvell.com>

On 09/03/2014 05:05 AM, Linus Walleij wrote:
> commit 2243a87d90b42eb38bc281957df3e57c712b5e56
> "pinctrl: avoid duplicated calling enable_pinmux_setting for a pin"
> removed the .disable callback from the struct pinmux_ops,
> making the .enable() callback the only remaining callback.
>
> However .enable() is a bad name as it seems to imply that a
> muxing can also be disabled. Rename the callback to .set_mux()
> and also take this opportunity to clean out any remaining
> mentions of .disable() from the documentation.

Acked-by: Stephen Warren <swarren@nvidia.com>
