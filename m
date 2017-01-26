From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] gpio: 104-idio-16: Add set_multiple callback function support
Date: Thu, 26 Jan 2017 10:56:16 +0100
Message-ID: <CACRpkdZSurWPz5C4mvi6tD4d-xmye1fNsdJAmfNxjwx9z=Ohug@mail.gmail.com>
References: <cover.1484838095.git.vilhelm.gray@gmail.com> <d8301960672e52f7f157e050f5c8be63810ff34e.1484838095.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d8301960672e52f7f157e050f5c8be63810ff34e.1484838095.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jan 19, 2017 at 4:05 PM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The ACCES 104-IDIO-16 series provides registers where 8 lines of GPIO
> may be set at a time. This patch add support for the set_multiple
> callback function, thus allowing multiple GPIO output lines to be set
> more efficiently in groups.
>
> Signed-off-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Patch applied.

Yours,
Linus Walleij
