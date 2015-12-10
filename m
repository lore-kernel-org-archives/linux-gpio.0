From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: mpc5200: Use platform_register/unregister_drivers()
Date: Thu, 10 Dec 2015 19:28:32 +0100
Message-ID: <CACRpkda5wCN25wnXx+e5c1S1rp82f=irLz=dH_iS=zcON9O8KA@mail.gmail.com>
References: <1449073195-11054-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449073195-11054-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Dec 2, 2015 at 5:19 PM, Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> These new helpers simplify implementing multi-driver modules and
> properly handle failure to register one driver by unregistering all
> previously registered drivers.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied.

Yours,
Linus Walleij
