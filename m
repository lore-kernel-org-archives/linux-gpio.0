From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: Do not accept gpio chip additions before gpiolib initialization
Date: Wed, 30 Mar 2016 17:37:12 +0900
Message-ID: <CAAVeFuJZuOWAeG7q=WaZj0f6ch9zmOHvBZReYDnqbFQLsP7G5Q@mail.gmail.com>
References: <1459275638-11717-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459275638-11717-1-git-send-email-linux@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Mar 30, 2016 at 3:20 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> Since commit ff2b13592299 ("gpio: make the gpiochip a real device"),
> attempts to add a gpio chip prior to gpiolib initialization cause the
> system to crash. Dump a warning to the console and return an error
> if the situation is encountered.

Mmm I see the problem but this could seriously delay the availability
of some GPIOs that are useful for early system boot.

I have not followed the GPIO device patches as closely as I should
have, but shouldn't you be able to register a GPIO chip without
immediately presenting it to user-space, for internal kernel needs? If
gpiolib is not initialized, then device-related operations would be
skipped, and gpiolib_dev_init() could then parse the list of
registered chips and fix them up when it gets called.

Again, I'm speaking without real knowledge here, but that pattern
seems more resilent to me.
