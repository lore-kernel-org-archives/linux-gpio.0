From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 20/23] gpio: sysfs: fix race between gpiod export and unexport
Date: Tue, 12 May 2015 10:42:49 +0200
Message-ID: <CACRpkdbqu178r9fp8SjVOv=QkdxBDBbRhymN_YJr-rErGn8ZBw@mail.gmail.com>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
	<1430752248-15401-21-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430752248-15401-21-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 4, 2015 at 5:10 PM, Johan Hovold <johan@kernel.org> wrote:

> Make sure to deregister the class device (and release the irq) while
> holding the sysfs lock in gpio_unexport to prevent racing with
> gpio_export.
>
> Note that this requires the recently introduced per-gpio locking to
> avoid a deadlock with the kernfs active protection when waiting for the
> attribute operations to drain during deregistration.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij
