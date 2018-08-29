From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Convert to using %pOFn instead of device_node.name
Date: Wed, 29 Aug 2018 14:02:04 +0200
Message-ID: <CACRpkdb0k15=8M4Q=KiH4VFWZKVyOg0NcSTxjmJApTnuTgFmfA@mail.gmail.com>
References: <20180828015252.28511-1-robh@kernel.org> <20180828015252.28511-18-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828015252.28511-18-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 28, 2018 at 3:53 AM Rob Herring <robh@kernel.org> wrote:

> In preparation to remove the node name pointer from struct device_node,
> convert printf users to use the %pOFn format specifier.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied.

Yours,
Linus Walleij
