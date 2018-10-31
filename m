From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/6] Mask read inputs for get_multiple callbacks
Date: Wed, 31 Oct 2018 10:00:26 +0100
Message-ID: <CACRpkdYcOVmJjdoVRpoMObxxmLa0-o4Kf9eQiL9zKZsEKb4YoQ@mail.gmail.com>
References: <cover.1540209293.git.vilhelm.gray@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1540209293.git.vilhelm.gray@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Oct 22, 2018 at 2:08 PM William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:

> The implementation for several drivers' get_multiple callbacks return
> additional input states that were not requested by the mask passed in.
> Although the current caller in the kernel does not care, it would be
> prudent to ensure the behavior of the get_multiple implementations is to
> return exactly the requested input states and not more. This patchset
> ensures such behavior by applying a final mask on the read inputs before
> setting the bits array.
>
> William Breathitt Gray (6):
>   gpio: 104-dio-48e: Mask read inputs for get_multiple
>   gpio: 104-idi-48e: Mask the read inputs for get_multiple
>   gpio: gpio-mm: Mask read inputs for get_multiple
>   gpio: ws16c48: Mask read inputs for get_multiple
>   gpio: pci-idio-16: Mask read inputs for get_multiple
>   gpio: pcie-idio-24: Mask read inputs for get_multiple

All patches applied for v4.21.

Yours,
Linus Walleij
