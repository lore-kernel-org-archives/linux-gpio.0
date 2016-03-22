From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.4.x
Date: Tue, 22 Mar 2016 18:22:22 +0200
Message-ID: <20160322162222.GF2099@lahna.fi.intel.com>
References: <CACPiFCKv=QJ0t5e=9Wm4cC4Spynx-tVCiabL7AcbcOkp_w47fQ@mail.gmail.com>
 <20160322152218.GA2099@lahna.fi.intel.com>
 <CACPiFC+hDF0+9vPCrhvo079E6RCVVmZXTS1ziS-jHAAZJQ+wNg@mail.gmail.com>
 <20160322154950.GB2099@lahna.fi.intel.com>
 <CACPiFCKS-8re6g1Zbhs8N9D_tDMENqXPeNGRS_0dU6tzz50T8A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:41895 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751142AbcCVQ2R (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 22 Mar 2016 12:28:17 -0400
Content-Disposition: inline
In-Reply-To: <CACPiFCKS-8re6g1Zbhs8N9D_tDMENqXPeNGRS_0dU6tzz50T8A@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Langhoff <martin.langhoff@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Tue, Mar 22, 2016 at 11:59:46AM -0400, Martin Langhoff wrote:
> This is a cheap consumer laptop I thought I'd get Fedora on in half an
> hour -- grand plans ;-) -- I don't have it rigged to capture dmsg of
> the crash, no serial adapter with me.
> 
> On the kernel command line... lvm, root settings 'single`.

Can you also disable sdhci:

CONFIG_MMC_SDHCI=n
CONFIG_MMC_SDHCI_PCI=n
CONFIG_MMC_SDHCI_ACPI=n

and see if that changes anything.

If not, please blacklist pinctrl-cherryview.c and send me full dmesg of
the boot and acpidump if possible.

> This is an Acer Aspire One 11 Cloudbook Series AO1-131-C1G9 Model N15V1 .

Thanks, I'll try if I can purchase similar machine here and debug it
further.
