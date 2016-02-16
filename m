From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] gpio: remove broken irq_to_gpio() interface
Date: Tue, 16 Feb 2016 16:42:18 +0100
Message-ID: <CACRpkdaQN9_qoTn4_riZGvi4BKRLEVkRRL4CWzKj8e_di7Q2Xg@mail.gmail.com>
References: <20160202194831.10827.63244.stgit@bhelgaas-glaptop2.roam.corp.google.com>
	<1455551208-2825510-1-git-send-email-arnd@arndb.de>
	<1455551208-2825510-2-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455551208-2825510-2-git-send-email-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, Linux MIPS <linux-mips@linux-mips.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Feb 15, 2016 at 4:46 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> gpiolib has removed the irq_to_gpio() API several years ago,
> but the global header still provided a non-working stub.
>
> Apparently one new user has shown up in arch/mips, so this patch
> moves the broken definition to where it is used, ensuring that
> we get new users but not changing the current behavior on jz4740.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied.

I expect the driver maintainer to deal with the resulting
deprecation fallout.

Yours,
Linus Walleij
