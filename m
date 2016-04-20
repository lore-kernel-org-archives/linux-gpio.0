From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/8] mfd: Add STMPE1600 support
Date: Wed, 20 Apr 2016 16:43:24 +0200
Message-ID: <CACRpkdb73QAs5jZpTq1Qz_RX=fSj3ymQ54S-6RwNDTZ9x8ASkg@mail.gmail.com>
References: <1461068317-28016-1-git-send-email-patrice.chotard@st.com>
	<1461068317-28016-7-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:36502 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932066AbcDTOnZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Apr 2016 10:43:25 -0400
Received: by mail-oi0-f45.google.com with SMTP id x201so42212729oif.3
        for <linux-gpio@vger.kernel.org>; Wed, 20 Apr 2016 07:43:24 -0700 (PDT)
In-Reply-To: <1461068317-28016-7-git-send-email-patrice.chotard@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <maxime.coquelin@st.com>, amelie.delaunay@st.com, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Dinh Nguyen <dinguyen@opensource.altera.com>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>

On Tue, Apr 19, 2016 at 2:18 PM,  <patrice.chotard@st.com> wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
>
> STMPE1600 is a 16-bit port expander.
> Datasheet is available here :
> http://www2.st.com/content/st_com/en/products/interfaces-and-transceivers/
> i-o-expanders-and-level-translators/i-o-expanders/stmpe1600.html
>
> As STMPE1600's SYS_CTRL register has the same layout as
> STMPE801 variant, unify STMPExxx_REG_SYS_CTRL_RESET/INT_EN/INT_HI
> bit masks to more generic STMPE_SYS_CTRL_RESET/INT_EN/INT_HI
>
> Signed-off-by: Amelie DELAUNAY <amelie.delaunay@st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

(...)
>  #define STMPE_SYS_CTRL_RESET   (1 << 7)
> +#define STMPE_SYS_CTRL_INT_EN  (1 << 2)
> +#define STMPE_SYS_CTRL_INT_HI  (1 << 0)
>
>  /*
>   * STMPE801
> @@ -121,10 +123,6 @@ int stmpe_remove(struct stmpe *stmpe);
>  #define STMPE801_REG_GPIO_SET_PIN      0x11
>  #define STMPE801_REG_GPIO_DIR          0x12
>
> -#define STMPE801_REG_SYS_CTRL_RESET    (1 << 7)
> -#define STMPE801_REG_SYS_CTRL_INT_EN   (1 << 2)
> -#define STMPE801_REG_SYS_CTRL_INT_HI   (1 << 0)

This looks like unrelated cleanups?
Should this be in the reset enablement patch?
(It's OK with me though.)

With that fixed:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
