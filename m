From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/8] gpio: zynq: Provided workaround for GPIO
Date: Mon, 14 Aug 2017 15:57:56 +0200
Message-ID: <CACRpkdaM7TN8pg=E6ETJrZYfN8AC-CNY8CWJrWUrsX=EP+gnRg@mail.gmail.com>
References: <cover.1502103715.git.michal.simek@xilinx.com> <4f1f7ed79879d17e38ffda095d631d0f561c2818.1502103715.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:36412 "EHLO
        mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751498AbdHNN55 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Aug 2017 09:57:57 -0400
Received: by mail-oi0-f49.google.com with SMTP id g131so84361652oic.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Aug 2017 06:57:57 -0700 (PDT)
In-Reply-To: <4f1f7ed79879d17e38ffda095d631d0f561c2818.1502103715.git.michal.simek@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, Swapna Manupati <swapna.manupati@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, Josh Cartwright <josh.cartwright@ni.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Aug 7, 2017 at 1:01 PM, Michal Simek <michal.simek@xilinx.com> wrote:

> From: Swapna Manupati <swapna.manupati@xilinx.com>
>
> This patch provides workaround in the gpio driver
> for Zynq and ZynqMP Platforms by reading pin value
> of EMIO banks through DATA register as it was unable
> to read the value of it from DATA_RO register.
>
> Signed-off-by: Swapna Manupati <swapnam@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>

Patch applied.

(I hope my random application of patches does not screw things
up, then I guess I need to back some out.)

Yours,
Linus Walleij
