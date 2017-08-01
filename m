From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: zynq: Fix warnings in the driver
Date: Tue, 1 Aug 2017 15:27:06 +0200
Message-ID: <CACRpkdYxQOjzJTG2ENt4uo2K86+v-PzUr_zVmWcZOu19-979tg@mail.gmail.com>
References: <4c6e1f9b0635682518d2ffa50cf611efef4aff68.1499937148.git.michal.simek@xilinx.com>
 <4ec0134906b80ac107dfc80fbf7beb10e38e47cb.1499937148.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4ec0134906b80ac107dfc80fbf7beb10e38e47cb.1499937148.git.michal.simek@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, Nava kishore Manne <nava.manne@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, Josh Cartwright <josh.cartwright@ni.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jul 13, 2017 at 11:12 AM, Michal Simek <michal.simek@xilinx.com> wrote:

> From: Nava kishore Manne <nava.manne@xilinx.com>
>
> This patch fixes the below warning
>         --> Prefer 'unsigned int' to bare use of 'unsigned'.
>         --> line over 80 characters.
>         --> Prefer 'unsigned int **' to bare use of 'unsigned **'.
>
> Signed-off-by: Nava kishore Manne <navam@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Patch applied.

Yours,
Linus Walleij
