From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: rcar: clamp returned value to [0,1]
Date: Mon, 7 Jul 2014 17:27:11 +0200
Message-ID: <CACRpkdb28zErzAur4Op-gh5wp6h3MXYX=2c1u673JyBVqB5udQ@mail.gmail.com>
References: <1403576390-28381-1-git-send-email-j@bitron.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1403576390-28381-1-git-send-email-j@bitron.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?J=C3=BCrg_Billeter?= <j@bitron.ch>
Cc: Alexandre Courbot <gnurou@gmail.com>, Magnus Damm <damm@opensource.se>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 24, 2014 at 4:19 AM, J=C3=BCrg Billeter <j@bitron.ch> wrote=
:

> While it will be clamped to bool by gpiolib, let's make this sane
> in the driver as well.
>
> Signed-off-by: J=C3=BCrg Billeter <j@bitron.ch>

Patch obviously correct to applied.

Yours,
Linus Walleij
