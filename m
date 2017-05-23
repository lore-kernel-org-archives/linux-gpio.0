From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] mfd: arizona: Update GPIO binding for newly
 supported flag
Date: Mon, 22 May 2017 19:16:07 -0500
Message-ID: <20170523001607.rarxleh7dxobrfr6@rob-hp-laptop>
References: <1494948714-15203-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
 <1494948714-15203-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:32877 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759148AbdEWAQJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2017 20:16:09 -0400
Content-Disposition: inline
In-Reply-To: <1494948714-15203-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: linus.walleij@linaro.org, lee.jones@linaro.org, mark.rutland@arm.com, gnurou@gmail.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, patches@opensource.wolfsonmicro.com

On Tue, May 16, 2017 at 04:31:54PM +0100, Charles Keepax wrote:
> Update the device tree binding to show that the new GPIO_SLEEP flags are
> now supported in the flags field of the GPIO binding for Arizona
> devices.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  Documentation/devicetree/bindings/mfd/arizona.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
