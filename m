From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] Documentation: gpio: mention that <function>-gpio has
 been deprecated
Date: Fri, 2 Oct 2015 04:13:24 -0700
Message-ID: <CACRpkdaAra_gHCGweUi-01_HAfb_8yYx9LagmOO1bP8T=DCYjQ@mail.gmail.com>
References: <1442841286-8586-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1442841286-8586-1-git-send-email-javier@osg.samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Sep 21, 2015 at 6:14 AM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:

> The gpiolib supports parsing DT properties of the form <function>-gpio
> but it was only added for compatibility with older DT bindings that got
> it wrong and should not be used in newer bindings.
>
> The commit that added support for this was:
>
> dd34c37aa3e8 ("gpio: of: Allow -gpio suffix for property names")
>
> but didn't update the documentation to explain this so it's been a source
> of confusion. So let's make clear this in the GPIO documentation.
>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

Acked-by, saw that Jon took the patch, thx.

Yours,
Linus Walleij
