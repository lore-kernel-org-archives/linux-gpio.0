From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH 1/4] gpio: remove broken irq_to_gpio() interface
Date: Mon, 15 Feb 2016 17:01:09 +0100
Message-ID: <56C1F645.1070405@metafoo.de>
References: <20160202194831.10827.63244.stgit@bhelgaas-glaptop2.roam.corp.google.com>
 <1455551208-2825510-1-git-send-email-arnd@arndb.de>
 <1455551208-2825510-2-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455551208-2825510-2-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org
List-Id: linux-gpio@vger.kernel.org

On 02/15/2016 04:46 PM, Arnd Bergmann wrote:
> +static inline __deprecated int irq_to_gpio(unsigned int irq)
> +{
> +	/* this has clearly not worked for a long time */
> +	return -EINVAL;
> +}
> +
>  #define IRQ_TO_BIT(irq) BIT(irq_to_gpio(irq) & 0x1f)

The issue seems to be a fallout from commit 832f5dacfa0b ("MIPS: Remove all
the uses of custom gpio.h").

The irq_to_gpio() should be replaced with "(irq - JZ4740_IRQ_GPIO(0))".

- Lars
