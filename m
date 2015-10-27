From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: xilinx: Drop architecture dependencies
Date: Tue, 27 Oct 2015 16:47:45 +0100
Message-ID: <CACRpkdbD7fk_0RK-zGxib1zXYHcSwDJi5iQrCCbs2QVxe7ZRDw@mail.gmail.com>
References: <1445276534-6948-1-git-send-email-soren.brinkmann@xilinx.com>
	<1445575878-31215-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1445575878-31215-1-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Moritz Fischer <moritz.fischer@ettus.com>, Lars-Peter Clausen <lars@metafoo.de>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 23, 2015 at 6:51 AM, Soren Brinkmann
<soren.brinkmann@xilinx.com> wrote:

> The driver does not have any real architecture dependencies. To avoid
> listing each architecture that might use this driver on some
> FPGA-enabled platform, drop these dependencies.
>
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> Acked-by: Moritz Fischer <moritz.fischer@ettus.com>
> ---
> v2:
>  - rebased

Patch applied.

Yours,
Linus Walleij
