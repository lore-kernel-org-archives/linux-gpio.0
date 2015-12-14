From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: zynq: Do PM initialization earlier to support gpio hogs
Date: Mon, 14 Dec 2015 14:10:31 +0100
Message-ID: <CACRpkdYsOtzc_TnRA=CuvQMFNpgrMHhUvLu1kRQFynk5wLNz0w@mail.gmail.com>
References: <fc67101afc0d10efbaeeb6bc3d881ab49e3f4671.1449745801.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:35903 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932268AbbLNNKc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2015 08:10:32 -0500
Received: by oian133 with SMTP id n133so13464174oia.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Dec 2015 05:10:32 -0800 (PST)
In-Reply-To: <fc67101afc0d10efbaeeb6bc3d881ab49e3f4671.1449745801.git.michal.simek@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Josh Cartwright <josh.cartwright@ni.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Dec 10, 2015 at 12:10 PM, Michal Simek <michal.simek@xilinx.com> wrote:

> GPIO hogs registration is call at the end of gpiochip_add() function.
> Calling sequence is:
> gpiochip_add -> of_gpiochip_add -> of_gpiochip_scan_hogs ->
> gpiod_hog -> gpiochip_request_own_desc -> __gpiod_request ->
> chip->request -> zynq_gpio_request which calls pm_runtime_get_sync()
> which returns -13 because PM is not initialized yet.
>
> Initialize PM before gpiochip_add is called to fix this issue.
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>

Patch applied!

Yours,
Linus Walleij
