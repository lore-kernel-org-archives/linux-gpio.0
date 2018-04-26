From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: fix aspeed_gpio unmask irq
Date: Thu, 26 Apr 2018 11:13:51 +0200
Message-ID: <CACRpkdbBOiC2EXuZvwCJHz3ucNGtNmu2vumFa=68fPXfM2_dSA@mail.gmail.com>
References: <20180406124135.46622-1-govert.overgaauw@prodrive-technologies.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180406124135.46622-1-govert.overgaauw@prodrive-technologies.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Govert Overgaauw <govert.overgaauw@prodrive-technologies.com>
Cc: Joel Stanley <joel@jms.id.au>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 6, 2018 at 2:41 PM, Govert Overgaauw
<govert.overgaauw@prodrive-technologies.com> wrote:

> The unmask function disables all interrupts in a bank when unmasking an
> interrupt. Only disable the given interrupt.
>
> Signed-off-by: Govert Overgaauw <govert.overgaauw@prodrive-technologies.com>

Patch applied for fixes as obviously correct and also tagged
for stable.

Yours,
Linus Walleij
