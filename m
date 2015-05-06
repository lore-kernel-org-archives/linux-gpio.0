From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: max732x: Add IRQF_SHARED to irq flags
Date: Wed, 6 May 2015 15:07:17 +0200
Message-ID: <CACRpkda5jrEcFuQKb63FbeggNWvJBYo4bbnrGecQnWTipdwxjQ@mail.gmail.com>
References: <1429622344-19429-1-git-send-email-semen.protsenko@globallogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429622344-19429-1-git-send-email-semen.protsenko@globallogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Semen Protsenko <semen.protsenko@globallogic.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Apr 21, 2015 at 3:19 PM, Semen Protsenko
<semen.protsenko@globallogic.com> wrote:

> It's possible that multiple MAX732X can be hooked up to the same
> interrupt line with the processor. So add IRQF_SHARED in requesting irq.
>
> Signed-off-by: Semen Protsenko <semen.protsenko@globallogic.com>

Patch applied.

Since you're doing these patches I assume my conversion to
GPIOLIB_IRQCHIP in the last merge window just worked.

Yours,
Linus Walleij
