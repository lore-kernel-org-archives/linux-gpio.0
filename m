From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: of: Remove unneeded dummy function
Date: Thu, 24 Apr 2014 14:43:21 +0200
Message-ID: <CACRpkdZZfxTV9ODrH6Z5xGFf+cUcKGzj+E-gZaZnV8Ho1adO8Q@mail.gmail.com>
References: <1398266889-17489-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398266889-17489-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Apr 23, 2014 at 5:28 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> of_find_gpio() is always called under an IS_ENABLED(CONFIG_OF), so the
> dummy implementation provided for !OF configurations is not needed.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied.

Yours,
Linus Walleij
