From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 2/4] gpio/xilinx: Convert the driver to platform device interface
Date: Wed, 10 Dec 2014 19:49:20 +0900
Message-ID: <CAAVeFuKj1ekbGyn_bLVN9ndF=B=H=2HQXDzjEvhes=GCcVyv_A@mail.gmail.com>
References: <1418051276-5476-1-git-send-email-ricardo.ribalda@gmail.com> <1418051276-5476-3-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1418051276-5476-3-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Dec 9, 2014 at 12:07 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> This way we do not need to transverse the device tree manually and we
> support hot plugged devices.

Looks ok at first sight, but I think patch 3 should be merged into
this one. They are really closely related.
