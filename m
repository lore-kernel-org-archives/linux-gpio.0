From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v6 1/3] gpio: xgene: Enable X-Gene standby GPIO as
 interrupt controller
Date: Mon, 15 Feb 2016 12:55:30 +0000
Message-ID: <56C1CAC2.8050709@arm.com>
References: <1455512263-18183-1-git-send-email-qnguyen@apm.com>
 <1455512263-18183-2-git-send-email-qnguyen@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:45048 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751114AbcBOMze (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 15 Feb 2016 07:55:34 -0500
In-Reply-To: <1455512263-18183-2-git-send-email-qnguyen@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Quan Nguyen <qnguyen@apm.com>, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>
Cc: Y Vo <yvo@apm.com>, Phong Vo <pvo@apm.com>, Loc Ho <lho@apm.com>, Feng Kan <fkan@apm.com>, Duc Dang <dhdang@apm.com>, patches@apm.com

On 15/02/16 04:57, Quan Nguyen wrote:
> Enable X-Gene standby GPIO controller as interrupt controller to provide
> its own resources. This avoids ambiguity where GIC interrupt resource is
> use as X-Gene standby GPIO interrupt resource in user driver.
> 
> Signed-off-by: Y Vo <yvo@apm.com>
> Signed-off-by: Quan Nguyen <qnguyen@apm.com>

Acked-by: Marc Zyngier <marc.zyngier@arm.com>

	M.
-- 
Jazz is not dead. It just smells funny...
