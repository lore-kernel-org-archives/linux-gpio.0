From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 6/7] gpio: Add gpio driver support for ThunderX and OCTEON-TX
Date: Tue, 22 Aug 2017 14:29:20 +0200
Message-ID: <CACRpkdbUSafTT7AHAO_gUDg9AFSGgn85bwPsosXMCVM2nZ7pUQ@mail.gmail.com>
References: <1503017616-3252-1-git-send-email-david.daney@cavium.com> <1503017616-3252-7-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503017616-3252-7-git-send-email-david.daney@cavium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <david.daney@cavium.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 18, 2017 at 2:53 AM, David Daney <david.daney@cavium.com> wrote:

> Cavium ThunderX and OCTEON-TX are arm64 based SoCs.  Add driver for
> the on-chip GPIO pins.
>
> Signed-off-by: David Daney <david.daney@cavium.com>

Patch applied on top of Thomas changes that I pulled into the
GPIO tree yesterday.

Yours,
Linus Walleij
