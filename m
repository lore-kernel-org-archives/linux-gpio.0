From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pcf857x: get rid of slock spinlock
Date: Thu, 16 Jul 2015 10:45:26 +0200
Message-ID: <CACRpkdbjJN1KbBjT4=tL0kBjJ8Y=5cd4LDrPNN6xJkjCqbNnUQ@mail.gmail.com>
References: <1435245491-18012-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435245491-18012-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Sekhar Nori <nsekhar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 25, 2015 at 5:18 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> The spinlock 'slock' is used now to protect pcf857x_irq() from itself
> which is unnecessary (especially after switching to use threaded
> IRQs). Hence, remove it and use mutex to protect device data in IRQ
> handler.
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>

No comments, so patch applied.

Yours,
Linus Walleij
