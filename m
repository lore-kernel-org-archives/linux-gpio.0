From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: remove useless check in gpiolib_sysfs_init()
Date: Thu, 24 Jul 2014 16:04:09 +0200
Message-ID: <CACRpkdbUp3=FtFyCgVKDFHwG51STBW88=-aJbn9x3iHxnK-R_w@mail.gmail.com>
References: <1406127413-10672-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406127413-10672-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jul 23, 2014 at 4:56 PM, Alexandre Courbot <acourbot@nvidia.com> wrote:

> An iterator variable cannot be NULL in its loop.
>
> Reported-by: Julia Lawall <julia.lawall@lip6.fr>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied.

Yours,
Linus Walleij
