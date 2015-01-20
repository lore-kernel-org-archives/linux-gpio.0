From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/8] gpio/mpc5200: Use of_mm_gpiochip_remove
Date: Tue, 20 Jan 2015 11:06:37 +0100
Message-ID: <CACRpkdbcYBZj1OLAbKJD8pChmBZoxvUwnCAPEJyehAVHqVCLdA@mail.gmail.com>
References: <1421581173-28416-1-git-send-email-ricardo.ribalda@gmail.com>
	<1421581173-28416-2-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421581173-28416-2-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: linux-gpio@vger.kernel.org

On Sun, Jan 18, 2015 at 12:39 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> Since d621e8bae5ac9c67 (Create of_mm_gpiochip_remove), there is a
> counterpart for of_mm_gpiochip_add.
>
> This patch implements the remove function of the driver making use of
> it.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

OK nice stuff, patch applied.

Yours,
Linus Walleij
