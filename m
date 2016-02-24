From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 30/50] pinctrl: tegra-xusb: Use devm_pinctrl_register()
 for pinctrl registration
Date: Wed, 24 Feb 2016 09:41:42 -0700
Message-ID: <56CDDD46.1060907@wwwdotorg.org>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
 <1456319775-3216-31-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:55570 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756824AbcBXQlp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Feb 2016 11:41:45 -0500
In-Reply-To: <1456319775-3216-31-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>

On 02/24/2016 06:15 AM, Laxman Dewangan wrote:
> Use devm_pinctrl_register() for pin control registration and clean
> the error path.

Acked-by: Stephen Warren <swarren@nvidia.com>

