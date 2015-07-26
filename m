From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 4/5] pinctrl/ARM: move GPIO and pinctrl deps to device
 tree
Date: Sun, 26 Jul 2015 20:55:42 +0200
Message-ID: <20150726185542.GC24272@localhost>
References: <1437635389-23463-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:33493 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755242AbbGZS4A (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jul 2015 14:56:00 -0400
Received: by lbbyj8 with SMTP id yj8so41171286lbb.0
        for <linux-gpio@vger.kernel.org>; Sun, 26 Jul 2015 11:55:59 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1437635389-23463-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, arm@kernel.org

On Thu, Jul 23, 2015 at 09:09:49AM +0200, Linus Walleij wrote:
> This gets the GPIO ranges out of the driver and into the device
> tree where they belong. Standard DT bindings already exist for
> this. Since no systems with this are deployed we can just augment
> all device trees and the drivers at the same time and simplify
> the world.
> 
> This also defines the array of GPIO chips related to the pin
> controller.
> 
> Cc: arm@kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ARM SoC: please ACK this if you are OK with it. I am using these
> systems as showcase, so I want things to look clean and nice.

Acked-by: Olof Johansson <olof@lixom.net>


-Olof
