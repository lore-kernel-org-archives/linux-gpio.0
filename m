From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 3/3] gpiolib: Show correct direction from the beginning
Date: Wed, 10 Oct 2018 10:31:23 +0200
Message-ID: <CACRpkdYhXcHXSkP2DMb0hRFHnZa_iTvf8FiWiX8-fZXY95Lweg@mail.gmail.com>
References: <20181005065300.22882-1-ricardo.ribalda@gmail.com> <20181005065300.22882-3-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181005065300.22882-3-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: jhugo@codeaurora.org, timur@kernel.org, Stephen Boyd <swboyd@chromium.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 5, 2018 at 8:53 AM Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> Current code assumes that the direction is input if direction_input
> function is set.
> This might not be the case on GPIOs with programmable direction.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Patch applied with the collected ACKs.

Thanks for working so hard on fixing this up.

Yours,
Linus Walleij
