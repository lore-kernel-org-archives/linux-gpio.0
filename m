From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio:Fix error handling in the function max732x_probe
Date: Wed, 26 Aug 2015 13:35:56 +0200
Message-ID: <CACRpkdaiz-Q+-=AnkyspM9Q2YEbk+cX9_OdCvmWFVUUfFp271Q@mail.gmail.com>
References: <1439906144-11904-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1439906144-11904-1-git-send-email-xerofoify@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Tue, Aug 18, 2015 at 3:55 PM, Nicholas Krause <xerofoify@gmail.com> wrote:

> This fixes error handling in the function max732x_probe by checking
> if the calls to the function max732x_readb fail by returning a error
> code. If so we must immediately return to the caller of the function
> max732x_probe with the error code to signal a non recoverable has
> occurred when calling this function and the caller must handle it.
>
> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>

Stripped and rewrote the commit message a bit and applied.

Yours,
Linus Walleij
