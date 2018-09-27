From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2] gpiolib: Show correct direction from the beginning
Date: Wed, 26 Sep 2018 23:51:13 -0700
Message-ID: <153803107307.119890.10052910965015646333@swboyd.mtv.corp.google.com>
References: <20180921103604.13361-1-ricardo.ribalda@gmail.com>
 <20180921103604.13361-2-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180921103604.13361-2-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Timur Tabi <timur@codeaurora.org>, linux-gpio@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Quoting Ricardo Ribalda Delgado (2018-09-21 03:36:04)
> Current code assumes that the direction is input if direction_input
> function is set.
> This might not be the case on GPIOs with programmable direction.
> =

> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---

Looks OK to me visually. I haven't tested it because I don't have access
to the locked down hardware anymore.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
