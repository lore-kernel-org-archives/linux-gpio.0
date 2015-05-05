From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 05/27] hwmon: Allow compile test of GPIO consumers if
 !GPIOLIB
Date: Tue, 5 May 2015 12:31:09 -0700
Message-ID: <20150505193109.GB7771@roeck-us.net>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-1-git-send-email-geert@linux-m68k.org>
 <1430843563-18615-5-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:32947 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753350AbbEETbW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 May 2015 15:31:22 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.85)
	(envelope-from <linux@roeck-us.net>)
	id 1YpiYr-004BCO-HZ
	for linux-gpio@vger.kernel.org; Tue, 05 May 2015 19:31:21 +0000
Content-Disposition: inline
In-Reply-To: <1430843563-18615-5-git-send-email-geert@linux-m68k.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.de>, lm-sensors@lm-sensors.org

On Tue, May 05, 2015 at 06:32:21PM +0200, Geert Uytterhoeven wrote:
> The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
> not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
> functionality only, can still be compiled if GPIOLIB is not enabled.
> 
> Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
> appropriate.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Jean Delvare <jdelvare@suse.de>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: lm-sensors@lm-sensors.org

Applied to -next.

Thanks,
Guenter
