From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sunxi: constify irq_domain_ops
Date: Fri, 9 Jun 2017 10:59:35 +0200
Message-ID: <CACRpkda37Xzfh_w08PeEGUDJn+5GkBNGQmsMaX98QZRpnkSEjA@mail.gmail.com>
References: <20170602112958.3882-1-tklauser@distanz.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170602112958.3882-1-tklauser@distanz.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Tobias Klauser <tklauser@distanz.ch>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Marc Zyngier <marc.zyngier@arm.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 2, 2017 at 1:29 PM, Tobias Klauser <tklauser@distanz.ch> wrote:

> struct irq_domain_ops is not modified, so it can be made const.
>
> Suggested-by: Marc Zyngier <marc.zyngier@arm.com>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Patch applied with Maxime's ACK.

Yours,
Linus Walleij
