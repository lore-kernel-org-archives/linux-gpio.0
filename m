From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 00/50] pinctrl: Add and use devm_ apis for
 pinctrl_{register, unregister}
Date: Thu, 25 Feb 2016 15:13:26 +0100
Message-ID: <CACRpkdZjv2KZ0AtC9oBytmSdS+=T+kC8PoJVt-RawE8Np8p40w@mail.gmail.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Jon Corbet <corbet@lwn.net>, Lee Jones <lee@kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 24, 2016 at 2:15 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> Add resource manageemnt APIs fro pinctrl_register() and pinctrl_unregister()
> and use these new APIs on hw driver to reduce the error path code and
> remove callback for driver.

As you can probably guess I like this too, so wait a while, collect ACKs
and send me a branch to pull for this too.

Yours,
Linus Walleij
