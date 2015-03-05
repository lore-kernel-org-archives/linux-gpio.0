From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 07/11] pinctrl: berlin: use proper compatibles
Date: Thu, 5 Mar 2015 10:39:47 +0100
Message-ID: <CACRpkdb7Snqmp7DrvB=JN4DQqHTFzmmYyzKVb4TEoTijyvNVjA@mail.gmail.com>
References: <1423671332-24580-1-git-send-email-antoine.tenart@free-electrons.com>
	<1423671332-24580-8-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423671332-24580-8-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jisheng Zhang <jszhang@marvell.com>, zhiming Xu <zmxu@marvell.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 11, 2015 at 5:15 PM, Antoine Tenart
<antoine.tenart@free-electrons.com> wrote:

> The Berlin pin-controller driver was sharing the chip and system
> controller nodes with the clock and the reset drivers. They all shared
> the same compatible. With the introduction of the Marvell Berlin MFD
> controller, the Berlin pin-controller driver has now its own node.
> Update its compatibles to not share anymore the ones of the chip and
> system controllers.
>
> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Tell me if you prefer that I merge this patch directly to the
pin control subsystem.

Yours,
Linus Walleij
