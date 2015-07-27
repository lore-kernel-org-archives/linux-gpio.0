From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] pinctrl: sunxi: Use common functions to change
 irq_chip and handler
Date: Mon, 27 Jul 2015 13:59:20 +0200
Message-ID: <CACRpkdYNzuSs6+J1a8tzR56ERJCOuq4xVYZH=T2DS892L+kOKQ@mail.gmail.com>
References: <1437396074-15791-1-git-send-email-maxime.ripard@free-electrons.com>
	<1437396074-15791-2-git-send-email-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437396074-15791-2-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 20, 2015 at 2:41 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> The current code uses some custom variable affectations, while we have
> common functions to do exactly that. Move to the common functions.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Patch applied.

Yours,
Linus Walleij
