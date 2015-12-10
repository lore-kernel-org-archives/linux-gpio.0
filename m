From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/4] gpio: pxa: change the interrupt management
Date: Thu, 10 Dec 2015 16:06:46 +0100
Message-ID: <CACRpkdZJ0fPz+Yw1tXDtKUiTDQHC4ouFCNsa55sr0K70FeJkDA@mail.gmail.com>
References: <1448746665-13422-1-git-send-email-robert.jarzmik@free.fr>
	<1448746665-13422-4-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448746665-13422-4-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Mack <zonque@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Sat, Nov 28, 2015 at 10:37 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> The interrupt management is changed by this patch to rely on chip data
> instead of chained interrupts.
>
> The main goal is to loosen the dependency on the global pxa chip
> structure in favor of the passed chip data. The secondary goal is to
> better show in /proc/interrupts the difference between interrupts for
> gpio0 and gpio1 (directly wired to interrupt controller), and the other
> gpios (wired onto a third line in the interrupt controller).
>
> The last advantage of this patch is that the interrupt is actually
> requested, so that another driver cannot steal this line, or overwrite
> the handler.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>

I stopped applying here, waiting for a v2 of the two last
patches.

Yours,
Linus Walleij
