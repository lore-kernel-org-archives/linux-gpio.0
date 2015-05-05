From: Peter =?iso-8859-15?q?H=FCwe?= <PeterHuewe@gmx.de>
Subject: Re: [PATCH 03/27] tpm: Allow compile test of GPIO consumers if !GPIOLIB
Date: Tue, 5 May 2015 22:57:57 +0200
Message-ID: <201505052257.59132.PeterHuewe@gmx.de>
References: <1430836404-15513-1-git-send-email-geert@linux-m68k.org> <1430843563-18615-1-git-send-email-geert@linux-m68k.org> <1430843563-18615-3-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430843563-18615-3-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Selhorst <tpmdd@selhorst.net>, tpmdd-devel@lists.sourceforge.net
List-Id: linux-gpio@vger.kernel.org

Am Dienstag, 5. Mai 2015, 18:32:19 schrieb Geert Uytterhoeven:
> The GPIO subsystem provides dummy GPIO consumer functions if GPIOLIB is
> not enabled. Hence drivers that depend on GPIOLIB, but use GPIO consumer
> functionality only, can still be compiled if GPIOLIB is not enabled.
> 
> Relax the dependency on GPIOLIB if COMPILE_TEST is enabled, where
> appropriate.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Peter Huewe <peterhuewe@gmx.de>
> Cc: Marcel Selhorst <tpmdd@selhorst.net>
> Cc: tpmdd-devel@lists.sourceforge.net
Acked-by: Peter Huewe <peterhuewe@gmx.de>
