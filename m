From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: add gpio_of_helper
Date: Wed, 22 Oct 2014 18:18:50 +0900
Message-ID: <CAAVeFuJrmea6yZn2J28ihs3+=FYkZ2QxDv6F7qiq+TPpv_odpw@mail.gmail.com>
References: <4b0bcf4679163c0da53e412a47eecd4bb03849b8.1413966148.git.jiri.prchal@aksignal.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f176.google.com ([209.85.223.176]:52133 "EHLO
	mail-ie0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751036AbaJVJTM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Oct 2014 05:19:12 -0400
Received: by mail-ie0-f176.google.com with SMTP id rp18so3044628iec.35
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2014 02:19:10 -0700 (PDT)
In-Reply-To: <4b0bcf4679163c0da53e412a47eecd4bb03849b8.1413966148.git.jiri.prchal@aksignal.cz>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jiri Prchal <jiri.prchal@aksignal.cz>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, panto@antoniou-consulting.com

On Wed, Oct 22, 2014 at 5:26 PM, Jiri Prchal <jiri.prchal@aksignal.cz> wrote:
> This patch adds new driver "gpio-of-helper", witch has possibility to export
> gpios defined in dt. It exports them in defined name under
> /sysfs/class/gpio/name.
> It's rebased from Pantelis Antoniou patch to new kernel.
> Usage example:
>         gpio {
>                 compatible = "gpio-of-helper";
>                 status = "okay";
>                 pinctrl-names = "default";
>                 pinctrl-0 = <&pinctrl_gpio>;
>
>                 gsm_on {
>                         gpio-name = "gsm_on";
>                         gpio = <&pioB 13 GPIO_ACTIVE_HIGH>;
>                         output;
>                         init-low;
>                 };
>         };
>
> This patch needs Alexey Ignatov [PATCH] gpiolib: allow exporting gpios with
> custom names.

We will need to see whether the pre-requisite patch can get merged
first, but there are a couple of things that are wrong with your patch
anyway:

- it is missing a bindings documentation
- it is using the legacy integer GPIOs instead of the descriptor
interface (see include/linux/gpio/consumer.h). Since this is DT-based,
there is absolutely no reason to not use the descriptors interface.
- it seems quite long for what it needs to do
- the MODULE_AUTHOR has not signed-off this patch (?)

But what makes me nervous is that this encourages more usage of the
sysfs interface, an in a way that is potentially harmful.

Also, I don't know if the DT people will be happy with this idea.
Since this concerns DT, please also add the devicetree list and get a
Acked-by for the bindings you want to push by a DT maintainer.
