From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: dwapb: Add support for next generation of X-Gene SoC
Date: Thu, 23 Feb 2017 16:07:47 +0100
Message-ID: <CACRpkdYEg6gr_qzDPggfcS=qaLc25iQNXTH7Ziq5juBo3Xyq6Q@mail.gmail.com>
References: <1487705563-8054-1-git-send-email-hotran@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1487705563-8054-1-git-send-email-hotran@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoan Tran <hotran@apm.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Jamie Iles <jamie@jamieiles.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Loc Ho <lho@apm.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Feb 21, 2017 at 8:32 PM, Hoan Tran <hotran@apm.com> wrote:

> Next generation of X-Gene SoC's GPIO hardware register map is very
> similar to DW GPIO. It only differs by a few register addresses.
> This patch modifies DW GPIO driver to accommodate the difference
> in a few register addresses.
>
> Signed-off-by: Hoan Tran <hotran@apm.com>

Patch applied for v4.12 with Andy's review tag.
Will appear in linux-next after the merge window.

Yours,
Linus Walleij
