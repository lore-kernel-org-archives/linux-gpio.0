From: Thomas Gleixner <tglx@linutronix.de>
Subject: RE: [PATCH] pinctrl/amd: Use regular interrupt instead of chained
Date: Fri, 26 May 2017 08:48:53 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1705260841250.1902@nanos>
References: <alpine.DEB.2.20.1705232307330.2409@nanos> <BLUPR12MB07212D4797B68DB06C3A6D40A0FC0@BLUPR12MB0721.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:39607 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030668AbdEZGtA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 26 May 2017 02:49:00 -0400
In-Reply-To: <BLUPR12MB07212D4797B68DB06C3A6D40A0FC0@BLUPR12MB0721.namprd12.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, "Xue, Ken" <Ken.Xue@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, stable@vger.kernel.org

Nehal,

On Fri, 26 May 2017, Shah, Nehal-bakulchandra wrote:
> Thanks for the patch. However, we have received this issue from multiple
> people and different disro but it occurs only on Gigabyte hardware. With
> reference AM4 ryzen board we are not facing this issue.  We are in
> discussion with gigabyte to check the BIOS part. Once we have clarity on
> that, we can consider driver part. Also, this code is running on multiple
> platform of different customers so changing directly at this point of
> time may be risky in my point of view. Requesting you to hold this patch
> till we get clarity on bios end.

It does not matter at all whether this is a problem only on GB
hardware. Fact is, that this happened and it will happen again.

The patch does not change any functionality of the driver, it merily makes
it more robust and spares users the bloody annoying experience of a non
booting machine and the tedious task of figuring out why.

The main objective of the kernel is robustness and not pleasing the ego of
silicon vendors. We can't prevent the stupidity of BIOS people, we merily
can deal with it.

That patch should go into mainline ASAP and backported to stable in order
to help those people who bought wreckaged hardware.

Thanks,

	tglx
