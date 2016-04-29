From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 10/10] gpio: stmpe: Add STMPE1600 support
Date: Fri, 29 Apr 2016 09:44:13 +0200
Message-ID: <CACRpkda=EtfuQZT6wcrZM4R4FhvM9A9N6sXRrvWV2bYgiDShGw@mail.gmail.com>
References: <1461845589-4826-1-git-send-email-patrice.chotard@st.com>
	<1461845589-4826-11-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:34840 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750758AbcD2HoO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Apr 2016 03:44:14 -0400
Received: by mail-oi0-f50.google.com with SMTP id x19so110067654oix.2
        for <linux-gpio@vger.kernel.org>; Fri, 29 Apr 2016 00:44:14 -0700 (PDT)
In-Reply-To: <1461845589-4826-11-git-send-email-patrice.chotard@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <maxime.coquelin@st.com>, amelie.delaunay@st.com, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Dinh Nguyen <dinguyen@opensource.altera.com>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Stefan Agner <stefan@agner.ch>, dev@lynxeye.de

On Thu, Apr 28, 2016 at 2:13 PM,  <patrice.chotard@st.com> wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
>
> The particularities of this variant are:
> - GPIO_XXX_LSB and GPIO_XXX_MSB memory locations are inverted compared
>   to other variants.
> - There is no Edge detection, Rising Edge and Falling Edge registers.
> - IRQ flags are cleared when read, no need to write in Status register.
>
> Signed-off-by: Amelie DELAUNAY <amelie.delaunay@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
