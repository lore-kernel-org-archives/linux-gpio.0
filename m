From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: add TS-4800 fpga GPIO support
Date: Fri, 5 Feb 2016 15:14:05 +0100
Message-ID: <CACRpkdZ-b6jdtjrgkv-pwjci7t9iEKJtoh1S8MQ=2m9M6_vX9g@mail.gmail.com>
References: <1452704263-16763-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
	<1452704263-16763-2-git-send-email-julien.grossholtz@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452704263-16763-2-git-send-email-julien.grossholtz@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel <kernel@savoirfairelinux.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jan 13, 2016 at 5:57 PM, Julien Grossholtz
<julien.grossholtz@savoirfairelinux.com> wrote:

> The TS-4800 GPIO driver provide support for the GPIOs available
> on the Technologic Sytems board FPGA. It allows to set
> direction and read/write states.
>
> It uses the generic gpio driver.
>
> Signed-off-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>

Patch applied with Alexandre's ACK.

Part of me wants to create a generic device tree binding for generic
GPIO like this with just register offsets in the device tree, part of me
resists it, as it makes it impossible to handle future quirks.

Yours,
Linus Walleij
