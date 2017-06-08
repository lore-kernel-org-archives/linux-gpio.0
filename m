From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 5/7] gpio: use class_groups instead of class_attrs
Date: Thu, 8 Jun 2017 14:05:22 +0200
Message-ID: <CACRpkdY0nM78QrKfhzLkqPrAHz+djY0MeSJakNA+MoYqma_xEw@mail.gmail.com>
References: <20170608081242.27061-1-gregkh@linuxfoundation.org> <20170608081242.27061-6-gregkh@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170608081242.27061-6-gregkh@linuxfoundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 8, 2017 at 10:12 AM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

> The class_attrs pointer is long depreciated, and is about to be finally
> removed, so move to use the class_groups pointer instead.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: <linux-gpio@vger.kernel.org>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please take this through the driver core tree.

Yours,
Linus Walleij
