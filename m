From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: brcmstb: check return value of gpiochip_irqchip_add()
Date: Tue, 22 Aug 2017 15:10:48 +0200
Message-ID: <CACRpkdacW8dBOaHUmp=dJDPMT22X088eMdepUoXtza4_DEiEGg@mail.gmail.com>
References: <1502319087-23396-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502319087-23396-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Gregory Fong <gregory.0xf0@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Aug 10, 2017 at 12:51 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Because gpiochip_irqchip_add() may fail, its return value should
> be checked.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Patch applied with Gregory's ACK.

Yours,
Linus Walleij
