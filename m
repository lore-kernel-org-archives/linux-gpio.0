From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 06/10] mfd: stmpe: rework registers access
Date: Fri, 29 Apr 2016 09:42:06 +0200
Message-ID: <CACRpkdbPGjmKb6V+QhxnjV+FxcTDhFDmMdjfHhS4fUEHVXEs6A@mail.gmail.com>
References: <1461845589-4826-1-git-send-email-patrice.chotard@st.com>
	<1461845589-4826-7-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461845589-4826-7-git-send-email-patrice.chotard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <maxime.coquelin@st.com>, amelie.delaunay@st.com, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Dinh Nguyen <dinguyen@opensource.altera.com>, Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Stefan Agner <stefan@agner.ch>, dev@lynxeye.de
List-Id: linux-gpio@vger.kernel.org

On Thu, Apr 28, 2016 at 2:13 PM,  <patrice.chotard@st.com> wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
>
> this update allows to use registers map as following :
> regs[reg_index + offset] instead of
> regs[reg_index] + offset
>
> This makes code clearer and will facilitate the addition of STMPE1600
> on which LSB and MSB registers are respectively located at addr and addr + 1.
> Despite for all others STMPE variant, LSB and MSB registers are respectively
> located in reverse order at addr + 1 and addr.
>
> For variant which have 3 registers's bank, we use LSB,CSB and MSB indexes
> which contains respectively LSB (or LOW), CSB (or MID) and MSB (or HIGH)
> register addresses (STMPE1801/STMPE24xx).
> For variant which have 2 registers's bank, we use LSB and CSB indexes only.
> In this case the CSB index contains the MSB regs address (STMPE 1601).
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Yep this is so much clearer!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
