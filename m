From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 2/7] gpio/xilinx: Convert the driver to platform device interface
Date: Mon, 12 Jan 2015 10:21:38 +0100
Message-ID: <CACRpkdY6Qzb=A=yGPHL8LfsjOEJK5AeqOsDM0wFYmiZ4fwpoaQ@mail.gmail.com>
References: <1418831474-24428-1-git-send-email-ricardo.ribalda@gmail.com>
	<1418831474-24428-3-git-send-email-ricardo.ribalda@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1418831474-24428-3-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michal Simek <michal.simek@xilinx.com>, =?UTF-8?Q?S=C3=B6ren_Brinkmann?= <soren.brinkmann@xilinx.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Dec 17, 2014 at 4:51 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:

> This way we do not need to transverse the device tree manually and we
> support hot plugged devices.
>
> Also Implement remove callback so the driver can be unloaded
>
> Acked-by: Michal Simek <michal.simek@xilinx.com>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

Patch applied.

Yours,
Linus Walleij
