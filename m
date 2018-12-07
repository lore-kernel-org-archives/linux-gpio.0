From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: mt7621: report failure of devm_kasprintf()
Date: Fri, 7 Dec 2018 10:46:26 +0100
Message-ID: <CACRpkdbsXHj=5uZNcJyxYNGhTeF3KhOyHaFgC8_DtTD8mRwynA@mail.gmail.com>
References: <1542823573-20228-1-git-send-email-hofrat@osadl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542823573-20228-1-git-send-email-hofrat@osadl.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 21, 2018 at 7:12 PM Nicholas Mc Guire <hofrat@osadl.org> wrote:

> kasprintf() may return NULL on failure of internal allocation thus the
> assigned  label  is not safe if not explicitly checked. On error
> mediatek_gpio_bank_probe() returns negative values so -ENOMEM in the
> (unlikely) failure case should be fine here.
>
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")

Patch applied with Bartosz and Sean's tags.

Yours,
Linus Walleij
