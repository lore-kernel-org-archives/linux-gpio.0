From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] gpio: davinci: Use dev name for label and automatic
 base selection
Date: Tue, 18 Sep 2018 12:26:37 -0700
Message-ID: <CACRpkdYmYHL1vrRFeyuO6immh9ZtVPeiOo+=ZB9T=CHe1yGTxg@mail.gmail.com>
References: <20180831191326.25106-1-afd@ti.com> <20180831191326.25106-2-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831191326.25106-2-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: "Nori, Sekhar" <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Keerthy <j-keerthy@ti.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 31, 2018 at 12:13 PM Andrew F. Davis <afd@ti.com> wrote:

> Use dev_name to get a unique label and use -1 for a base to get our
> selection automatically. We pull in all GPIOs per chip now so this
> does not have the effect of out of order labels like before.
>
> We do these both together so we can drop all the static data in one
> patch. This also lets us normalize the return paths as we don't need
> any cleanup after this change.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>

I have tentatively applied this patch set as we seem to have rough
consensus that it will be OK.

We can always pull it out or revert it if things break.

Yours,
Linus Walleij
