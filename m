From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 07/23] gpio: sysfs: rename gpiochip registration functions
Date: Mon, 27 Apr 2015 12:54:36 +0900
Message-ID: <CAAVeFuLOwa53YgcHVj9uGa+KLpV2Et-iEAwKEK3vhtJgQSJH4Q@mail.gmail.com>
References: <1429630951-27082-1-git-send-email-johan@kernel.org> <1429630951-27082-8-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:34157 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752461AbbD0Dy5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Apr 2015 23:54:57 -0400
In-Reply-To: <1429630951-27082-8-git-send-email-johan@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Apr 22, 2015 at 12:42 AM, Johan Hovold <johan@kernel.org> wrote:
> Rename the gpio-chip export/unexport functions to the more descriptive
> names gpiochip_register and gpiochip_unregister.

Since these functions are related to sysfs, wouldn't
gpiochip_sysfs_export (or gpiochip_sysfs_register, although the former
sounds better to me) be even more descriptive?

The renaming should probably also cover the non-static gpiod_*
functions of gpiolib-sysfs.c which are equally ambiguous. Basically
anything non-static from gpiolib-sysfs.c should have that prefix.
