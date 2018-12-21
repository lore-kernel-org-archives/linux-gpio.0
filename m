From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: ocelot: add MSCC Jaguar2 support
Date: Fri, 21 Dec 2018 11:51:15 +0100
Message-ID: <CACRpkdaM-N9BmG=bFZAkZcojcKbXDnar0tRWAW0a3E1VwsD==A@mail.gmail.com>
References: <20181220144431.11143-1-alexandre.belloni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181220144431.11143-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Dec 20, 2018 at 3:44 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:

> Jaguar2 has the same register layout as Ocelot but it has 64 pins, meaning
> that there are 2 registers instead of one.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Pulled out v1 and applied this instead.

Yours,
Linus Walleij
