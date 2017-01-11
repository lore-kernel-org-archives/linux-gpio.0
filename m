From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: pca953x: lockdep warning since 4.10
Date: Wed, 11 Jan 2017 14:43:31 +0100
Message-ID: <CACRpkdaaCJK3=VOvyHt5hdJQJCQmaFjW5YXwEqivVPdFXDZ91Q@mail.gmail.com>
References: <20170107205410.GA11574@archie.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170107205410.GA11574@archie.localdomain>
Sender: linux-kernel-owner@vger.kernel.org
To: Clemens Gruber <clemens.gruber@pqgruber.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Wolfram Sang <wsa@the-dreams.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Jan 7, 2017 at 9:54 PM, Clemens Gruber
<clemens.gruber@pqgruber.com> wrote:

> I observed the following lockdep warning when booting an i.MX6Q board
> with several PCAL9555A gpio expanders connected over I2C. They are
> connected to 3 separate busses, there is no i2c-mux in use.
>
> This warning appears with the latest mainline Linux kernel 4.10-rc2:

Can you please test the patch with subject:
"gpio: provide lockdep keys for nested/unnested irqchips"
that I sent out a few minutes ago?

Please provide Tested-by if it solves your issue.

Yours,
Linus Walleij
