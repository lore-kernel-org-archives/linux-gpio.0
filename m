From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 17/19] pinctrl: amd: make use of raw_spinlock variants
Date: Wed, 15 Mar 2017 11:12:37 +0100
Message-ID: <CACRpkdaQ8+D31EndEJfE4GOdmhe8kUL0zN8fT9yG-KEeO_1kSw@mail.gmail.com>
References: <cover.1489015238.git.julia@ni.com> <1078eff36a2507d1aa5130cc0a9b28d520aabf31.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1078eff36a2507d1aa5130cc0a9b28d520aabf31.1489015238.git.julia@ni.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Cartwright <julia@ni.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 9, 2017 at 5:22 PM, Julia Cartwright <julia@ni.com> wrote:

> The amd pinctrl drivers currently implement an irq_chip for handling
> interrupts; due to how irq_chip handling is done, it's necessary for the
> irq_chip methods to be invoked from hardirq context, even on a a
> real-time kernel.  Because the spinlock_t type becomes a "sleeping"
> spinlock w/ RT kernels, it is not suitable to be used with irq_chips.
>
> A quick audit of the operations under the lock reveal that they do only
> minimal, bounded work, and are therefore safe to do under a raw spinlock.
>
> Signed-off-by: Julia Cartwright <julia@ni.com>

Patch applied.

Yours,
Linus Walleij
