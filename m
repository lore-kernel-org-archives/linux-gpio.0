From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: it87: add support for IT8718F Super I/O.
Date: Fri, 10 Aug 2018 23:12:02 +0200
Message-ID: <CACRpkdZmpTnTOSQJU4fojjCUVgsJt8Zy4__MihX4OmubF9Fdrw@mail.gmail.com>
References: <20180808084622.26392-1-ipodovalov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180808084622.26392-1-ipodovalov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ipodovalov@gmail.com
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 8, 2018 at 10:46 AM Ivan Podovalov <ipodovalov@gmail.com> wrote:

> The DIO connector on the WAFER-945GSE is interfaced to GPIO ports
> on the ITE IT8718F Super I/O chipset. From the datasheet of ITE IT8718F,
> the GPIO interface is identical to IT8728, so just add it
> to the same case as the other chip.
>
> Signed-off-by: Ivan Podovalov <ipodovalov@gmail.com>

Patch applied.

Yours,
Linus Walleij
