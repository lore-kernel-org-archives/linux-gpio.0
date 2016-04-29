From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH V2] gpio: tegra: Implement gpio_get_direction callback
Date: Fri, 29 Apr 2016 10:47:43 -0600
Message-ID: <5723902F.1010704@wwwdotorg.org>
References: <1461947123-18170-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:40424 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751153AbcD2Qrr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Apr 2016 12:47:47 -0400
In-Reply-To: <1461947123-18170-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, thierry.reding@gmail.com, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/29/2016 10:25 AM, Laxman Dewangan wrote:
> Implement gpio_get_direction() callback for Tegra GPIO.
> The direction is only valid if the pin is configured as
> GPIO. If pin is not configured in GPIO mode then this
> function return error.

Reviewed-by: Stephen Warren <swarren@nvidia.com>
