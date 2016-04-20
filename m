From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 8/8] gpio: stmpe: configure GPIO as output by default
Date: Wed, 20 Apr 2016 16:56:50 +0200
Message-ID: <CACRpkdZwUnf3qfJr7btC7Bz5VXfPGaevmc3A3MTnimSXAj06+A@mail.gmail.com>
References: <1461068317-28016-1-git-send-email-patrice.chotard@st.com>
	<1461068317-28016-9-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:33221 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754513AbcDTO4v (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 10:56:51 -0400
Received: by mail-oi0-f42.google.com with SMTP id r78so42850891oie.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 07:56:51 -0700 (PDT)
In-Reply-To: <1461068317-28016-9-git-send-email-patrice.chotard@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <maxime.coquelin@st.com>, amelie.delaunay@st.com, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Dinh Nguyen <dinguyen@opensource.altera.com>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>

On Tue, Apr 19, 2016 at 2:18 PM,  <patrice.chotard@st.com> wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
>
> Configures all GPIOs as output, in order to minimize power
> consumption when GPIOs are unused.
>
> Signed-off-by: Amelie DELAUNAY <amelie.delaunay@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Not only do you set them all to outout but also:

> +       /* To minimize power consumption, configure unused GPIOs as outputs */
> +       for (i = 0; i < stmpe_gpio->chip.ngpio; i++)
> +               stmpe_gpio_direction_output(&stmpe_gpio->chip, i, 0);

You are driving them all low.

Now GPIO is general purpose: what if they are connected to a
line with a pull-up resistor?

That is not saving power, instead consuming more than if you
were setting them all to 1.

I am afraid this is wrong.

What you need is to be able to define in the DT (or similar)
a set of initial values for the GPIO lines, and set them to
0 for this design.

Such bindings have been discussed but no conclusion
or merged patch has emerged. Please help out in driving
a standard for this!

Yours,
Linus Walleij
