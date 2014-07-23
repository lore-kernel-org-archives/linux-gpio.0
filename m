From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/5] gpio: make gpiochip_get_desc() gpiolib-private
Date: Wed, 23 Jul 2014 17:41:35 +0200
Message-ID: <CACRpkdbSMSqK3xprZ4FDF1uY=kN-EAj3Ze4a2K3O1n5f-V5+pA@mail.gmail.com>
References: <1406013463-19218-1-git-send-email-acourbot@nvidia.com>
	<1406013463-19218-4-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406013463-19218-4-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jul 22, 2014 at 9:17 AM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> As GPIO descriptors are not going to remain unique anymore, having this
> function public is not safe. Restrain its use to gpiolib since we have
> no user outside of it.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied.

Yours,
Linus Walleij
