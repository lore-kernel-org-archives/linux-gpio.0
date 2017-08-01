From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpiolib: skip unwanted events, don't convert them to
 opposite edge
Date: Tue, 1 Aug 2017 14:08:25 +0200
Message-ID: <CACRpkdZF4H9gH8B9FDTv8cBUocFWfbEppO=hXWMrTgfRBE0zSw@mail.gmail.com>
References: <1499073123-13393-1-git-send-email-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499073123-13393-1-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 3, 2017 at 11:12 AM, Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> The previous fix for filtering out of unwatched events was not entirely
> correct. Instead of skipping the events we don't want, they are now
> interpreted as events with opposing edge.
>
> In order to fix it: always read the GPIO line value on interrupt and
> only emit the event if it corresponds with the event type we requested.
>
> Fixes: ad537b822577 ("gpiolib: fix filtering out unwanted events")
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
> Hi Linus,
>
> I tested my previous fix on a real board, where I got a storm of
> interrupts from simply playing with a GPIO manually. It looked ok so I
> posted the patch, but I didn't notice that when waiting for rising-edge
> events, all falling-edge events got interpreted as such. This patch
> should actually fix this bug. Tested carefully with gpio-mockup this
> time.

Patrch applied for fixes and tagged for stable.

Yours,
Linus Walleij
