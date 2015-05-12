From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 18/23] gpio: sysfs: clean up gpiod_export_link locking
Date: Tue, 12 May 2015 10:38:44 +0200
Message-ID: <CACRpkdbbWavyzVS5FU4_D2b1k3RtL4v9-5Mc9vEbMXhg3-yU_Q@mail.gmail.com>
References: <1430752248-15401-1-git-send-email-johan@kernel.org>
	<1430752248-15401-19-git-send-email-johan@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430752248-15401-19-git-send-email-johan@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Johan Hovold <johan@kernel.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 4, 2015 at 5:10 PM, Johan Hovold <johan@kernel.org> wrote:

> Drop unnecessary locking from gpiod_export_link. If the class device has
> not already been unregistered, class_find_device returns the ref-counted
> class device so there's no need for locking.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Patch applied.

Yours,
Linus Walleij
