From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] pinctrl: imx: do not implicitly set pin regs to -1
Date: Mon, 2 Mar 2015 19:45:17 +0800
Message-ID: <20150302114516.GC3040@dragon>
References: <1423240256-27210-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:38862 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753030AbbCBLpd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2015 06:45:33 -0500
Received: by pdbfl12 with SMTP id fl12so7877076pdb.5
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2015 03:45:33 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1423240256-27210-1-git-send-email-stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: linus.walleij@linaro.org, u.kleine-koenig@pengutronix.de, kernel@pengutronix.de, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Fri, Feb 06, 2015 at 05:30:56PM +0100, Stefan Agner wrote:
> Commit 3dac1918a491 ("pinctrl: imx: detect uninitialized pins") needs
> the values in struct imx_pin_reg to be -1. This has been done in a
> rather unorthodox way by setting the memory to 0xff using memset...
> Use a proper for loop to initialize the whole array with -1.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Acked-by: Shawn Guo <shawn.guo@linaro.org>
