From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xilinx: Fix kernel-doc warnings
Date: Tue, 12 May 2015 09:56:49 +0200
Message-ID: <CACRpkda3RyBtqG9CgUOhA-4Z_21sgQY+gnZN1st90Z69gyZhgw@mail.gmail.com>
References: <6680ac72661b4be9c4de4a3e2589a0b466fdda74.1430750234.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:35767 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752672AbbELH4t (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 12 May 2015 03:56:49 -0400
Received: by obcus9 with SMTP id us9so88998807obc.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 May 2015 00:56:49 -0700 (PDT)
In-Reply-To: <6680ac72661b4be9c4de4a3e2589a0b466fdda74.1430750234.git.michal.simek@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Simek <monstr@monstr.eu>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, May 4, 2015 at 4:37 PM, Michal Simek <michal.simek@xilinx.com> wrote:

> Fix kernel-doc format:
> - Add gpio-width description
> - Remove additional "inited" variable description
> - Add return value description - xgpio_remove
>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Patch applied.

Yours,
Linus Walleij
