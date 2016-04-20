From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/8] mfd: stmpe: Add reset support for all STMPE variant
Date: Wed, 20 Apr 2016 16:34:26 +0200
Message-ID: <CACRpkdbcr7Lz6ac27JgfLKtShP4tEjatdK80fJQRsVrsBrqrGQ@mail.gmail.com>
References: <1461068317-28016-1-git-send-email-patrice.chotard@st.com>
	<1461068317-28016-3-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461068317-28016-3-git-send-email-patrice.chotard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <maxime.coquelin@st.com>, amelie.delaunay@st.com, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Dinh Nguyen <dinguyen@opensource.altera.com>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 19, 2016 at 2:18 PM,  <patrice.chotard@st.com> wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
>
> Reset was only implemented for STMPE1801 variant despite
> all variant have a SOFT_RESET bit.
>
> For STMPE2401/2403/801/1601/1801 SOFT_RESET bit is bit 7
> of SYS_CTRL register.
> For STMPE610/811 (which have the same variant id) SOFT_RESET
> bit is bit 1 of SYS_CTRL register.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
