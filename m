From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Fix gpio_get -> gpiod_get typo in kernel-doc
Date: Fri, 2 May 2014 15:18:36 -0700
Message-ID: <CACRpkdZ1m2AuuJt_AK1JimND0suisjYaPyiQJtqra3a3LkUKmA@mail.gmail.com>
References: <1398437662-19936-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398437662-19936-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Apr 25, 2014 at 7:54 AM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The function is called gpiod_get(), not gpio_get(). Fix the kernel-doc
> comment to match the name.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied.

Yours,
Linus Walleij
