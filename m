From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: gpio-mxc: gpio_set_wake_irq() use proper return values
Date: Tue, 1 Aug 2017 10:39:13 +0200
Message-ID: <CACRpkdbjqLXtar7zw_cKza=8eC6DzCMBgj7_Jn+q1SG22FCE1Q@mail.gmail.com>
References: <1499848600-7233-1-git-send-email-p.rosenberger@linutronix.de> <1499848600-7233-3-git-send-email-p.rosenberger@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499848600-7233-3-git-send-email-p.rosenberger@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Rosenberger <p.rosenberger@linutronix.de>, Vladimir Zapolskiy <vz@mleia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 12, 2017 at 10:36 AM, Philipp Rosenberger
<p.rosenberger@linutronix.de> wrote:

> Errors from enable_irq_wake() in gpio_set_wake_irq() were silently ignored.
> Thus led to the problem that gpio_set_wake_irq() always returned
> successfully, even if enable_irq_wake() returned an error.
>
> Signed-off-by: Philipp Rosenberger <p.rosenberger@linutronix.de>

Patch applied.

Yours,
Linus Walleij
