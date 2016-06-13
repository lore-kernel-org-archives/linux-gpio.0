From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/9] pinctrl: walk into bcm subdir unconditionally
Date: Mon, 13 Jun 2016 09:26:55 +0200
Message-ID: <CACRpkdZ+RnCo=GhsRrY0+VxLYcETrUZZGrbH-O3rwO7rRSG-ow@mail.gmail.com>
References: <1464934708-24769-1-git-send-email-kraxel@redhat.com> <1464934708-24769-2-git-send-email-kraxel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1464934708-24769-2-git-send-email-kraxel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Jun 3, 2016 at 8:18 AM, Gerd Hoffmann <kraxel@redhat.com> wrote:

> There is no ARCH_BCM on arm64, and we need pinctrl-bcm2835 for the rpi3.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

I see I got an identical patch from Florian Fainelli and applied it.
Sorry for my clashes, confusion and screwups... Added Eric's
ACK on the applied patch.

Yours,
Linus Walleij
