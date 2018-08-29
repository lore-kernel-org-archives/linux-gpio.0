From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: pxa: handle corner case of unprobed device
Date: Wed, 29 Aug 2018 13:57:08 +0200
Message-ID: <CACRpkdbU=87WNn1jksJitVouOQuXJsukUqCXggnD6kUjyr7Zwg@mail.gmail.com>
References: <20180825084417.13526-1-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180825084417.13526-1-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Aug 25, 2018 at 10:44 AM Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> In the corner case where the gpio driver probe fails, for whatever
> reason, the suspend and resume handlers will still be called as they
> have to be registered as syscore operations. This applies as well when
> no probe was called while the driver has been built in the kernel.
>
> Nicolas tracked this in :
> https://bugzilla.kernel.org/show_bug.cgi?id=200905
>
> Therefore, add a failsafe in these function, and test if a proper probe
> succeeded and the driver is functional.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> Reported-by: Nicolas Chauvet <kwizart@gmail.com>

Patch applied.

Yours,
Linus Walleij
