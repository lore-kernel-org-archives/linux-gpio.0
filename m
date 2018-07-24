From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH 2/2] pinctrl/amd: use byte access to clear irq/wake status bits
Date: Tue, 24 Jul 2018 07:29:04 -0500
Message-ID: <CAD8Lp44Ty9x7UF0=QOpqG-Yeo4rg0ep0VfTuW5FaDuXE1VQO+w@mail.gmail.com>
References: <20180717005719.258905-1-djkurtz@chromium.org> <20180717005719.258905-2-djkurtz@chromium.org>
 <CAD8Lp446Zu=EhdzRE9pEoskMWeOHOovoAJ8qtrovEuZ2E7Z5VQ@mail.gmail.com> <CAGS+omDPkC=Tv7SJ91cLxrFnab_VPC3VZRAugkvAUokkkoYSTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGS+omDPkC=Tv7SJ91cLxrFnab_VPC3VZRAugkvAUokkkoYSTg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Ken Xue <Ken.Xue@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jul 20, 2018 at 6:38 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:
> Sounds reasonable.  How about:
>
> -                       /* Clear interrupt.
> -                        * We must read the pin register again, in case the
> -                        * value was changed while executing
> -                        * generic_handle_irq() above.
> +                       /*
> +                        * Write-1-to-clear irq/wake status bits in MSByte.
> +                        * All other bits in this byte are read-only.
> +                        * This avoids modifying the lower 24-bits
> because they may have
> +                        *  changed while executing generic_handle_irq() above.
>                          */

That looks good. Thanks

Daniel
