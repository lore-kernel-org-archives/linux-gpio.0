From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 13/27] mtd: Allow compile test of GPIO consumers if
 !GPIOLIB
Date: Wed, 20 May 2015 15:51:50 -0700
Message-ID: <20150520225150.GT11598@ld-irv-0074>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-13-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:36552 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754353AbbETWv6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 May 2015 18:51:58 -0400
Content-Disposition: inline
In-Reply-To: <1430843563-18615-13-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org

On Tue, May 05, 2015 at 06:32:29PM +0200, Geert Uytterhoeven wrote:
> The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
> not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
> functionality only, can still be compiled if GPIOLIB is not enabled.
> 
> Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
> appropriate.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: linux-mtd@lists.infradead.org

Pushed to l2-mtd.git.

Brian
