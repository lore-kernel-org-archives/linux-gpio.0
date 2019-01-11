From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/8] gpio: zynq: Wakeup gpio controller when it is used
 as IRQ controller
Date: Fri, 11 Jan 2019 13:54:13 +0100
Message-ID: <20190111135413.73dad0b2@windsurf>
References: <cover.1502103715.git.michal.simek@xilinx.com>
        <72d3cd83bed792a23ab60cf9b6d51b618f5aa084.1502103715.git.michal.simek@xilinx.com>
        <CACRpkdZE-Edr7fWZY5VQM1_65iw7MYGP-iDa2ExZsPxpM0rurQ@mail.gmail.com>
        <6da5fd79-fbc8-b613-954f-dcbe2ef8d6c5@xilinx.com>
        <20190107164210.3ecf37e8@windsurf>
        <CACRpkdafBpC14TxBNVN2AemkBz-yKkXkKfNpdgkYKQX3qFemag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdafBpC14TxBNVN2AemkBz-yKkXkKfNpdgkYKQX3qFemag@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michal Simek <michal.simek@xilinx.com>, Nava kishore Manne <navam@xilinx.com>, Josh Cartwright <josh.cartwright@ni.com>, "monstr@monstr.eu" <monstr@monstr.eu>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Borsodi Petr <Petr.Borsodi@i.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, =?UTF-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>, Shubhrajyoti Datta <shubhraj@xilinx.com>
List-Id: linux-gpio@vger.kernel.org

Hello Linus,

On Fri, 11 Jan 2019 10:54:20 +0100, Linus Walleij wrote:

> My stance is that the driver is responsible of enabling and managing
> runtime PM for its hardware block(s).
> 
> Runtime PM in the core should only be added if the core needs to
> be aware about it, such as is the case when e.g. a block device
> needs to drain its write buffer before going to runtime sleep.
> 
> I fail so see why the GPIO core need to be aware about this.

In this very same thread at
https://www.spinics.net/lists/arm-kernel/msg600515.html, you kind of
proposed to handle this in the core in fact :-) Though indeed you said
that the core could provide helpers.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
