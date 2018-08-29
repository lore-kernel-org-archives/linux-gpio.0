From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl/amd: use byte access to clear irq/wake status bits
Date: Wed, 29 Aug 2018 13:55:24 +0200
Message-ID: <CACRpkdb7OEC8ZFNOU915aD2e=PzOk1DasmaAq-oHCeSYVrnuTQ@mail.gmail.com>
References: <20180822165754.213402-1-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180822165754.213402-1-djkurtz@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Daniel Drake <drake@endlessm.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>, Ken Xue <Ken.Xue@amd.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 22, 2018 at 6:57 PM Daniel Kurtz <djkurtz@chromium.org> wrote:

> Commit 6afb10267c1692 ("pinctrl/amd: fix masking of GPIO interrupts")
> changed to the clearing of interrupt status bits to a RMW in a critical
> section.  This works, but is a bit overkill.
>
> The relevant interrupt/wake status bits are in the Most Significant Byte
> of a 32-bit word.  These two are the only write-able bits in this byte.
>
> Therefore, it should be safe to just write these bits back as a byte
> access without any additional locking.
>
> Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>

The build robot is complaining about the syntax.
Is this fixable? Maybe you already sent a new patch... I will
see when I reach the top of my inbox.

Yours,
Linus Walleij
