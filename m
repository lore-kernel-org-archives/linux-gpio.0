From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] davinci:Fix possible NULL pointer deference in the
 function davinci_gpio_probe
Date: Mon, 15 Feb 2016 14:38:56 +0100
Message-ID: <CACRpkdabV8dfHcn8MCCrc3zA+yDO0zK0ko0QG5bN=fDoHZo+dQ@mail.gmail.com>
References: <1454458679-11165-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454458679-11165-1-git-send-email-xerofoify@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 3, 2016 at 1:17 AM, Nicholas Krause <xerofoify@gmail.com> wrote:

> This fixes a possible NULL pointer deference in the function,
> davinci_gpio_probe due to the function, gpio2regs being able
> to return a NULL pointer if it rans to get the registers for
> the gpio devices on a davinci board. Furthermore if this does
> arise return -ENXIO to signal callers that this case has arisen
> and avoiding setting the regs or other pointer values on the
>
> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>

Patch applied with Alex' review tag.

Yours,
Linus Walleij
