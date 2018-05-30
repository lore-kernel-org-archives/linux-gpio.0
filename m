From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2] mdio-mux-gpio: Remove VLA usage
Date: Wed, 30 May 2018 22:57:12 +0200
Message-ID: <20180530205712.GB16286@lunn.ch>
References: <20180530204830.GA24884@beast>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180530204830.GA24884@beast>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Pramod Kumar <pramod.kumar@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Wed, May 30, 2018 at 01:48:30PM -0700, Kees Cook wrote:
> In the quest to remove all stack VLA usage from the kernel[1], this
> moves the allocation into struct mdio_mux_gpio_state during probe.
> 
> [1] https://lkml.kernel.org/r/CA+55aFzCG-zNmZwX4A2FQpadafLfEzK6CC=qPXydAacU1RqZWA@mail.gmail.com
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v2: allocate array as part of structure (Andrew Lunn)

Hi Kees

This looks much better, thanks.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
