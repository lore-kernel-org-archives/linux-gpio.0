From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpio-tb10x: remove incorrect __exit markup
Date: Fri, 27 Mar 2015 11:25:54 +0100
Message-ID: <CACRpkdYxiQMOH1mHUu+SMgUC+RDOCfA5hWZ67E6QD_wx15AHRw@mail.gmail.com>
References: <20150309180409.GA24645@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150309180409.GA24645@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Mar 9, 2015 at 7:04 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Even if bus is not hot-pluggable, the devices can be unbound from the
> driver via sysfs, so we should not be using __exit annotations on
> remove() methods. The only exception is drivers registered with
> platform_driver_probe() which specifically disables sysfs bind/unbind
> attributes.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Patch applied.

Yours,
Linus Walleij
