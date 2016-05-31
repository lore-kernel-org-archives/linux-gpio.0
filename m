From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: stm32: factorize stm32_pconf_input/output_get()
Date: Tue, 31 May 2016 10:06:54 +0200
Message-ID: <CACRpkdY0Z7J347u1UkdYKpbKCga_JiJ+bKmULXAv2rWyb24cmA@mail.gmail.com>
References: <1464091063-22341-1-git-send-email-patrice.chotard@st.com>
	<1464091063-22341-2-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464091063-22341-2-git-send-email-patrice.chotard@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Patrice CHOTARD <patrice.chotard@st.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, May 24, 2016 at 1:57 PM,  <patrice.chotard@st.com> wrote:

> From: Patrice Chotard <patrice.chotard@st.com>
>
> As these 2 functions code are 95% similar, factorize them.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij
