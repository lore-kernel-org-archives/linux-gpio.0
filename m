From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCH v2 11/11] net: rfkill: Allow compile test of GPIO
 consumers if !GPIOLIB
Date: Thu, 13 Aug 2015 10:49:22 +0200
Message-ID: <1439455762.2114.0.camel@sipsolutions.net>
References: <1438506475-31012-1-git-send-email-geert@linux-m68k.org>
	 <1438506594-31931-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from s3.sipsolutions.net ([5.9.151.49]:46924 "EHLO sipsolutions.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751373AbbHMIt2 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 13 Aug 2015 04:49:28 -0400
In-Reply-To: <1438506594-31931-1-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On Sun, 2015-08-02 at 11:09 +0200, Geert Uytterhoeven wrote:
> The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB 
> is
> not enabled. Hence drivers that depend on GPIOLIB, but use GPIO 
> consumer
> functionality only, can still be compiled if GPIOLIB is not enabled.
> 
> Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
> appropriate.
> 
Applied.

johannes
