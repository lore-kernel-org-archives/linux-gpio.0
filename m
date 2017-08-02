From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 066/102] pinctrl: stm32: explicitly request exclusive
 reset control
Date: Wed, 2 Aug 2017 13:43:59 +0200
Message-ID: <CACRpkdbZerkS9AvDWSgHaVdbEaF31m0QSFcnPedNEej9kJkF+Q@mail.gmail.com>
References: <20170719152646.25903-1-p.zabel@pengutronix.de> <20170719152646.25903-67-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170719152646.25903-67-p.zabel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 19, 2017 at 5:26 PM, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> Commit a53e35db70d1 ("reset: Ensure drivers are explicit when requesting
> reset lines") started to transition the reset control request API calls
> to explicitly state whether the driver needs exclusive or shared reset
> control behavior. Convert all drivers requesting exclusive resets to the
> explicit API call so the temporary transition helpers can be removed.
>
> No functional changes.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Patch applied.

Yours,
Linus Walleij
