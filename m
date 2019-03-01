From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/2] iio: adc: ti-ads7950: add GPIO support
Date: Fri, 1 Mar 2019 14:25:37 +0100
Message-ID: <CACRpkdaDVvOQnYUGPLFEjqWOnLS=sw=mAn4WkJPHrLtp0gtCdQ@mail.gmail.com>
References: <1551392209-20004-1-git-send-email-justinpopo6@gmail.com> <1551392209-20004-3-git-send-email-justinpopo6@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551392209-20004-3-git-send-email-justinpopo6@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Justin Chen <justinpopo6@gmail.com>
Cc: linux-iio@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Feb 28, 2019 at 11:17 PM <justinpopo6@gmail.com> wrote:

> From: Justin Chen <justinpopo6@gmail.com>
>
> The ADS79XX has GPIO pins that can be used. Add support for the GPIO
> pins using the GPIO chip framework.
>
> Signed-off-by: Justin Chen <justinpopo6@gmail.com>

This looks good from a GPIO point of view.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
