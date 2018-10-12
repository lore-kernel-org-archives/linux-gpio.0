From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: REGRESSION: [PATCH v5 3/3] gpiolib: Show correct direction from
 the beginning
Date: Fri, 12 Oct 2018 11:08:50 +0200
Message-ID: <CACRpkdY89b-hy_aoBiZXX6KqyJrZd0fX9-XCGcF9XjPBy6Lwrw@mail.gmail.com>
References: <20181005065300.22882-1-ricardo.ribalda@gmail.com>
 <20181005065300.22882-3-ricardo.ribalda@gmail.com> <1539334839.30485.9.camel@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1539334839.30485.9.camel@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: timur@kernel.org, Stephen Boyd <swboyd@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, jhugo@codeaurora.org, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 12, 2018 at 11:00 AM Marcel Ziswiler
<marcel.ziswiler@toradex.com> wrote:
> On Fri, 2018-10-05 at 08:53 +0200, Ricardo Ribalda Delgado wrote:
> > Current code assumes that the direction is input if direction_input
> > function is set.
> > This might not be the case on GPIOs with programmable direction.
>
> Unfortunately, this breaks at least Apalis T30 and Apalis TK1. Enabling
> earlycon reveals the following:

Does this (just applied) patch fix the issue?
https://marc.info/?l=linux-kernel&m=153932470412013&w=2

Yours,
Linus Walleij
