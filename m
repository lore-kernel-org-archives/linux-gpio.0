From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pca953x: add pcal6416 to the of_device_id table
Date: Thu, 11 Apr 2019 15:33:58 +0200
Message-ID: <CACRpkdYZduLLnE7XxcVgjajQzMH5XCTQM9RU-jt_xXoBT4faXQ@mail.gmail.com>
References: <20190409102517.6468-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409102517.6468-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 9, 2019 at 12:25 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> When adding support for the pcal6416, the of_device_id table was left out,
> add the proper entry.
>
> Fixes: aac1e3c9680b ("gpio: pca953x: add support for pcal6416 type")
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Patch applied.

Yours,
Linus Walleij
