From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch 00/19] gpio: Interrupt cleanups and API change preparation
Date: Thu, 16 Jul 2015 15:55:40 +0200
Message-ID: <CACRpkdZqGfB-5e+gt8qk+m+iXnO8+S7K_-qQbL+nvHQaxD36BQ@mail.gmail.com>
References: <20150712232317.244138485@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150712232317.244138485@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jiang Liu <jiang.liu@linux.intel.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jul 13, 2015 at 10:41 PM, Thomas Gleixner <tglx@linutronix.de> wrote:

> The following patch series contains the following changes:
>
>     - Consolidation of chained interrupt handler setup/removal
>
>     - Switch to functions which avoid a redundant interrupt
>       descriptor lookup
>
>     - Preparation of interrupt flow handlers for the 'irq' argument
>       removal
>
> The series has no dependencies and is also available as a git branch
> for your convenience:
>
>  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/gpio

Hmm.....

git pull git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/gpio
fatal: Couldn't find remote ref irq/gpio

Same with pinctrl, did you push it?

Or am I a shitty git operator ... don't rule that out :/

Yours,
Linus Walleij
