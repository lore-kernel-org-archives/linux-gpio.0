From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v2] mdio-mux-gpio: Remove VLA usage
Date: Tue, 19 Jun 2018 21:44:27 -0700
Message-ID: <CAGXu5j+sh-gSXvGg25oN9Xsyw1W=i177=52ZXPV3OvEym6nr7g@mail.gmail.com>
References: <20180530204830.GA24884@beast> <20180530205712.GB16286@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180530205712.GB16286@lunn.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>
Cc: Pramod Kumar <pramod.kumar@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, May 30, 2018 at 1:57 PM, Andrew Lunn <andrew@lunn.ch> wrote:
> On Wed, May 30, 2018 at 01:48:30PM -0700, Kees Cook wrote:
>> In the quest to remove all stack VLA usage from the kernel[1], this
>> moves the allocation into struct mdio_mux_gpio_state during probe.
>>
>> [1] https://lkml.kernel.org/r/CA+55aFzCG-zNmZwX4A2FQpadafLfEzK6CC=qPXydAacU1RqZWA@mail.gmail.com
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> ---
>> v2: allocate array as part of structure (Andrew Lunn)
>
> Hi Kees
>
> This looks much better, thanks.
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Thanks! Who can take this patch? Linus?

-Kees

-- 
Kees Cook
Pixel Security
