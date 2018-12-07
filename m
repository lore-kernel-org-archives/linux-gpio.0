From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2] gpio: mt7621: pass mediatek_gpio_bank_probe() failure
 up the stack
Date: Fri, 7 Dec 2018 10:48:09 +0100
Message-ID: <CACRpkdaM1j7tXm+rekxWUOuzshfYxHf66mYQYtJLuHq=kpJ6Vw@mail.gmail.com>
References: <1543338018-708-1-git-send-email-hofrat@osadl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543338018-708-1-git-send-email-hofrat@osadl.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 27, 2018 at 6:06 PM Nicholas Mc Guire <hofrat@osadl.org> wrote:

> The error cases of mediatek_gpio_bank_probe() would go unnoticed (except
> for the dev_err() messages). The probe function should return an error
> if one of the banks failed to initialize properly indicated by
> not returning non-0.
>
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")

Patch applied with Sean's ACK.

Yours,
Linus Walleij
