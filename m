From: David Lechner <david@lechnology.com>
Subject: Re: [RFC] gpio: of: fix GPIO drivers with multiple gpio_chip for a
 single node
Date: Mon, 24 Oct 2016 16:31:44 -0500
Message-ID: <5caabb44-3c32-fc6d-e0e0-a063cd665c52@lechnology.com>
References: <1477295033-6008-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477295033-6008-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, Axel Haslam <ahaslam@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On 10/24/2016 02:43 AM, Masahiro Yamada wrote:
> Sylvain Lemieux reports the LPC32xx GPIO driver is broken since
> commit 762c2e46c059 ("gpio: of: remove of_gpiochip_and_xlate() and
> struct gg_data").  Probably, gpio-etraxfs.c and gpio-davinci.c are
> broken as well.
>
> Those drivers register multiple gpio_chip that are associated to a
> single OF node, and their own .of_xlate() checks if the passed
> gpio_chip is valid.
>
> Now, the problem is of_find_gpiochip_by_node() returns the first
> gpio_chip found to match the given node.  So, .of_xlate() fails,
> except for the first GPIO bank.
>
> Reverting the commit could be a solution, but I do not want to go
> back to the mess of struct gg_data.  Another solution here is to
> take the match by a node pointer and the success of .of_xlate().
> It is a bit clumsy to call .of_xlate twice; for gpio_chip matching
> and for really getting the gpio_desc index.  Perhaps, the long-term
> goal might be to convert drivers to single chip registration, but
> this commit will solve the problem until then.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Reported-by: <slemieux.tyco@gmail.com>

This fixes gpio-davinci. Tested on LEGO MINDSTORMS EV3 (I included the 
chip->of_xlate(chip, gpiospec, NULL) >= 0 suggestion from  Sylvain 
Lemieux when I tested).

Tested-By: David Lechner <david@lechnology.com>
