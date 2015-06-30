From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: zynq: Fix problem with unbalanced pm_runtime_enable
Date: Tue, 30 Jun 2015 22:46:53 +0900
Message-ID: <CAAVeFu+Ur_3ZKsRJh2hH1fzsAouNPxOvqdU_hqDUVu26U5EkDg@mail.gmail.com>
References: <b4b2bb2d7747f8c9223fb50fd2868f77a7c7f63a.1435220957.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:32905 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752416AbbF3NrN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Jun 2015 09:47:13 -0400
In-Reply-To: <b4b2bb2d7747f8c9223fb50fd2868f77a7c7f63a.1435220957.git.michal.simek@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, monstr@monstr.eu, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, Josh Cartwright <josh.cartwright@ni.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Thu, Jun 25, 2015 at 5:29 PM, Michal Simek <michal.simek@xilinx.com> wrote:
> Add missing pm_runtime_disabled to remove().
>
> Error log:
> root@zynqmp:~# modprobe gpio_zynq
> root@zynqmp:~# lsmod
>     Not tainted
> gpio_zynq 7086 0 - Live 0xffffffbffc00a000
> root@zynqmp:~# rmmod gpio_zynq
> root@zynqmp:~# lsmod
>     Not tainted
> root@zynqmp:~# modprobe gpio_zynq
> [  246.924438] zynq-gpio ff0a0000.gpio: Unbalanced pm_runtime_enable!
> root@zynqmp:~# rmmod gpio_zynq
> root@zynqmp:~# lsmod
>     Not tainted

Yup, this was missing indeed.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>
>  drivers/gpio/gpio-zynq.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
> index 2e87c4b8da26..a78882389836 100644
> --- a/drivers/gpio/gpio-zynq.c
> +++ b/drivers/gpio/gpio-zynq.c
> @@ -757,6 +757,7 @@ static int zynq_gpio_remove(struct platform_device *pdev)
>         gpiochip_remove(&gpio->chip);
>         clk_disable_unprepare(gpio->clk);
>         device_set_wakeup_capable(&pdev->dev, 0);
> +       pm_runtime_disable(&pdev->dev);
>         return 0;
>  }
>
> --
> 2.3.5
>
