From: Gregory Fong <gregory.0xf0@gmail.com>
Subject: Re: [PATCH] gpio: brcmstb: check return value of gpiochip_irqchip_add()
Date: Tue, 15 Aug 2017 23:08:47 -0700
Message-ID: <CADtm3G70RM_gomboAovi8_=qjj-FqN4PTFAo_tPKCApg5somEw@mail.gmail.com>
References: <1502319087-23396-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1502319087-23396-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brian Norris <computersforpeace@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 9, 2017 at 3:51 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Because gpiochip_irqchip_add() may fail, its return value should
> be checked.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Gregory Fong <gregory.0xf0@gmail.com>
