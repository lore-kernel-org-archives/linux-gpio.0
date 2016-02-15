From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: TS-4800: remove useless bgpio_init flags
Date: Mon, 15 Feb 2016 14:22:53 +0100
Message-ID: <CACRpkdbEadqrvfTF7jDbAVxaa5puoWYUBKCjQrksi8J4thWQVg@mail.gmail.com>
References: <1455124834-18224-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455124834-18224-1-git-send-email-julien.grossholtz@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, kernel <kernel@savoirfairelinux.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Feb 10, 2016 at 6:20 PM, Julien Grossholtz
<julien.grossholtz@savoirfairelinux.com> wrote:

> No flags are required for bgpio_init in the TS-4800 gpio driver. This
> patch set zero instead. The driver will have the same behaviour since
> the & operator between the flags already resulted to zero.
>
> Fixes: 5041e791440a ("gpio: add TS-4800 fpga GPIO support")
>
> Signed-off-by: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>

Patch applied.

Yours,
Linus Walleij
