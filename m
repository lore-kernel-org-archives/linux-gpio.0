From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: 104-dio-48e: Fix control port offset computation
 off-by-one error
Date: Wed, 8 Jun 2016 10:08:34 +0200
Message-ID: <CACRpkdawGmR6oLG-Vvs=O=KsLM=8RmSSF7M-xCh-A4vgnk+-pw@mail.gmail.com>
References: <1464897609-7389-1-git-send-email-vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464897609-7389-1-git-send-email-vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 2, 2016 at 10:00 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> There are only two control ports, each controlling three distinct I/O
> ports. To compute the control port address offset for a respective I/O
> port, the I/O port address offset should be divided by 3; dividing by 2
> may result in not only the wrong address offset but possibly also an
> out-of-bounds array memory access for a non-existent third control port.
>
> Fixes: 1b06d64f7374 ("gpio: Add GPIO support for the ACCES 104-DIO-48E")
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
