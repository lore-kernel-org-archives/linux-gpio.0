From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 10/19] gpio: ws16c48: make use of raw_spinlock variants
Date: Wed, 15 Mar 2017 11:02:40 +0100
Message-ID: <CACRpkda_GtOT5_Xs6iNCbVqzDWQM6qWM2T7ctxoBa-4VmGK6hQ@mail.gmail.com>
References: <cover.1489015238.git.julia@ni.com> <90f09a1e378d9858c4d79bd02e31512b96ef8de3.1489015238.git.julia@ni.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <90f09a1e378d9858c4d79bd02e31512b96ef8de3.1489015238.git.julia@ni.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Cartwright <julia@ni.com>
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Mar 9, 2017 at 5:21 PM, Julia Cartwright <julia@ni.com> wrote:

> The ws16c48 gpio driver currently implements an irq_chip for handling
> interrupts; due to how irq_chip handling is done, it's necessary for the
> irq_chip methods to be invoked from hardirq context, even on a a
> real-time kernel.  Because the spinlock_t type becomes a "sleeping"
> spinlock w/ RT kernels, it is not suitable to be used with irq_chips.
>
> A quick audit of the operations under the lock reveal that they do only
> minimal, bounded work, and are therefore safe to do under a raw spinlock.
>
> Signed-off-by: Julia Cartwright <julia@ni.com>

Patch applied with William's ACK.

Yours,
Linus Walleij
