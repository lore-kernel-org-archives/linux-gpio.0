From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7796: Fix GPSR definitions for
 SDHI2/3
Date: Thu, 3 Nov 2016 14:52:31 +0100
Message-ID: <20161103135228.GA14009@verge.net.au>
References: <1477297361-28197-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47597 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751944AbcKCNwj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Nov 2016 09:52:39 -0400
Content-Disposition: inline
In-Reply-To: <1477297361-28197-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

On Mon, Oct 24, 2016 at 10:22:41AM +0200, Geert Uytterhoeven wrote:
> Fix off-by-one (row and/or register) errors in links to Peripheral
> Function Select Register bitfields from GPIO/Peripheral Function Select
> Register 4 macros for SDHI2 and SDHI3 pins.
> 
> Based on rev. 0.52E of the R-Car Gen3 User's Manual.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Untested. Thanks for testing!

Tested-by: Simon Horman <horms+renesas@verge.net.au>

