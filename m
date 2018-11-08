From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/3] gpio: mockup: fix indicated direction
Date: Thu, 8 Nov 2018 21:35:46 +0100
Message-ID: <20181108203546.54rncnydgamud5z3@pengutronix.de>
References: <20181108165255.9940-1-brgl@bgdev.pl>
 <20181108165255.9940-2-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181108165255.9940-2-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hello Bartosz,

On Thu, Nov 08, 2018 at 05:52:53PM +0100, Bartosz Golaszewski wrote:
> Commit 3edfb7bd76bd ("gpiolib: Show correct direction from the
> beginning") fixed an existing issue but broke libgpiod tests by
> changing the default direction of dummy lines to output.

The indicated commit only changed what was shown in debugfs, but didn't
touch the actual direction of a GPIO, doesn't it? If someone called
gpiod_get_direction before it would have returned "output", too, unless
I miss something.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
