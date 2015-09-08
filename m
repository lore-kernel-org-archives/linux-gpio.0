From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Documentation: gpio: Explain that <function>-gpio is also supported
Date: Tue, 8 Sep 2015 16:01:21 +0200
Message-ID: <CACRpkdZW5f5KZ7vAhDH4_UL5Gd7hE6x9geeXggSJNhYV7KJysQ@mail.gmail.com>
References: <1441097175-10341-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1441097175-10341-1-git-send-email-javier@osg.samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Sep 1, 2015 at 10:46 AM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:

> The GPIO documentation mentions that GPIOs are mapped by defining a
> <function>-gpios property in the consumer device's node but a -gpio
> sufix is also supported after commit:
>
> dd34c37aa3e8 ("gpio: of: Allow -gpio suffix for property names")
>
> Update the documentation to match the implementation.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Patch applied.

Yours,
Linus Walleij
