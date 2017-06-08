From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: sunxi: Add compatible string
 for A83T R_PIO
Date: Thu, 8 Jun 2017 17:22:07 -0500
Message-ID: <20170608222207.gi2m5gjetmtxiyxj@rob-hp-laptop>
References: <20170603144427.22855-1-wens@csie.org>
 <20170603144427.22855-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:36691 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751563AbdFHWWJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jun 2017 18:22:09 -0400
Content-Disposition: inline
In-Reply-To: <20170603144427.22855-2-wens@csie.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-sunxi@googlegroups.com

On Sat, Jun 03, 2017 at 10:44:25PM +0800, Chen-Yu Tsai wrote:
> The R_PIO on the A83T is almost the same as the one found on the A64,
> except that the CIR_RX function was moved from pin PL11 to pin PL12.
> 
> Add a compatible string for it.
> 
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/allwinner,sunxi-pinctrl.txt | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>
