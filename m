From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpiolib: let gpiod_request() return -EPROBE_DEFER
Date: Fri, 11 Oct 2013 16:28:05 +0200
Message-ID: <CACRpkdYzCt6pbLahFoA7cn326bBESu-vVRmFSu6b9wCm+J7bOQ@mail.gmail.com>
References: <1380909598-6382-1-git-send-email-acourbot@nvidia.com>
	<1380909598-6382-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1380909598-6382-2-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Fri, Oct 4, 2013 at 7:59 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> Patch be1a4b brought some improvements to the GPIO error handling code,
> but also changed the return value of gpiod_request() when called on a
> not yet initialized GPIO descriptor: it now returns -EINVAL instead of
> -EPROBE_DEFER, and this affects some drivers.
>
> This patch restores the original behavior for gpiod_request(). It is
> safe to do so now that desc_to_gpio() does not rely on the GPIO
> descriptor to be initialized. Other functions changed by patch be1a4b
> do not see their return value affected, so these are not reverted.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Reported-by: Dr. H. Nikolaus Schaller <hns@goldelico.com>

Patch applied.

Are these two patches regressions that need to go into fixes
for v3.12?

Yours,
Linus Walleij
