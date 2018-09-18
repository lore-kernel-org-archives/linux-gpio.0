From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] gpio: davinci: Remove unused member of davinci_gpio_controller
Date: Tue, 18 Sep 2018 12:24:38 -0700
Message-ID: <CACRpkdZCKPnr4d+2oDHc50U7Z=yw-m9R=X=973Rm+dkvwYrD6w@mail.gmail.com>
References: <20180831191326.25106-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831191326.25106-1-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: "Nori, Sekhar" <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Keerthy <j-keerthy@ti.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 31, 2018 at 12:13 PM Andrew F. Davis <afd@ti.com> wrote:

> This was added as part of the patch in the fixes below, but was
> not needed or used, remove this here.
>
> Fixes: 8e11047b8f3c ("gpio: davinci: Add support for multiple GPIO controllers")
> Signed-off-by: Andrew F. Davis <afd@ti.com>

Patch applied.

Yours,
Linus Walleij
