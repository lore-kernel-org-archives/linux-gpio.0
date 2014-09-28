From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] pinctrl: remove remaining users of gpiochip_remove()
 retval
Date: Sun, 28 Sep 2014 11:08:38 +0200
Message-ID: <20140928090838.GD31554@pengutronix.de>
References: <1410905274-22339-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1410905274-22339-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hello Linus,

On Tue, Sep 16, 2014 at 03:07:54PM -0700, Linus Walleij wrote:
> Some drivers accidentally still use the return value from
> gpiochip_remove(). Get rid of them so we can simplify this function
> and get rid of the return value.
>=20
> Abdoulaye Berthe <berthe.ab@gmail.com>
Is there a "Signed-off-by: " (or an other tag) missing?

> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Best regards
Uwe
--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
